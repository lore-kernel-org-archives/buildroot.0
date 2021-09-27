Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC10C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:39:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A31E60FC2
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A31E60FC2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6A194021C;
	Mon, 27 Sep 2021 14:39:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zQMDFlad-uth; Mon, 27 Sep 2021 14:39:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D18994036F;
	Mon, 27 Sep 2021 14:39:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 023891BF275
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A4F66084D
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n4PwbFDrP_Gn for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 14:38:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC37B60890
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 14:38:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7008B8D2AE; Mon, 27 Sep 2021 14:35:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 16:34:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90ad7f53ec8d2929f2c4ef231bc2404204daae0f
X-Git-Newrev: ac120d277704fb212654356a6d2a2ff7be90737a
X-Patchwork-Hint: ignore
Message-Id: <20210927143554.7008B8D2AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-inflection: needs python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac120d277704fb212654356a6d2a2ff7be90737a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python 2 support has been removed since version 0.4.0 and
https://github.com/jpvanhal/inflection/commit/a826dac7a562e67881ab704adbef45440566836e
resulting in the following build failure since bump to version 0.5.1 in
commit 6c09567e6b6f2cc826e64cd9b36fb41ed7c6e00c:

  File "/home/giuliobenetti/autobuild/run/instance-1/output-1/build/host-python-inflection-0.5.1/inflection/__init__.py", line 91
    def _irregular(singular: str, plural: str) -> None:
                           ^

Propagate host-python3 dependency to host-sdbusplus

Fixes:
 - http://autobuild.buildroot.org/results/6d6e937135ef95c63001359fec5f8c28183fc0a9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-inflection/Config.in | 4 ++--
 package/sdbusplus/sdbusplus.mk      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-inflection/Config.in b/package/python-inflection/Config.in
index 427275bc71..5b6a26fead 100644
--- a/package/python-inflection/Config.in
+++ b/package/python-inflection/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_INFLECTION
 	bool "python-inflection"
-	select BR2_PACKAGE_PYTHON_UNICODEDATA if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_UNICODEDATA if BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_UNICODEDATA
 	help
 	  A string transformation library that singularizes and
 	  pluralizes English words, and transforms strings from
diff --git a/package/sdbusplus/sdbusplus.mk b/package/sdbusplus/sdbusplus.mk
index f4e258089b..498b835052 100644
--- a/package/sdbusplus/sdbusplus.mk
+++ b/package/sdbusplus/sdbusplus.mk
@@ -10,7 +10,7 @@ SDBUSPLUS_DEPENDENCIES = host-autoconf-archive host-pkgconf systemd
 HOST_SDBUSPLUS_DEPENDENCIES = \
 	host-autoconf-archive \
 	host-pkgconf \
-	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python) \
+	host-python3 \
 	host-python-inflection \
 	host-python-mako \
 	host-python-pyyaml
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
