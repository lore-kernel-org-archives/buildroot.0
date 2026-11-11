Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC9E606A321
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 11:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FpkR6JGM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=Lp35kUK8
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E267B40AE7;
	Wed, 11 Nov 2026 11:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4qrFNAiHQzP; Wed, 11 Nov 2026 11:25:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EC91E40B04
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794396324;
	b=Gr1QK+jqq0tzOpfFl8xXksd3i67U7os2CYyM/Hu9KyNcGuseANeA1wkn54IIMxOipUfY
	 oRkq45B0drkhJrVJ/fKPrcSbpBefVNj7b6ptJ2lOLZFg46XYONjD7JKg0u/ArdGLt25Ph
	 4fLjEjL0REFjti+iOgTy2/pbyRsp3tAtoevXgdgeGhDdEKOh0/CiG6maZ6himIqmwi/ch
	 pMgBIZ6/kEFtFgn0jtHmyjWGDWlrMuE5tXaUW/Gi80Gpoovvj4D3sNIkRHgJb46BILKr+
	 45xiKAvILsYIbn1cU8tfIe8pFSlg0U+yPOVlukP+0RPHamTShmXhIHIHT2akCUa0t/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794396324;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nlwWltEJxNGGzCinbCly9M60mQOw3ndOitVTSR9MpLY=;
	b=tcsKmxyLB8PI+NyueAjJv17hll1MTXxmzt1THAPchND9jKqoUpJ5VfTWjPmd5Gw5FJm/
	 olMtXPyBEAkQBdl2KyPAXlXzeRjx88vSoZkGbpuF/nhYEwsyU2Gzch9tqv6QrStwPoJkz
	 o1Qp3YKXVI799ZC31WVMY4mGMRoxyomZrfsECt9khE3HNOtYitUHAZ3XhmajViJ9tliTc
	 lzp/g9F1ozsCL79wv4Lc6+QS5ZqkRvnvgqhV2bd8w5PwEU3PYEfRNIoHhjoeHQm7nIDJw
	 pyYjRdG64Mmt81C4nTijPWwVrbsbBlViVgjD/aCc6fPiNFSE1XuqRU2YLcjbykZhh8w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794396324;
	bh=nlwWltEJxNGGzCinbCly9M60mQOw3ndOitVTSR9MpLY=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FpkR6JGMyljp7LhPGz91rcCUtXcy8x24AqQl8MfGYBfmFU3ZqjNBcnLId/dx3Tqoh
	 5oTTyfW2aDUS7XIUl9Zh3QpBxp8Aqom7qrThkrIeFzLUpIKI631XjFGI6aGzKwLnni
	 pYoK6Zn1LYRc0sV9BjJm7xxlxDfZ/RQ4FYKcj4panEmcg//LTSjrB2zqgISlCin70T
	 lHIuogJzt+eXthG0HNcrdHkkKj3EwW86NOrS+wTEajZ+IlH0c4IKl+VdkgE7U9ANHb
	 BdU5HNiLmAM936JcdP63ZcynbjyuBxuRkZsxReyXaxbQvDlhSpzo4z5dUpGcI/4G7o
	 6YBh40Ut78lHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC91E40B04;
	Wed, 11 Nov 2026 11:25:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B4C217CC
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C3E840217
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xtiRKLMYKmOc for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 11:25:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3DF6E400D5
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Lp35kUK8
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DF6E400D5
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:25:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Lp35kUK8zxeYMOO7vN1d6qeH2f6pdzC+WgwXJ7Vlejxc160kcGORjKeEYjKEH8VfdzZClWtC1C0oZ8u+Ta1VBYHDKKgJXte/V0goSu2wNPh4Tp7HpJa4bb3G0vNYZb2weOxdjdKcMdjaysaR2tU305yMQ5LbboNTIicN3hNznyvr5KFebmFr3Fdzu40I6x8J/Vd41PYuUB1k7p0yz0Zjy4Q5pACHd8wWwjS6YVrzefk8aiLsb1CLoCI9Pl9zTl3ZPjAP/O90oyxnoouuk+ILTS8FjQj8H6pwNDn6UcMqAW2ahLc5WT7pHAWvXlSg6asb0gpYw0E+f8eOWp66gwAB/Q==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=1a7U6IEH1N5WHrrgjyn1jfXAD9n0g5I2i+hBHm7tniQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1606359563; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 11 Nov 2026 11:25:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xR6Ry-00000002cWu-2Jkt;
 Wed, 11 Nov 2026 12:25:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yegor Yefremov via buildroot <buildroot@buildroot.org>
In-Reply-To: <20261110114907.2273598-1-yegorslists@googlemail.com> (Yegor
 Yefremov via buildroot's message of "Tue, 10 Nov 2026 12:49:07 +0100")
References: <20261109132501.233001-1-yegorslists@googlemail.com>
 <20261110114907.2273598-1-yegorslists@googlemail.com>
Date: Wed, 11 Nov 2026 12:25:10 +0100
Message-ID: <87cxsbk3u1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/libcurl: fix build on LoongArch
 with musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Yegor" == Yegor Yefremov via buildroot <buildroot@buildroot.org> writes:

 > Since libcurl 8.21.0, building the curl tool for loongarch64 with a musl
 > toolchain fails with:

 > ld: read-only segment has dynamic relocations
 > collect2: error: ld returned 1 exit status

 > On musl, none of the secure memory zeroing functions curl knows about
 > are detected, so curlx_memzero_low() falls back to calling memset()
 > through a 'const volatile' function pointer. In non-PIC code, GCC places
 > this pointer in .rodata, and on LoongArch the linker emits a dynamic
 > R_LARCH_64 relocation against memset() there, i.e. a text relocation.
 > musl's dynamic loader does not support DT_TEXTREL, so the Buildroot
 > toolchain wrapper links with -z text, which turns it into an error.
 > Other architectures resolve the address to a PLT entry at link time and
 > are not affected.

 > Backport the upstream fix, which detects explicit_bzero() at configure
 > time. musl provides it since 1.1.20, so the memset() fallback is no
 > longer used. As the patch touches configure.ac and m4/, autoreconf the
 > package.

 > This issue has been present since commit be2789d08432 ("package/libcurl:
 > security bump to version 8.21.0"), which brought in the upstream code
 > using the 'const volatile' pointer. It therefore affects 2026.08 and
 > later, and 2026.05.x since 2026.05.1.

 > Fixes:
 > https://autobuild.buildroot.org/results/558c08d552920e45628254bdc029518120a35ae1

 > Fixes: be2789d08432da951c0ebfb23b034072601bc8fe ("package/libcurl: security bump to version 8.21.0")
 > Assisted-by: Claude:claude-opus-5-5
 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > ---
 > Changes v1 -> v2:
 >   - replace the local patch with the upstream fix, which detects
 >     explicit_bzero() at configure time instead (suggested by Viktor
 >     Szakats in the upstream review)
 >   - autoreconf the package, as the patch touches configure.ac and m4/

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
