Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC161C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 20:36:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 942D76127A
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 20:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 942D76127A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F3C682CA3;
	Tue, 28 Sep 2021 20:36:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZKcNLklg7ogm; Tue, 28 Sep 2021 20:36:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8DD082591;
	Tue, 28 Sep 2021 20:36:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B7B231BF990
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 20:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4225405E9
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 20:36:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Q_It19nGk-E for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 20:36:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB86140019
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 20:36:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A19998D45C; Tue, 28 Sep 2021 20:33:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 22:35:45 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 96a48f122250335f6a5d76d5ea1c6c9d9d8d461d
X-Git-Newrev: 1cebcd27b86f57b41c0de7f1ff3ab6ddf49ca9a6
X-Patchwork-Hint: ignore
Message-Id: <20210928203356.A19998D45C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/libvirt: add
 libnl optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=1cebcd27b86f57b41c0de7f1ff3ab6ddf49ca9a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

libnl is an optional dependency (which is enabled by default) since the
addition of the package in commit
ccfc90e1010e42e6529afae3a5ea8bf7226dabc1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 69bcb52766e8a877fa024f963c544b886217aa46)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvirt/libvirt.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 396dd61577..f30baaab71 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -134,6 +134,13 @@ else
 LIBVIRT_CONF_OPTS += -Dlibiscsi=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBNL),y)
+LIBVIRT_CONF_OPTS += -Dlibnl=enabled
+LIBVIRT_DEPENDENCIES += libnl
+else
+LIBVIRT_CONF_OPTS += -Dlibnl=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPCAP),y)
 LIBVIRT_CONF_OPTS += -Dlibpcap=enabled
 LIBVIRT_DEPENDENCIES += libpcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
