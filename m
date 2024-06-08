Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A7FC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 14:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5C51607A7;
	Sat,  8 Jun 2024 14:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9y_7Fyfyq5_r; Sat,  8 Jun 2024 14:01:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C92A8607FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C92A8607FE;
	Sat,  8 Jun 2024 14:01:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 00A681BF41A
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 14:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED83742676
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 14:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E10RuEfv2u2G for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 14:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAF1A40811
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAF1A40811
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 14:01:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0C538218A; Sat,  8 Jun 2024 14:01:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 15:40:08 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 4424203ae58e620c38200c3b1b472bedda1fd19b
X-Git-Newrev: dbe045d0169aa77b7c2eaa159e267df4ec50e25d
X-Patchwork-Hint: ignore
Message-Id: <20240608140141.C0C538218A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/gr-osmosdr: fix
 python build
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

commit: https://git.buildroot.net/buildroot/commit/?id=dbe045d0169aa77b7c2eaa159e267df4ec50e25d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fix the following python build failure:

In file included from /home/buildroot/instance-0/output-1/host/include/python3.11/Python.h:38,
                 from /home/buildroot/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include/pybind11/detail/common.h:266,
                 from /home/buildroot/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include/pybind11/attr.h:13,
                 from /home/buildroot/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include/pybind11/detail/class.h:12,
                 from /home/buildroot/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include/pybind11/pybind11.h:13,
                 from /home/buildroot/instance-0/output-1/build/gr-osmosdr-0.2.4/python/bindings/device_python.cc:1:
/home/buildroot/instance-0/output-1/host/include/python3.11/pyport.h:596:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
  596 | #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/f009958c37902a224512b336fcb431903bdd0b96

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8759d81b0017e062d0909bf0ddccefdc052d83b1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gr-osmosdr/gr-osmosdr.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
index 316ed80887..0d1e4edb30 100644
--- a/package/gr-osmosdr/gr-osmosdr.mk
+++ b/package/gr-osmosdr/gr-osmosdr.mk
@@ -23,7 +23,9 @@ GR_OSMOSDR_CONF_OPTS = \
 GR_OSMOSDR_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
-GR_OSMOSDR_CONF_OPTS += -DENABLE_PYTHON=ON
+GR_OSMOSDR_CONF_OPTS += \
+	-DENABLE_PYTHON=ON \
+	-DPYTHON_INCLUDE_DIRS=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
 GR_OSMOSDR_DEPENDENCIES += python3 host-python-six
 else
 GR_OSMOSDR_CONF_OPTS += -DENABLE_PYTHON=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
