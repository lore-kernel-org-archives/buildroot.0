Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717E1CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35FDD60F9A;
	Sat,  3 Oct 2026 15:56:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QpLsZjs1diRN; Sat,  3 Oct 2026 15:56:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2E59860E86
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042984;
	b=gm5MPJe+cInrg5fjHZGS1PIq1a3zv/G+KmuaQYaH4hBSGjRtnfvHFBSMRw2FeOCeteAQ
	 Rr2oOY+uVabNFutfM2J6UfwYPrULC1jZg8Zxa6gK49oPK0XTBRtTzlWFXUqaxeVK+Iler
	 LtDS5D+35oMOI/cBEKncEqJeH38swyaLmLA2g/pYt5K71hzog9mJLYTmuC0OKmNlHiGnF
	 04u2xPnKhTdE2yln3/BeQeUP101FkioHweR/UNjGet7CZ43TyKyEG2HtWcy9CJ7zjMkpO
	 lOfwdrwySisugdTaxUJA/0ZNpsGVmLI2jkEbnKsPV9AEa5dqj51mkJhQK4xU5yPHgww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042984;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aEPDm7YETZzdF/rQeaK2umRJWkv3JgDJvoie1z+pEI4=;
	b=Id0VmbSLD6YQDLqH7BJCOtRLVeke3s1nbaMydax9toddd9d828Kf8Cr5MpPOzxc6ohwI
	 XnEcXBEEwuoIvXBPOdNbcKEalZcNNDFVEOVS5VT4Hn/YrhiFynUtNTcNjpft7kSH9pKc9
	 O/QGuv0/yuVxFFjSPMKN1ARe8nlHX7bPQEssqw4R4Zcn9y3bZmzMTKUAAL+Tk+5kYf8Gi
	 7ETDKv+B1FAOHNh2/l+dJd5cM9RqfZFmCJi/oCFe6fUGcZ4IsvGQCOS44CRF/fzDkCJNk
	 s/HLqGN5sX9ior/NXY4+mEQsDMexxX2YFHmI+XAIsAsBMe+ejS2nwmvBVAYn5+txGvg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042984;
	bh=aEPDm7YETZzdF/rQeaK2umRJWkv3JgDJvoie1z+pEI4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VfeAJsS34s9LcOM+/n4G2CslDAdjC1TfqRL+MBGo1YFdBZLR5APVdF1vtG4oCvEOZ
	 ayxJL+7XUYBJEJI5iYkSG/v5WMgnBjIGPE9TF7FyO4LRFJZrvHZH0fKF8BaROlApgZ
	 IkMljbeWOVn94X7W1lcl5j86CHbREFL8oUY7eyukIMVcJGKeusjr+lTffXYS9G8wWx
	 09MmttzZQbkHj7YEuJhB+Jm21IOtDQiDeqq6sG4gkbBNp2kkJfrq9y6wGNr3ULORXG
	 6c7s/f+StxuNeHicVTmXnRNJL2ICzLnemjL1ZMOWZ/wBUa7Lhpmf0Iiso/9lnTMkqe
	 ml6j/uhUKR8XQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E59860E86;
	Sat,  3 Oct 2026 15:56:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BCD69335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87BCB60697
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mFvjiFiogOw for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 562CF606BD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042846;
 b=kgBzzs++gBEKVh7mzI49curwYhvuu2BL1QWYGONPc8k/Y9ewDlWPj6TG7FWQw+okPACo
 xSLjZzbIPnliU4Yg2ouKUK0scJ7/ncTem0zwPSsUUR7suVrcYMNi0lS/BPGM3nYx/tA5l
 BSqYXxlNnYcughpqIbcWoPttRC7ggvnT2zenzKlAyOUYgsPIXhg+nzMUsFRO/YhwIXpbb
 zi871NK/lR+iAej2uW7kLaDpmctHTjmVlZmUiM5QVdJu8jQq10HDoDtTIFXLN2VDPTZEg
 lcKhbBh4UaTweTwbkdAakKpqLXS652seBxXA1TjPDESaML7BEXGDW66AOKLnS8/RqHA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042846;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=cJVB9h0WLCwZxUqu9JeVhbHtgdgq5Y7y6zQZn5MHeL4=;
 b=X9AK/Rt+F3g7MeBeBFLEQkPZpNqfkXKW4BbVdyNU1GS6liEkXXlOAQCb2r12zodDgBmJ
 VvdFT9R56rpABw5WvA3evPcb0sT14BnSuZsP1PXzHqmmVmqM43rgaTljsdKCYFZ/qA8g6
 i0hK+zporrSgWpuU3Ltvl9PIvFOO/Z45/lpy88lZJGkQjN/4fmAOroA2/M+tXwFwN4ag1
 xyeeQMJNmMPBn+KrgZzhTjjK666RsxaAngtXvquu9PyfDAo/YEPpPb+52GbSZENv5lWrd
 lRS8qb0U7YfrIw9kPxyc2Wlf4QUa3KROVRa4E25k54Y8JH+FNarOypGCzXvqrOrrRQA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 562CF606BD
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 976FC8A30A; Sat,  3 Oct 2026 15:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a4717aa87e6978775505e11d6f7ec66cd06bf33
X-Git-Newrev: 1f9e7d67ad7d962502facf60afeed2a937efe220
X-Patchwork-Hint: ignore
Message-Id: <20261003155251.976FC8A30A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cchardet: bump version to
 2.3.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1f9e7d67ad7d962502facf60afeed2a937efe220
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cchardet/python-cchardet.hash | 4 ++--
 package/python-cchardet/python-cchardet.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cchardet/python-cchardet.hash b/package/python-cchardet/python-cchardet.hash
index 1ecfd6fa95..f2e72a0bb4 100644
--- a/package/python-cchardet/python-cchardet.hash
+++ b/package/python-cchardet/python-cchardet.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cchardet/json
-md5  8a76472ad09c68c12069203ea9348ee3  cchardet-2.1.7.tar.gz
-sha256  c428b6336545053c2589f6caf24ea32276c6664cb86db817e03a94c60afa0eaf  cchardet-2.1.7.tar.gz
+md5  e8a5838c4d705346489d4335fda539b2  cchardet-2.3.0.tar.gz
+sha256  e08fade06af9aa4888ad99609a66bbce99ad01c1269c0ea673af75a15a6f762e  cchardet-2.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  107a29ccdd2d778aa2df5462f85dddfa099059abd22e064e07ec2cc9bafc37cd  COPYING
diff --git a/package/python-cchardet/python-cchardet.mk b/package/python-cchardet/python-cchardet.mk
index 53a17f6732..cadd892256 100644
--- a/package/python-cchardet/python-cchardet.mk
+++ b/package/python-cchardet/python-cchardet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CCHARDET_VERSION = 2.1.7
+PYTHON_CCHARDET_VERSION = 2.3.0
 PYTHON_CCHARDET_SOURCE = cchardet-$(PYTHON_CCHARDET_VERSION).tar.gz
-PYTHON_CCHARDET_SITE = https://files.pythonhosted.org/packages/a8/5d/090c9f0312b7988a9433246c9cf0b566b1ae1374368cfb8ac897218a4f65
+PYTHON_CCHARDET_SITE = https://files.pythonhosted.org/packages/86/80/6b87429533a8a6fc5b970c44a3a844c315c3313377ecc4fb9efeb56a3241
 PYTHON_CCHARDET_SETUP_TYPE = setuptools
 PYTHON_CCHARDET_LICENSE = MPL-1.1
 PYTHON_CCHARDET_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
