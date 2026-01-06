Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C9BD0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D29B412AD;
	Wed,  7 Jan 2026 18:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2rMytgcYvqjq; Wed,  7 Jan 2026 18:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9343D412BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808898;
	bh=JwkBNUwijs7qHw9WfRI1yEWqe47rRDxT7RofIQFdp/w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r9Qp3R7nh7mFULbRuPZg4cRq70IwonmdAZ+M4KBP5M9PwW1NJFfAtr0ihsvWg1hYk
	 InrZxvAKLZLcUrYrImkeSGW7DstcJpTiExnrBPJeeV3Rm0p66dm1MHrmt77qEPZqJU
	 jcQ71t80GzccWaBE9cq6l4+Wy/O1C7WJSWR7t2meVzaXW5UMWjaCgUKpteiR7TQanL
	 k7tqOWXmceMQZrRRrduAtuiED+4zWf5IT9sJbfU82AjhB6oWuO/KncFiLCIkI8C6IJ
	 f5IaulnMWeQFec1uTKS0W1oiW2MVAE2LK1yXoXFq9Xt0zpIVi5lLlC0b/Uegrm+NUk
	 XD9hS5FAccBFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9343D412BC;
	Wed,  7 Jan 2026 18:01:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A1A425B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 266636083D
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eX-OvK_7daiV for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45EB660643
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45EB660643
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4571082200; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:42:48 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: a7eafdcb0ed4e91090248e1d9a5652a9510dd564
X-Git-Newrev: ef6c4dddf3c5cd780478aa2ad0f428a1107c2523
X-Patchwork-Hint: ignore
Message-Id: <20260107180112.4571082200@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/cppcms: change
 upstream to Github, bump to 2.0.1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ef6c4dddf3c5cd780478aa2ad0f428a1107c2523
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

cppcms.com now points to a Github page at
https://github.com/artyom-beilis/cppcms which has a 2.0.1 version, so
let's use that. The number of differences to 2.0.0.beta2 is very
small:

$ git log --online v2.0.0.beta2..v2.0.1
b872972 (tag: v2.0.1, origin/master, origin/HEAD, master) Version to 2.0.1
a1914f7 (tag: v2.0.0) Replaced system category with one from predating C++11 (v1.2) because std::system_category does not translate WSAGetLastError results
c4febcc Merge pull request #104 from dreaming-augustin/upstream
922cd49 Python 3.12 compatibility: wrap regex in r''.
a11e9d4 Merge branch 'cpp11'
3000bc6 (origin/1.2_updates) Merge pull request #99 from dreaming-augustin/master
44e24c7 [#89] cppcms_error fix typo + consistent  messages
a6d5575 (origin/cpp11) Added backtrace to system error
b3aef3b Fixed missing include for stripped down build
463a9a6 Removed IPV6 due to travis limitations
f8163c6 Merges from cpp11
31d4fe7 Added verbose log on failure
90bc996 Added Linux to build matrix - so I have fallback if normal build environment fails
f78ee39 Added Readme for github
a737d5d Merged python3 compatibility from master
0c67544 Support of python 2.7 and python 3
0d121a7 Python3 compatibility
2fc7e38 Python3 compatibility
d745869 python3 fix for tmp_cc

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 29641d1675756dd82486cff4d5f71321bd89cad2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cppcms/cppcms.hash | 5 +----
 package/cppcms/cppcms.mk   | 5 ++---
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/cppcms/cppcms.hash b/package/cppcms/cppcms.hash
index a8d04ff36f..8e59f66489 100644
--- a/package/cppcms/cppcms.hash
+++ b/package/cppcms/cppcms.hash
@@ -1,8 +1,5 @@
-# From http://sourceforge.net/projects/cppcms/files/cppcms/2.0.0-beta2/
-sha1  746cc5e3f58565d91d9ded6e2616399d60e9d01d  cppcms-2.0.0.beta2.tar.bz2
-md5  ef561d13ee92d2053151cab073feba10  cppcms-2.0.0.beta2.tar.bz2
 # Locally computed:
-sha256  697031c7d141fdd215c6be5090b66e2106a63bb3e52f09ee8120e8efc6c08a21  cppcms-2.0.0.beta2.tar.bz2
+sha256  4a7a2217b3fa59384650912a7000e016c308b4fa986a3d2562002691e5a9d6e7  cppcms-2.0.1.tar.gz
 sha256  fb7c15ddf590037d4cd18ebd61148a2304b9243369d238a64f599182377e32db  COPYING.TXT
 sha256  3e4012cc5950e05bedfdd2f00ceffe1ef71c46ac8c79f07e237ecb23c773f65f  MIT.TXT
 sha256  d6ce062e5cf4f7e3c536d7d2fee84c882c45245f1848ed3162401f2b29fa2b4b  THIRD_PARTY_SOFTWARE.TXT
diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index 8a59990a8d..b39122d12f 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-CPPCMS_VERSION = 2.0.0-beta2
-CPPCMS_SOURCE = cppcms-$(subst -,.,$(CPPCMS_VERSION)).tar.bz2
+CPPCMS_VERSION = 2.0.1
+CPPCMS_SITE = $(call github,artyom-beilis,cppcms,v$(CPPCMS_VERSION))
 CPPCMS_LICENSE = MIT, BSL-1.0 (boost), Public Domain (json2.js), Zlib (md5)
 CPPCMS_LICENSE_FILES = COPYING.TXT MIT.TXT THIRD_PARTY_SOFTWARE.TXT
-CPPCMS_SITE = http://downloads.sourceforge.net/project/cppcms/cppcms/$(CPPCMS_VERSION)
 CPPCMS_INSTALL_STAGING = YES
 CPPCMS_CXXFLAGS = $(TARGET_CXXFLAGS)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
