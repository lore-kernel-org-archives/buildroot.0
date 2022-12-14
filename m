Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866FFC4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 19:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F103081E66;
	Wed, 14 Dec 2022 19:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F103081E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y9aT21OBiQvU; Wed, 14 Dec 2022 19:01:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1870B81E3B;
	Wed, 14 Dec 2022 19:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1870B81E3B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 509E11BF312
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 19:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C1D26079D
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 19:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C1D26079D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XDyJBkqQIgGB for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 19:01:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3E41607F4
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3E41607F4
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 19:01:06 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 7A7774409F0;
 Wed, 14 Dec 2022 20:57:58 +0200 (IST)
References: <20221214185040.3340152-1-francois.perrad@gadz.org>
User-agent: mu4e 1.8.10; emacs 27.1
To: Francois Perrad <fperrad@gmail.com>
Date: Wed, 14 Dec 2022 20:59:54 +0200
In-reply-to: <20221214185040.3340152-1-francois.perrad@gadz.org>
Message-ID: <87zgbphksw.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1671044278;
 bh=gskSPf1B9QFWPmTlTOrj8A+HmcNXnxovk0HDjSrkRqg=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=cHgKZicVD5ceABHXZR7UUseJqVZbJrLvnG8G/9kw3W97JdIe3l2Cn9X3tsR+uTDp3
 r5T2zHnXibd4LdJo4gl2uz8EGlwZIX8qK8kuJtoRkz329DK3+sfBnhaCNGBwvIoZN+
 e788usdcrHx3apQ0Ag6Lx2cvtE26EekExMRqxUm3tztHx0mIbkqpI3boZ3fxQXojyW
 +FmwidEwwF70Q0jMrkPUSokb2/JikSES9shA8FVLDd9CzBFsc8Ug/z8nSN0ISO307X
 h1sWk1QE4fnOlyCOKLjCQdt476bF7VLD5DvW8TkbFbMiM0jRJBFP1Zh/rWt20QvEsk
 DGzafwQSXD2NA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=cHgKZicV
Subject: Re: [Buildroot] [PATCH] package/sudo: bump to version 1.9.12p1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Francois,

On Wed, Dec 14 2022, Francois Perrad wrote:
> remove merged patch

There is SUDO_IGNORE_CVES to be removed here as well.

baruch

> diff LICENSE.md
> -    Copyright (C) 1995-2017 Jean-loup Gailly and Mark Adler
> +    Copyright (C) 1995-2022 Jean-loup Gailly and Mark Adler
> -    Copyright (c) 2008-2018, Dave Benson and the protobuf-c authors.
> +    Copyright (c) 2008-2022, Dave Benson and the protobuf-c authors.
>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/sudo/0001-Fix-CVE-2022-43995.patch | 53 ----------------------
>  package/sudo/Config.in                     |  2 +-
>  package/sudo/sudo.hash                     |  6 +--
>  package/sudo/sudo.mk                       |  4 +-
>  4 files changed, 6 insertions(+), 59 deletions(-)
>  delete mode 100644 package/sudo/0001-Fix-CVE-2022-43995.patch
>
> diff --git a/package/sudo/0001-Fix-CVE-2022-43995.patch b/package/sudo/0001-Fix-CVE-2022-43995.patch
> deleted file mode 100644
> index 3f544dcf8..000000000
> --- a/package/sudo/0001-Fix-CVE-2022-43995.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From bd209b9f16fcd1270c13db27ae3329c677d48050 Mon Sep 17 00:00:00 2001
> -From: "Todd C. Miller" <Todd.Miller@sudo.ws>
> -Date: Fri, 28 Oct 2022 07:29:55 -0600
> -Subject: [PATCH] Fix CVE-2022-43995, potential heap overflow for passwords < 8
> - characters. Starting with sudo 1.8.0 the plaintext password buffer is
> - dynamically sized so it is not safe to assume that it is at least 9 bytes in
> - size. Found by Hugo Lefeuvre (University of Manchester) with ConfFuzz.
> -
> -[Retrieved from:
> -https://github.com/sudo-project/sudo/commit/bd209b9f16fcd1270c13db27ae3329c677d48050]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - plugins/sudoers/auth/passwd.c | 11 +++++------
> - 1 file changed, 5 insertions(+), 6 deletions(-)
> -
> -diff --git a/plugins/sudoers/auth/passwd.c b/plugins/sudoers/auth/passwd.c
> -index b2046eca2..0416861e9 100644
> ---- a/plugins/sudoers/auth/passwd.c
> -+++ b/plugins/sudoers/auth/passwd.c
> -@@ -63,7 +63,7 @@ sudo_passwd_init(struct passwd *pw, sudo_auth *auth)
> - int
> - sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, struct sudo_conv_callback *callback)
> - {
> --    char sav, *epass;
> -+    char des_pass[9], *epass;
> -     char *pw_epasswd = auth->data;
> -     size_t pw_len;
> -     int matched = 0;
> -@@ -75,12 +75,12 @@ sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, struct sudo_c
> - 
> -     /*
> -      * Truncate to 8 chars if standard DES since not all crypt()'s do this.
> --     * If this turns out not to be safe we will have to use OS #ifdef's (sigh).
> -      */
> --    sav = pass[8];
> -     pw_len = strlen(pw_epasswd);
> --    if (pw_len == DESLEN || HAS_AGEINFO(pw_epasswd, pw_len))
> --	pass[8] = '\0';
> -+    if (pw_len == DESLEN || HAS_AGEINFO(pw_epasswd, pw_len)) {
> -+	strlcpy(des_pass, pass, sizeof(des_pass));
> -+	pass = des_pass;
> -+    }
> - 
> -     /*
> -      * Normal UN*X password check.
> -@@ -88,7 +88,6 @@ sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, struct sudo_c
> -      * only compare the first DESLEN characters in that case.
> -      */
> -     epass = (char *) crypt(pass, pw_epasswd);
> --    pass[8] = sav;
> -     if (epass != NULL) {
> - 	if (HAS_AGEINFO(pw_epasswd, pw_len) && strlen(epass) == DESLEN)
> - 	    matched = !strncmp(pw_epasswd, epass, DESLEN);
> diff --git a/package/sudo/Config.in b/package/sudo/Config.in
> index cbef15d67..ee5ea542a 100644
> --- a/package/sudo/Config.in
> +++ b/package/sudo/Config.in
> @@ -8,4 +8,4 @@ config BR2_PACKAGE_SUDO
>  	  basic philosophy is to give as few privileges as possible
>  	  but still allow people to get their work done.
>  
> -	  http://www.sudo.ws/sudo/
> +	  https://www.sudo.ws/sudo/
> diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
> index 63c98e2c4..a3476df96 100644
> --- a/package/sudo/sudo.hash
> +++ b/package/sudo/sudo.hash
> @@ -1,4 +1,4 @@
> -# From: http://www.sudo.ws/download.html
> -sha256  a21918eb9fc0063794f6887464fa2d924ab6d192e19063191a429605c22791d2  sudo-1.9.11p2.tar.gz
> +# From: https://www.sudo.ws/getting/download/
> +sha256  475a18a8eb3da8b2917ceab063a6baf51ea09128c3c47e3e0e33ab7497bab7d8  sudo-1.9.12p1.tar.gz
>  # Locally calculated
> -sha256  cf3a83366f9aabfd76d693ce03843106fcaaf6c76dfa97610f7c0b719a06e6bb  LICENSE.md
> +sha256  d2f93a3b17ed5586fddd07be33ad767146c1a81a22682baa68bb4360a31d020a  LICENSE.md
> diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
> index 8e237bd36..5f9a6e50a 100644
> --- a/package/sudo/sudo.mk
> +++ b/package/sudo/sudo.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -SUDO_VERSION_MAJOR = 1.9.11
> -SUDO_VERSION_MINOR = p2
> +SUDO_VERSION_MAJOR = 1.9.12
> +SUDO_VERSION_MINOR = p1
>  SUDO_VERSION = $(SUDO_VERSION_MAJOR)$(SUDO_VERSION_MINOR)
>  SUDO_SITE = https://www.sudo.ws/sudo/dist
>  SUDO_LICENSE = ISC, BSD-3-Clause


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
