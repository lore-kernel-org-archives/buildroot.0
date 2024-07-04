Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AB2C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 12:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC3A3405CC;
	Thu,  4 Jul 2024 12:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lA6Qat91EqQM; Thu,  4 Jul 2024 12:14:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0BE2410A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0BE2410A7;
	Thu,  4 Jul 2024 12:14:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EFCAA1BF2C5
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 12:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E90B5404CD
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 12:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vcYP52PPcHR4 for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 12:14:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3094C40242
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3094C40242
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3094C40242
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 12:14:19 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.251]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McH5a-1rr7au0RTQ-00c44A; Thu, 04
 Jul 2024 14:14:16 +0200
To: buildroot@buildroot.org
Date: Thu,  4 Jul 2024 14:13:52 +0200
Message-ID: <20240704121352.1915154-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704121352.1915154-1-fiona.klute@gmx.de>
References: <20240704121352.1915154-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ybiq84vkVBWi5QH/j2fikPcmArUAM8qqqDdDfVtf8DwEIXGKNeR
 nNFuX5v2Iq8NUZDrr+qWiDnVKM1HzRnekwlPYJcsJyL8A52g5B94qHi6uhIOrqytwLgEoUs
 mt9XuJr7XgamTaJobqdi8ntgUTeWbpgcNZJ1O/vjmsTtgk/HKWFf+QVRKlkSsLikcO5kWAF
 rh4BeCKoleoTcLQl+6e+w==
UI-OutboundReport: notjunk:1;M01:P0:BuJIqMXAmPs=;2qEEXnoynTHQdhOgh0RLFuBbZCO
 ajSWYcgdT7TEz2ujlVi/56mL+hJcXcl7SirIlh0oqtC4ILoLi3JOI3ipiO0EkyOLj0szZ/tNc
 5625zipUuzN/q5dMY0NbAkla58P9HBzzmXoaQu08a3rvgLrhNakqeoJcoDLbw7EymZa3Km4x5
 D0Mm4scsR3/5pPOqg9EMzTLQpX8uY0j29vhNcUiy+ObESNfcmUZxSn//97SXL2ZrMobRxEZXj
 kprjQpNZNNuxqaLqGwAlGA4DFVmIb7LZL+KYbwA6Od061Vc+uDCuuYEBCX2h1F339NzJTFDR9
 BUDOuxC6cRpPpdY4TAVuj5OGE0vlpNMLjrn4rBJvKrOBYNwMC0KKw0BMx+udJeyqSTydw1YuY
 iy7RdMBntszon+DcHdm5oXRRQSxbQW+QpIXm2IYY763G52HyWOs9jKr7FqINJOHK5dAmaVkbx
 96SPrSwQWpcRn8aFx8y8KXvriezsoA9ckinlJVzVTsDxsF6imyDZQ6J70fIksz/zP2V1fU5uT
 fS7Zp6vDJkqV7AWfVNt+zMFeZngmXOV/bPH1ncCyxDXe7+Q7Rqav73ESSOYEvze6yMOaJ9E50
 H6DUka08eQIpb0Mt5f8Al2SOa+7CaD0YdKNunuc9ytgO0B7gNNXf932Ljh7bvk7O666vJVDHT
 Okkhp/bRWOnx1IoxxAHElr/z9RoknI75AyjcqmjaTNz7iB3BX4fuJ5A36OgAkOTGgk9mjfPsI
 GhyNehafEJsuSboR1sTyB5yOrnVEEYu+BQGbXrNzGWgOA6y1DGYI7bSki5W8HdEq9hIzkFI3C
 tRywWLfTFTW0YQYRKV1MJVkbn+Jyy/0Q0hzdv1DdRKf2A=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720095256; x=1720700056; i=fiona.klute@gmx.de;
 bh=SW5zk/sKVwtvqiJl40HWOAympo0Yc77suVm3v2VrIjA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=J23EGdEcLy4BWEiT0UqZOFIJkknbZLAEHt5oWg/swM2YGyR97uZgWa4eesirg27K
 E+RVB87GeBqvGc/dTbbNm6MhVwGu2MFjz97dyio1MkJIKpgZ2C9jYgqe4E/yOwbar
 NBBuih3a5mtjZSTkdnjs+RKVMj86TULzyX9cUkiO6bYDixfVaTAuwjivd0aXR5wwM
 bYEJa2zncZDgGR504KA/jnfYX+G+Q/POdd0IhwrnhMhJtfGEaPOYYGX+iS5QQpDpY
 v5T/O5nIlvy8sEiKIUbLfcM5z3rN6ukB2Z0kyDy9gtDczNOsbYcDYFnyKfB5MurK7
 m6HzisaamwmnZ2e9zQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=J23EGdEc
Subject: [Buildroot] [PATCH v2 4/4] package/fail2ban: fix sshd filter with
 OpenSSH 9.8
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

The filter needs to consider the new sshd-session binary, patches
already merged upstream.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* Add this patch to fix the sshd filter with OpenSSH 9.8

 ...lter-for-openssh-9.8-new-daemon-name.patch | 24 +++++++++++++++++++
 ...shd.conf-ungroup-unneeded-for-daemon.patch | 24 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 package/fail2ban/0002-adjust-sshd-filter-for-openssh-9.8-new-daemon-name.patch
 create mode 100644 package/fail2ban/0003-filter.d-sshd.conf-ungroup-unneeded-for-daemon.patch

diff --git a/package/fail2ban/0002-adjust-sshd-filter-for-openssh-9.8-new-daemon-name.patch b/package/fail2ban/0002-adjust-sshd-filter-for-openssh-9.8-new-daemon-name.patch
new file mode 100644
index 0000000000..026cef9693
--- /dev/null
+++ b/package/fail2ban/0002-adjust-sshd-filter-for-openssh-9.8-new-daemon-name.patch
@@ -0,0 +1,24 @@
+From 2fed408c05ac5206b490368d94599869bd6a056d Mon Sep 17 00:00:00 2001
+From: Fabian Dellwing <fabian.dellwing@mbconnectline.de>
+Date: Tue, 2 Jul 2024 07:54:15 +0200
+Subject: [PATCH] Adjust sshd filter for OpenSSH 9.8 new daemon name
+
+Upstream: https://github.com/fail2ban/fail2ban/commit/2fed408c05ac5206b490368d94599869bd6a056d
+Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
+---
+ config/filter.d/sshd.conf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config/filter.d/sshd.conf b/config/filter.d/sshd.conf
+index 1c8a02deb5..a1fd749aed 100644
+--- a/config/filter.d/sshd.conf
++++ b/config/filter.d/sshd.conf
+@@ -16,7 +16,7 @@ before = common.conf
+
+ [DEFAULT]
+
+-_daemon = sshd
++_daemon = (?:sshd(?:-session)?)
+
+ # optional prefix (logged from several ssh versions) like "error: ", "error: PAM: " or "fatal: "
+ __pref = (?:(?:error|fatal): (?:PAM: )?)?
diff --git a/package/fail2ban/0003-filter.d-sshd.conf-ungroup-unneeded-for-daemon.patch b/package/fail2ban/0003-filter.d-sshd.conf-ungroup-unneeded-for-daemon.patch
new file mode 100644
index 0000000000..597df667f0
--- /dev/null
+++ b/package/fail2ban/0003-filter.d-sshd.conf-ungroup-unneeded-for-daemon.patch
@@ -0,0 +1,24 @@
+From 50ff131a0fd8f54fdeb14b48353f842ee8ae8c1a Mon Sep 17 00:00:00 2001
+From: "Sergey G. Brester" <serg.brester@sebres.de>
+Date: Wed, 3 Jul 2024 19:35:28 +0200
+Subject: [PATCH] filter.d/sshd.conf: ungroup (unneeded for _daemon)
+
+Upstream: https://github.com/fail2ban/fail2ban/commit/50ff131a0fd8f54fdeb14b48353f842ee8ae8c1a
+Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
+---
+ config/filter.d/sshd.conf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config/filter.d/sshd.conf b/config/filter.d/sshd.conf
+index a1fd749aed..3a84b1ba52 100644
+--- a/config/filter.d/sshd.conf
++++ b/config/filter.d/sshd.conf
+@@ -16,7 +16,7 @@ before = common.conf
+
+ [DEFAULT]
+
+-_daemon = (?:sshd(?:-session)?)
++_daemon = sshd(?:-session)?
+
+ # optional prefix (logged from several ssh versions) like "error: ", "error: PAM: " or "fatal: "
+ __pref = (?:(?:error|fatal): (?:PAM: )?)?
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
