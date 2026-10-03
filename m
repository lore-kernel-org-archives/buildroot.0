Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416C4CA5FE8
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05A3E60E8D;
	Sat,  3 Oct 2026 10:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yzTjZEEGb9-9; Sat,  3 Oct 2026 10:08:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1683860EBA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022083;
	b=aJDti/xREgL/d7NOK2cbK52ePMChkQobIRN0qJegGttqmEvsVC2yDBk1efgMKm0AuRsQ
	 Yv7dYCYJpxj9HnU9Q2FfIettgMnEwkj7mAbfQBz7s6x7EEyy62XZlRAxiv0NECYCSXT6L
	 AW6RKWcpybJQy9Ii4DejykHZbMfB+b7Qgay1P6jRR1T/lnbasp6B/rbuzoU+q0G+ZDq4U
	 DJxQy0QlSKEDEQNudQIgpuh4EluaH65zYgWuOFGGK04zdE+I/qAkG5ujgWW5YvOzVn91K
	 Xe192z3XVanU+7c8UQFqaCRW8mkrlyGfg9awMcWrSUlYHNpuOZRt7mtmHfqidDCdB/Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022083;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DDhRwbM5xhpxEukCPcIzCS1X8kNAbmyEyhJ9QRmxG1c=;
	b=PjF2bTKPOkoXnPVEco4mD5htSGmEe8qzUtpmQFoYX6QviyWNMMp/8HzTrUjqJfXhG/3s
	 DeSx4CSfTmrekzuCmL+1q8zcUQtSU98qL1hqPdHcxlTCm+tVkFw/+AjIUqo5wtG5RhLqZ
	 WfiNFOyedtL6a2jrUSz6PGPPXfhYx3wFTi8qj3LK2Mcpiw60h9d4/lwksF7F9YZPp71fK
	 6MJf6GR9j57Gw2ezLMHKsP5fHpg5uN9mebpCNFUI7CcweFvu1VEbZB0UekxZZpvvVrbiW
	 uGEc1RC0On0gmyCe61FAbLT4M3FiDe5/YwI2fhkSUutdxl1kP7DeD5I4XEOlgwW6cqA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022083;
	bh=DDhRwbM5xhpxEukCPcIzCS1X8kNAbmyEyhJ9QRmxG1c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Mc2XYHuECO/YZsweRqcrTivcYrL3SDUxbkYFpfVnca34erYmwZa9e2vRNvYU58uAG
	 hmtWnhGqg61vYe2re8NV9lZXKk58NMPWhyJSg59pb2f5l3CwNZQZgXz/OTNKu5KUEe
	 vKXIgp0TaCq5bESSfBbo+eHdIjbb4x/XKaw3wrMvVkjB/EZEKDFXBuX6gdXlfLptgu
	 ZWjDWnbfu5nW6LfIsADsZdxYtX/0RnX424z0tn2p9Yj71Fmn4ozzPQsG4+yhrBxZCx
	 hCxfr4SeGmKUiyZa2lLkGpSJxx7cYixaoWTsMNxi6NEIifuV0Knr3RQJYyqxRbr7Ip
	 KGdAQJMm2HtJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1683860EBA;
	Sat,  3 Oct 2026 10:08:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 36396476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2722160E84
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wkACSC5BSdAv for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D749E60E98
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022029;
 b=Ra8nhjXkT6H2ZCHNadO1HQNZo/QZAz1w7u+dj/4tFO3W9eFSKz6yepYw2qVJXLZr4l2q
 INwshaAwTqC29/e2APOmSfIfY4hmyttFTemzl9x5VfRXZ6LkhnqKQNL6v4tKGz8pgZrB1
 dn19MLgaY87S3/tYxrq5f1VXA3oJthQWMmHnafX4Us9s8lfWe9ZbzlvpatNyAfdJe4cVr
 IYeNlTyP/OR6YVRgtU/kOCeYnk/3Dq/WWdJJE/1zxEb5QU3AqWwPcOJlqzAU1Dl66IhsF
 XiY6IUoLBhIf0k5heS+H6nipxC1aIneKoVzn+LAZdESj6kOeWRPH21U3URwMV/b1izA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022029;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1GDb06LSoZVM7W7cDiQIdBwz5bff4lckg+xIuGyTJXE=;
 b=TgbhFyOrcWn2KeH5ZOlvhVlIhzAfFffi6KqpoKU6ajiUASkmOn62JLQC4ds4twM6Qo1Q
 jg7zxAhbyq5y8RvMgtQ2dQ+YADxedEzl3jfNa0mUdqZrxX0TrIHPNNL7xRgtIE7bZ3DaX
 5FivkIRcJIJk0Km2Kh5WdBJ7hfQu884B1ipQg9qaUx1W1rLl+ukDYzmafiTQlr3eygPzc
 3+2VoooaHw9wZIjjHTxLxcH6ON8Y8AGsrp+Av+zBkKJqq9Mx2R+YBPua6zHGE8b2S5r04
 xfkm8O61EWc8aRRiuNQDoLxQdINF+u2I5cK2VP5crTgBvBFMJMONqJ5YK70eeCsAObA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D749E60E98
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41F5988801; Sat,  3 Oct 2026 10:05:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e077275a119a666014277226f25af1613d7a9559
X-Git-Newrev: 0d644bc38ed94173905ce43e4f243e4651ae8b04
X-Patchwork-Hint: ignore
Message-Id: <20261003100555.41F5988801@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/scons: bump to version 4.11.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0d644bc38ed94173905ce43e4f243e4651ae8b04
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/scons/scons.hash | 4 ++--
 package/scons/scons.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/scons/scons.hash b/package/scons/scons.hash
index 3a8a942ee8..56f9f1db51 100644
--- a/package/scons/scons.hash
+++ b/package/scons/scons.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/scons/json
-md5  37ad818d24ad2f44d6bee5b0f3838706  scons-4.8.1.tar.gz
-sha256  5b641357904d2f56f7bfdbb37e165ab996b6143c948b9df0efc7305f54949daa  scons-4.8.1.tar.gz
+md5  c382470963a5a836e45972e61f0f038d  scons-4.11.1.tar.gz
+sha256  4210d1a80a62e986029208117991b6347ccaaaab37b67463a3ff31ee065dc487  scons-4.11.1.tar.gz
 # Locally computed sha256 checksums
 sha256  2f6ac9a1fc98394d18b80dba9bedb9d5626006d44db3fecf7cf3e21cff7e8b1c  LICENSE
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index f1f76f38a6..d9a38c0be3 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SCONS_VERSION = 4.8.1
-SCONS_SITE = https://files.pythonhosted.org/packages/b9/76/a2c1293642f9a448f2d012cabf525be69ca5abf4af289bc0935ac1554ee8
+SCONS_VERSION = 4.11.1
+SCONS_SITE = https://files.pythonhosted.org/packages/42/b9/b7a5c88f348a0c34594d88100872c55fa1cae863ccb222c1c438341b5503
 SCONS_LICENSE = MIT
 SCONS_LICENSE_FILES = LICENSE
 SCONS_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
