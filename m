Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DA4C88E63
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 19:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AD3B80D8D;
	Sun, 13 Sep 2026 19:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K8M9iH2Mlyco; Sun, 13 Sep 2026 19:34:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 22A2D80CF2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789328072;
	b=SgBSE3zaFyHYvfTCcK0ZvDYrzHLy/coajYsfzaUmdNB9ZszlLNNcDCdRUt1gOJ0elvmG
	 y4Dxmfz88Fimi9+2UDqicGUk8aq0X0vQmh16AALbEunHEiytmW2YnClqhLD9SOseGkCpY
	 3S3AkPRmlUiAF/o7EEC+SxGF/TIkAJ/NPWvGfVDwjeWEZ6zvi6yvEbi4JXOCzIpEc+ITt
	 tCr7tXDYY+J/TpWALN43G3zahHwycWOFFUOxdtyF3p9ZXMYIzKX29Gbt+xIN7SoE1cWXy
	 tCHT+4zO0ImLNwxPadTqhEwRmWvjSdWxJgpbjnHjENsCssVFtAbU44bhEy0M5PSg/xg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789328072;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EJ0qBNQzDXlDGOfr2rU6rUCZpq9+MFITlvLYmX7ITC0=;
	b=G8LH8W0dVbfXMX4wLPF1QPz0mqKaUSTKMh835kMKO+MpchlmhFfsST2Eqe9t3iDwtuSk
	 Dcfd1cO0IFT2/ltEJzN6K+YU0jmRSiIybyce8kTs2hiITcfyLbNCBpLPhmE9K2en1Aeun
	 a/3k0jWYEgBUC/NG6OO0oDm9dsSrUjBKuMINpnvbWh8IAwmV0T8qIzLUcJYHCW7LOnk3l
	 dDiqzEJrmx7yAYq5A4VPuzJgdBSYMlX4lAqifZYForVbDhko1dvNI+b9DJiPnelatDBd9
	 13oZPxAaoU+dk00kqEiFRxZ8OIb9rz+DzMBUVW+PCZAhO1p0skeE7nTH49hD1+ur1rw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789328072;
	bh=EJ0qBNQzDXlDGOfr2rU6rUCZpq9+MFITlvLYmX7ITC0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c8zOjPVoXCTLb72RJI9nNiggpfMhId7XRke4sfHVD4pAvFDb2d1Yx9UG9h5mjpkQR
	 E8CRHRDNkXkwbim6yhZI0Yg96Ik0uUl9BK1D2rOinQCO1LnRoU1fABbjMmlMoHnDbK
	 Ox3bC+bcTHLWL9xiBPQ9ZkOXkBnOAUtUjyY31Ipz3YSNr58UJW5Qd5kp2kXntsM/eN
	 w0G+ciNcehJHNC4ir1xAp6olVNCRr2+dPEppNRMP58wODdWJIjGe2bGOlps/Y5LBsX
	 ta25coSTzn9EuakXhJnVpQbNfKU5gbRpBL7tGwwVR2rSxuNaIsfklIYa/3nKjRQh9/
	 ESe5nze/PzWBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22A2D80CF2;
	Sun, 13 Sep 2026 19:34:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 73028465
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64CB940063
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-YYEke_68Yb for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 19:34:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6EE6B40022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789328060;
 b=mQo2qim3oSr85nbcbElXmvKgmYp/M499lj+UiKbRal6JE24HZVUjmTbCQEK2FYVjdoT6
 w1zlE2THtRxjkaytlBGDiwKcjm2gmzcrpevrC6Lu9W4601K/mu3KEB5lF/KHhEF0fx4sJ
 B3C3HC8HnCXyRgmWkmzcglE2CyMRnGMAmemoqYNmn3LlfAF1fhgiyHD1yqbG7cNMpZzfy
 7eaUl54Z5PnGmWW4h94iwGeDU+vCEz0fq68DqiNRc+zyjVZz7gz1hsKir7oECw3VNt0yw
 QzGDYsM71hHCaA7RPchrCQeVcCJD1zKPvl4igkGvqmPplaaCghtmI2Q04pRD8telFmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789328060;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yMj0AoVmwLcLjtBWcPA8wRbiV+H1BalVLTFd5xJoCkk=;
 b=NIljWpVzdJoyWSYLEDGDJDzzmpddxgbDJ+VLtfsh6DiFid2+HgFqiHseoK+BixdgDI8j
 vlwJn2BI0XHsdBqVOT8/s9HP4ZfpxT1ozU/5fURLILG3E3zsfXWkslzsmoA7PndaTW7BV
 xxsJfy8VMkrzSa7sGN225bGTSdtoJPgHTZq3ZmKZDPU1zDs3eFeAg42SuzyYIUBpYLxiv
 TEgHcc/tCDqhOZGuIVfaxw8xQ+ZUm9iIVx3m+VA4pmdYMbJaRqmrWTEZpbrTGaI5ZMUgF
 bovJoD6irpoOoy+/A1YtVNgXc4lOafB3egGNLeKx3TQByswn1ctPMpk7ozt4hCFTN7Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EE6B40022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FF5095C71; Sun, 13 Sep 2026 19:33:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 21:23:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90aeea08bb685ac38b74799d830aff4023698cd0
X-Git-Newrev: f077ba9e67566a6855148ffa732c06d63db0622f
X-Patchwork-Hint: ignore
Message-Id: <20260913193315.4FF5095C71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5cinex: add missing select
 BR2_PACKAGE_QT5BASE_GUI
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f077ba9e67566a6855148ffa732c06d63db0622f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_QT5CINEX selects BR2_PACKAGE_QT5BASE_PNG,
BR2_PACKAGE_QT5BASE_WIDGETS and BR2_PACKAGE_QT5BASE_EGLFS, which are
all sub-options of BR2_PACKAGE_QT5BASE_GUI, but we don't explicitly
selects BR2_PACKAGE_QT5BASE_GUI.

It turns out that things work because the package selects
BR2_PACKAGE_QT5GRAPHICALEFFECTS, which selects
BR2_PACKAGE_QT5DECLARATIVE_QUICK, which selects
BR2_PACKAGE_QT5BASE_GUI, but that is rather non-obvious, and it makes
more sense for BR2_PACKAGE_QT5CINEX to directly select
BR2_PACKAGE_QT5BASE_GUI if it also selects sub-options of it.

No functional change.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qt5cinex/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5cinex/Config.in b/package/qt5cinex/Config.in
index 8dbf484267..d831af5a79 100644
--- a/package/qt5cinex/Config.in
+++ b/package/qt5cinex/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_QT5CINEX
 	# dependency.
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	select BR2_PACKAGE_QT5BASE_NETWORK
+	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_PNG
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5BASE_EGLFS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
