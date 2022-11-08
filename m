Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CC9C433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 19:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C959B40A6A;
	Tue,  8 Nov 2022 19:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C959B40A6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7dfjOE93k8ws; Tue,  8 Nov 2022 19:38:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02639408D1;
	Tue,  8 Nov 2022 19:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02639408D1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCCD01BF422
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3F73416EF
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3F73416EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j24j3pWhVY19 for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 19:38:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 914ED416E9
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 19:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 914ED416E9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BDCD8823C; Tue,  8 Nov 2022 19:38:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 8 Nov 2022 20:35:38 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 63570947e47e66aec8876a94bae062a81a6e1b65
X-Git-Newrev: 2acbcd1cc69f8ea08235214bb74080b5bd07a8a0
X-Patchwork-Hint: ignore
Message-Id: <20221108193844.7BDCD8823C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/usbguard: fix
 build without asciidoc
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2acbcd1cc69f8ea08235214bb74080b5bd07a8a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Set ac_cv_prog_A2X to disable build of documentation and avoid the
following build failure without a working a2x raised since at least bump
to version 1.1.1 in commit ad21d84a589458fd4542993912891daa503d72dd:

a2x -v -f manpage doc/man/usbguard.1.adoc -D ./$(dirname doc/man/usbguard.1.roff)
a2x -v -f manpage doc/man/usbguard-dbus.8.adoc -D ./$(dirname doc/man/usbguard-dbus.8.roff)
/nvmedata/autobuild/instance-5/output-1/host/bin/python3: Error while finding module specification for 'asciidoc.a2x' (ModuleNotFoundError: No module named 'asciidoc')

Fixes:
 - http://autobuild.buildroot.org/results/e41950f3cd4bd83d9b067af498757cb9d2f207ef

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cff78c34fbf80880c39725049ff42c3dd632fd7a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/usbguard/usbguard.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
index 26dc40d15b..cf8f883485 100644
--- a/package/usbguard/usbguard.mk
+++ b/package/usbguard/usbguard.mk
@@ -10,6 +10,7 @@ USBGUARD_LICENSE = GPL-2.0+
 USBGUARD_LICENSE_FILES = LICENSE
 USBGUARD_CPE_ID_VENDOR = usbguard_project
 USBGUARD_SELINUX_MODULES = usbguard
+USBGUARD_CONF_ENV = ac_cv_prog_A2X=""
 USBGUARD_CONF_OPTS = \
 	--with-bundled-catch \
 	--with-bundled-pegtl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
