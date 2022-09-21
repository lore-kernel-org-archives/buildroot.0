Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B77ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AF1B61060;
	Wed, 21 Sep 2022 20:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AF1B61060
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Mwea9QY9o-t; Wed, 21 Sep 2022 20:09:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77C2760AD0;
	Wed, 21 Sep 2022 20:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77C2760AD0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BDC2E1BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9846D60B9F
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9846D60B9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i_YzIOeO3lr6 for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:09:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 870A560AD0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 870A560AD0
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:09:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D45FEC0003;
 Wed, 21 Sep 2022 20:09:22 +0000 (UTC)
Date: Wed, 21 Sep 2022 22:09:21 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220921220921.5082e684@windsurf>
In-Reply-To: <20220917210519.241693-1-fontaine.fabrice@gmail.com>
References: <20220917210519.241693-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663790963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/o5IdU4PtDGztwI0JogKWdxARIkzwDQrD2aROJKNdvg=;
 b=IMKeWL7TlPBiFsr4Yf96Kr1JYRCo4lY71ttMnCxRDxEZ4DDZCsTHF9jTUo/Dx/Ro9sGdjj
 1thh3XeDls3ooC2s2YmzkYzoPVOYuPUidxCGpR7rLb6ibT2eHLhUaFhKLiw3M6NJPz5MIB
 Tc1ZJUwxkNGaw+sOg1fs9iRdLv4UmQa4gx8PirznLsxbmAPxiJ161mOlTWn/9QwW04Odk4
 IM8PL7rMb23xS3wiBuYqfb3n2UlTvlkVjH1orLV4lwV28KGxKKQyS+4hCSM1XqKEfuKc4P
 kXA9MaDCevp2aHMdH8cLQDHUq1lpefb2XO3fnc3JCiflogJmWlrT61Z1VzqJ4A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IMKeWL7T
Subject: Re: [Buildroot] [PATCH 1/1] package/ipmitool: bump to version 1.8.19
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 17 Sep 2022 23:05:19 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Switch to github to get latest release:
>   https://sourceforge.net/projects/ipmitool/files/ipmitool/%21%21%21_READ_HERE_FIRST_%21%21%21
> - Drop patches (already in version)
> 
> https://github.com/ipmitool/ipmitool/releases/tag/IPMITOOL_1_8_19
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Fix-missing-stddef.h-include.patch   |  38 -----
>  ....1-compatibility-error-storage-size-.patch | 108 -------------
>  ...iler-happier-about-changes-related-t.patch |  40 -----
>  ...ool-coredumps-in-EVP_CIPHER_CTX_init.patch |  57 -------
>  ...CIPHER_CTX_free-instead-of-EVP_CIPHE.patch | 148 ------------------
>  ...ompile-with-deprecated-APIs-disabled.patch |  50 ------
>  ...g-move-variable-definition-to-c-file.patch |  40 -----
>  ...-Fix-buffer-overflow-vulnerabilities.patch | 132 ----------------
>  ...uffer-overflow-in-ipmi_spd_print_fru.patch |  52 ------
>  ...er-overflow-in-ipmi_get_session_info.patch |  52 ------
>  .../0011-channel-Fix-buffer-overflow.patch    |  46 ------
>  ...er-overflows-in-get_lan_param_select.patch |  92 -----------
>  ...u-sdr-Fix-id_string-buffer-overflows.patch | 141 -----------------
>  package/ipmitool/Config.in                    |   2 +-
>  package/ipmitool/ipmitool.hash                |   2 +-
>  package/ipmitool/ipmitool.mk                  |  16 +-
>  16 files changed, 7 insertions(+), 1009 deletions(-)
>  delete mode 100644 package/ipmitool/0001-Fix-missing-stddef.h-include.patch
>  delete mode 100644 package/ipmitool/0002-ID-461-OpenSSL-1.1-compatibility-error-storage-size-.patch
>  delete mode 100644 package/ipmitool/0003-ID-461-Make-compiler-happier-about-changes-related-t.patch
>  delete mode 100644 package/ipmitool/0004-ID-480-ipmitool-coredumps-in-EVP_CIPHER_CTX_init.patch
>  delete mode 100644 package/ipmitool/0005-ID-480-Call-EVP_CIPHER_CTX_free-instead-of-EVP_CIPHE.patch
>  delete mode 100644 package/ipmitool/0006-lanplus-Fix-compile-with-deprecated-APIs-disabled.patch
>  delete mode 100644 package/ipmitool/0007-hpmfwupg-move-variable-definition-to-c-file.patch
>  delete mode 100644 package/ipmitool/0008-fru-Fix-buffer-overflow-vulnerabilities.patch
>  delete mode 100644 package/ipmitool/0009-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch
>  delete mode 100644 package/ipmitool/0010-session-Fix-buffer-overflow-in-ipmi_get_session_info.patch
>  delete mode 100644 package/ipmitool/0011-channel-Fix-buffer-overflow.patch
>  delete mode 100644 package/ipmitool/0012-lanp-Fix-buffer-overflows-in-get_lan_param_select.patch
>  delete mode 100644 package/ipmitool/0013-fru-sdr-Fix-id_string-buffer-overflows.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
