Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935E3CA5FFA
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 20:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A0F184089;
	Mon, 19 Jan 2026 20:17:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NHBGjtBNexuW; Mon, 19 Jan 2026 20:17:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3F6184083
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768853851;
	bh=OZTkfpxVYkBcmVPEzcBluouMTHzYYQ4wYIHscr6L4y4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CfqvIR3DeFeECq1WHwwbCwpP7vaE5Mu6S/Agnq/pkA6xRBEOASfGktvAYn/IesBp/
	 O6JZtm3FD3T5hRKnJBwcUkNejZ+9t/ujlCA5vSYV08qXUSEkosB53fSVZFqjraI5or
	 x87IIPWJodTkEvqxroGWm7JmW5nDa8ynYA/oXuwbe2DwTcFVlVSgqvqx1dqgeCqrX4
	 xHQJ+gIdR9or1HSG8xejo681cgdBPw8IH7MGYdFRq3QOVK/GSFcXXAYhTnnqrFLOm3
	 su/t1lika7mDHu1GMa8lXo7s0KfBFz8suzV2Qqc3p0YK0HyY02hzixKfF8DRxAjR4H
	 gbP6gXhlaQqvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3F6184083;
	Mon, 19 Jan 2026 20:17:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 947BC2A8
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 20:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7367940669
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 20:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xMr-25g7qvgK for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 20:17:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E7E5405EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E7E5405EB
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 20:17:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D33788695; Mon, 19 Jan 2026 20:17:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Jan 2026 21:16:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5f5ac1cbb5b9a05f2680b04d368b1da4a17ffd2
X-Git-Newrev: 888beb6c4493cb9d23958a8c1fb8b80e87d899aa
X-Patchwork-Hint: ignore
Message-Id: <20260119201729.8D33788695@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-urllib3: security bump to
 version 2.6.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=888beb6c4493cb9d23958a8c1fb8b80e87d899aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/urllib3/urllib3/releases/tag/2.6.3

Fixes the following vulnerability:

CVE-2026-21441: Decompression-bomb safeguards bypassed when following HTTP
redirects (streaming API)

https://github.com/urllib3/urllib3/security/advisories/GHSA-38jv-5279-wg99

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Julien: add link to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 76fe4e5fc9..858b8ca3a3 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  838e0ffee00ec870a3ba6727a7832ab8  urllib3-2.6.2.tar.gz
-sha256  016f9c98bb7e98085cb2b4b17b87d2c702975664e4f060c6532e64d1c1a5e797  urllib3-2.6.2.tar.gz
+md5  2c381874816fe551f50a2551abae62b3  urllib3-2.6.3.tar.gz
+sha256  1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed  urllib3-2.6.3.tar.gz
 # Locally computed sha256 checksums
 sha256  130e3a64d5fdd5d096a752694634a7d9df284469de86e5732100268041e3d686  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index d57473566b..7f7f0b03d2 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 2.6.2
+PYTHON_URLLIB3_VERSION = 2.6.3
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/1e/24/a2a2ed9addd907787d7aa0355ba36a6cadf1768b934c652ea78acbd59dcd
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/c7/24/5f1b3bdffd70275f6661c76461e25f024d5a38a46f04aaca912426a2b1d3
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
