Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A774C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 10:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40D224029D;
	Sat, 15 Jan 2022 10:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sadRxd_MbVs6; Sat, 15 Jan 2022 10:21:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FD0E40196;
	Sat, 15 Jan 2022 10:21:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F3DB31BF5DD
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFB8F60AC1
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:21:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FkMSJ03Az-UW for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 10:21:44 +0000 (UTC)
X-Greylist: delayed 00:07:27 by SQLgrey-1.8.0
Received: from exit1-us.msgsafe.io (exit1-us.msgsafe.io [104.131.125.206])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 25C8260AC0
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 10:21:43 +0000 (UTC)
Received: from exit1-us.msgsafe.io (localhost [127.0.0.1])
 by exit1-us.msgsafe.io (Postfix) with ESMTP id 986123F41E
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 10:14:15 +0000 (UTC)
X-Msgsafe-Uuid: a8bc7c36-a852-4682-808c-483220b40602
To: buildroot@buildroot.org <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="870760f247a1418f9c1ff9de6641a758"
Mime-Version: 1.1 (msgsafe.io)
Message-Id: <20220115101415.986123F41E@exit1-us.msgsafe.io>
Date: Sat, 15 Jan 2022 10:14:15 +0000 (UTC)
Subject: [Buildroot] package/vte: add libvte to buildroot toolchain
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
From: rainbox2k12 via buildroot <buildroot@buildroot.org>
Reply-To: rainbox2k12 <rainbox2k12@msgsafe.io>
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--870760f247a1418f9c1ff9de6641a758
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="6491fdedbc614dedae6d6dbe922e5df5"

--6491fdedbc614dedae6d6dbe922e5df5
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="ascii"
Mime-Version: 1.0

This patch is needed in order to use libvte in the buildroot toolchain.

diff --git a/package/vte/vte.mk b/package/vte/vte.mk

index 07e8136..ceb2f09 100644

\--- a/package/vte/vte.mk

+++ b/package/vte/vte.mk

@@ -11,6 +11,7 @@ VTE_SITE =
http://ftp.gnome.org/pub/gnome/sources/vte/$(VTE_VERSION_MAJOR)

 VTE_DEPENDENCIES = host-pkgconf libgtk3 pcre2 $(TARGET_NLS_DEPENDENCIES)

 VTE_LICENSE = LGPL-3.0+

 VTE_LICENSE_FILES = COPYING.LGPL3

+VTE_INSTALL_STAGING = YES



 ifeq ($(BR2_PACKAGE_ICU),y)

 VTE_CONF_OPTS += -Dicu=true

\-- Sent using MsgSafe.io's Free Plan Private, encrypted, online communication
For everyone. https://www.msgsafe.io



--6491fdedbc614dedae6d6dbe922e5df5
Content-Transfer-Encoding: 7bit
Content-Type: text/html; charset="ascii"
Mime-Version: 1.0

<p>This patch is needed in order to use libvte in the buildroot toolchain.</p>
<p></p>
<p>diff --git a/package/vte/vte.mk b/package/vte/vte.mk</p>
<p>index 07e8136..ceb2f09 100644</p>
<p>--- a/package/vte/vte.mk</p>
<p>+++ b/package/vte/vte.mk</p>
<p>@@ -11,6 +11,7 @@ VTE_SITE = http://ftp.gnome.org/pub/gnome/sources/vte/$(VTE_VERSION_MAJOR)</p>
<p>&nbsp;VTE_DEPENDENCIES = host-pkgconf libgtk3 pcre2 $(TARGET_NLS_DEPENDENCIES)</p>
<p>&nbsp;VTE_LICENSE = LGPL-3.0+</p>
<p>&nbsp;VTE_LICENSE_FILES = COPYING.LGPL3</p>
<p>+VTE_INSTALL_STAGING = YES</p>
<p>&nbsp;</p>
<p>&nbsp;ifeq ($(BR2_PACKAGE_ICU),y)</p>
<p>&nbsp;VTE_CONF_OPTS += -Dicu=true</p>
<p></p>
<br><br></div>--</div>
<div>Sent using <a href='https:/www.msgsafe.io/?utm_source=msgsafe&utm_medium=email&utm_campaign=freemailsignature'>MsgSafe.io</a>'s Free Plan</div>
<div>Private, encrypted, online communication</div>
<div>For everyone. <a href='https:/www.msgsafe.io/?utm_source=msgsafe&utm_medium=email&utm_campaign=freemailsignature'>www.msgsafe.io</a></div>


--6491fdedbc614dedae6d6dbe922e5df5--

--870760f247a1418f9c1ff9de6641a758
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--870760f247a1418f9c1ff9de6641a758--
