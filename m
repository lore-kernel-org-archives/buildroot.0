Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535B5606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 08:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pUsxEPTK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=dz6bkdt6
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D39F4080A;
	Sat,  7 Nov 2026 08:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nvx3CmrvpTM2; Sat,  7 Nov 2026 08:10:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 826E1407CD
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794039029;
	b=iZsuLQ0Zu2Aut60D2zeHFwJaSdDowG3IMnaTVS3d1XuyRwGEcxqc3MwRFgK8+pM9HcPa
	 g9e2yRYXfVCFUP7KjDBesdWX0yCRsAXc1Vk0DL8YrarbUl0VsjE3v09m/ssNBqTt5DNVF
	 tC8wH0lfG94V14g+wXMH9UZdwSBI3tgblARKU3c7NeHtQcZ2ej95NYpXA5RVmfYNbxMsP
	 q7mqUuR9g/T/oOadEvUHfpxJbvTKobJQXSoZfdPV8UhtC2p52raJfL0rMna4RNRwFyLRF
	 TfCbAf7LxTRgvWbAQWs4oIiSyIvVlJPKVFCAzUEIviYuq+i6m/F2bfYBNYw+hnULyzQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794039029;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XrdVdVBufSP3W6V2PoTCEzytgVWnJS/PycW2xnYrH2I=;
	b=nn5KsL3tEa+Ox8sonJGBQ8J48iLgKsetfTZLb8gjqjVQ2cxx49U+F9lVM67ULf9Cl2sf
	 TxjM27caKYOPNYRW/T+SOdTK09uZzpOlJk8sLUwo9K8WGoiPFR8DGUKqh3YcaKjpz+Ikg
	 LBbIbb0SEEQlcct38WgKUd8dY5fmJw6yvAhIRDyWhli2Q1mwJY5rdoxa1gD/Ow906J6q5
	 Gbsq8k234pYfuTI7ARrWOcMEQXbqNSQw8M/DukXK2ZOk40Sb5/mI7wXQxzZ4fZSydjNK5
	 09241++ubWcwnVE/GIqHOPH8YifhP605fHX5uwJDVNVhYsP9hgqIo6VZcoVWwVt8lxg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794039029;
	bh=XrdVdVBufSP3W6V2PoTCEzytgVWnJS/PycW2xnYrH2I=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pUsxEPTKfxWGxQkkZH70IxHI8tQshZf8fEiqSFclmW35/YXsKDdNvmBqWk8qhoq5r
	 dsMtoRq91u2bHUpngnh8BjDqHnu/SiOLpemGrrOGbrkTSbn41fzcN8xGVPZRgfqFz+
	 BMeDoJster5VlmksFdq8f2boj6/PeK0RJ6DoB/iwddo0w59U3yYpNW2ATbWiTAiRzP
	 21qtWdeWUV+IP+uHSe6C4a73/v4GDC1bQE5VeQziCucz5in/74dBuAdN91Q5F8ETs9
	 sxojmwWLYJp0zddFI5QpC/NhzaBodyuyxWqRzk8NAYBcPq6PG80tnoudXEFSCVGYfe
	 fOGolQNZK/lTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 826E1407CD;
	Sat,  7 Nov 2026 08:10:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D76D2E5
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 08:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 730296069C
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 08:10:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7BnqYYJ_twqr for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 08:10:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 164646069B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=dz6bkdt6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 164646069B
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 08:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1794039018;
 bh=KLXhoxQUw3xLPDSetJ5pJbOV0TN9GkEPxy6hz8MJb6Q=;
 h=From:To:Subject:Date:From;
 b=dz6bkdt6bZqDnjqC7yBXnQxAyCfolKG0mLYKLews/7M4vTmv0x4/oT6uJ0j+B3QSU
 W2/EP4Y4VOpBU32689T1jiDo/5Z52LFdqEcrdpgaRnAgiaR7y8nBPrHMEGQoVFRYe0
 flDSU9KhSEvQUv5xl25j+KkgHlv7986eBaEy7xv9EfTrpT2xgtU7sQGLNFWJLMnlKd
 w0aM1SOrgE13e70zMvf0R+HBGiHI+fTaYqpKslLUc7tZstq3gHLwntzzuB1V5TIFvp
 FYfoNFS5ePjxcPV7sgvhI1oz6P29/HWhb7qkOT+KD8CoseWeDfBgC7LQK83AE5GNyS
 PYr0zNHyt6rGQ==
X-KAS-Sym: v3:f51bdf72230551df:qJNVZ+GfhISc04N0yNM/3z+fPCrVqVEwoui5lvLsF1Njh
 DFsmotWNTRwCobKrpU08KeUcU9SGFd+O0YCkBfznWyhB04+9QcULFSOWRSwHMpJHMWYcmJU8kag
 qPeTGSUFRJZp43ZzQk0WRxsy8g7Aha1euDcAQdekCmbid72YYMxkcZmnG27U3O2zh0KQ+xCKtY0
 dBg+2mwDTA6hVwBx5cKG+CXp0D0QLw7NX5VBsarrkgSR0/LrRaUAQ5wdixNJBVuNcgUL14RXUyv
 twvTUdsQiC9/GsceYQ2s84Q70vIHJXSqcVOBtU0Lq0O4xPeFGsDeNa6kZgw2d/Co1xpCM7Hw==:
 kZ2Z0OBu4XdI59RHgaj86afYmJdTcrVP61tirubqk0HKYajiq2JQKufxm4+NpOeWlpUlSTgGS0k
 RDdiKpKJFkGVBMpRVSAVzzYuZqxYaqir5zZc2l5vg2dO92XrBz6m7HBz5CsBg4pqnfYH6Csxev1
 AvbFGbzusoYzlXnpHPaQd9QL/oWcpDNa14BgVfUVWXxQaMN1ni/G1ayF7UMKgq8OAAwshuUxcQA
 tX3Ca8S9lQjMRv/O+UOCOJINxucthiXnV2SUYCq1ZFb9oo5VeFfxFL0WRFRLUbCQ+A69+x18Dkd
 tDFF+d+wRRofbYVxBkLRN83KvdnMZQMyviMnrMVuwTL2BUrx9heMdpux+UZLnVYcKtUJsqnSOa+
 Uirij5w4B0boQlWqkgQzWTqLnU0purfGhiXoVfWvOzYjIO85dHdopUoA+2ETUj8yFVeuBAOpKeC
 m95LtcNHQ11+GNH63cPyK9eEQL1GePid2+c5Xlw2JqlQQCSPqcz68Q3XLEu5FX23FqHOXNO98BT
 chEnQWUE7HAmmRB8kXdcQCGxpvbQuU6lreNqm4zo7LEBz9WhqTAh8cEaVVPMDSrMEoyE4cnVSfe
 mpc=
Received: from fli4l.lan.fli4l (p5b3a0a8d.dip0.t-ipconnect.de [91.58.10.141])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A790DA4C3BC0
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 09:10:18 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60854)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xPbVB-000000000Jz-2cey
 for buildroot@buildroot.org; Sat, 07 Nov 2026 08:10:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  7 Nov 2026 09:10:17 +0100
Message-ID: <20261107081017.16144-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] package/kodi-inputstream-ffmpegdirect: bump
 version to 22.2.11-Piers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/xbmc/inputstream.ffmpegdirect/releases/tag/22.2.11-Piers

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-inputstream-ffmpegdirect.hash                          | 2 +-
 .../kodi-inputstream-ffmpegdirect.mk                            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
index ed22d4a27a..a347fa9942 100644
--- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f72d027b0aafe9e7734ca83e88e83dd038ea4c9b912dc6c53dfadbcfdb069468  kodi-inputstream-ffmpegdirect-22.2.10-Piers.tar.gz
+sha256  969295fbec985a940a32ec94cfcd224d27b54618e98fa84a6ee29f5de12c8f7c  kodi-inputstream-ffmpegdirect-22.2.11-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
index 9b050512ce..c0c99ccbd1 100644
--- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 22.2.10-Piers
+KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 22.2.11-Piers
 KODI_INPUTSTREAM_FFMPEGDIRECT_SITE = $(call github,xbmc,inputstream.ffmpegdirect,$(KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION))
 KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
