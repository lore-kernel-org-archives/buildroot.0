Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B65C433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 12:32:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CB4960C40
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 12:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CB4960C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E599160699;
	Sun, 14 Nov 2021 12:32:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id daIwdst95Hiv; Sun, 14 Nov 2021 12:32:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3512160688;
	Sun, 14 Nov 2021 12:32:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD2711BF34C
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 12:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD9C980DF8
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 12:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kfOn_-VW9Wiw for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 12:32:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3299B80DF7
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 12:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636893140;
 bh=KUqVa80A8ZqlsrkjLh/UYg0rbwRvDiVn1LcJ2/TGfTs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=D9t5o1TkK2Kei1zLchoIrvI3jI1cJeRvtx9+bDONWfzjgxMR684kzc0LFAjh3CpAf
 11Y5iI4rYO1FGaMmDcs0zFtp0jyWMM3IY2/baecTb7kAsu3DV4xEcjMkRNYap2ZnCP
 31fbtC/Ehwq4QCTnbMUGstRleK2xntgUpaEYPm6A=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.16]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1Ycr-1moiit1RqF-0037fk; Sun, 14
 Nov 2021 13:32:20 +0100
Date: Sun, 14 Nov 2021 13:32:17 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211114133217.068c6c87@gmx.net>
In-Reply-To: <20211114103349.962611-1-fontaine.fabrice@gmail.com>
References: <20211114103349.962611-1-fontaine.fabrice@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:xvBKgVXwVcE3kPzTo1/tLwyZLTNSN7ejM2XWvxVpeGVLVtYpkND
 q0kE24WtFk9wNnJbwDWChpYeaomcO3jheTyfEDVOHBxmh2ElcMddEF3FKa2Im6b9vV1Er1T
 xfPWWXdMPfDNX9EKCQN1no/AWU2Z3vscUzPotEpeIcMhg4xDsWPmvFGMeJh5crMxyIMMiPR
 2P7Ndj3qMaOSeumKEfD4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:39ymtvaoeCE=:d+RK0zn1eol/ZWehok8zGt
 YT9LP3EyVX1fw8OB1pNBUD/VLBCOgyX+LW7FADy+ftNqVnxcJiwaP2mB3gkZmZ6TnMC6I4C4A
 rQUlJZOj/cq1rBBzBtJeoCxYOzrQB9WgevTfTvTsJjA5FiQ+YLgXzCqVnVN1Ai6y2HKM0LC6I
 B2e3OH3vuH7pcRagYReq8b0cuLYIXl97YQPP1PWDD97t7+3q34r9jvDrscT7IzZ4XS9MMxe1v
 I09ShXXX8nyhCsjro/g8jJxMO8B4G2KAvhjjXzWxUpWwUrafMsZIJPHD0nI3+7N9eOOuhojy4
 yEjqW7WoWM1i2NgXYK68PB4E6yCZXhG55BnQ3xI2wa9memQku33XB7w1k6K6/APmjOIgbn3Dh
 m4XqQVn2ihSQI1PcQdKUaHaouhAhzWRmnbAqyMcT4ou8l8pmDsQpn0GYdS9249ScRAdt440gP
 iN3EGFakDEeUNvMAPGMScvQgIqGmOmYW7Tylp1fmLLKoJaBC/sORL5vvH6osqyLtys5zJXyT4
 2Te8/fNFj6dEuSSZchGg7E9kmHLCPe672k46JtdPZip19o7/NSfttSsu0ifbkOqj+kHaMYwTO
 5MIH8ytrY191WN+WhnU04ESS+mNFp0gDWoxF4KySenCRx5/zeNQ0j58fJtKe5f2u+o4EUEEXa
 1P9Ws/6FFwv+E55o4T6cnZEAAkkvGBUVbRnRSj2gjEMKgJy1Xyr577Qo6B/om0G9j4Adj9fDS
 ocP4NfOd4GxKqYoE1PhA1jykK+Kwln9iSAW0iqeMiIgACgM82Sij1t7Gb5DgW2B9WwsyCgBSc
 lCXKenOJSQ8kJ1qKa5FRpuPOnospFhT1AyM78M6ucJv+qy58CdjgWd8/P+RjcnT84BGbaLeeh
 VmpHe64e2cGDceZnm4iHac21OVoXS0o/Qjz+jKKg+kFMZstWPk3YGBKH3UJvdEgOl5CewdT4J
 JXw7AI1d/HsFNj43PDVYLDkQHG+KoCdCElGcOgQQTNCFxIlyJt7zl5M3FOHoHB6oMdjEcZ7On
 ywtdPcX6d5uErOX+bRHzKMjBZZMPAz4UvwXNreHiF9A6h7dnNsN2ZVihXej+0RsPtTz2flq4K
 BjZw+OW3eIrrrs=
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5base: add libkrb5
 optional dependency
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
Cc: Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Sun, 14 Nov 2021 11:33:49 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libkrb5 is an optional dependency which is enabled by default (with no
> user option) since version 5.14.0 and
> https://github.com/qt/qtbase/commit/93b7b0ec76572427291d8e2eef9a10eb499417a9
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>


--- build/qt5base-5.15.2_orig/config.summary     2021-11-14 00:00:33.698378466 +0100
+++ build/qt5base-5.15.2/config.summary 2021-11-14 13:16:42.818139194 +0100
[...]
@@ -57,7 +57,7 @@
   OCSP-stapling .......................... no
   SCTP ................................... no
   Use system proxies ..................... yes
-  GSSAPI ................................. no
+  GSSAPI ................................. yes
 Qt Gui:
   Accessibility .......................... yes
   FreeType ............................... no


Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Out of interest, how did you stumble over this and the zstd one?

Regards,
Peter


> ---
>  package/qt5/qt5base/qt5base.mk | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index b04d710d78..ba2971dc08 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -233,6 +233,8 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_TSLIB),tslib)
>  QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_LIBGLIB2),-glib,-no-glib)
>  QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_LIBGLIB2),libglib2)
>
> +QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_LIBKRB5),libkrb5)
> +
>  QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_ICU),-icu,-no-icu)
>  QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_ICU),icu)
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
