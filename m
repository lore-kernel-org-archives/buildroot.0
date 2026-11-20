Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9931606A331
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 10:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AcIknClv
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D16D606A8;
	Fri, 20 Nov 2026 10:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOqNdxKK05zu; Fri, 20 Nov 2026 10:00:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AA7E860E3A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168821;
	b=pEiAPRNJlhMoVQYSc8aDLegT6FAB9qJlWhUyebMTH/RKInGDTpFUUPDIuDmV+FMFJglQ
	 P8EJ3GWu1tZ4rQ//8TA7JKlFokVRtDMzalCW9AnyY+Joc5OYQvymNh7kvRrkVmzI8Joqr
	 8F6GLg65VMLVzU+ZC0UCYVDMp9vpQ8Z16l2Q4mPUIHRGVoYzUCIU3uwTKoxnwHSgGtuYU
	 Ew5UjRjkLLgDq/buAhesgMBipIlcS/AtDYxxm2N5HaJO8rWboA/zLYVUnGZx+3rkRJEC8
	 WHtAPvfjUv1X2M2iqIHbAzTy+Xo+Xpj3qe1TEU4I6DNF8tf6FtzPmD95lm4Zuy7+n8Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168821;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=AarJE8zXB6CfBtvjjdFSn2j1nH1e2Bxg7gkJBlYd5ZM=;
	b=dLVCpOB+zsHGovXtGK5owcck7/ugWUTqa3fihzpLzozOplcf2z5jaxP5zloHJMGulQyM
	 NthPZiXz9Ny8u1D6NIlN9ScPMjRDCKiYrY1+mzpjAh69T/p1bZ63Sgnp6eXuGe6G7Pog9
	 PVlj+UxP5hGcyAnWuooH07hiRaAVZ9bJyJQ9VT0eca5LNj0WnwdmZHoWsYuEgrzL8Q56C
	 qEIw6S6Sj8nM+lAREm6fl5yg6kjQ7GWa7dXiuS69qBYyyUiapQijU7QY01oyV3DZgoNfp
	 LZSyvfC92TcYb0Vb8Cwdb2KwAiCf5F8G0g1dKG11YxsSWDi/Q+m4LzWivgdqEe48oyQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168821;
	bh=AarJE8zXB6CfBtvjjdFSn2j1nH1e2Bxg7gkJBlYd5ZM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AcIknClvqd1Yxq2KBSdoJJsaYQe37e+udHL0SLG4iWoJVsKUXE4md7V//YYL01xZM
	 Y5d5cibAvKtqCNVxaslHXcqhwReZ1Lq4xYvBxw6fnXVJ5gWqqk7KGlgqEFwmFX3R5E
	 qEFhOI16NyfPaPh1/GX//J1C33Y+gxLdx/PvHE+Pf1iLucPYna76M4lJcLON7Cd6Tt
	 NISgLhQOxjm8uaERDOZeAuzQdzTZwwdxxep7H4BR//xYEig6l055SUMByltbIVO+51
	 W/M5A7CD9dMn5AwX+xx1ymTQFu8Qde10BlPZ4QTok8uylC1uTV3LOCjxDbUh9JheHu
	 QOvJqF7D+2jnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA7E860E3A;
	Fri, 20 Nov 2026 10:00:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CBC5169
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EA7E4016D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8jgrbvC7CmtR for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 10:00:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3AF90400D6
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3AF90400D6
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:18 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a35a60499eso5159055e9.0
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 02:00:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168817; x=1795773617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=24eE1+tHnMArxuK7HIt/PrSP4cD8MYr721Tmb80njdY=;
 b=oU3jB4UdDJoqkaq0ouvcI9D7oZ+2HiMVryBpcEd1TLffQFyuB6jUWNfNMTG/OsrPiK
 JS2e2lbe/hjQSW20GNw3xiRWn13tTY9hhmAhVok7gyh5YEboWHVsbPKO4/HHyhxZTUOL
 snvTkt2hbnVErezQ1hiUQ7NH32SSIKkdg+3fl+drN9WgyABFBhZu94Ts0OGgUqu6QmHh
 rDx9wHclEN9bXRfubrcpRyI9WSR6g93+EiTldLpVBrhwb5L6VRac/uVk1aXjyaGOHrFX
 dW5GEGI9T8Qrjw0I4GH2zZXhRAUSFEu0kJKE11EUzcYhwqUUMSk8VyI7JztiXjASZqT8
 8l+w==
X-Gm-Message-State: APuU4Z+0rlVbJIzhWyOxL1A/GypdmcEemWDSutE+0I7gDZMXf6ppk+Dw
 WY37ZWNnZzFSI0/zUM9NzBE5wg8Y/1EOsv8Ug9VGBHW+OOP3YWJX48up9l/6PRAlATLFb9sE8vI
 J55Em1Wzk8A==
X-Gm-Gg: AYBFou0bkgtc1OEEjHsdITklZhrV7LDL000g2iiPuegbOepFOwNHed8KoNET44iG0/o
 vX0/rkciCdK6juJ0yDhARKAA2yffI8kxCnAcCBCel0xTMbo2/6hSz6VpKv2lcUbHicNCzzWgW4e
 epk4uzPNY2cErs46CY9oKym0QJ3xt9Uymuo7hHC457tvmxsHj3rR+NwFr3nJT8leu48qgWfhVar
 3ioDaZLcJn4XkpgfZcHVOPzyOh2x5vCiLpx1hOWDSK8u+HqB0IvoNJ1IMU2hCHakB2VstZxnjmz
 vJAy/5VIS0deTA9riWQvaKrjCHgbEGYOqoo1Df7/JfYbNPYjbgqNa6y2chfb86x2i/BYGidoJg9
 K+dei1HanWQJR2el4zwQQ3lJbxylUR31J0LQChW6osJwquTKS9cw8qh1QXNB9A2VbZA8nC1U+sy
 Wykyv2ugdrr6pMEapnOLkM/48IBdNMc2kVpAHZ1oVIEu3sEsEyKdQ5d8jmjhCoyM9oH9iu2I5nJ
 z9Mc5+pM5VHWTr49G+Yr15ffvauhFeQD/QMg/grhbCWTK0mSR97qhp2JOG7QbpWSFpqAHyA4UZ1
 yQ4Drf/ZkmlKgtsseYpSsJHeqmcdxBK5eUtHbosUzUJR
X-Received: by 2002:a05:600c:6748:b0:4bb:6a2d:b42d with SMTP id
 5b1f17b1804b1-4bb88824e64mr53772575e9.31.1795168817179; 
 Fri, 20 Nov 2026 02:00:17 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853a9846sm118293965e9.11.2026.11.20.02.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 02:00:16 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 11:00:12 +0100
Message-ID: <20261120100015.541610-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261113225401.2300017-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump version to 2.44-77-g438677ef4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Fixes CVE-2026-84243:
> https://gitlab.com/gnutools/glibc/-/commit/438677ef498552b28c2060060c9e3947373f1e2c
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
>  package/glibc/glibc.hash       | 2 +-
>  package/glibc/glibc.mk         | 5 ++++-
>  package/localedef/localedef.mk | 2 +-
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> index 9deb97a267..f76bdd3d02 100644
> --- a/package/glibc/glibc.hash
> +++ b/package/glibc/glibc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from git)
> -sha256  5e09d1c1717d779862645ee5ad4a0a3665f2a185dc0832b1daa7b9f593f195e0  glibc-2.44-70-g21442dba0d0be00d8b875349ba9fc71daa1639ce-git4.tar.gz
> +sha256  f262e6bd4c51015a2a3095f934cd6bfa8f0cfc46724be06a5d8a49cf2f6f8533  glibc-2.44-77-g438677ef498552b28c2060060c9e3947373f1e2c-git4.tar.gz
>  
>  # Hashes for license files
>  sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 2c202b1ce8..3e4585d014 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -7,7 +7,7 @@
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
> -GLIBC_VERSION = 2.44-70-g21442dba0d0be00d8b875349ba9fc71daa1639ce
> +GLIBC_VERSION = 2.44-77-g438677ef498552b28c2060060c9e3947373f1e2c
>  GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
>  GLIBC_SITE_METHOD = git
>  
> @@ -49,6 +49,9 @@ GLIBC_IGNORE_CVES += CVE-2026-89092
>  # Fixed by 2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746
>  GLIBC_IGNORE_CVES += CVE-2026-97399
>  
> +# Fixed by 2.44-77-g438677ef498552b28c2060060c9e3947373f1e2c
> +GLIBC_IGNORE_CVES += CVE-2026-84243
> +
>  # This CVE is considered as not being security issues by
>  # upstream glibc:
>  #  https://security-tracker.debian.org/tracker/CVE-2010-4756
> diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
> index 8cef67f2c4..a4655da94f 100644
> --- a/package/localedef/localedef.mk
> +++ b/package/localedef/localedef.mk
> @@ -7,7 +7,7 @@
>  # Use the same VERSION, SITE, and LICENSE as target glibc
>  # As in glibc.mk, generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
> -LOCALEDEF_VERSION = 2.44-70-g21442dba0d0be00d8b875349ba9fc71daa1639ce
> +LOCALEDEF_VERSION = 2.44-77-g438677ef498552b28c2060060c9e3947373f1e2c
>  LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
>  LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
>  LOCALEDEF_SITE_METHOD = git
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
