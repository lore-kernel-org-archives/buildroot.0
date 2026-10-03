Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275FCCA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F10DC60672;
	Sat,  3 Oct 2026 15:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Tu2h7YaFzzB; Sat,  3 Oct 2026 15:54:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 15D8060683
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042862;
	b=LQ1uCb8m0BDFkusNIX8Ov4zPS3ElAebOcCLHttTf9EYdHG/9UBysqgmViYU79Jor5JjA
	 GKmsQrTUrBtCikCWB8aYVneNz7XBbqXm00tFvdlHGLW2VTgsXI2ofbdueZDc9fJ1HYvJu
	 IWNNn2ZT9YPuuUVL+Avde5NxFW8VzCiJK9LVxc4ydN2uzIg4JWKYEw4uvLbmW365VcGs6
	 EBfSFVQ9WckYoL5Nt8Z6qYYXY8FSNPlLzIcMDc7Val7vhZ34TggZrB15nJR3OJJVgQVD3
	 jCGyQmrCq8K+VzlycY+RMPCkoXrPjEGnHkOOfhkUyVpqkBr66+6w3FvA47hCHvT6/Lg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042862;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kDxrdh6dL6ZBXwUT9qXYwEh0r5yfW8t6f+mP2j6zcfM=;
	b=WV0RgAxzxJggbPJNALoUPBRfu+vM7Eq1Lo14LkGItMCnp2Fj08lLd4WibV0lzIJmXF4b
	 J6LDEIgPjE1XIER4hoHfV8nXUlPIJmrl4eS7SWWVUTzpfyCtu2HijgdeyPmE2ejO9nODJ
	 3xek4dHukt+FJPkpjZ1ZayzDaSy+FaP4X+tQohSbFqaJ3jpN84gSF4h0vor7uHe2H/Ns0
	 xch06VNtpSNI9ylrFSnRQOYgrsyNJr0KivDyjFyakypwEjo7kM30dXPG3WftGzSoKVlnq
	 QQNut5up5JsEiqaNeFn7Ddi569yyLk8saAiB0550CREUS/4xVKPLZg+RrEt/iEmm47w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042862;
	bh=kDxrdh6dL6ZBXwUT9qXYwEh0r5yfW8t6f+mP2j6zcfM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Hw0JOZRP8mFr+Zq8AaOY31YSXM2jORyNuJXuZzXxS7o/bX0XC5cjkOjWAb/cLstX5
	 XTplVUb2qD/NJ0fvgaPsyEh7erxsjK9S100c2g9ykHHlsH7thkjtBbaXuZWWyZHaQE
	 f/kHvzB6pBQT/HCVLgcXFm7zahOsFUqE6zsbmK/PIge93g6hoj7E9XrzUY2ZsdJ+Xl
	 R6D8wBsbGzkS+ggSLcYJ28f9wRk7GaMQDcv1C9TdRsU4sHvyZ2e2aI9p0Q+lPI9sQ2
	 QxLaWKrRVPcKv7RV0MrKem8IE+o7hBS1mfcFcbWrV5jB9ZAc6i7xo7FTQW/tYD/0Pv
	 4MdVSA0jkMyJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15D8060683;
	Sat,  3 Oct 2026 15:54:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 58467A0F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D49240FC5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f7UiTmtsOb4t for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 883FD41000
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042843;
 b=ojoLUcIaVYT2Vx6bYgcybiy/xPupyIuIk5Cm+Y7CaCrKDDjH3e8sJUhlGk8e2ZXBoQsf
 GKL704kYLvzmaMgOuZW/6GyzCVJgMzDuCcaiQk61+urdtyt94aUyEH9IPS3Ml+oKBMdGH
 c99751cffMxlnc5Go0VElWCstOgWh87x+sIgpvD5FuPvYyVDerkkE3PQdIrVedw/vv2/l
 l5edeFdfT3PLfOrMjSBcDo8KbWplQZIAUhLh6uqHln9EbvXyrpTMkSU+EeK1PVpHvTK40
 pUbP/KkzSY9NHi/ZVfgDVPMiMB7gOTjqyWCb1hcBMHxbC/HKOjB2CIs0PfywHpwWPPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042843;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZHIt5RaCdaTMlXr3BWhL99yGbFS20xJtGr1hS3XqBoM=;
 b=J9GtPusfpnqdeGz7MFX7/Qak6A2r8fzpVEFDpGBPUC214ymB/5/fWIwOF5n1M7t7C1LL
 Me4nOFvVwDJJZ16v7FGpvG6rmj3TvZ3yLQp7QlihuQ1nMAC+YVbIAHxP/nO7BxnjqIxMS
 44r79Si/F7k2NIUR9mqs0k38+meQO7ggq/KQJiSlVlWimw8BTWtFJ2CuclDFU74aQ0al4
 oSrcXYc5O2iVhRFzf13HLxua8K+u8/pv7BQcrerPKQAtF0jMMJKQTPuKDaSsu0roQLuC/
 81bsWq79Y3w2G2uSS62C166t8Mx1k2TrAheBcQFDvSEXADwvCkCw7+9W64tYqdPPQ9Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 883FD41000
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB80B88762; Sat,  3 Oct 2026 15:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 16:10:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e69bcaed4b4ff00154b85f1e34728ad9a558b722
X-Git-Newrev: 7f51195e00c24137684d1cd378cfaf519bdc6413
X-Patchwork-Hint: ignore
Message-Id: <20261003155248.BB80B88762@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-websocket-client: bump
 version to 1.9.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7f51195e00c24137684d1cd378cfaf519bdc6413
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/websocket-client/websocket-client/blob/v1.9.2/ChangeLog

Updated license hash due to copyright year bump:
https://github.com/websocket-client/websocket-client/commit/b5435d66b152230777c0530b7af81c3549fae5d8

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-websocket-client/python-websocket-client.hash | 6 +++---
 package/python-websocket-client/python-websocket-client.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-websocket-client/python-websocket-client.hash b/package/python-websocket-client/python-websocket-client.hash
index a966a7e441..4e77d129f5 100644
--- a/package/python-websocket-client/python-websocket-client.hash
+++ b/package/python-websocket-client/python-websocket-client.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websocket-client/json
-md5  3e6fd932858e9123d6ef5161e9ce7c46  websocket_client-1.9.0.tar.gz
-sha256  9e813624b6eb619999a97dc7958469217c3176312b3a16a4bd1bc7e08a46ec98  websocket_client-1.9.0.tar.gz
+md5  57a05031bf5050ade819166416448b77  websocket_client-1.9.2.tar.gz
+sha256  0fcb57545848be86992e128218fd96dd87a6769ffdb1a968dff79632b85604d0  websocket_client-1.9.2.tar.gz
 # Locally computed sha256 checksums
-sha256  d7ad8d0966aa363d45c7b16b0838cadcd51676acdf215ad967307d581b47872c  LICENSE
+sha256  14214b7bbb6952ada76afea206b6c393f2563d4e7678be0232e1a1d216716679  LICENSE
diff --git a/package/python-websocket-client/python-websocket-client.mk b/package/python-websocket-client/python-websocket-client.mk
index f735782cf8..d94d95daf5 100644
--- a/package/python-websocket-client/python-websocket-client.mk
+++ b/package/python-websocket-client/python-websocket-client.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKET_CLIENT_VERSION = 1.9.0
+PYTHON_WEBSOCKET_CLIENT_VERSION = 1.9.2
 PYTHON_WEBSOCKET_CLIENT_SOURCE = websocket_client-$(PYTHON_WEBSOCKET_CLIENT_VERSION).tar.gz
-PYTHON_WEBSOCKET_CLIENT_SITE = https://files.pythonhosted.org/packages/2c/41/aa4bf9664e4cda14c3b39865b12251e8e7d239f4cd0e3cc1b6c2ccde25c1
+PYTHON_WEBSOCKET_CLIENT_SITE = https://files.pythonhosted.org/packages/d8/cb/a5abcc2891249f393827c650c6296660ce40374ac22d99ab9aea41f9d2a2
 PYTHON_WEBSOCKET_CLIENT_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKET_CLIENT_LICENSE = Apache-2.0
 PYTHON_WEBSOCKET_CLIENT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
