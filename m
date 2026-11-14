Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C917606A331
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 16:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=K9x1eXg8
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 582BB6072E;
	Sat, 14 Nov 2026 16:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BMUghDq1NS9B; Sat, 14 Nov 2026 16:25:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 15D78606CE
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794673546;
	b=lkb+ebq0wmoDRdAp7dWthd7MSoI2T8fLSCD7ePKlO1+GEnsarTwAzB7Vu6zCi9Q/3gAB
	 duhjH4YGWPhuonNFkmDls2ogi5ZZ/k247jUog15749rGbd854bdlIS7gYYLEucmYGmv/Y
	 8Ih6wPohL1h8uyrnNQb/Ttda1eAgb0E3lmoQA8ZhDkRd6VntG3upWO1bPO930U18MqFzS
	 PpQHSUtaWofD+uu/ltK3XSA6KHqxIkK90QhBGj4N/WU7+gpUjGbKeJh7eWHOm3ZeZwOO2
	 SS6I1npSIhSQiPTHbc4sejaYoxwI1dEopknSKGiJbxV4fAqkgDFmYKZRZRsTTQa18BQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794673546;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=o6PnWJLALaVdY0DjpUpIVOtynoKMGeBIaVvoEyg4uwY=;
	b=Ya2mmgPZAliVKqiAi4XnLtveB6TYcf6Q6N65dtwjPxnpSbVKCTLjp15SaDnl1NNw562V
	 08i2xi6ss1kzvw2KlSlLchO477vDp2zD6cy45oqTySbOUJrnNpOPRD0euywvj3mhYnqRn
	 9pXzwXKzGvKc9xfKmpRFQCxpwkkJJHAmHqex7M7oZ2WyYzGKdDUvoJRj4vBNFfMinYkTJ
	 mxfAyGCNu0JZyMRtHiZ1UiUzyzaSlWPqmRExBoWsPrqHlBPDUt3aSRcwm7BuB0MwIotox
	 nKSuB1/qluqQ527wKM5CWIeBRAK2LwDYfNhuLkpCnERysG0M3TQSG1ouTIZO22/526A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794673546;
	bh=o6PnWJLALaVdY0DjpUpIVOtynoKMGeBIaVvoEyg4uwY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K9x1eXg8ZbW1Ama0CPeXTNM9oBi6E+pjK4iN1xwyDRRHsUR1otXIf+NfZcs4rj7Z+
	 ObQbojYHuhj909PF/cf2+SZx/+MDCA0FpKDUX1fZ1IyYhA2Gbroy/qCED91hE9HVBp
	 Zs+HL2+xBKRSVJWWuJFWiQftVJqZD8vXS8/xByEEh1SyrEw5WZ9dDwCLYUNJPDoIAX
	 SVERB/VuWHAES85bTJcPUolQHkJcXxBL0pznr/5GoF2sAzXXTYzhFrqaM4u0gugIpZ
	 uyN+H1HT/j5NSX1hiz8tn5CEQqrV9yNAVlnEeOSa0QnaIcxISZIy4On6cGPCa6z2/6
	 TweqdovxOqPuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15D78606CE;
	Sat, 14 Nov 2026 16:25:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 310FF72D
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 16:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E7D081231
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 16:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5KiTgv9aDyB3 for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 16:25:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 803A881069
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 803A881069
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 16:25:42 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1794673540; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:QbhsjGwrx3ZX6R2rzzo3AI/QSB+h
 f42fSPYOYfpGriLXu3aNUu9D2vuqG5rFo2+ilCfcXV3yZY6EiTj5LBby+2N6CytMVIE4YgvZeZD
 zSvbpKIQ4Ksf/ZlSrhsEuVar4IbnAbej3enovZMwDk4o/5FmmNHsHAliUd/F+hWkIROA7WYfHgA
 7iBPts6XY6KOJ0GC912Z+JN5Dt7pcUfyXa9uEtEauqmg/MMaG08TI1pH7IoJLCLbbeRfg0xqbvU
 S9sCDkZR32glKlyV3MhK8grULXTAzaoRNMMMLMF95Mc4WAp3H0RNYA5rLRUbaG2fXftUv5lev6T
 PfwVXv4qS1jbNg==;
Message-Instance: m=1; h=sha256: ve5h7p06GhSylHkTivo2cpExCJiMtSRqVY9Aiib3MxI=:
 TCFvKNE+Ng5F29buu3UVJGUtAuqG5HvAvcxwxodsISc=, sha512:
 RdmGd2oT9kDQJhrpNF4Hg280qIuXlUb21ze4eKFVnqYdUmz044lng92ghBFn5nuW7lkKiIog9k/Pozf/GKKR2Q==:
 uSxUYMOTUDdw7S05xTZM1IplY6PRZ1o2WAH3j6O5zb5gzDihGDd1OZxTmKaLqVFzb4wl1h0ZCKNPpYOOZXdfPA==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5wLZ-1xMUrt0nM3-001yLj; Sat, 14
 Nov 2026 17:25:34 +0100
Message-ID: <d8219c4b-01da-40d6-a38f-9906f498fb83@gmx.de>
Date: Sat, 14 Nov 2026 17:25:32 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>
References: <20261113131321.1408652-1-buildroot@bubu1.eu>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261113131321.1408652-1-buildroot@bubu1.eu>
X-Provags-ID: V03:K1:V6gfbDZk02gnCq1hPa7hNLYKYb8p4Iskz+9sb+WWYVn9TXMr/4g
 2soERP/l13ZeY+c2Co39jBNwqMTGXorIBl5y4q1jMknREvfSSW1dzqrFVCSBD/7049faL2c
 sBZyOT0Xe9AKp/Igupgs7eL51hz9cc+q0P9NIcgKR/u8bNYqH5unbJUoQFWU9Oj3mXI3O0v
 EbrBJ01V/Lw+6VZjQSzqQ==
UI-OutboundReport: notjunk:1;M01:P0:m9+SOrFt0LY=;6OgJ6Y0foskcWkJiv+mOT5PnZmj
 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
Subject: Re: [Buildroot] [PATCH] package/systemd: remove stale libgcrypt
 reference
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

Am 13.11.26 um 14:13 schrieb Marcus Hoffmann via buildroot:
> BR2_PACKAGE_LIBGCRYPT is not a systemd crypto backend anymore since
> systemd 258 (commit c38d7326e093), so the test deciding
> -Ddefault-dnssec= is stale. Test BR2_PACKAGE_LIBOPENSSL only and fold the
> option into the block that already enables/disables openssl.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Good catch! Applied to master, thank you.

> ---
>   package/systemd/systemd.mk | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 2d41df7bc3..f5fa0920ef 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -347,12 +347,6 @@ else
>   SYSTEMD_CONF_OPTS += -Dselinux=disabled
>   endif
>   
> -ifneq ($(BR2_PACKAGE_LIBGCRYPT)$(BR2_PACKAGE_LIBOPENSSL),)
> -SYSTEMD_CONF_OPTS += -Ddefault-dnssec=allow-downgrade
> -else
> -SYSTEMD_CONF_OPTS += -Ddefault-dnssec=no
> -endif
> -
>   ifeq ($(BR2_PACKAGE_SYSTEMD_HWDB),y)
>   SYSTEMD_CONF_OPTS += -Dhwdb=true
>   define SYSTEMD_BUILD_HWDB
> @@ -604,13 +598,15 @@ ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
>   SYSTEMD_CONF_OPTS += \
>   	-Dopenssl=enabled \
>   	-Ddns-over-tls=openssl \
> -	-Ddefault-dns-over-tls=opportunistic
> +	-Ddefault-dns-over-tls=opportunistic \
> +	-Ddefault-dnssec=allow-downgrade
>   SYSTEMD_DEPENDENCIES += openssl
>   else
>   SYSTEMD_CONF_OPTS += \
>   	-Dopenssl=disabled \
>   	-Ddns-over-tls=false \
> -	-Ddefault-dns-over-tls=no
> +	-Ddefault-dns-over-tls=no \
> +	-Ddefault-dnssec=no
>   endif
>   
>   ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
