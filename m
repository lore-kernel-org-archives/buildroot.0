Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458F0FA3740
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 12:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7542402B9;
	Mon, 31 Oct 2022 12:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7542402B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OXceh-ECH26r; Mon, 31 Oct 2022 12:08:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6DB640292;
	Mon, 31 Oct 2022 12:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6DB640292
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7FDF31BF95C
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B2848146F
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:08:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B2848146F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N-3c9WBcah5N for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 12:08:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82CBB8174F
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 12:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82CBB8174F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7239D878D7; Mon, 31 Oct 2022 12:08:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 13:08:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89c245b97a1db31d0545face2d1d28de48beb488
X-Git-Newrev: 43c7fda8d6fd4834c2ee2d75abb0b9ed87120804
X-Patchwork-Hint: ignore
Message-Id: <20221031120825.7239D878D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyyaml: add host package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=43c7fda8d6fd4834c2ee2d75abb0b9ed87120804
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Jetson AGX Orin python script to flash requires host python-pyyaml.

Add a Config.in.host option for the host python-pyyaml package.

BR2_PACKAGE_HOST_PYTHON_PYYAML

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in.host               | 1 +
 package/python-pyyaml/Config.in.host | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 8ccbf40a84..b76bea60d0 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -79,6 +79,7 @@ menu "Host utilities"
 	source "package/python-greenlet/Config.in.host"
 	source "package/python-kflash/Config.in.host"
 	source "package/python-lxml/Config.in.host"
+	source "package/python-pyyaml/Config.in.host"
 	source "package/python-six/Config.in.host"
 	source "package/python-xlrd/Config.in.host"
 	source "package/python3/Config.in.host"
diff --git a/package/python-pyyaml/Config.in.host b/package/python-pyyaml/Config.in.host
new file mode 100644
index 0000000000..1e8382ef5e
--- /dev/null
+++ b/package/python-pyyaml/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_PYTHON_PYYAML
+	bool "host python-pyyaml"
+	help
+	  The host PyYAML package contains binding to the libyaml API.
+
+	  http://pyyaml.org/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
