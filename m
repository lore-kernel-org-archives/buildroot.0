Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A72606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bjDPl1Wa
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FEA960A59;
	Fri,  6 Nov 2026 21:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-1XVq4ZgfAD; Fri,  6 Nov 2026 21:55:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7548860909
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794002115;
	b=iVvjP3IO7MsqOUI+WnEhKwKmK5hLknBl2Ih9N6tV4+lTn0E96vSRwMdkZ3NsLGeU/5yt
	 rPv630rHr8KlrRRFAUGl4/K08lEaNzlp/atY5g/gC2u2q4kWW1Z01bc/dj6rR8lH15vYK
	 IKIni9KcZ0wNoSIoweDqIS/BOdDWbAtXx0V/jYsApnTmmQeNHEOIXRAz6PCF2XcyFFzVA
	 Ybqzc737PHakYdeYPHDe2c1VAHIPHAXyCIPynzHGw3K/H0PoJzD2qVAy7Kx0KbqeD4fxw
	 QVCZygfWqFV3FFcKRbHLpUejAGybVf/2R+OdBlVWEM+Nqf+hZZmNr0kE0/4zZEBwMCw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794002115;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lm9UcVlHRojbT9SCW0qPlLwnZl7I8PqI4eGs/94VE7U=;
	b=nnOInaFiwcxWkZItWYovt3dZjG0u7sM76smDDFSBRH2yGVr0jB+CmhZq7U2rFe1kfyEz
	 nGEHfH+yMehvQobdCgJ+X+PHgJ1SS6UTJ8oIsmGyCJ2IEILK9N1oAhM9Dv9psaiE68Tj+
	 LTCpMGTFDy4S0y1iZhXTWyxw6TaokoHXXOmqeI3x83JkgajuuFMATe9WgzsCSY0SVzdoM
	 /HDhiT8+StUrGvL/X9hdV3aPeCfJediGg96n0Crw41u6aRWPNjFI18wabOKiqavX0OTKh
	 al3DaGtLeLoaG2mz+Hk2RAbDUqjakCMh+4iktx8a0D+ZK9hUo9EYW+6FsgNrk8nZKJw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794002115;
	bh=lm9UcVlHRojbT9SCW0qPlLwnZl7I8PqI4eGs/94VE7U=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=bjDPl1WaTRhe9PCgWzn5K8SSNrysRbvaKv7CBfSDy60aND+q1sTlAWwtcN1/upcm8
	 GvOxe1TSSMPix/TbRm7ILq4MYOB6CQ322suZxN+mmT4BwwOharyk3ygjyKzPEOWSmU
	 iAAS7sip2+ZBL7xB9p921sa/+dhSb9yHqSpnp8Rh+BxSHZXulhZGB5t+B/l0jE/l++
	 Toox3UicAKr0h49FGZunsaNywbWRqiuGi5n0HS8y+o2EoJUAzzbMd9pcfxLBL0sWR4
	 L6O8J287A6mZQ7TcZ1Nj88eD/se3EhXsluX/IRKPlMfo7aYgltC0FLTzxDc1mj8JBI
	 FZujOPlyrsi9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7548860909;
	Fri,  6 Nov 2026 21:55:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BE7C1C6
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 788E4409B3
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8yubQONJ3QXF for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:55:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 00DC4409AB
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00DC4409AB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:55:12 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVeI8-1wxucU2VfA-00XqQm; Fri, 06
 Nov 2026 22:55:10 +0100
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Fri,  6 Nov 2026 22:55:04 +0100
Message-ID: <20261106215504.352784-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:rmNx84MloTdsUBphoGW4OGrFdAAse9CQBxFgfVsGS0ivKjYSEgF
 fiTUZg5eJiO6Iv/UdJ1fJOTZxY9+dZu165bpb5A3FGxMpr2Ifj/nOShMCQ+qJPYp91KRRPm
 o4uipIr7+aI1yim/UBVqLownY8DtLh2Ehw3Q47abuDK8rCIQLzeu7NiJlC5ATposUu5BqYP
 WlNZ2rIM2b2vz+jRlpMFQ==
UI-OutboundReport: notjunk:1;M01:P0:xenSFqXurJI=;c49wplEiG2RHo8KE/q4P7uPsIGh
 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
 u90MSms8FBsMd5wPUr6ejspE
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump version to 262.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

This is a stable patch release, no changes to options/services.

All changes:
https://github.com/systemd/systemd/compare/v262.1...v262.2

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 047cfac3c4..2bc539d60d 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  100fc873b848b9b0297d8a705e8e2ed326256c8483d9960ee1ffe264c8a5c3e3  systemd-262.1.tar.gz
+sha256  116432ee9dce9bfef4c7da7963c6de41899ab44197f2876ee99545707a5c7c1f  systemd-262.2.tar.gz
 sha256  ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  LICENSE.GPL2
 sha256  6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  LICENSE.LGPL2.1
 sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 05aefb40cc..b162b1f948 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -21,7 +21,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 262.1
+SYSTEMD_VERSION = 262.2
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
