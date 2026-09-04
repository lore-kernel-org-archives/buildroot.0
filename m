Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6929C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A685860648;
	Fri,  4 Sep 2026 12:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TT8e5J54PM9L; Fri,  4 Sep 2026 12:16:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AA7B9607FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524205;
	b=QQGSG6bL4H0NiSypGOwtGPkw7HPNdRjJXawdHYHvCZRHwitHYSdvJlRuMlZdD6edEyB2
	 aolslnHQAsxeakfHGR0bLWHs09bRZrRooPuZGM+PI/r2OQ1aYkbfwr6H4CrbSqkt4sAwp
	 8L1a91ozGblpVvGmqMM7Sv0MeK9JcWdbJTg4P+pdQqjhLc+Ca1ScuaxFnl7ZZXKt6UkoY
	 hWCp3pP/AqEI9FIxtARrG246WjFne4RH59/+JaPF8Q1VYlMTcUZ9RX8inTFsC4hA7Sylm
	 KIi/vetIUqikArfrEhdzG7B2TkZZ9CfBjxFsGf46vEdxxl133rdH4HUk0CIK8HyBs6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524205;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HC2z+AHROsxNt387jMH85tQqzZal7cmmey7dm3SnEc0=;
	b=rsugcRkrNJtlG+JPImuziIdSJfjjd0Vu9FTLb4h/k2z1luYUunsU3fXqIAxmobpjkPMW
	 Y+3+M39DH5HmvdYa1m4iAAtm8A7Ja2uCdwgmoo+1iJbnLA4E9y37QSOdndqeq5jM5wt/i
	 WijVgbJJv36FDrV/yT8QqwmDAOVhZxJJVwFeqKMvLrA26OcavIq9IWU4QBNzrjViLVhGN
	 GGSP/tmQ93Wd6hX0/DEHEhW2CZWt/lgJWX0jPrVB5iSHxaFyngYV2+e7PSPat+oK7lOkj
	 XNJ1Zw+LTvvD8IrBZDmMTkRECe58bUMMimfKa1T7P07UVIxi2M/zZ8eFNwqMGfb1H8Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524205;
	bh=HC2z+AHROsxNt387jMH85tQqzZal7cmmey7dm3SnEc0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ScYnq6d4XWdcl+VRWCL7ixRvMD35agkDV9vG6WmsKbzE9PN5+SCiTKpoWTJyMhfG5
	 99jNKAJDXm4OL9IEtSwTaco1LnxMx+xqlt0WYhjyP0R4HSh7R6e9sKqHwFsVBq6BVA
	 2tCh8eh3HmMaalrS7SHZXLvotaIzh/iSHns/oCwDapB3jC4yjyoJfrWQ8BtvvqUmVA
	 p8kAMqz/HHoR7kSGrHrHYJ8wCHAuVAgzyKahZWmuU7T6MqehINVpmG6kBjzMuNIhWL
	 0VyjOmWzbNseJiN22kfuUmiq32vvCi3+xqnfDUXDqT8KujyPBwlvTqfz+usFYRZ59P
	 +kVpM0AqlwZcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA7B9607FF;
	Fri,  4 Sep 2026 12:16:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 48B6C10E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E7D081174
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkolbfnXQ5OQ for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:16:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8ADB681172
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524203;
 b=Z+IbLx29qaVol4FXme3fIUPLkSMwTrikrGQrTyzdD86myv2sCIzHbOyzhobx07RnIrex
 TC9nkLzq33VUtXCOAdFHW9yZD+v31rlZTajCcE7PKFtt/A1j0fBI+iHKGP0OdumlfhUyM
 N7HSFcl+5uRsSo2arTCvBIdamodVV2/vm/xJlIt1S1QL5R3rfaBgIg5ZWTJwqfy1w55gT
 auXRTj6MUVbbzXVE5yUYJcO3Ls16COUWg+x616V6EJkEMwN6818RqfJHaSvsinBGnk0ND
 irDhx/zrk/nR/MSnAKwRBWhe2ZQxB1rFVHtpDGxKJ/6XB8cAcI7qek3hh22QvbqTBMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524203;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=gvzAa6dkPIMRXG5KrRAKnnRRjr6fc53asCc2UGBlwpU=;
 b=hMJFNY/dLaJ+jILlJ1BkVdsE6g4wcBj4NSCkY15/Y6MkraC263vJiwNjUhBfXvsOMURf
 oZJw1SHK+sOjcSYtqkc7n0qHoJ33ywzCoAClf3/QqDAfUMLoM50RVEd6QPWa5osUx+ebL
 u3oFkWZhl9hpuOIZAAe5ZowBTz53F1JZDkoRXkMGR+ZvTWHC4hrGJuhu68oZpJdCFICdn
 yOSA7RQ/nMltpVRRR8+DC5bSrLV/eUJhUwx50Jj/2z548N7aYjUGBp00aPqZ7hf0eO4T8
 REaC6IyM4IUPhwo6jHC99yFzgE0yk+otDgscpQQZCvgHTa8e0m9k+fomgdLDpVPC6aw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8ADB681172
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:16:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D9B694AA9; Fri,  4 Sep 2026 12:15:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 4 Sep 2026 14:06:19 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 0e6359561ee3643c8ca253e18bd5b38b7475a10e
X-Git-Newrev: 611ddaa9ce6f4e3993aca544bd107b13e753e664
X-Patchwork-Hint: ignore
Message-Id: <20260904121543.1D9B694AA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/python-gobject:
 bump to 3.56
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/611ddaa9ce6f4e3993aca544bd107b13e753e664
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

This version bump is required following the glib security version bump
to 2.88.3 [1] to fix a runtime issue due to GLib-2.0 backward
compatibility removal [2].

We prefer updating python-gobject to 3.56 stable release instead of
backporting complex commits from 3.55.x unstable release [3].

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152329 (TestFirewalldSysVInit)
https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152332 (TestFirewalldSystemd)

[1] e313a2d2590af689eb1f79e55b5a488154400da1
[2] https://gitlab.gnome.org/GNOME/glib/-/commit/e02603d44dd71fa7bcb07a1c5d64c5a91d3e93af
[3] https://gitlab.gnome.org/GNOME/pygobject/-/commit/74e4e0f40a66436a55c72d4a6e6058c1f91a7310

Runtime tested with TestGst1Python and TestFirewalld{Systemd,SysVInit}.

Cc: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b4949ce4c9f4718d66ea5a81cf33b2f1a5c0b0cc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-gobject/python-gobject.hash | 4 ++--
 package/python-gobject/python-gobject.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index 191b74b1e6..6b26e289e7 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from https://download.gnome.org/sources/pygobject/3.54/pygobject-3.54.5.sha256sum
-sha256  b6656f6348f5245606cf15ea48c384c7f05156c75ead206c1b246c80a22fb585  pygobject-3.54.5.tar.gz
+# from https://download.gnome.org/sources/pygobject/3.56/pygobject-3.56.3.sha256sum
+sha256  12760e4a0e3d04b6eb95e06f7a27e362c826d567ea613373a92c003b6c70d2d6  pygobject-3.56.3.tar.gz
 sha256  f4cac31434b287b10a70b81c62cfa973d250417f8f248c4c1b5566d061ecfb2f  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index 9386b6fed8..310cde24a7 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_GOBJECT_VERSION_MAJOR = 3.54
-PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).5
+PYTHON_GOBJECT_VERSION_MAJOR = 3.56
+PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).3
 PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.gz
 PYTHON_GOBJECT_SITE = https://download.gnome.org/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
 PYTHON_GOBJECT_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
