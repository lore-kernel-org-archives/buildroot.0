Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B375CA5FEF
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7E5B81370;
	Sat,  3 Oct 2026 16:35:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZaSX52Pi3a5H; Sat,  3 Oct 2026 16:35:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org ECDDF81369
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791045317;
	b=XFJ9HV3KjaJjeFIoTsX7NbhAB1Sk1xVBZIKR8Pr87gUbeylMa5FFft92ul/ccVcRf5qm
	 /8CHBSBVUqGd75XqGRAyh36Vqrl3NFQbSWKy47BKE93xDvqvj0eDIplwahObKPVK6UqqC
	 HUicUAgt4nBpHHf4LOiSSZwYKCsRnR/CZHY8diMFZiYy8kx5OYiRZfqHOKtd10PX8784j
	 6b960z5T5NfaoRGHoQEZ1YM3wFFvTOmdu0i+OGylVf8fRapdMC/HVW8QdO4JAFMy3qqtx
	 4zuZwIE8Cefom3HXOsmPIccN4U8sjyy97ZYDKqnpElnSQRnWdZrYZEmzLAGOVJ6d7kw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791045317;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ltx96z9sj4nrj3G6wbvS9Hcpcc3zBvF8i0rWSCAO1EY=;
	b=kUXvq1rdxTFjQE9zZJdu5FD0xkkaXzsAefUHzCJFx20yB45Sw+Hm7lSW2LQzdFNEP5ee
	 /fHcSECvPjCMxvxCxPO+1eFSoOkXmeibNQIrquW/CkM1G48OP8JktPTwjCSH4o8ecsAjC
	 9zHWFOai7sK4z4C3TMwe3kTRPJkaqIUKNc3yl65gPvcPbOwbpnWl24KqOZKo2504im7kr
	 ot14X0bAdkp+oqLHrrhs0seIXH6OAzpOUm8iRRBY+ekYKTrQToT6x4VTk0ag+Kih25+Ae
	 BVsF4SAQE22u8GqsysQPOGcF230QJGRY3P2vR4VS5oWMP8gPLunlBxDhHAsRFXO5Onw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791045317;
	bh=ltx96z9sj4nrj3G6wbvS9Hcpcc3zBvF8i0rWSCAO1EY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=D3Y0UvIKI1Rc3y4ftHHzZFwsTjcacBHOn7F+Koy5ibx9M0P72lYmBXwrQkEVD104L
	 Jw6RFUa72iQHymKrmph3jm2JAb22SfDgcEYmhkNqu9mBtmDDjE40aY+HT9lwufOycn
	 uTHjZI8Pft5XEl0ChdK0HgSmHljWeKowaql28/E3DN3+pmOGloQDPVyIODrYXBF6gn
	 cncgHrMFoCc0OtRzkLP8OG0crn4KcAIXUud8WpqNIYNn84xFczDDXxiRTEpDOWR4GD
	 1i72XqL/3laX3aR+K35sqpVLu9OjxAYo4iFGMvMVjVdHbDrNEpaZaPTdvO2y0Y0tyW
	 ZcNyLS29PVE9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECDDF81369;
	Sat,  3 Oct 2026 16:35:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F6C02E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30F3F40DC6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eR0Fw3ginI28 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:35:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7494D40DB8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791045315;
 b=m0KHnN1IuT2ii7C4pf/t17UgLDKPItvN6TUqHAv0zczedR9nT6+XRnvMtNBMoDrHPsXI
 maEU4puJEueoAExmS6UDpQxWsB0gw+KxiWSFfZdV6njpRMpcd/ikhy4qIVXFgNjlQ4XnT
 IlMYXJEDwB+o93mTzIII02pbK+QgeCgmtGQq2PNwLPebJ0kib0CsEA2nLF/uXWyLB+Wg8
 GRdCR6IQXdj89fatTWacEDaWhB6AZIbdIDlkZU6ut6ITDgmfvGoMipHBaasqf7g4lwxN+
 5hdczMPGgXCGOkj4qZUVOuFSy5f4tkmHZofd1M+rtrNYRqANErqmFr4FX+ocaw27NRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791045315;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=H8hE2KVHekH2EGxt7qqVB0b9+YnxxPvSIQO/T9RR73M=;
 b=DP3Vbx8gILFSxNKnpAfAuS+hTe1FQOwf6U18yC/daEqYHwUhoTJq3wCC7jS2N0Qb3XNU
 XlYxElA20zOSMEhCe1lpRxEZpTxWfNSjY0aR1NOEAvDsZ/Z2/Hj2LBd3FrfQ7xCwlLy3h
 xz57n1GvAhqJNQnzlnHJObGTvTuNpbs0oigBVCT6H7igWMBpJiGlC5QgPND+Z0QlrUsHm
 WRPxVTFJc+K/Nev4ztRLBT/+HfliVt2ux5uD0H22ABEsg7EWP+sgJRPyqTTOitTbOeLwM
 SM2mkuapxUDpb2T6Gd4d1lUiLfNhZJP0HhGCCwtjagkJt0HKc/uETkFupGI0KkainUQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7494D40DB8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:35:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A09B58B4FD; Sat,  3 Oct 2026 16:34:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 18:35:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c9c2b71e6db0bc9c16747b341439e8bb21bb7d8
X-Git-Newrev: 079f168792e1520b615c64d436ed3bb100d9b6f5
X-Patchwork-Hint: ignore
Message-Id: <20261003163400.A09B58B4FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chrony: add 50-chrony.list for
 systemd-timedated
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/079f168792e1520b615c64d436ed3bb100d9b6f5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

systemd-timedated discovers NTP services from ntp-units.d/*.list.
Buildroot's chrony package never installs one: on a systemd image
without timesyncd, 'timedatectl status' reports

    NTP service: n/a

and 'timedatectl set-ntp on' fails with

    Failed to set ntp: NTP not supported

even though chronyd is running.

Install 50-chrony.list, following the convention set by Debian,
Fedora and Arch, so timedatectl can manage chrony.

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Scott Fan <fancp2007@gmail.com>
Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/chrony/50-chrony.list | 1 +
 package/chrony/chrony.mk      | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/package/chrony/50-chrony.list b/package/chrony/50-chrony.list
new file mode 100644
index 0000000000..6b9cca00bb
--- /dev/null
+++ b/package/chrony/50-chrony.list
@@ -0,0 +1 @@
+chrony.service
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index a42042744f..1fddaa3b6c 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -85,6 +85,9 @@ endef
 define CHRONY_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/chrony/chrony.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/chrony.service
+	# advertise chrony.service to systemd-timedated
+	$(INSTALL) -D -m 644 $(CHRONY_PKGDIR)/50-chrony.list \
+		$(TARGET_DIR)/usr/lib/systemd/ntp-units.d/50-chrony.list
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
