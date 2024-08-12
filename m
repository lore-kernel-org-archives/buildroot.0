Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93871E6FE47
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FD3C846D1;
	Fri,  6 Sep 2024 20:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sk-oJS8Q0-8D; Fri,  6 Sep 2024 20:01:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6358846D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6358846D2;
	Fri,  6 Sep 2024 20:01:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E2B21BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D94D16110C
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ao94C1IbUWGv for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0CAE6066C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0CAE6066C
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDB5F86EE3; Fri,  6 Sep 2024 19:58:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 22:15:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e26f9345603b500b2ed0f290fd42c65131ea72e8
X-Git-Newrev: 9173306d2428a49d9d12686c4be02729920371e0
X-Patchwork-Hint: ignore
Message-Id: <20240906195852.DDB5F86EE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bird: update to 2.15.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9173306d2428a49d9d12686c4be02729920371e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See here for a changelog:
https://gitlab.nic.cz/labs/bird/-/blob/master/NEWS

An uClibc-ng based system needs _GNU_SOURCE in the CFLAGS to
provide getrandom().

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bird/bird.hash | 2 +-
 package/bird/bird.mk   | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/bird/bird.hash b/package/bird/bird.hash
index a62fbba630..a781e314df 100644
--- a/package/bird/bird.hash
+++ b/package/bird/bird.hash
@@ -1,2 +1,2 @@
-sha256  3ec462a237d06d1f4455d6ec00a42f0b1686061fc988e5c89a841d01dd753b53  bird-2.0.12.tar.gz
+sha256  48e85c622de164756c132ea77ad1a8a95cc9fd0137ffd0d882746589ce75c75d  bird-2.15.1.tar.gz
 sha256  94c53c84320078920ac1f0d49c81a4e9004512f534521a58bdf145acbcbc2cd2  README
diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index f1b2ee6c5e..34d7912954 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIRD_VERSION = 2.0.12
+BIRD_VERSION = 2.15.1
 BIRD_SITE = https://bird.network.cz/download
 BIRD_LICENSE = GPL-2.0+
 BIRD_LICENSE_FILES = README
@@ -12,6 +12,8 @@ BIRD_CPE_ID_VENDOR = nic
 BIRD_SELINUX_MODULES = bird
 BIRD_DEPENDENCIES = host-flex host-bison
 
+BIRD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
+
 # 0001-configure.ac-fix-build-with-autoconf-2.70.patch
 BIRD_AUTORECONF = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
