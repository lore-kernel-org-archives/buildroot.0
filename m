Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DDCC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:41:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0360660F46
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0360660F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEB626082A;
	Mon, 27 Sep 2021 14:41:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rE0NDj_UtKoA; Mon, 27 Sep 2021 14:41:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E32F60808;
	Mon, 27 Sep 2021 14:41:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 471EA1BF275
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52AF5404C8
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:38:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GqnyyMixQs4w for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 14:38:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E01F40488
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 14:38:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5B6568D266; Mon, 27 Sep 2021 14:35:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 16:34:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d4fcb8cf37de94ff672416e454310be66c3778d
X-Git-Newrev: 14a0cb805d1cb8a8d1276a97ecdf3501d76d06c3
X-Patchwork-Hint: ignore
Message-Id: <20210927143554.5B6568D266@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-beautifulsoup4: needs
 python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=14a0cb805d1cb8a8d1276a97ecdf3501d76d06c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python2 support has been removed since version 4.9.3 resulting in the
following build failure since bump to version 4.10.0 in commit
109ea1a4a2f9154c5d9502ba814a09e1e1bbd9f5:

  File "/tmp/instance-1/output-1/build/python-beautifulsoup4-4.10.0/bs4/__init__.py", line 36, in <module>
    raise ImportError('You are trying to use a Python 3-specific version of Beautiful Soup under Python 2. This will not work. The final version of Beautiful Soup to support Python 2 was 4.9.3.')

Fixes:
 - http://autobuild.buildroot.org/results/57e6677932f587c279cc0ed671895740d0cf2304

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-beautifulsoup4/Config.in | 1 +
 package/python-pytablereader/Config.in  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-beautifulsoup4/Config.in b/package/python-beautifulsoup4/Config.in
index eb7d2ba673..93fa540a73 100644
--- a/package/python-beautifulsoup4/Config.in
+++ b/package/python-beautifulsoup4/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_BEAUTIFULSOUP4
 	bool "python-beautifulsoup4"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_SOUPSIEVE # runtime
 	help
 	  Beautiful Soup is a Python library for pulling data out of
diff --git a/package/python-pytablereader/Config.in b/package/python-pytablereader/Config.in
index e6b2a4a306..2642d3fdad 100644
--- a/package/python-pytablereader/Config.in
+++ b/package/python-pytablereader/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYTABLEREADER
 	bool "python-pytablereader"
-	depends on BR2_PACKAGE_PYTHON3 # python-mbstrdecoder, python-pathpy
+	depends on BR2_PACKAGE_PYTHON3 # python-mbstrdecoder, python-pathpy, python-beautifulsoup4
 	select BR2_PACKAGE_PYTHON_BEAUTIFULSOUP4 # runtime
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
 	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
