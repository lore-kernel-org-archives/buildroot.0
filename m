Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEE4C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 06:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75F2260BFF;
	Sat,  5 Sep 2026 06:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PcZhDSj_Pk39; Sat,  5 Sep 2026 06:03:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7BA3F60BED
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788588191;
	b=R7fjNRAkxHBE5sdLBsI8DNPca8n4F1UpcGwd5XrbyelKruVgCgqc3yPpQqb4GskSth7D
	 R9ztPBmWJb33OqcydeOvMesCNYWfyGKNRWBujg2eo5TURPKy4p3mqt0kKzjrwjyn3Kuh4
	 FbRIRESLs/R4VDcxE5O5+sjEjwCNMxVzkzgijT6qnxa3vZpeFkZ+pyx+I1ArUZQwNR4/a
	 z2yhZdrERq1GlAcOMUrUdTgn2v0napwCZpU2mul86fXkCoEQEX427MwBRJMsqjYh7qe0Z
	 YZldxduSfnNs0FnlKhiD33x4P6ZLMZDvmaa+h+D1HLNwOL/CzD3OvY5c7GheDm6SKXg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788588191;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=5nEhQbCuNxvR6jiHmW8ByYhNQkdcc4FdhZwlOEGOuSQ=;
	b=I72YAiLQTIp8x39CKhHY1XOG1IbM4/DM6JI5wcNevCAzSAmhK6/EJ2WjZ4EvwiFCRbqL
	 8rAxQ9suu6pFDtp+DqeObQ6HD8bfqykD15MUvX9ON1xz+VoHlchsqF7F+taCQKes/8mxd
	 BWgQeL9M3lU6VV35i/PMLZXkwiujacJELYeAfcJGx5R8OhIsbjAwoUUq9n/MhJYX9Bqbg
	 DBmUFd4GQVFKDVZZfbKZisff1uF+Q1+0s8BJ7YoowLAufcq2vPAu9arLrusuGxEApgqrx
	 w671Nu4rAtww4f4GXxwK9vyaT/i6usBZeT72Rutut951nv8IyU0sagzMFJUIifLgiPA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788588191;
	bh=5nEhQbCuNxvR6jiHmW8ByYhNQkdcc4FdhZwlOEGOuSQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PO3Vc6it7O9siJmEKRYDhOLRfhRiXH+KIhrkX5kshAPwssRO2KTjQ34CFpz7N+A8Y
	 7D8LXLTpRdlJKuM0OkuHWQA+94wDGbh1zolTgQ/49TbO+O2UkZxkiGEwh1kdlY7gsn
	 fE9XGgC7PKYJ/E5Tb1Dx+NZbKsRrwt66D2WVRAac4wrmtxJ5Am39wAvaN/wsFX5bhA
	 VJ/kUv7vxyNTyJG7yeC0kgQVpwHjroHc393SoFWq/DJrz/d9K1w0tnRIP5gY8aD7N/
	 GGCmtFRBZ40pQLRUxz6FECQRfwre70QGltw1d/b6rFc3x5Mu268hatrHAEK+WryTZ5
	 Mtt6+naKhkOZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BA3F60BED;
	Sat,  5 Sep 2026 06:03:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B053230
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 06:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CDA240C89
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 06:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N5VT2pYspeC3 for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 06:03:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9977A40C87
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788588188;
 b=NXjUOW4NBYh70Uo/lEHj5VWxQtsBb81HJ5XGBOHc5UUfFAtyqS6JjyNCT8yUXQ9doA6J
 yAzxLVOvqJoB9wtGpKJ3g6XqZPZh/JIBS0GelmNu8XVlttAsJR5iPcJgSJTcfzlv0IVo8
 2QlxWO1HfBxgcd+RePotmzAF++VAcPJDLSTpgHlO6nj2WfPl27MdltrR4Zx3cKLwWwVQy
 SiM98jy/URvIDIInu6n6AWmeA9OdRxCMHb+jPYqwNB0obL9Jmv1GYdBill4xmPSxjf7rh
 SWev014NMskFwZG2w4QMlKMiZXQY4otmIcGfG2+n4tQuIJlupMGjFBmeiyQugsiZp0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788588188;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=ca/XbFEXwHiTn8ZhWz845FHYqQpICHT/8czjXIsiLzI=;
 b=IdQ+E315xjbvjazSaYxo03zAAzryiCL1Rpja3k/SeYo8CvmP2H5e1V3I10FsBALLPpTy
 xX8ho5w7knek7e8794NADsOyIwLUHZKUMKUfz8PUxzNf67hMHvEV0uQ/RIJRsckpmtUDr
 D/VFht8DwDmcQP4vqtpw+gs4ye1avhX0S9vWgnTptLmMFXPgoE2v5DbJ2y83sobkr9nhi
 RXzckIxOJX5nO0eye2nLJe3E6fpayJ4mnRxC5nYtWsD103JGWMcMTcZ52QuhVzbMq9G2v
 BXRNOctTRedOdX9in9woW/N2M9wbHpBPUxfC6wccA8BP4g9BW7E3cPkY6osmVo+flFw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SdtehP9s; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SdtehP9s
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9977A40C87
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 06:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788588168;
 bh=ca/XbFEXwHiTn8ZhWz845FHYqQpICHT/8czjXIsiLzI=;
 h=From:To:Subject:Date:From;
 b=SdtehP9sERuyBnu9Txi1ZzcBH0YLMCpuUo5lEdmfDTu9UPX7OS24s//LP+Eat0f3t
 c08cRspoz1Aiemw1RbLFBDLFf2ZXwsuImyPjzC/TOa16HAbtgT9zUOv42rUAttsKTX
 /wcMFg2FHmXx5Yq1rXW1yZIHAMb9Hkr8nfoF6rqOrnvxGXJC66b/fzx2HV68paU0YZ
 SCQoSO4rLpLoInnbkaIk+bCiPG4sTTGZjHxyifuNRpS9rBxFGRrZplo7u2au/FoZ8w
 cOIH+d+jcQqaQnNFHdm3c4SNwy05RcIxjlxNzuBs4HUw5oAcftt2NN5Cprq5RwMznt
 s4yIDQZYpS/ag==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D7FE9A4C2F20
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:02:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35818)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2jUG-0000000078N-1Bbg
 for buildroot@buildroot.org; Sat, 05 Sep 2026 06:02:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Sep 2026 08:02:47 +0200
Message-ID: <20260905060248.332445-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 26.3.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/intel/media-driver/releases/tag/intel-media-26.3.3
https://github.com/intel/media-driver/releases/tag/intel-media-26.3.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/8916a0a9433c6954a513445a1f29b8b2335bdf54

 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 0392a45a2a..3f4486aa0f 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  eb8351e2ac9c1007a6489f3ef53907a464bec5e4fb2a1030f5b2b8fad81cc01a  intel-media-26.3.1.tar.gz
+sha256  bbe4deb0d2f72e5c58adaf17f87b7a11bf639446d99bf4193a116d0588647a97  intel-media-26.3.3.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 4810bb6ebc..f1a6dde392 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.3.1
+INTEL_MEDIADRIVER_VERSION = 26.3.3
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
