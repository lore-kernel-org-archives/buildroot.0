Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD425606A335
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 21:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FS49Rdbv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m8qGEB33
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1DAE40435;
	Mon, 23 Nov 2026 21:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mu83OvdfqRjr; Mon, 23 Nov 2026 21:20:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B2CD54065C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795468828;
	b=Ao9+4UEra8TjXIK5aV0E+lDBh0R64iFOaLWGj+NirPL/4TpEfLcaKI/c0kOwZxeH8Z0f
	 I2TgN803AGzHrP8An7opcyhQZiHG5g1Ds7EeN3QlM2kiEbZqLhpsccqrw58x1wY63mE/Q
	 xyLLLcyWsLNP551HGCd1Zgj1olB9Li0t3zL4mxj/dse/6x52VeZBwT32c60x2DHQgDeaC
	 +MBjJ45vsnmZn8A0y62Rwe6qy/GAFd6bCscpgYT4GzpdgdOww4qAyCL2S+Ljk7PUrXEEc
	 oFzMU/ScBKGQNSzZP0JSNfJg91qg4NhmtPQ1Gi5AzrQEZeLvChfukdwfZvQR8WepO7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795468828;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=uGjMdZC2K5RdCGyJUH+bMuUD8tLtVErleFJn5SEHbyY=;
	b=XRXVpgNUBmNOe38uEu0IfDTHRb3JH9dqU3hnuQR3oglcTAA1ffhaZqO/wxKC2gUT4uig
	 Jr4OtaKlsrd6y+HBQUy6d2LA8pRjPMfLn9e1Gk6xMHhnfJKKp74D27eWbXjmDVT2Pw+DQ
	 LeqTZWRhExJVGdIaHe9eC4x/4zfXyLkzlOkktF0MnwtTWQCfBPxbKw+zfnNKVXXlfM1jz
	 bahH56ZIpHjdOlXuMTv0AJYkYsK/ISYPlemJnkGjjuLbD+8eMlAMb5Ehu7Hl+RBAjL+kt
	 Sv7rf34cziPGSdVJ7PGmWFzE8Uyf0COE6VQMxe6bgQHeKTyfMBklYIODNdT8StPqHyA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795468828;
	bh=uGjMdZC2K5RdCGyJUH+bMuUD8tLtVErleFJn5SEHbyY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FS49RdbvPpVJBaTKVW/temd5tZoyyAzZrxtS0yzhbwauv/hutsqeAD75sK1D5Qr3i
	 Ih4PHSAEgZZ2O58/ddnnEk72Pfo1dlWfc2SMNXkR2v1XWJD3GppdQKU+I/Gw/RxLS/
	 3h3b01+wfJK+BRgYpsNeSm9TCaAZyB/IpoCzRxNlo1tyGd83sIjjQZXNpYggSxZSCj
	 WU2rZNt6+8HE8uh8O7eY6t+pPItSn7eJx8DFcQK6tzNQMw6dhIf2A1Cnc30nq9eJy9
	 l7vafAnG9CEWmK9GANy8ahX/euKp0kh7GW61E3iW+08fx0oeSMwUwMlW9xDXpz/IzF
	 js4sZHpKt17GQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2CD54065C;
	Mon, 23 Nov 2026 21:20:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C6376371
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3DD880D35
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-QDPlHonHuw for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 21:20:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8AAA180EA4
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=m8qGEB33
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8AAA180EA4
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:20:26 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4bb55cda775so24239095e9.0
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 13:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795468824; x=1796073624; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ymg30vt45WZM9ccuN28VwEwnP61S91Flip9DFL3gorQ=;
 b=m8qGEB33U8fkSwP2DcZoItiARXJfGVrtqCpHMz5t0HPNrxDim58bkdrwQsW8c5G5Zn
 E2y6Xfq00DPM4NbAEYcjISaTOaCSMORkfGXIXzCbYV4gQXE//rOZtWnKZPCahg5MZrgU
 CdVoCpnGOdTdWSUx5KjQh0KNEqUSpInWMsQ9Ot938/Q9tTWmK7ceQgvZ7juo5DlT00yl
 LRuj0KdN0Y1RuVqkyecYOSgzFB45gwUr8soVi1vfPCL1lkVi5OcrmrXHgmnYOuWELyRz
 zCu/2QkLyD+TDI3ybSixKDlVFQ+CMUhDbdvFaMU7zfTB/VlxP2LLxRDXh5Cr6UYSZxS1
 jLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795468824; x=1796073624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ymg30vt45WZM9ccuN28VwEwnP61S91Flip9DFL3gorQ=;
 b=YTcyFt0fh4i/opSd2WGz7ZFk2hgumf6MGduoxl+JyxjTCvKJrCV8WVeSkX2SRYKoKr
 c15NUKsRtElJNoEiL3+AIjMtmp9P+zNkj9n1iOKpBIkpJGWOerBT1rVzLzLS8OWLnQam
 nj15iiHNnYohFnDTI6mlAjCuE+ykufOLWDCFAGW3yugZu2KLRZQiHF/tHKN6NJcKE9Ni
 aL5kt8CHCEAE+m+/8Mje9LmNLob2SiomnGar59OR5j+vSzllC8cIhwfqw9pNmn3tf/Z9
 mPdAyB4NC90kkdrO84GyoTC1m+1Sjh7nW+DfAOr3YWWl2Tio+NEy7ybW1XCtHBxHFM03
 ORBw==
X-Gm-Message-State: APuU4Z+t/5GeUMpw7/EkNWBNT4/7znRCbtmG0qFa1clPzEmUdlY1xTFz
 tKNKWJsXSyNetjetcHQB1XUfqKaXMz+CYbZx60sj9mrOk8zzQAS6j3O2mmsM1PKF
X-Gm-Gg: AZFdTZcR2mI/zFHw1MvJVrwR19NWe+t70oCa8om0R1zqszPx6MXFQ64/70n7IPphbgj
 W0SH8zrFnFZn8n3qCxx2ezRwA1FvpZ5H3gXPk8pNzk22yMT1JkPn/SE7iElPceRaPchEZt+j1kU
 haO0vcQrvv2ZY9LtUnTZ2gd28Zi9+aVqUF/VjHX6cBkxN//Ilh2h1gavOdeXCCyGdMECj2TDTPp
 7140kiyw2cvjYz9KY4reGkdnjkikrK34aodXNCLpLrq5LUbZutdU/HiH42EbEx6mzRioTb/Robr
 YVP+pMHnZtLOYuIt1rzGVlDexTVx+lT3XpXgeFpaHi/pFW2cgcrV5sE9rjHsqNlwhFLzx0o9pMo
 /LovYb5P5eRlW3kAjgnWuOm7ivIIZBoqv0x1OOO+xuVhGZ/RaqBuXveFs4fYVBeRxYMZKYYeCLb
 eWRXu9raUXkclcr1HC0TmmScnD/diMB9qBMk75UzMiC3Ci1d4GWnanJUlQs6f6t+bWR5LxpWQoH
 HuIpPVKieQOoCXqeCtafojeBXJHziAMnuYDe+K4cnpSjy9R1vYVAfGA3Ydk2rcXYT0tO8FnmVNO
 EifBuUD/CM3ivb6kOlMVn0hW5NoyT6Q+JFQwBiU+lItNR3h60G/8x+8PmbVlHLhf9QIpttk+
X-Received: by 2002:a05:600c:154c:b0:4bb:6a78:7c42 with SMTP id
 5b1f17b1804b1-4bb887c3428mr269348165e9.1.1795468824203; 
 Mon, 23 Nov 2026 13:20:24 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8533579csm338766385e9.2.2026.11.23.13.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 13:20:23 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Nov 2026 22:20:21 +0100
Message-ID: <20261123212022.3748880-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122205404.3669909-1-angelo.compagnucci@gmail.com>
References: <20261122205404.3669909-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] package/qt6: drop hashes of removed
 license files
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Baxiche Su <baxiche@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

qt6languageserver, qt6mqtt, qt6opcua and qt6websockets have a hash for
LICENSES/Qt-GPL-exception-1.0.txt. Upstream removed this file from
these modules:

- qtwebsockets: in 6.8.1;
- qtmqtt and qtopcua: in 6.8.2;
- qtlanguageserver: in 6.10.0.

None of these packages lists the file in its _LICENSE_FILES, so the
hash is never checked. Drop it.

Fixes: ecea4d94ac676ae9e66ce3e8799c0ba7dc14cc96 ("package/qt6: bump version to 6.8.1") [2025.02.x, 2026.08.x]
Fixes: 5ae304d96cb7c4df040ba1bdfedfb09b3d5a3417 ("package/qt6: bump version to 6.9.1") [2026.08.x]
Fixes: 1ef39b9196e0a5979581187f15fd665ca390c2a0 ("package/qt6: bump version to 6.8.4") [2025.02.x]
Fixes: 05cd38635a1c2a8e6c44170b5eae8488b0c7a104 ("package/qt6: bump version to 6.11.1") [2026.08.x]
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v2:
  - add Fixes: tags [Thomas Petazzoni]
  - say in which version each module dropped the file

Supersedes v1: https://patchwork.buildroot.org/project/buildroot/patch/20261122205404.3669909-2-angelo.compagnucci@gmail.com/

 package/qt6/qt6languageserver/qt6languageserver.hash | 1 -
 package/qt6/qt6mqtt/qt6mqtt.hash                     | 1 -
 package/qt6/qt6opcua/qt6opcua.hash                   | 1 -
 package/qt6/qt6websockets/qt6websockets.hash         | 1 -
 4 files changed, 4 deletions(-)

diff --git a/package/qt6/qt6languageserver/qt6languageserver.hash b/package/qt6/qt6languageserver/qt6languageserver.hash
index cb91c6fea5..f4b0727a54 100644
--- a/package/qt6/qt6languageserver/qt6languageserver.hash
+++ b/package/qt6/qt6languageserver/qt6languageserver.hash
@@ -8,4 +8,3 @@ sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENS
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
 sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
-sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6mqtt/qt6mqtt.hash b/package/qt6/qt6mqtt/qt6mqtt.hash
index 50e63c7d51..cb345f43ee 100644
--- a/package/qt6/qt6mqtt/qt6mqtt.hash
+++ b/package/qt6/qt6mqtt/qt6mqtt.hash
@@ -6,4 +6,3 @@ sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENS
 sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
-sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6opcua/qt6opcua.hash b/package/qt6/qt6opcua/qt6opcua.hash
index 1c141c162f..ed0602e407 100644
--- a/package/qt6/qt6opcua/qt6opcua.hash
+++ b/package/qt6/qt6opcua/qt6opcua.hash
@@ -7,4 +7,3 @@ sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENS
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
-sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6websockets/qt6websockets.hash b/package/qt6/qt6websockets/qt6websockets.hash
index 57c0301c7f..3387892890 100644
--- a/package/qt6/qt6websockets/qt6websockets.hash
+++ b/package/qt6/qt6websockets/qt6websockets.hash
@@ -8,4 +8,3 @@ sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENS
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
 sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
-sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
