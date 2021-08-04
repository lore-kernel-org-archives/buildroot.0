Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A83DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:27:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A4BD60F56
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A4BD60F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED5A040153;
	Sat,  4 Sep 2021 18:27:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6B_-QdqGwU_X; Sat,  4 Sep 2021 18:27:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16F75400EA;
	Sat,  4 Sep 2021 18:27:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02EF61BF5DD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB15F401E6
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OxQ96oS6O5Yx for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3EDB40171
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B72198834A; Sat,  4 Sep 2021 18:23:52 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 21:42:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a778fbb8ad794ea513101c493971497e20f1bbec
X-Git-Newrev: bf44a11cf67fde4ba96928a2a4196103b7ec4ef3
X-Patchwork-Hint: ignore
Message-Id: <20210904182352.B72198834A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pulseaudio: add SELinux module
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bf44a11cf67fde4ba96928a2a4196103b7ec4ef3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for pulseaudio is added by the apps/pulseaudio module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pulseaudio/pulseaudio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 19e08f55ae..372cd98da8 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -11,6 +11,7 @@ PULSEAUDIO_INSTALL_STAGING = YES
 PULSEAUDIO_LICENSE = LGPL-2.1+ (specific license for modules, see LICENSE file)
 PULSEAUDIO_LICENSE_FILES = LICENSE GPL LGPL
 PULSEAUDIO_CPE_ID_VENDOR = pulseaudio
+PULSEAUDIO_SELINUX_MODULES = pulseaudio
 PULSEAUDIO_CONF_OPTS = \
 	--disable-default-build-tests \
 	--disable-legacy-database-entry-format \
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
