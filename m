Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DE6606A332
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 12:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=T0gXYNoi
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E030581021;
	Tue, 20 Oct 2026 12:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RhXfPcqS7K21; Tue, 20 Oct 2026 12:55:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D6FFD8100D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792500912;
	b=UFRHVL9ch6qB8+2uHyxJambixN/sUsqdRkgQbeiydX/s/3gfHTXfmgI3s+Lf1O59GGAt
	 QFeKtrRC0Gidxmw+ajSUFp8SRJxg2LTXGKNwuHBKwYT/0ZjxtQGcZ/pJUzhfRQ6XJriyV
	 RwLreGCiwQP1ASDN1kBxQ0k7mgJMJDgPRGGdvi67lUpQaTwXJyMqHJYWkoqkzJkf9OPm9
	 V4hbqQFfEWsVBem1O4tvRe2G3IdVTV9bcUZlVmduxoYcZB2j3MrgMpXdfEGaE7mPS9HSt
	 VwHBkYjVXQBlM6WFFSKFOOQkpjEshy9ijqP2m0oMnIuUoyj8xK409PVlhRS9VIe3rQA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792500912;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=xIbq9kZbbYLTFJAAqRQMCnP/53HoTfEg9+Gd53eFeQQ=;
	b=H83pTKfMJHnnMR5i89pnVLUz60OTASXsrgMBQ/RxsSn5JKYScgFbysZgujWZL60frVzV
	 BlmGKYnr3ics4OQBEHBL/jZ92LNlvpQfPw3mkFwWkCsV1oBpjYRox8cO4NdZFLXQ/x66N
	 XQpGPqi42gE82cLMAH77Br3Kxq6YPBJ3Mwg42S7d9xCUpsBFMBdqkGLku6M/toZQX2ltG
	 8mjZwGchtzjDZ+7k7xW938kcnpVEoRQcNEGQAMjPT5U+rXGXfHZw/PMR5KjoYVVlYc6vx
	 JO+9xu68FOQPrpzcM6GtAD5kb7kNPJVb01PlgknBX33nlX+rYyoE7zWGWxRfGe3BH0g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792500911;
	bh=xIbq9kZbbYLTFJAAqRQMCnP/53HoTfEg9+Gd53eFeQQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T0gXYNoik4hCY8NcbKZLmkcXZ0HtBJhhm1boek/AKl1XjpuOTdIM/iXJPn/yVEZGO
	 hIAon1z3HrSrV4CuV4eTJpEqT82yiu6hqH0HnBVakON7Klg2/Qi4gNm5tKTuluCbI1
	 xSxM0L3eLAlMz4DiV8/Xq+48b+EukNAwC2PZhECw09c8Vi3oG8+pGLZTqLQkuBjO1J
	 9eXHs1ANbJuthD3Na4noKKxglxfrxNCcBo4IQXH557sqQV2EKe/Cf/M9nFk5UzJ1Pa
	 phkVDzqmQ+H1LANfHr7R+4ZXctzXyFy7wnG/InkCgruRdh5lboZnKXR4+PvvGKtxAE
	 y4ZdrJoiHaftg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6FFD8100D;
	Tue, 20 Oct 2026 12:55:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F976769
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 12:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25296407E0
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 12:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lm46nxuKfE56 for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 12:55:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6896C407D4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792500909;
 b=kRTWd1k67BCe86YjVMnjn0EcPRwCxMvV3OgoD/+y9gwJlNAIVrqsgKXLYKOp8PfNcrNU
 gNiPCheYiurjr1b+Dj/5O8jNC5oxLehOo2Drff+ea0NbiMDHXH+18Y1qmMlA9yPXNMIcn
 0lbo6xU7iTEQgZrjcFeE8Bh8xux3oKmcHyYlO9Wu6jIoLOdXXnqJPQo08/3u4mcnO0gn7
 7s3PLAD1CqCBl+9lIO9E4AsnZd9ThXbOPnwbRgyFHNUo2mMmO2bhU/yofxAY3caFjYRfX
 iMyX4WoMwAh0RNpf0OYZ/pCPqqXp4qDiwtrQl9cI2OT4oL1yTo0R4KMya4EeZQ8e4TA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792500909;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=QhIhn8LHdQoUu95PJGdssz8FESuijxBSPnfNN1LTh5k=;
 b=MdKEdeRO4LIIfSog0Ih0viAlOaFBtxZpTo+fXxhI0tXJMrk53OVpnPseu+K22KBsRQFW
 iBR162QzDu53GKpMwFTtLgNL8+6l3fa0ITYhMcm35YrM4KwR0odXTU/TaHuzt6OfOfNYW
 wi/8lFlE+rmbwtJS4hAEIfGuUGsF5Nx3UUBc023QIiZPkZY2v3YyPsHnQgVRqcXsyA7xq
 0P5g4/+zJHzJLXholW6v2gmKESvEKlN7Mmu1pLiXow1pIKGrafeZ5NpyX3wuh3TTYGXos
 ZzVUf7AmZOK9rVhY5JZZ+uGEUc5RPvDlvSxNMTVGNGhTBp/jceRJxrwRMzCYPKhvphw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=bylx9hTs; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6896C407D4
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 12:55:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Md6Mt-1wjGeY0NH9-00c9GI; Tue, 20
 Oct 2026 14:55:05 +0200
Message-ID: <8b5cbb21-caa0-4935-b2d4-35908b5ab0d8@gmx.de>
Date: Tue, 20 Oct 2026 14:55:04 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Francois Perrad <francois.perrad.86@gmail.com>
References: <20261020120646.1306735-1-thomas.petazzoni@bootlin.com>
 <20261020120646.1306735-2-thomas.petazzoni@bootlin.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261020120646.1306735-2-thomas.petazzoni@bootlin.com>
X-Provags-ID: V03:K1:AiHmNcQ0wRm0nD0C1ghgQ307VX157Ot48kZsW3UENqGUWP+1LtD
 NYCRDLvQtgG7nZE5+fO1CtqcF9uWoZvFk9Pst0K6DVc5YXjy+a52L6h4Q1HsTx2uAfjahka
 NLtDqLwnCNZM2JyA4Gwe8cdqmwuQs+swngBwZDmUXGQe1dl/+EvfyfgK2FGGK5fjjTFZgMT
 3zDNEE61GfdcJCBdJDFPA==
UI-OutboundReport: notjunk:1;M01:P0:UBudZwCw2VY=;yHprFu7/4vffi8uRSLOZeuoXh7h
 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
 tyHcO9QF4uA=
Subject: Re: [Buildroot] [PATCH 2/2] package/pkg-hare: move cache directory
 outside of $(HOME)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 20.10.26 um 14:06 schrieb Thomas Petazzoni via buildroot:
> By default, hare will store its cache directory in $(HOME)/.cache,
> which is a problem as we don't want a Buildroot build to write outside
> of its output directory (to the exception of DL_DIR, of course). The

And CCACHE_DIR, if enabled. Not really critical, but might give someone 
who's new to Buildroot a wrong idea. ;-)

> build of hare-package packages currently fails with:
> 
> Error creating /home/br-user/.cache/hare: Permission denied
> make[2]: *** [Makefile:15: dbus-introspector] Error 255
> Error creating make[2]: *** Waiting for unfinished jobs....
> /home/br-user/.cache/hare: Permission denied
> make[2]: *** [Makefile:19: dbus-scanner] Error 255
> 
> due to this issue.
> 
> We fix this by passing XDG_CACHE_HOME when building hare-package
> packages.

I'm not familiar with Hare, what does it store in its cache dir? The 
default path suggests it's intended as a global cache, so I'm wondering 
if something like $(BUILD_DIR)/.hare-cache might be better than a 
per-package cache. But of course that depends on what goes in there.

Best regards,
Fiona

> Fixes: 44d38432343e65ec7a6d898cf982985cc2bc1e88 ("package/pkg-hare.mk: new infrastructure")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>   package/pkg-hare.mk | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-hare.mk b/package/pkg-hare.mk
> index 15dc769311..6494d2651c 100644
> --- a/package/pkg-hare.mk
> +++ b/package/pkg-hare.mk
> @@ -51,7 +51,11 @@ define $(2)_BUILD_CMDS
>   	if grep "^all:" $$($(2)_SRCDIR)Makefile > /dev/null; then \
>   		target=all ; \
>   	fi ; \
> -	$(MAKE) -C $$($(2)_SRCDIR) HARE="$$(HARE_RUN_CMD)" HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)" $${target}
> +	$(MAKE) -C $$($(2)_SRCDIR) \
> +		HARE="$$(HARE_RUN_CMD)" \
> +		HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)" \
> +		XDG_CACHE_HOME="$$($(2)_SRCDIR)/.cache" \
> +		$${target}
>   endef
>   endif
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
