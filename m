Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70830CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35ABA60E4A;
	Sat,  3 Oct 2026 21:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QqTiYVUGH5PU; Sat,  3 Oct 2026 21:09:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 210B860E5A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791061754;
	b=Pwz5++0ZNvurGwMc6KbMGqZOzkCfKoFx67lFrrrmADoYHYm//iaeQM2OIb+KEJT/f5MS
	 sldR+3FGXboUH1QKx5X0+MgeYxOA4WS8PSMm5jY31Mo084r2doccmaADww51UIAeVGEst
	 rQqMpECyYBE0eUnsOB1psy5WHfYwbIi5kfxm8WvzI//Kx37U6lv3AtxjWehcsChuoNyTI
	 5oRLWyj2iFa8SbRph9adsQNA7b4SmDjUBnhjXFP3rOip/nmfHuDABTb6ktnuGtevg9M8H
	 2jbuMpAfJeXkLoF4Ng38wDcwkwFVYbF2MwuDap628gANa6W3wksT7erFEdAZw6Fo6sw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791061754;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RcjH/+QxyKJUqfJymz4ttFL5CdI14BkoxBtSc9r48vQ=;
	b=eSEaD2Lrs1ebWfmByf7cg4lrzmQTSAWkuwIqYBoDGMmrMK9QG1KwJ786vJZm3CoYmRss
	 eb72FS43AmxSC4ghzpdZcEXrefkt/P2rj36zydit8esEcUPmJ2moUzoiJ1Iu8iYztDyw0
	 lmwUIp1WusueTOpU4s6xHXhcRoh0NW+vkXTrUN35kRCgoZWdF1Z23siaiSVRDibdb2DId
	 Y6ZA8Msxx0q0Ivv3TYMojnL3MOt0LpCYTqu9PhB8x8OVWCTnniGEteY2IrDb3d+JgGZW8
	 5bCUOqza3tqjhz/RI01sRsefByNam4vHQDHWsBvQW9/suyk4osI1Legos/0KVpF+Tvg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791061754;
	bh=RcjH/+QxyKJUqfJymz4ttFL5CdI14BkoxBtSc9r48vQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=BbSeh0ZGV+BaFpGy9erEbdRvZFSqy7EtEsEIuYjTct6I/cgzPaa69ZvB7JQapZEDQ
	 Tydd1MxwO5JGkURmATGCJMuVXQr2x04OGpjjr6zT6az5U4L7A7ybwbvpaWWbzooLVs
	 pzUzJLKm8e6rTQHngz2xWO0IgercZwohx69FYDJzriAXRdNq14/D5mD0mtmyLel86W
	 UTDeNmtjLS88ti8pC49pHpkg47VrH8MVV8kyKGP7mhq/wg+E6G6TnuVLZX3/mXD+70
	 LLs/7qgIobY7M0IFqey3st6GY1CcbeO2kWsGUDeFVjVQfIgC4byFs4nJuQTCYyLhnI
	 GW4wBahK5LQMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 210B860E5A;
	Sat,  3 Oct 2026 21:09:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ADBDB1A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F977400D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZgF5Jit11cXU for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:09:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org BE19F4007E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791061752;
 b=rD8YDgRlEyn9wO4Lop+Qcz93boshMQDhBFilumQztFbg9g7HUi7QyoMw84ifsdCHl36p
 Iw6V1Hppnrl9Lz0+qEFufGEePzIhKXlLYt5iEZZnMfoOmZWp4gAGN4KnWDjzRruXJ0IQg
 3I8fKtxDIh+XSTIY2Gf4yt1zWKjS27PzLDM/8jkF8A6JaKxwZW5HFQjRsusle3Twui69Y
 HAXaUxQhXx771JR3iQUmcASvDmqbQeqI/3Rs45ao8xpGs4DjPcDtXtxxyepFQP7ikYoH8
 PD5o1sw/oJd9XN7UGdi8mbMW6c6G9tZA9bpBRTN0rjluxtpkqIGWFCNYQqATdOcTKFA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791061752;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=jAgPPP3CpNo33wTZgvjX/EcyBUdB/beagLZ5jHXBmRk=;
 b=pNLuZqA7FgnxvRG4b2og95WoRvDQXDK5sULpXINiMUeLs0CNoMlFMJJmFE2ePHS0JjBG
 pM94fYn1tzpVS3pj3LqAa1+BYj08+XtYV2G6MaCd9nJHadL1LKls4bocL/5wTHm8lGK4K
 NRWBLBmTSsSpZi8hFyxI0b91vJ/dkAJpwrFYBsmngL+S6suQY87x+sOHR1klEsgVj/M41
 1iKMsVwkgx5OFpK1xcV/w7t5qGUyHJYyNEGv+kOAqU/GbtBBlKnfp4yiY+WZxM8fzlyIx
 gcEkR3N3FVgXFdBmqo4NsFwC4gAsjXZjrGW5ynXTo+t6DBd0Ny0MfwrdHBoSG67ZKEQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=mjAabHrU; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=mjAabHrU
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE19F4007E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:11 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-823b938464fso816207a34.2
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 14:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791061750; x=1791666550; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=jAgPPP3CpNo33wTZgvjX/EcyBUdB/beagLZ5jHXBmRk=;
 b=mjAabHrUlOgEpUQlqajmvnIfF/Uz8V926ryGttAh4kw8gG84KeNzLjqABWJ7E8uObC
 6Svx3d5JgXTNmW7H2jgRRD7cYRK5MQvFkBuUk/l3+9BrtbY+qkbVYtN8X9GNbFdcmLPe
 V1y2+jyQVzI9SE9pZtaPx3M0H2GCsKmpmgk9Cm+ZkT7hcH7zV2YAErYJTEeY9djo/J4v
 CzWOaaouUBmPTisi8WDj091vaFririvYgB2f5igeIUfP8sCH8RcZXW7btcLcvtja1Cph
 xShE+fq+d+wjoHzd6v9ry4OShGJiQ3A7LrFlv0pIfcxvcndURsd0tNZHrS4CqaiMfKJK
 eONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791061750; x=1791666550;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jAgPPP3CpNo33wTZgvjX/EcyBUdB/beagLZ5jHXBmRk=;
 b=sA1uCCpKZY3R4leW2hgwyffdORMXlUSt4brhcA52+/dqo8CDf6jDWNcwA/1phgwRRs
 in4LF7dXPy2fPKY6vuE80pTEze6g67u00Fyfsyc/18IiWgUOqOKOW5GQIffs15auZDmz
 pQ7obFkM0Ol9YGaz3GxHwbotz5mAsAYwVEfUtAx9YnvGasJFp6zzo7LjZOXTBvyoSuRT
 Pbeo5C9S+ZhugoBUENG2HMulpgLiNLNVT+MkRN//RfS72jbUBvoRSAmfVE/6A50l5uxt
 UP+LoY34HDGa+6FLs8/ej5xA5ICGzZfiS2YXD6gJQwT+y7Y3HY1/0nk4BPKSHftXg6Pb
 KwHw==
X-Gm-Message-State: AFuF++ns8M0gsilTnSt6XVjPFJhRrPm2sGq7sSQjKQDPqFlSTTbcj7BW
 iutzGd92FLop3V1aUKeNtQ8r9V5LBpFYFQZsE3adMHopY68lUtwbvTKzW5gN6w==
X-Gm-Gg: AYBFou0xCUpHCV9uDeMkR9T6BVNU8GkoAAMUPaKXN1ZYLBap9zt00FlbooXNLV8sJnT
 oQb/wWrVdfnTmk0C5fgl2H3aUrL+khGpxD+gAmTFiR04umYNz+FJHYfwirTKnGiNDA/XNVX4wFs
 ltobLB539DL+6pRnAy1DCocGymBHuepcg7ystubVUSiAExCAhKjtlKRDUa9rjLw7Ru4kaJ8tmbi
 YIO6lwkffqMXwq7b9bQ0uYGqg+ay6l6n+oTpb+/zi9sQjF3JvOlHldfkkRXCqjhs7HGyZ/W4DD5
 gI/dzMnTfVoszl21STQpKiBGTvKIrYDblBFHSe9aaAdxM4w8iRr8+IVQX4oEscNvAal/Qanp9Wt
 NrUWbR6P/pEsxiv936iSRISMKieIZQj97z2VPmQdOswMN7auWHOoLut/uKxkFvx9AFsWCeSI0vt
 Z4GfqUOrMPyiZTS2qFbAY9YtGNtwpmNwbuoW+9mes0HeoFOdY5PfIBV7vEvocZqNqKuOXgRfmH9
 0Jvn+byHz0OYvMtrUpMnPst60JyepPuc+fGOGinbPimJ60LvbOMktCbDHh2eRUqIgr7ga2g2wNF
 gd3B6twM9CZyzF0ZzY1dT2Qkco6dw1BZljIleMW6xcT0WkCUgo7CmpLP4//xZA7lhSv7ckfUVG/
 nJLAjIHdt/84ILYHh8pIMixUExheW7inZw2AWYSPN7v3U3ykFKF0o
X-Received: by 2002:a05:6830:25d3:b0:806:ab05:c1dd with SMTP id
 46e09a7af769-823f9d9575bmr4017964a34.4.1791061750491; 
 Sat, 03 Oct 2026 14:09:10 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82409c586d3sm3119917a34.11.2026.10.03.14.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 14:09:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 15:08:08 -0600
Message-ID: <20261003210833.735937-18-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-selenium: bump to version
 4.50.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update license hash due to copyright year update:
https://github.com/SeleniumHQ/selenium/commit/fbd3b6de2f8f79d9ab0e7c86de462d454ef4de04

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-selenium/python-selenium.hash | 4 ++--
 package/python-selenium/python-selenium.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
index f2048092e3..4ac6965323 100644
--- a/package/python-selenium/python-selenium.hash
+++ b/package/python-selenium/python-selenium.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  fc578e57f98032ab4d89193bfdfed5dac965362d08aa436b8b713e182ea43f4c  python-selenium-4.39.0-cargo6.tar.gz
+sha256  6cf2734ba0e1651163a936122739140a4a9689226a58f1c57fd56ef67dcc3fac  python-selenium-4.50.0-cargo6.tar.gz
 # Locally computed sha256 checksums
-sha256  1ee8454a0696ac46b0d5b67f85b2a0e3af2b7726e1b82cd182af60fd285bcba3  LICENSE
+sha256  307012b4481479a56605420e81db14686a0274d246d06d224c363ee09297d330  LICENSE
diff --git a/package/python-selenium/python-selenium.mk b/package/python-selenium/python-selenium.mk
index 8308325ffe..fdb9a5c7fe 100644
--- a/package/python-selenium/python-selenium.mk
+++ b/package/python-selenium/python-selenium.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SELENIUM_VERSION = 4.39.0
+PYTHON_SELENIUM_VERSION = 4.50.0
 PYTHON_SELENIUM_SOURCE_PYPI = selenium-$(PYTHON_SELENIUM_VERSION).tar.gz
-PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/af/19/27c1bf9eb1f7025632d35a956b50746efb4b10aa87f961b263fa7081f4c5
+PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/1f/6c/09a5bdf96a5f850a2bf69ee670a246ae30a132dca3975c7fb081aae09338
 PYTHON_SELENIUM_SITE = $(PYTHON_SELENIUM_SITE_PYPI)/$(PYTHON_SELENIUM_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_SELENIUM_SETUP_TYPE = setuptools-rust
 PYTHON_SELENIUM_LICENSE = Apache-2.0
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
