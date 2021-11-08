Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C74C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:47:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B133F61105
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B133F61105
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D3AF608A1;
	Mon,  8 Nov 2021 22:47:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WBIHMDz1Rbss; Mon,  8 Nov 2021 22:47:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01416608B8;
	Mon,  8 Nov 2021 22:47:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DEAA1BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA8C0403B1
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:29:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a_wqQ2EqmQo7 for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:29:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B61640384
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636410543;
 bh=zPXcLdlVnCy4eACgpUkDk9Q5KtEHZaGz9MFtJRLC+HE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=OWEKa4bwFrzKw+13zHrvmO90quNGxyY0QpXaLjrr3NUQOVo75MWh/atqWGeaZZXaS
 Bf0zNprlNSWagyWUV86Fv5aT4Keig9yPI5/wbUkntGpibLkZ0YuPoEVMKrDuTBNMfR
 fobUlRhOQgk+BsXX3NKLNpk90tAD+nItxRpigXTg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.202]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M26vL-1mhkIA0qsb-002bkd; Mon, 08 Nov 2021 23:29:03 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon,  8 Nov 2021 23:29:01 +0100
Message-Id: <20211108222902.29000-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:ARVEGrFp+X8SmMRCJGo7WXjRK8keo4OXn0nnAHEaKhaxsoU65SI
 /o56Mowh29uKUi2rfk9a88O1elUU27Qx+We13R2E6+VzU+QVl9J2a7tIPU1ppC2mVvVduIl
 8X52y4ke8l22G87JhLcsXCmCI0QMJk5owDBJU4S+DEfR6k5ONBIUY82mlpN0WvHO0Ze469a
 YW567oQtdBTZqeYyvl2MQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FYhbNb21hzI=:Gru3bpGJn0KV3CloJdw9a6
 bEB2+N0dBSk9BaB+jHJONnNEumP0b2kAFfm6mewcxfxk1GgPX3Ju0gP/jYyIEABn+iCamw3E6
 g5RlrWOs+nVdwQZiBhB5TiOjbpqa2K1qVs2iGxI1Uarn3jXipV8Y0S2dl86YDwy5kpHruwetd
 A9/TXaHq/k0xzmKlF4TsTGFY3Jjg8fovattNPInqywc2u4hjx5NY+ky7DdzOR88zcswYk9hFO
 W/Vwt585Q1T6SYW5fM12o1Fg77JtEi3Shkg1EnT/8gkktob1tQCr7XwV3/uRaKiA8Mg0fEuZj
 F5sZIdMjxG8w4eJXRMzJz3Zr7p9Qn3O2Ft14/OEhWhMlL4oLqNd2i8xk8Q++2NOLWyaHgWuog
 JChKWM9Iujh6wNd2zbhUtdDb8MTSsz843OcZc/qYGyvTh8mc4TjCWliTRnxKjTv3PpS8C1z/x
 yXJsXkTVSfFyfSDfk7Xh2ReidWyAaVJaQ1XlPoEzxtl03VAP9q6aM9liaQG+EUtMDF2CjXqeN
 B/aECRP9iDuZEEgY0M0+W9sK9pZ4h2Qm5ht5k59kUsxd0/amX3hDxYUWZsKO7kRJ0/IGiNbL7
 pNeMO7qBvkXEo5NuQ8o0Jt0eA+S6FCI0WdjLqLwg74qULbdfncL3NA77ztX3Yfi0J5/08oocx
 XhrRFEnskgMlbGOY9R4eqzQctoXWQAGRDdnams3fASkfHxxtNxrobD70o4fedbG8UnW+KKe92
 xT8V/XvMQAsv/TO1wQZHmOcsAh37OJNVGbZb0fLWVeXOpn41BKk0hUafHNNpBXhcOWoBwkKaU
 NcYrJf5dMRay24UhEc/WcEOHnMSeziXW85rdrSC+XBvYaWXGHlzUTQ62jgLbIZadqjhTNwefa
 AA+KqSGB4IZMaTfP+gH841M+SacbPsQFBsqJ3BpI7EMa6V7mr84mRiFuDRkv+kWbNtNTaJv7q
 iCuazFt5sEmQYmC9lM3x0xaLvMp/7Iqvd8l66upsdS8S1pNt+OL2IddzLnmHQHfjx4Nz7ZYM3
 TWuUv+3WIDRz9qovvPoHk0eie9ZKIDRUvYYNeAEmF0EfTMTg1tiYqNpr1yvlxDmyzAdEFMyp3
 YryUbbFqL7goMM=
Subject: [Buildroot] [PATCH v1 1/2] package/ell: bump version to 0.45
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Changelog (since 0.44, from [1]):

  ver 0.45:
    Fix issue with ICMPv6 and handling re-entrantly callbacks.

[1] https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 84016c0ce0..4bb2688c48 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  41a6f8fa4d285b52cb7a5a87bda3e7370ecaac02d94aaa7ec1a23f0480b8bc3f  ell-0.44.tar.xz
+sha256  fedfcceee56eb63ab1eb98bf120a3cfbecee50bcd893874328c889f1b381e7d7  ell-0.45.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index 47137e2530..963fad4bae 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.44
+ELL_VERSION = 0.45
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
