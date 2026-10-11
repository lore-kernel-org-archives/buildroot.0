Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C111FCA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A042406F6;
	Sun, 11 Oct 2026 13:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3IJbvIb5kyDt; Sun, 11 Oct 2026 13:10:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A4062406CD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724205;
	b=ZdUGYNliN7kCWCRCHWoYzavszDebAS/IMJ9MtB4rRc5Y//pXs4iAd2jYeEHNAtOZ3Ma/
	 KUD1+ze67bOYOO4JTXUG16nAEiO1NQDFabfRXi5RkMWdhnrk/ZLVJDspaX7E3kMg9Qe8E
	 H0pG7Ls4n+Y79JNy9sO3VJA3JgdOfVIAA+YvKk8VMjjHyMe65siqmuQS96htAmQIEdSic
	 pZ0JvxkzgGFBzYTRdMEv74ZxPEX+MJUgEk7NspesAQWFSCHRay4VMkqk453j9ReMjp8Fj
	 jwg80/LrOgg5+f2tEk+4XoGUhmxBK+TtdsfdNLpuEWCVeSnw1j4zdB6Xe+XiZ9N2GPg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724205;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/cSN9M8mXvzxtHIdeFrtkUmMQgbdeMNjRY3lai1bJ2Q=;
	b=hnm4P+tLVHK6ktzf62rmhxikJ4fjpm0nRWfjcpigI3rNMv2HV1hO5plnNEYtVCNvsNCe
	 0cUZHSN8Q9s9Z6WXPvlJYuymfiiMb5Wcxpa8SylYJJC81gd3+RBN1bS0hNCUSxLcVWW5v
	 x2kR0xRo3b4lCn0enu7t3ScV1Z7IGk8ICqj0CE5Z1C/VBVuwA+T0y5cwEi/wYvqv06Gtv
	 3t2RkzNclcCJgmAwMhhljgS3H/54PEfkFfBH43X4fg86pyNYdD5V16WMetuU+CYVipoF3
	 rN9hYoANx5t9XB4Vr32klbuwDQTnMdtpD88xRGLzVp30/tZv6g6VJKlCKLNs3XoGvRA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724205;
	bh=/cSN9M8mXvzxtHIdeFrtkUmMQgbdeMNjRY3lai1bJ2Q=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X6HoCeInV+HQ8Qs1e22HaRcW0V0rStXH94fu72kQeTfENeiXmZ9UeCMCjpLSx9FR3
	 YHoUo5LuUjDlThqoqkkkBzAx+t33TaiCow6CaJMn4VkiGRMh1MKtkjlRIAVWqFgFwo
	 lLWqN/jWnhh/fvP74jB524oV7sVt5zdAuhsQDDpuOIoYYKIlEfP5VcH5IOcpG3EbfW
	 fn3LY00HpCIdaLLpwMwZfw3qENXWz7QbHYFzqKf2v/hwX4/HwE4bNNLsBchgSFNdxU
	 lEdsBX5uuYu4sT+1j1nDwIBOfHkdoKzNLdIn+ZgKkuzQSTgxgkEmSVkAfrVAHZi1Dd
	 rcrId57AeVnaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4062406CD;
	Sun, 11 Oct 2026 13:10:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D660194
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6AA980DAE
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dV0F5U-9G-2W for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:10:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CA42580D9F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724203;
 b=bfpKrTERn/a4iy065M8YZOarbVgueZ5PSIv8/Qt/Kt6j4Lia6J1WlIOr7ZwHBK8ABJzp
 9yv13zA47fN3DIJC1Pez/BC5/E/8WjBDdjlPaYPLxEFAfnQZz+Q6YEt+rprmIFJqQpRgg
 k0zKdVitPO+b4aPw2CiJBbGu6JLq+GeQ0JVUHxTTFfHTMK6VuDu9OV/Kft6G5ckPf8r5m
 nYZCprtKAD3UhS3mJKyusJq0IEYaMymesOK/bJoHd2Ak49+2vwrpqOPvSEjsXImVFZd5j
 W2A25C2Jl6GcKkNEKfZ80bbQvyfGhcw6oblvhfCP3HeFqDPVaqeDfry6Kd10Sx8RnUw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724203;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=n5bkT+yoQYQPpJXiPY2hGVQ25nZcbEJlRJVzuq7d/lM=;
 b=lXyQwji13YbZdy+Kcw9eAzgvyh9zdV/J1DNGG1TBLOCrkcrkkXfRlemUd9c08BfrIPox
 fKB3D5Bin9fLk+V/HtnIMmse04n8OlTtzMufJGn5dR+OTz2hcwDw23kqY0lH6x6jHzG3T
 kL8YpWATTjZykp40Co7Yn47yH2EVDuY5ZBYVQDJbC/JIxvH9v0b4VMg7Krl0+Rqq7389/
 5fodBtXkW1AvoBcrZlKm97GbV/xwSe7eAlS6aFDdgv5CG88rhGf6lukRJPYVDwISW+j2A
 7dcmQHfIxsKaslTpCHBQb0CZIm5M7TkoSyQQt6fJ72wBjwLiiJWQrPI+INF0BjnYWMg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lshnMdq2; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=lshnMdq2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA42580D9F
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723684;
 bh=n5bkT+yoQYQPpJXiPY2hGVQ25nZcbEJlRJVzuq7d/lM=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=lshnMdq2ZhvSJk7bm3sbmrWNCkJJCnUl6tj8hKQq8Ty95eJ0ajp/sgrknY1qaVG+V
 DonIKrF1P4gzaYhx51z8STrg2YrfqosqHYvFGlxCfKbs2zVlwM1xtDO7wy4NNQ9ub7
 M5lme+SaemL5Ds+SFytKKCTlqSHjTR9civr7A9hV4uo19N87T3rSt0/kXa9rL6SZr4
 Amb5F3EXJWDzJshFFTV5zVA8euYWj4AvGXdNkAG/eE4DJP2e+jfNui6Xu04FmI4pPp
 T21U63mqDjyrNfBnXK3Y6aBijPlre+4u27i8BP2PVs/bXZHwBeVVnNNw/MsTooh/Yq
 an12tM78gzUfw==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 AGD3c/32+r/zC9YR/lLGJsPvP5RFfLBTqxQ9xeQLP99xvegxRs/J8l6nu3Syq9FO4+SasgvYqp0
 TRIy4anbs4Akl+94fzCTW8Enbyxj1LBQFcsGWpu6CYtgQmXMtn3OBZuUPMJIrujY0WkBovA8s1i
 sXOn6aVih4cJjxVwefIh9Piu8LNPsKKo9bnmErZcpCslKUfheCibsT70HovB+/qIuY5L8fhZ7E2
 kCS5h9WJB77aLHaQcPZnBPmniYLSmvuHrZbsq0t+gxGebQtFTFi1R2KNIETcEe2BWAhW2Xf8/6C
 ULWxAoZ1s/6nRaHof9mwqbaMutblchuLTJHEATPhDNa60wALbQB/SLImJ1oUPuqVlYolIIRJR6N
 N7qsxFFfZm1iP+bK1JqdF0t0riaN3jCk7co1aHlSFaQGEBJlxbXaPK3jBloRjD/ybwC2gAparXa
 oz6m+ExSOukX5+CpbvBZjggo17W9nPTmV8A90IoJuHsCYH6N7wF+vGmzJNxBHOVeDmxPA7Qe/dn
 xTtgllAHPN26czRpUCweOcvk/9MTc7cb3sdF9a3UEhpagStEhOWEw5Zb5dl/Am9vbGlBj/0K6t9
 0xsNUKw=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1FC18A4C589C
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:01:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAn-000000007Fz-3K66
 for buildroot@buildroot.org; Sun, 11 Oct 2026 13:01:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:47 +0200
Message-ID: <20261011130058.3443432-43-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v9 42/52] package/kodi-pvr-waipu: bump version
 to 22.10.0-Piers
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

Replaced dependency rapidjson with nlohmann-json:
https://github.com/flubshi/pvr.waipu/commit/5d74289b7501625ab2d9098ac16af0f66b8b4b98

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-waipu/Config.in           | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-pvr-waipu/Config.in b/package/kodi-pvr-waipu/Config.in
index ee0cc2bdad..855e4ddc5f 100644
--- a/package/kodi-pvr-waipu/Config.in
+++ b/package/kodi-pvr-waipu/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_WAIPU
 	bool "kodi-pvr-waipu"
-	select BR2_PACKAGE_RAPIDJSON
+	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	help
 	  Waipu.tv PVR Plugin for Kodi
 
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
index 96cfeb940b..04746da530 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  80e4723a228b27447fe6e83c9e2aa4e9ebfc0d2a3618fbe0491b6d2440124b64  kodi-pvr-waipu-21.12.6-Omega.tar.gz
+sha256  9e7e71df13dd3f6d01a8899ec2da794d7a5d0c080cd6fefc0279fccaf612a29b  kodi-pvr-waipu-22.10.0-Piers.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index 177c1236b1..c68af9aa57 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 21.12.6-Omega
+KODI_PVR_WAIPU_VERSION = 22.10.0-Piers
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
-KODI_PVR_WAIPU_DEPENDENCIES = kodi rapidjson
+KODI_PVR_WAIPU_DEPENDENCIES = json-for-modern-cpp kodi
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
