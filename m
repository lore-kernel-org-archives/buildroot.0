Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD55C6FA99
	for <buildroot@archiver.kernel.org>; Fri, 10 Mar 2023 21:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3012D41753;
	Fri, 10 Mar 2023 21:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3012D41753
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wuZag4A0PIPi; Fri, 10 Mar 2023 21:01:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50D2D41781;
	Fri, 10 Mar 2023 21:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50D2D41781
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AB261BF390
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 21:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 632424173E
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 21:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 632424173E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0PsPDHj2dnmj for <buildroot@lists.busybox.net>;
 Fri, 10 Mar 2023 21:01:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F0724170F
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 21:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F0724170F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 725F186E46; Fri, 10 Mar 2023 21:01:03 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 10 Mar 2023 21:56:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70d9f17c48f8aaf02e6cd4c17093c00d07eb56c8
X-Git-Newrev: f1623664253853208773b7318165189b5cf94867
X-Patchwork-Hint: ignore
Message-Id: <20230310210103.725F186E46@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: fix build with
 -Dmodem_manager=false
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1623664253853208773b7318165189b5cf94867
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with -Dmodem_manager=false raised since
commit c36f6938858d3246ca493dacc925717586e2ea0f:

../output-1/build/network-manager-1.40.10/meson.build:1060:0: ERROR: Unknown variable "mobile_broadband_provider_info_database".

Fixes:
 - http://autobuild.buildroot.org/results/896879c8e8ce022556ee834216ced2f962ff279c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: John Keeping <john@metanate.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...-fix-build-failure-with-Dmodem_manager-fa.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/network-manager/0002-meson.build-fix-build-failure-with-Dmodem_manager-fa.patch b/package/network-manager/0002-meson.build-fix-build-failure-with-Dmodem_manager-fa.patch
new file mode 100644
index 0000000000..648be027e0
--- /dev/null
+++ b/package/network-manager/0002-meson.build-fix-build-failure-with-Dmodem_manager-fa.patch
@@ -0,0 +1,38 @@
+From 736a2c356c1c4871e8c4e70be622c65c87d3bca8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 21 Feb 2023 13:03:00 +0100
+Subject: [PATCH] meson.build: fix build failure with -Dmodem_manager=false
+
+Fix the following build failure with -Dmodem_manager=false raised since
+https://gitlab.freedesktop.org/ffontaine/NetworkManager/-/commit/03ba04d4784fa4fc7ec31455070fb5ecf25ade23:
+
+../output-1/build/network-manager-1.40.10/meson.build:1060:0: ERROR: Unknown variable "mobile_broadband_provider_info_database".
+
+Fixes:
+ - http://autobuild.buildroot.org/results/896879c8e8ce022556ee834216ced2f962ff279c
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/1544]
+---
+ meson.build | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 84ce52c736..b79240efc0 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1057,7 +1057,9 @@ output += '  jansson: ' + jansson_msg + '\n'
+ output += '  iptables: ' + config_h.get('IPTABLES_PATH') + '\n'
+ output += '  nft: ' + config_h.get('NFT_PATH') + '\n'
+ output += '  modemmanager-1: ' + enable_modem_manager.to_string() + '\n'
+-output += '  mobile-broadband-provider-info-database: ' + mobile_broadband_provider_info_database + '\n'
++if enable_modem_manager
++  output += '  mobile-broadband-provider-info-database: ' + mobile_broadband_provider_info_database + '\n'
++endif
+ output += '  ofono: ' + enable_ofono.to_string() + '\n'
+ output += '  concheck: ' + enable_concheck.to_string() + '\n'
+ output += '  libteamdctl: ' + enable_teamdctl.to_string() + '\n'
+-- 
+2.39.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
