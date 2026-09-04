Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9F1C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2F6480EC6;
	Fri,  4 Sep 2026 16:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wabaoMXsEJZa; Fri,  4 Sep 2026 16:33:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EC7A481007
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788539590;
	b=pO2KYmyZSqQJB7PguLGP5j0K/KYPij5YrAcTPLPHCZP9fuMKrJZQQOsMLTJpb3kIB/z/
	 7Q7vQqJ5jtK4CEHvVS4+l/lVzF/dUkawofbL78zGwemdjPZhyCSS27hmEsytJJSwqr/L3
	 kSKnVymcP7AsPfHBXLbrcnZ2lXYlOd7KJIP9gZlEWNKjKQKElp5FekCNVcOacZXOmrZPO
	 qHbdzMeJF7wffT2/v1W+clxjJ4Z2yW1OdGO5MXM6+w3ecK6lLadKfKEJ9h2KZYAQBDkTY
	 KaYwcgAlaCGEDLCP0pyhq+3K2acx8pbqUH66yr0HK5lxCx0qe63ceoVe61WeZiweF5Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788539590;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=SiPP55H7CgGoBF+d/cEDpYLzXjBU+6aVCzqgJP6H51U=;
	b=DSeVuVVQL2CPfxBQnKSomMwvGQIKJ7OuQHchdtEmFVDw9FnIrEPCtjhwXEUnbegWS2j8
	 077KwvP9RLUQ/Y1rucFSe4rN/ICHKhLxsv7KwA/Pt7M8dQQtqe0/4w4gjSl+QrqOdlQUH
	 FnFdLyr8OE4pKGO2i7pD+57I0B/QrEhFI5QHp+fkuliDL8qxZEeK+0o01bCjooGZTKXfX
	 Y+ux9Mw3PPdpBQ9KTUDvm/t2T5PsCHCdNVzmXWL+G/boxu5bfFhNc+F5MAZUR9ZxpaQU0
	 8AZ5Cdg73WD5Bgr51J2wyzM5iez8R9DdQhb6XnkkPXnsXJuDNkLxmOh6io5jdvJROXQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788539590;
	bh=SiPP55H7CgGoBF+d/cEDpYLzXjBU+6aVCzqgJP6H51U=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RhHYoiJcdh3N5mMH/oZ9BQv2WWDz7VS9Hq74VdAsn5vgEpkduetJhldqvDiQemrO2
	 ZHZtGVbWVrLFbIAOI/lLZuDFrEK2TOUlV6kf/DimA+MtlhDb5Hd//ZuqoVufFqpbl7
	 Hu/l1IH1IyB0lkz8dm2616YcisYxL9fDE84fXNTBPpfCar3omovOtwU6iuBbYXtknN
	 hUso76We3iSLy2MHnLTRrBvwWR5cbVI2jnfBzB3L41xC4F4Dk7RwOGa7bQfSrgXJ0s
	 6Dg760B5Qm3d0f1VPkkMzSFm81Wm6QGm8tJ1elCnVAwD2tlbLrfsTDK+98CCGAgmft
	 ennsR/yx2ueIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC7A481007;
	Fri,  4 Sep 2026 16:33:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C67CC9CF
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC44B606A7
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ZBytuKCiA_a for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:33:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9B6B96069C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788539587;
 b=JUtH6bMAPQK3WxkA3R9efLAVTjOspEQv7UZUKiPOx7A8BLGaqW8xnOULzATcknzp1I9v
 vIw5kXO3RdnOEkpUzs9Dfpe83OWGJj9xboxxBXkTi5ro75+PkiNrAXyydob+gpxg5dEAu
 Oit3nrV+e9Z7Ch2YnPaWsV6GirHKlaXjT27t4fUyVHoRoCOhfCjlaKNcb2gDCbEJk2lH2
 WR8fMmP4WqMJZSnhklwUqLeQU7brz+fvQu2Cbn6BvHEZ6iuCJ17Dk23hm7L/MmebP9ci9
 iI4v9c5YNGRaznPl7FWEkye/jneL7awwJ6PMON5KjuLa2rjDzvk7FudNhQf2Fmxvi3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788539587;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=SiJVt28fJJIjCr/STzmUkLFwSIzko5/xlYVhwAINgYU=;
 b=l0fde7JZXGJg9TMXWGNduVUGtX5oayYhkWW51/XA3wgoxYreRAf/l/Iyqoispm+8JxMk
 jSCYj01bOFETcvpfwZjdBhPqi4iWJEe3yjhSU7S1u/Bd6ATsZf+1sDAYHrKZjjItvL9ZH
 VibWcHkdKu1q52hNA/np5WbYdHmVlSg3EmWKgYIcLNgBOv188trCD0KQ0LhThEHPUKmTX
 zmiCgpQQXbAM8D7Aok7GtqLNQeYLmCiq5jKY+kIeuEaN3trtjklEElyZrQRXsE2tp0mGO
 5L2Iv1mPAN4yqV4tY4XmkRbAkSERS32hFR/doEJ0+0mJmMFgMNgiv3PnLKC51JWdn0A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kYtHaE8z; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=kYtHaE8z
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B6B96069C
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788539584;
 bh=SiJVt28fJJIjCr/STzmUkLFwSIzko5/xlYVhwAINgYU=;
 h=From:To:Subject:Date:From;
 b=kYtHaE8zox2+EeTVJL92elwjDmQkKLuHKFTsLgAaDfF6KTgifPaiIeYQXeJTTIvoz
 cCS23tExnsSYyJIsLloxPU2DnnRtPmuw9oJonFeVqiJHp/T6FvZt3ZGUHh+osQ0Rzj
 aESFsduMcRvELTVz6m/dlHSByF07ZNCUNq4obWT/E3oY2/KLAe/bIDtQtCf4pnmbFo
 YUMhs4bAsnuKmRXl3obG9/3PQtnTwxdp+lpZ8zE65ddQ6MMXHkV/2Y1YfEfrs9NqJl
 e4U0WihVYlZtLwdiScxRnv8JycwgVcWrwPoagW1CSBQPCcls/I5z53dyMS0I0jqGm8
 JvoLb7ZFpRWMQ==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CB2A8A4C2096
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:33:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44800)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2Wqe-000000006Wm-2PUZ
 for buildroot@buildroot.org; Fri, 04 Sep 2026 16:33:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Sep 2026 18:33:04 +0200
Message-ID: <20260904163304.119934-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.411
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/vcrhonek/hwdata/releases/tag/v0.411
https://github.com/vcrhonek/hwdata/releases/tag/v0.410

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 74a7f5e7e7..0046b56c75 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  23006accc0f931dd5187d0307a57d0744e2b8feb85e73c37bc0f5229fb31eadd  hwdata-0.409.tar.gz
+sha256  d75462181fbd307228e0a48b8d1449f1773ea4b1f17e8a1d56346907f999ce33  hwdata-0.411.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 7300b908b1..20ecd799b8 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.409
+HWDATA_VERSION = 0.411
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
