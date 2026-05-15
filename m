Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E6CCD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7B7F85574;
	Tue,  9 Jun 2026 13:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbNUC8g-ohIi; Tue,  9 Jun 2026 13:02:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF3CD856E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010124;
	bh=nJTpGY+vs4gGDw6RHyV14NV8AXz13XLbkwqzkRhOjGw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rUN8hUfNR0159Qme1X85IUUneW8NLkZKlZ4/UOm2d/BYerNCngHxcYn43LUh2HvE5
	 eSrg3IHNYindclKvADxpp+LfHm/rRpXP3Bd7DdfnqrqxdnUut87/a7pMGO035ZNeLv
	 hIN7JdB16QUYmvL74sIGVzAvCR8hUrENZsTJb0r07vk/te60RNoyo6SHRX4MgR3Kfd
	 z/LLAg6C9CUYqmVgpLiclD6toofE8IlN8h0B1a8dCSd/gZmkv/3uDRQJoKztl8J/97
	 R2s+KBusoKcrwGVDHHQZ8U/0WLglypytbIZIUfIgifuRRHjQ0f5OCpmeUZ9iZ0/+QG
	 GaHI1QulcQ4Rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF3CD856E6;
	Tue,  9 Jun 2026 13:02:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11FBB196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F646423C0
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Tb7NOIwjv_u for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52657426BF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52657426BF
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D90787E7E; Tue,  9 Jun 2026 13:01:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 15:13:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40ceef27819a51263310fc1c81f7bbe3d4e2fab5
X-Git-Newrev: 0c73553d840697b78181c773786f76e318f03214
X-Patchwork-Hint: ignore
Message-Id: <20260609130115.8D90787E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-farama-notifications: bump
 version to 0.0.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0c73553d840697b78181c773786f76e318f03214
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/Farama-Foundation/Farama-Notifications/releases/tag/0.0.6

Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../python-farama-notifications/python-farama-notifications.hash    | 4 ++--
 package/python-farama-notifications/python-farama-notifications.mk  | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-farama-notifications/python-farama-notifications.hash b/package/python-farama-notifications/python-farama-notifications.hash
index b8ef65f8a8..951f82e9ae 100644
--- a/package/python-farama-notifications/python-farama-notifications.hash
+++ b/package/python-farama-notifications/python-farama-notifications.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/farama-notifications/json
-md5  5caeb9a1f37a2e4ccdeff13858f41444  Farama-Notifications-0.0.4.tar.gz
-sha256  13fceff2d14314cf80703c8266462ebf3733c7d165336eee998fc58e545efd18  Farama-Notifications-0.0.4.tar.gz
+md5  34f4a8cdb0c313712c64c5c0234ea633  farama_notifications-0.0.6.tar.gz
+sha256  b19acac4bb41d76e59e03394b5dd165f4761c86fa327f56307a35cbee3b60158  farama_notifications-0.0.6.tar.gz
 # Locally computed sha256 checksums
 sha256  7ff6336b33ae4c168086e899a11b7c91d369b6758cee20f9469d563f004f89eb  LICENSE
diff --git a/package/python-farama-notifications/python-farama-notifications.mk b/package/python-farama-notifications/python-farama-notifications.mk
index 2ed06ad150..14759d3b1d 100644
--- a/package/python-farama-notifications/python-farama-notifications.mk
+++ b/package/python-farama-notifications/python-farama-notifications.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FARAMA_NOTIFICATIONS_VERSION = 0.0.4
-PYTHON_FARAMA_NOTIFICATIONS_SOURCE = Farama-Notifications-$(PYTHON_FARAMA_NOTIFICATIONS_VERSION).tar.gz
-PYTHON_FARAMA_NOTIFICATIONS_SITE = https://files.pythonhosted.org/packages/2e/2c/8384832b7a6b1fd6ba95bbdcae26e7137bb3eedc955c42fd5cdcc086cfbf
+PYTHON_FARAMA_NOTIFICATIONS_VERSION = 0.0.6
+PYTHON_FARAMA_NOTIFICATIONS_SOURCE = farama_notifications-$(PYTHON_FARAMA_NOTIFICATIONS_VERSION).tar.gz
+PYTHON_FARAMA_NOTIFICATIONS_SITE = https://files.pythonhosted.org/packages/ec/91/14397890dde30adc4bee6462158933806207bc5dd10d7b4d09d5c33845cf
 PYTHON_FARAMA_NOTIFICATIONS_SETUP_TYPE = setuptools
 PYTHON_FARAMA_NOTIFICATIONS_LICENSE = MIT
 PYTHON_FARAMA_NOTIFICATIONS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
