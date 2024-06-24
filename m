Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431EAC2BD05
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 06:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 033DD81111;
	Mon, 24 Jun 2024 06:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YrmU4ocxp5pN; Mon, 24 Jun 2024 06:49:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20226810EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20226810EC;
	Mon, 24 Jun 2024 06:49:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBDB81BF4D6
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 06:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4DE8810EC
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 06:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dW5Vz-XXm3vD for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 06:49:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B1111810E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1111810E9
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1111810E9
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 06:49:54 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.90]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRmjw-1rthM21SX4-00M523; Mon, 24
 Jun 2024 08:49:52 +0200
To: buildroot@busybox.net
Date: Mon, 24 Jun 2024 08:49:51 +0200
Message-ID: <20240624064951.12894-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:S+7yJ+PTo6hZRcKQKbn4jBLfWQZiXjg6Wh8noVquSrD5O004mXL
 dcQdT08Rrn2W8TWXxdLaDNKBCZzIVfIbb+XiS3I5UdiEZwLO2LyG4sxZLjcC0aUR5CiGZTK
 0JtDp1Lv2Mf+eBIv2f5/2GoRE0hYO/HOtOhawxVCOqHoBbKulziYgCGrQSa3x5TCapySvjL
 /tNjWOxlmTaThr5OMzX0A==
UI-OutboundReport: notjunk:1;M01:P0:dZxzYZgSo48=;andkaxMBV9/wjqLmUVUg+0KUohs
 ZLa3BOPDtsArGVSToLnxMtEp7UutT68FzDXa8wx61oJsNW5Ay7+32FedHHX8nUihONpEkrDPB
 IMUvN8u4lJLJrkqNRAoZEJcQ/0R4vS0czdQR24EAMI/rTk06z8xRS49xw0pwTEZmC+RxnZ5Oa
 na5XGXdMagzptDRntzeXEv9GEljccLIyzu6qK5VzA4Gej+SCb3VnLue6KZaJDiMFshQlYKrtX
 hLveOiN3UIOQjrXpITbUFkCBjmXJ2iEOOxctbJqAk9f2Ue98KFlIXbBeQU33YMFsHpIURMpE4
 eCJ0xP5v9FvjA7frPEnTnOd1KhnYJWbhDUMEUbmHF68/cw+yNOdsUHY7DnWlG40HriKGZiKmr
 FvYxSMUW4Qz9C519VtuM6jXw/5ZpuL24tRABmpt+X3QvskH2f5qiOZz8DprQ3oMumfG7PgwOg
 jKbYxrOFHpjDF6Nz97bilM0XVdVdcsSEO4UXw6hbWhKQgc8+Urd5NQ6B2cWZxaQECNvaDbkww
 0JVsGN4LL3W8+AQBH0tUdZAAxQvQXg4OMgsu8/H42s9em2y+8Ze1i/wfIhlJAn8KnoeDmgFA+
 isckKJdTlvuWT/C+OqpwmnqShBPiQ33KELtemmlzdzlrgjshzmjoI0EGqZbcwvuUOcmhxHvKd
 DPaVe7FAIrL4HcJTHisMrl2sZiSVgqGu4QpPawgcfYad6tvHDeAgN52uL2Mqodfcar61WyNID
 +21u3BmBrlKbiifCcsqH9E7xPgjil+8Uj2X3E4asjuqR32n5CHNnOfngjgkUC6jx9zbzbIuFG
 D3IVGljxkddvy17+e9opDPwb3hJdQYHJz3L/2G794vuFY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1719211792; x=1719816592; i=ps.report@gmx.net;
 bh=8Ncssop1vLw2OjED+Cti4fzJtKy/E+qFmc4TsqlL+sQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=S8nHnsJ+pC8SGPwROcwyJlOzVu+NStNCF3KCCTAjv3EQe/jo3WO9ZYkobYi56IKp
 cNj82yx7rsuJuOT8BP01eqdONHajH2DoSZLiyLRAKBhfkQ/qm4FBSvxDOGgnXwzwh
 KP2W7vjZfxgM37uooIKc2jFR7NTXW7gw/XqGac8QI6ViHwgVUbmwovmL1fmtDgYG3
 5Tknv0Nhncr06zMI8Et9c+IcrPmxzAEUVQPS0OwbdX4tJRqfRurDse6LFXfun6nXO
 siU0WwOm5fiiYBiIaHMYAVWa47g2TXUsAKqz6LEwbWv8hx9o7I2Tnk/sspXtLqvxZ
 y1KgXxhaXATHdkAmjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=S8nHnsJ+
Subject: [Buildroot] [PATCH v1] package/ca-certificates: bump version to
 20240203
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ca-certificates/ca-certificates.hash | 2 +-
 package/ca-certificates/ca-certificates.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
index 8a5b48dd79..6980a11796 100644
--- a/package/ca-certificates/ca-certificates.hash
+++ b/package/ca-certificates/ca-certificates.hash
@@ -1,4 +1,4 @@
 # hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
-sha256  83de934afa186e279d1ed08ea0d73f5cf43a6fbfb5f00874b6db3711c64576f3  ca-certificates_20230311.tar.xz
+sha256  3286d3fc42c4d11b7086711a85f865b44065ce05cf1fb5376b2abed07622a9c6  ca-certificates_20240203.tar.xz
 # Locally computed
 sha256  e85e1bcad3a915dc7e6f41412bc5bdeba275cadd817896ea0451f2140a93967c  debian/copyright
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index fe115209a7..a80ff8884c 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CA_CERTIFICATES_VERSION = 20230311
+CA_CERTIFICATES_VERSION = 20240203
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
-CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20230317T205011Z/pool/main/c/ca-certificates
+CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20240204T221334Z/pool/main/c/ca-certificates
 CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
 CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
