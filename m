Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CF5C79F82
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE6498109A;
	Fri,  4 Sep 2026 16:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S4Ghl03pL-Wh; Fri,  4 Sep 2026 16:22:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0A62C810D1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538936;
	b=LaoPu+iDkHrPs0cSo5tQur1X0c8r2TmPXgfLpU4RDkiyXPjiRwgea38j45EEOumpkUSs
	 KSG7jy/YHK4s2pBuygwXdDSpZBEk/7FTM+wLnibRTFQ1Ns39M5FodzNgyaZCXIlBrp2HG
	 DDR90FWfkqXYvPPrwvQlTfLDwNJQKe8sIbDsxLCciD6rUSd5D+05eaJThvQd+YYg0Iwnb
	 9bnPO9jRfchrLQoQzPZzLUe9tYDtoy7Dc3wXGablQFAdy/nFpCBFbLwNYvxSB5eAfHKL1
	 IkQA0Fum0MaHiW/qZ8oexHzjbkBiwUsaj5wBswfFrRUiHhKIH7CAFf6yYUpzr7b9oGA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538936;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ab03kvz7pAqA5SMkNblKJNk7OjYRhNNTLGQrYXBdcSg=;
	b=H+z/ud4LDLj4EsgvZ9gf6cFzQ3d9/S1K7rcXEW7IV1Md5XeFq7NoBILvFqlOPx3GT8gR
	 CBcQ2n1SV+MTZlUDXJExJo6bxJVzoomFq/V6HcOaFOwmXIor+JxIbSpvpukBib8LDaBbE
	 iGvvg8FkB2Upx+zke8+bsMzNZ3i82B2qHo4mxaXX7tenCV36UBuooHTjFXD9IjkKfPRWh
	 whmSS7DADdL/FCqEERtZ78oTXhuq9u8X3HwRCoxkKQ/Ese2CUEZTwVluC/wL/+z0pW+lR
	 g3Kc4ybbZF6h8QNrBP0Um4NFt2941Ps2N5kTPJo0NrtbYxdpFzVBrYuMOdrzB51ZWDA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538936;
	bh=ab03kvz7pAqA5SMkNblKJNk7OjYRhNNTLGQrYXBdcSg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iSj3NYf8pjmdb/ObmNqr+2ASK/mgZlHeDmOXUfA0z9Wgdt8Vr8ABWs/GTf1wePooL
	 OEkptJGH/uqJAgaBVtMJOBQFBrCNnRa0lvyg4n9Kmz0WQawtq6Ym9iV+2jH6dNuz9d
	 UbSE3/+EhXrRUo9MY+RFzpBd8rONi7kcOYcNbOordQmZiE3Wy3GH8ZxoFUr6U/Nluj
	 64yssnLLhK+rkLYzoBmG071EM1XN0GCfN7lICxGH/nCSH7+PTW+VYoxb5ZswE8P2Yc
	 s0c+fzjJQFKT9LSCqJ/izHa3ih/dMD3TnDCjJMOEjq8T9Wjlwhf3vjwWq/8BKa1QlD
	 CRnfhwY9bBXeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A62C810D1;
	Fri,  4 Sep 2026 16:22:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1947D3891
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15B2640B03
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3wUO_8MO5fe6 for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 544B240A9D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538927;
 b=KMhk4cv7aInNLOM/gX/PGthjR7Y6VIkD68L3gFD7BT3HIziKoy16etYHgwJ8u+6ULTmM
 ViOUbhYFRolmm7mTZKNUnvmXDy75Br3AV8V5kSICSoZGlIfmYnKWPCIiEroxJ8WIS8+6P
 vt5aEm0HFeJntLPdcZ5HUsBWqBv9ywnTG18CVIOWL+Nu35ZdFG5Fx8Y/MFdmUA2S9Aswh
 /RSLEf/vASaS77dcvFdGkNzOlFi6vTaVLyxMbZ3HBICTYM+jZzrTHX+WqskbBapPQv6g/
 qELcviz/b+FZcfFYhRYAcQ+nIriah3Camx72q79xPhRVTboDGBmsdrmTLwK7yD4JU5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538927;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=b6sNeqRKJMg9EUi1WzjoBb5e8ig7MBv0Lp3MSZ7rgi0=;
 b=qHotMm2PbMT11WacjE44YJVOFZotwiAwO8yYhaPQznbdb7gB9/bTMoS5mK8Grg7dPIDS
 Z+pgzRvX3KBu6JaWYhOijQ2AFiA1Nb98k7Mhc3/m7BAifFCWxXqjOXutgz0fuHSaXvCyD
 v/EkmugGqPnB8lep5258qMJSOVhTI1K9bW2jRaoOPHNQ0v/9maVyOa5e3BY3heRm4CpXs
 lyJKbW9dIcRUQL+eguXDnjnLLBb1ry9PnSJgPOw571zLUayULU2xLs8cN4URMSIcUwMUG
 SkVPsqdVEI3IuVDyznJ2q1tNAoEA61mwqlVRYTKUccV6wie0E0Oee0cGze2jbf0luUQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 544B240A9D
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C58FE94C40; Fri,  4 Sep 2026 16:21:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 13:46:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 323f7e8492c87e1b761dbbc7d98fe0c535bd71da
X-Git-Newrev: 7e6e19e97bda5fd399df9bb6d393a523b32ea2e3
X-Patchwork-Hint: ignore
Message-Id: <20260904162106.C58FE94C40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/harfbuzz: bump version to 14.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7e6e19e97bda5fd399df9bb6d393a523b32ea2e3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/harfbuzz/harfbuzz/blob/14.4.0/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 3d7540f788..f8ee98e172 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.3.1
-sha256  9dae9538aae2ffdf70cec31f2c27bf68e2aaeeae3112688467697d5faf6194f7  harfbuzz-14.3.1.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.4.0
+sha256  2357ed966c6ced7bfa720b0640c0231065af01158fbea215093ffa15aed44371  harfbuzz-14.4.0.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 909629d7d0..184253949e 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 14.3.1
+HARFBUZZ_VERSION = 14.4.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
