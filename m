Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3897C5DF86
	for <buildroot@archiver.kernel.org>; Wed, 19 Aug 2026 09:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A60B280D36;
	Wed, 19 Aug 2026 09:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTAwlDXdfPjO; Wed, 19 Aug 2026 09:54:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787133281;
	bh=iLDL6QitaoYz3fL0kx3u3zNdUuzznPtE27GrMkjfjRE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IErvW/AO3RH39Talg0CYrNHzddTeRRk7NKMyVkP4NadxKGS7eAYUL+aqDrxYFste3
	 s6GGZzM7IOW8+PwOG6dNqaQc5G/w4HrTbwqoXu43DXQR7FBOx1I46Q/nmv+RNscecA
	 3uIZfb4jovkzm2kQi3De50FckgNT22Cg/RJpyepOmt0PleRdWEEDXpeWog/Ap5WndN
	 a6/WhmzNtvjkx7kQfsCeLdYoXBGGETxSVY76yAm3VEwuLJgJiy+32p+JIgXH92a1M6
	 J0s+lbkfOKIxyYDR+tYMljpa8SWfO+f5YSl1kzHQbaxgisAeAdS6Reh2zPOwVEZgkE
	 qrfmat3m7acrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B820A80DA1;
	Wed, 19 Aug 2026 09:54:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CA08334
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 09:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86CAE6060C
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 09:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6da_0_qOcmE for <buildroot@buildroot.org>;
 Wed, 19 Aug 2026 09:54:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D409C605F3
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 09:54:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6091F8DC43; Wed, 19 Aug 2026 09:53:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 19 Aug 2026 11:42:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93049b2559b4e87a6d03cf8c1b0125ffeab86477
X-Git-Newrev: 5245c41441bacca292d129d4339e79e5179af79c
X-Patchwork-Hint: ignore
Message-Id: <20260819095347.6091F8DC43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireshark: security bump to v4.4.18
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8731088662791965764=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8731088662791965764==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5245c41441bacca292d129d4339e79e5179af79c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following vulnerabilities:

- wnpa-sec-2026-64 · Sharkd utility crash
  https://www.wireshark.org/security/wnpa-sec-2026-64

- wnpa-sec-2026-65 · Sharkd utility crash
  https://www.wireshark.org/security/wnpa-sec-2026-65

- wnpa-sec-2026-66 · UMTS FP protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-66

- wnpa-sec-2026-67 · RDP protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-67

- wnpa-sec-2026-69 · Dissection engine reassembly crash
  https://www.wireshark.org/security/wnpa-sec-2026-69

- wnpa-sec-2026-70 · BUSMASTER file parser abnormal exit
  https://www.wireshark.org/security/wnpa-sec-2026-70

- wnpa-sec-2026-71 · Tektronix K12xx file parser crash
  https://www.wireshark.org/security/wnpa-sec-2026-71

- wnpa-sec-2026-72 · ERF file parser crash
  https://www.wireshark.org/security/wnpa-sec-2026-72

- wnpa-sec-2026-73 · Bluetooth Attribute Protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-73

- wnpa-sec-2026-74 · Catapult DCT2000 file parser crash
  https://www.wireshark.org/security/wnpa-sec-2026-74

- wnpa-sec-2026-75 · C12.22 protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-75

- wnpa-sec-2026-76 · CMS protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-76

- wnpa-sec-2026-77 · H.245 protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-77

- wnpa-sec-2026-78 · Kerberos protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-78

- wnpa-sec-2026-79 · Bluetooth HFP Profile protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-79

- wnpa-sec-2026-80 · Bluetooth BR/EDR FHS protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-80

- wnpa-sec-2026-81 · 3gpp phone log file parser crash
  https://www.wireshark.org/security/wnpa-sec-2026-81

- wnpa-sec-2026-83 · CMS protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-83

- wnpa-sec-2026-84 · Pcapng file parser crash
  https://www.wireshark.org/security/wnpa-sec-2026-84

- wnpa-sec-2026-85 · SSH protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-85

- wnpa-sec-2026-86 · ESS protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-86

- wnpa-sec-2026-87 · X.509IF protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-87

- wnpa-sec-2026-88 · RRC protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-88

- wnpa-sec-2026-89 · C12.22 protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-89

- wnpa-sec-2026-91 · Bluetooth AVRCP Profile
  https://www.wireshark.org/security/wnpa-sec-2026-91

For more information on the version bump, see:
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.18.html

[Peter: add list of vulnerabilities]
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 917ac47471..3d8fdb6131 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.17.txt
-sha1  d46443d5bbca3580f944f3effcdfcc59e24eb7f4  wireshark-4.4.17.tar.xz
-sha256  b89a8c60b9282f29be4db91437a6e969e61bc17e8c92ddd980cc38c7304dd772  wireshark-4.4.17.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.18.txt
+sha1  482fecbe21a876f53a26bf5beaa5b0ee0ad16e50  wireshark-4.4.18.tar.xz
+sha256  f77a7939983758383797fed0a34a491f785e541cca397a7a44e9cdd7c6f847c6  wireshark-4.4.18.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 1fd81515c1..c500a49336 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.4.17
+WIRESHARK_VERSION = 4.4.18
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license

--===============8731088662791965764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8731088662791965764==--
