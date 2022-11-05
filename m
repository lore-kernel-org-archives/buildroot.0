Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4974C4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 14:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76C054047B;
	Sat,  5 Nov 2022 14:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76C054047B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7hc7oDsbM0Po; Sat,  5 Nov 2022 14:04:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FCE040471;
	Sat,  5 Nov 2022 14:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FCE040471
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 869B81BF2C7
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 14:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5721740901
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 14:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5721740901
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bbsQ4FI1Rczn for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 14:04:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBB06408F7
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBB06408F7
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 14:04:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.11.77.72])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 725482003C6;
 Sat,  5 Nov 2022 15:04:06 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 05 Nov 2022 15:04:06 +0100
Date: Sat, 5 Nov 2022 15:04:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221105140406.GF3918838@scaer>
References: <20221104162638.649147-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221104162638.649147-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667657048;
 bh=ZIUbclpHh+Yhr/N/mCBg1LuTk24MzLwp3xsA+V87HUA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZLKXNJmhxSmd3DMFPrWLABRvjtyR24Mi9GsS9Iea4rORs4uey0G/xHscTdcp2Gaf+
 RjZr/XmwXwtL4iY/iiKoUK16yOVHmqGIvCRonFR8wBCFF8rDNzcBr6RUCtaek8PAkh
 GpKLG5BixlUthP1RqNheQWDUP8IIsak83ri7/QV1J4FU6u9yv4GvMMLd8SpXKpnciR
 gm3Y3U/jT9O6owMfZjv9NvYHw7qGiAt1x4mpw+yTqvnYhwFCEQ9hayhR4iQy6sEjfV
 CZw28q5FKvuOsa1snk/Fk9lDdYG3MHkYgzkfFH740sxonT9hmNhCK+tPsq4JcLNLqz
 nFZEITf0JCcaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZLKXNJmh
Subject: Re: [Buildroot] [PATCH v2,1/1] package/sudo: fix CVE-2022-43995
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-11-04 17:26 +0100, Fabrice Fontaine spake thusly:
> Sudo 1.8.0 through 1.9.12, with the crypt() password backend, contains a
> plugins/sudoers/auth/passwd.c array-out-of-bounds error that can result
> in a heap-based buffer over-read. This can be triggered by arbitrary
> local users with access to Sudo by entering a password of seven
> characters or fewer. The impact could vary depending on the compiler and
> processor architecture.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>  - Add upstream patch
> 
>  package/sudo/0001-Fix-CVE-2022-43995.patch | 53 ++++++++++++++++++++++
>  package/sudo/sudo.mk                       |  3 ++
>  2 files changed, 56 insertions(+)
>  create mode 100644 package/sudo/0001-Fix-CVE-2022-43995.patch
> 
> diff --git a/package/sudo/0001-Fix-CVE-2022-43995.patch b/package/sudo/0001-Fix-CVE-2022-43995.patch
> new file mode 100644
> index 0000000000..3f544dcf81
> --- /dev/null
> +++ b/package/sudo/0001-Fix-CVE-2022-43995.patch
> @@ -0,0 +1,53 @@
> +From bd209b9f16fcd1270c13db27ae3329c677d48050 Mon Sep 17 00:00:00 2001
> +From: "Todd C. Miller" <Todd.Miller@sudo.ws>
> +Date: Fri, 28 Oct 2022 07:29:55 -0600
> +Subject: [PATCH] Fix CVE-2022-43995, potential heap overflow for passwords < 8
> + characters. Starting with sudo 1.8.0 the plaintext password buffer is
> + dynamically sized so it is not safe to assume that it is at least 9 bytes in
> + size. Found by Hugo Lefeuvre (University of Manchester) with ConfFuzz.
> +
> +[Retrieved from:
> +https://github.com/sudo-project/sudo/commit/bd209b9f16fcd1270c13db27ae3329c677d48050]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + plugins/sudoers/auth/passwd.c | 11 +++++------
> + 1 file changed, 5 insertions(+), 6 deletions(-)
> +
> +diff --git a/plugins/sudoers/auth/passwd.c b/plugins/sudoers/auth/passwd.c
> +index b2046eca2..0416861e9 100644
> +--- a/plugins/sudoers/auth/passwd.c
> ++++ b/plugins/sudoers/auth/passwd.c
> +@@ -63,7 +63,7 @@ sudo_passwd_init(struct passwd *pw, sudo_auth *auth)
> + int
> + sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, struct sudo_conv_callback *callback)
> + {
> +-    char sav, *epass;
> ++    char des_pass[9], *epass;
> +     char *pw_epasswd = auth->data;
> +     size_t pw_len;
> +     int matched = 0;
> +@@ -75,12 +75,12 @@ sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, struct sudo_c
> + 
> +     /*
> +      * Truncate to 8 chars if standard DES since not all crypt()'s do this.
> +-     * If this turns out not to be safe we will have to use OS #ifdef's (sigh).
> +      */
> +-    sav = pass[8];
> +     pw_len = strlen(pw_epasswd);
> +-    if (pw_len == DESLEN || HAS_AGEINFO(pw_epasswd, pw_len))
> +-	pass[8] = '\0';
> ++    if (pw_len == DESLEN || HAS_AGEINFO(pw_epasswd, pw_len)) {
> ++	strlcpy(des_pass, pass, sizeof(des_pass));
> ++	pass = des_pass;
> ++    }
> + 
> +     /*
> +      * Normal UN*X password check.
> +@@ -88,7 +88,6 @@ sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, struct sudo_c
> +      * only compare the first DESLEN characters in that case.
> +      */
> +     epass = (char *) crypt(pass, pw_epasswd);
> +-    pass[8] = sav;
> +     if (epass != NULL) {
> + 	if (HAS_AGEINFO(pw_epasswd, pw_len) && strlen(epass) == DESLEN)
> + 	    matched = !strncmp(pw_epasswd, epass, DESLEN);
> diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
> index 4f9fdb4b2c..1826f72017 100644
> --- a/package/sudo/sudo.mk
> +++ b/package/sudo/sudo.mk
> @@ -23,6 +23,9 @@ SUDO_CONF_OPTS = \
>  	--without-interfaces \
>  	--with-env-editor
>  
> +# 0001-Fix-CVE-2022-43995.patch
> +SUDO_IGNORE_CVES += CVE-2022-43995
> +
>  ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
>  define SUDO_INSTALL_PAM_CONF
>  	$(INSTALL) -D -m 0644 package/sudo/sudo.pam $(TARGET_DIR)/etc/pam.d/sudo
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
