Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D438E67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DF744087F;
	Sun, 21 Dec 2025 22:12:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UMRbiLvlLrK1; Sun, 21 Dec 2025 22:12:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC03740779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766355166;
	bh=fOXEpV9rfiYSCw2YU+y8X1WYIRWr/8g7LECXHIT8yjk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ISfMCCQODk+cFTKIqDoYLjW0MppXNXcS88z3PTiQsO103SBPeZ179j3S6rwJ69hDi
	 gNBG4PP3TzWzUqwQP1Pfk9qQsDNRNtydldrtG0ARzyCL1xO2ADTTjuLZXAnQldz7vV
	 kagld+xI66i49Dgi7HuHA4Xd5hzItIGAXDtNkvsXA4HS18UE2Q5m2WrLvXjzTvcRSK
	 pitI/8a56wLSFZ8I9W2WBnwkV3JvL3Sgr9JFrMnLYoYDkwTicvk+O/3KWunmwSli76
	 OrJje695Gh4nRUL/qkb93Wju58jARGMgJ6IVMXvpy4mTNl8IH/L1r0aFJhtb7mYVIi
	 ydN84OZqhDOKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC03740779;
	Sun, 21 Dec 2025 22:12:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F1F3195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B3E14078E
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IKBpG4hLBvQq for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DA4540789
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DA4540789
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CDAF870BB; Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 22:58:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dee2bb0fac979f0d11d07aee0406e45db92ad9bb
X-Git-Newrev: 5e9d79ac897242823aa6330a71bb3be5afce14d7
X-Patchwork-Hint: ignore
Message-Id: <20251221221227.7CDAF870BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-grpclib: bump version to
 0.4.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5e9d79ac897242823aa6330a71bb3be5afce14d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/vmagamedov/grpclib/blob/v0.4.9/docs/changelog/index.rst

Updated license hash due to upstream commit:
https://github.com/vmagamedov/grpclib/commit/069f2493abcd7734231e4071d5ecb9b83852a8a9

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-grpclib/python-grpclib.hash | 6 +++---
 package/python-grpclib/python-grpclib.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-grpclib/python-grpclib.hash b/package/python-grpclib/python-grpclib.hash
index 31ff505fdb..022c9a7575 100644
--- a/package/python-grpclib/python-grpclib.hash
+++ b/package/python-grpclib/python-grpclib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpclib/json
-md5  c37be825d02fa3f3f488f172c784ca71  grpclib-0.4.8.tar.gz
-sha256  d8823763780ef94fed8b2c562f7485cf0bbee15fc7d065a640673667f7719c9a  grpclib-0.4.8.tar.gz
+md5  4dbde1ad88752eefa7bf70f1fa186182  grpclib-0.4.9.tar.gz
+sha256  cc589c330fa81004c6400a52a566407574498cb5b055fa927013361e21466c46  grpclib-0.4.9.tar.gz
 # Locally computed sha256 checksums
-sha256  6c7fa8cf9b94ad5043a6b550a0ffb98356e66100b69dd1cb8e1f82606b436e8e  LICENSE.txt
+sha256  8d61e1a3368175363c2983902aad03df636144b01144c0f82c2e9b0d41fa9166  LICENSE.txt
diff --git a/package/python-grpclib/python-grpclib.mk b/package/python-grpclib/python-grpclib.mk
index 4f8406ee69..70a0824e64 100644
--- a/package/python-grpclib/python-grpclib.mk
+++ b/package/python-grpclib/python-grpclib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCLIB_VERSION = 0.4.8
+PYTHON_GRPCLIB_VERSION = 0.4.9
 PYTHON_GRPCLIB_SOURCE = grpclib-$(PYTHON_GRPCLIB_VERSION).tar.gz
-PYTHON_GRPCLIB_SITE = https://files.pythonhosted.org/packages/19/75/0f0d3524b38b35e5cd07334b754aa9bd0570140ad982131b04ebfa3b0374
+PYTHON_GRPCLIB_SITE = https://files.pythonhosted.org/packages/5b/28/5a2c299ec82a876a252c5919aa895a6f1d1d35c96417c5ce4a4660dc3a80
 PYTHON_GRPCLIB_SETUP_TYPE = setuptools
 PYTHON_GRPCLIB_LICENSE = BSD-3-Clause
 PYTHON_GRPCLIB_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
