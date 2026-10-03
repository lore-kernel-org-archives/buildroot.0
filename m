Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6C3CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3C91606A2;
	Sat,  3 Oct 2026 13:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jwGxbOS8lNF; Sat,  3 Oct 2026 13:57:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F267260F4C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035852;
	b=PxqoyNhdnJZXJIRRCYDgI3VVmFfQd+yIGQUfeCyrnaqlrZX7kVULx7Cd+G3IpyshCWTs
	 xERTbMPS1HQQskCMaITu10jl5ZKFE4iCmbcwK3Qr7Fg7Kl+y3cRN1/oc/qr8W9NE7aJGy
	 BnpO20rPCh+p24cAImgjXYtj+YdE7oivUeTY8x8Msqwu6DkbhwNUCTriYJ3O/3buAPZRB
	 DUmOHagN+1pNNHP50hwQzTLI6gIVFJ04EGaKcmKmTISCRKZfdXGDzKVNJpfJRCxd1QVv9
	 0rlXQo9KMEiRIQlfH5b+/I1zFXCWcJs8VauXeBHfroicWjFZoD3vIEjYrubb/L/A5Sw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035852;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qADVMjsgRRCreHSy1o445ESdgVRar9q10twWprqLyDI=;
	b=J10t7QagWoFSnr4z8ONF86jkvtj4je7NU/WSFtjr/1094OZrFJmWNieXLe6kFVq/zDGB
	 A8KVHny+IFbiJ2ztVpSvTojAtZhnYzZ4QjLcSns2+DrU7F3NAMpG1uvP5XRW5dGrt7tND
	 +uEOvWJruRsNBvYgO8zxto4fzS0Jjw3YTdW5IQjjATC5an28v3Dh93z1eR8hnzq4tr7Aa
	 SH7jJI6uCh2G10eeI6lh9eoOZXwGZ0vDb6Lb9BAyaEqMMvNAt54XgZWTgwvigJ893YH8W
	 3WBEe3G137gm1W2nQfqHzMAbrTlgEfZOowl81cRYOxeGQqrShzXDCLKQf8IMwb7RbQg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035852;
	bh=qADVMjsgRRCreHSy1o445ESdgVRar9q10twWprqLyDI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NyjX+miFM7BYt/x39u1xztgsOG4qj5lOIH9mcNKzXOmIInXB+CXFysgIiAMTwJkIs
	 xkmoJ/Ma3UhMxAgg8hoiyxNj8xvs6rdQx3lVP6DGAxv+ScBM+J5QiPqr8OwB/0gFMh
	 bxmkAHeft/AKbg1yk9Y8ee2eK8SSLgErFQTb+Y/xV7E/u1vu/jNJ4jdgYQ09+wmzFZ
	 y/Z2K1WVje61ZYhngh8Fjccgj30LVzfKjorP2+/QitF1wrLONQHQK/mWUu9Ef8kD3P
	 eVsrRy8xfDWbeY9MLQEKCj2jZojHGCTWnbWM+LuQiH0vBdYGxvh6Czm1KOuDgccq3R
	 17VuCmiGJAflg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F267260F4C;
	Sat,  3 Oct 2026 13:57:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 88CC1179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A173414E5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVgufwar7OcF for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 07014414E7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035816;
 b=WpzMjw/LYHE2DZiO95gCDa6X5p4GVhc9Wo8jsgVqSG+8eaBT1FA9jAjwIpqqhx+rTkOZ
 31mWwq6V38YrUh1osnk/5Vy0/4EqqmRIJOx8biwQqDnO61ANtoLc1TM8A17ZwBZwNI1Y9
 OOipggpsFW3gheRx9mM2KNwhFCWtFZz241P9/wr+KnE5qSapnu7/+UTqF5hfNbKEDsATE
 kBmiGoSdr6xm/TIqlSMP/1VJzOSWHFYIE7vVUw4TRBVVB6TNZ5hph1r2tCKc+2nKHNNos
 9F7CkgrVsDeUpNeCz3nzRv5PaDNimoSYAfNgcj93iYRY9HTR68/7Zpwdd538rwAj+6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035816;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=+UoeNL48/RmwWohizTE8yzHqDVjhHMyZSMSp7a5gwa4=;
 b=Wu1z8BR8KKOpwQwjG4RwGYYEColyp7WRFmePu76ERklghOQn4mMQUP3tpwYYmIV5D2p1
 O3nytvY4Cp+cWD4vaxQ6PhNRjxQ+vgJyQesETDsu4L0STU2VukniqKwjLUIDBng+n1nzJ
 jOxwEawap/foNGCprgFDZ2litm+4MVY+RnpHSiZSwy5mCjiLuLjkyKzojfkE9XxKgYIKs
 mlRjS9us0/qa0lGkbVG4xbzbct9fenuLLPsEgxHazMpgEzVfhInpSiAmEpbq8b0vGIEGw
 aR0Lc+6MVt+dAgS+Yy5vPcAZ6kZs3IrBDSyzWNX+b96tpBmwCtImsfRacWVz/jdqgsw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07014414E7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52A3788FDB; Sat,  3 Oct 2026 13:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b942389570f38a81589504f753f5cd9b2ccc2acb
X-Git-Newrev: 42803538e946b14e402580300ea75f17af3f111e
X-Patchwork-Hint: ignore
Message-Id: <20261003135541.52A3788FDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyproject-hooks: bump to
 version 1.3.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/42803538e946b14e402580300ea75f17af3f111e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyproject-hooks/python-pyproject-hooks.hash | 4 ++--
 package/python-pyproject-hooks/python-pyproject-hooks.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyproject-hooks/python-pyproject-hooks.hash b/package/python-pyproject-hooks/python-pyproject-hooks.hash
index 54e85e7173..e1482bf433 100644
--- a/package/python-pyproject-hooks/python-pyproject-hooks.hash
+++ b/package/python-pyproject-hooks/python-pyproject-hooks.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyproject-hooks/json
-md5  ed3dd1b984339e83e35f676d7169c192  pyproject_hooks-1.2.0.tar.gz
-sha256  1e859bd5c40fae9448642dd871adf459e5e2084186e8d2c2a79a824c970da1f8  pyproject_hooks-1.2.0.tar.gz
+md5  4946aadbb25ac57019c431257e910583  pyproject_hooks-1.3.3.tar.gz
+sha256  defda19b854fa0d3bd4f76ea4ddcba8abd7dcfcdd585a6690ade050744fc5f43  pyproject_hooks-1.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  1b22b049b5267d6dfc23a67bf4a84d8ec04b9fdfb1a51d360e42b4342c8b4154  LICENSE
diff --git a/package/python-pyproject-hooks/python-pyproject-hooks.mk b/package/python-pyproject-hooks/python-pyproject-hooks.mk
index 7edbd64294..31013f9715 100644
--- a/package/python-pyproject-hooks/python-pyproject-hooks.mk
+++ b/package/python-pyproject-hooks/python-pyproject-hooks.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPROJECT_HOOKS_VERSION = 1.2.0
+PYTHON_PYPROJECT_HOOKS_VERSION = 1.3.3
 PYTHON_PYPROJECT_HOOKS_SOURCE = pyproject_hooks-$(PYTHON_PYPROJECT_HOOKS_VERSION).tar.gz
-PYTHON_PYPROJECT_HOOKS_SITE = https://files.pythonhosted.org/packages/e7/82/28175b2414effca1cdac8dc99f76d660e7a4fb0ceefa4b4ab8f5f6742925
+PYTHON_PYPROJECT_HOOKS_SITE = https://files.pythonhosted.org/packages/6d/5d/f2ddeef4a855a102aaae5e97826a0260007522ab504421b75addfdb1517c
 PYTHON_PYPROJECT_HOOKS_SETUP_TYPE = flit-bootstrap
 PYTHON_PYPROJECT_HOOKS_LICENSE = MIT
 PYTHON_PYPROJECT_HOOKS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
