Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86F1C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 21:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9128B41750;
	Mon,  4 Dec 2023 21:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9128B41750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AbfJzpuwgWzP; Mon,  4 Dec 2023 21:13:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92FC140201;
	Mon,  4 Dec 2023 21:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92FC140201
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C0C5D1BF30E
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4D6140201
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4D6140201
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v09l-J7E4LEO for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 21:13:24 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B86640151
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 21:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B86640151
Received: from fli4l.lan.fli4l (p4fd6c4a5.dip0.t-ipconnect.de [79.214.196.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9C11AA4C0C51
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 22:13:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49380)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rAGFm-0006ay-1N
 for buildroot@buildroot.org; Mon, 04 Dec 2023 22:13:22 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 Dec 2023 22:13:22 +0100
Message-Id: <20231204211322.12580-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1701724402;
 bh=Hppt4bl5RK/DGe6OTghM99MBpXHFhtD8bl8YcSdPopo=;
 h=From:To:Subject:Date:From;
 b=WuqhGTcOjvJfO/3bVyZUM3h4GREPJBvAUbj+RGF7OmvpK7pB7QELJrnV1y7zR1EWh
 Dba84lNztDdu2NT5awvZjVUgadxoYAj2zhJ4j948NzaxfRH6rbgGjZLk13UpyjesLo
 bVMHssHWbFZNwoXPTPuK032mnDqaIdeWzLy7ZdjEuiwB7qTtIAC+GMJap6SxyXOkGq
 D38xLSnRNschLX66Od1WXUWRNoFrWjpTHwS1LTrmMXjsM04Lo8vPXOaqA1vfYIK3XR
 j0+mPkCbbA7Mu1Qk+lbxH6G0ZsvBAcM3NlzZ+qbkUl5mXoV4AyG8SJaIdVDKbsxayu
 0sv4dsus6t20g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=WuqhGTcO
Subject: [Buildroot] [PATCH 1/1] package/openvpn: bump version to 2.6.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/OpenVPN/openvpn/blob/release/2.6/ChangeLog
https://github.com/OpenVPN/openvpn/blob/release/2.6/Changes.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index f4b39bfbc9..6dc470360a 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  ee9877340b1d8de47eb5b52712c3366855fa6a4a1955bf950c68577bd2039913  openvpn-2.6.7.tar.gz
+sha256  5ede1565c8a6d880100f7f235317a7ee9eea83d5052db5547f13a9e76af7805d  openvpn-2.6.8.tar.gz
 sha256  1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index f8fc7e0744..28948a3ab3 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.6.7
+OPENVPN_VERSION = 2.6.8
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
