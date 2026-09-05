Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDC3C624D6
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 06:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDC7340BF1;
	Sat,  5 Sep 2026 06:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id THL1J9yJDyMI; Sat,  5 Sep 2026 06:23:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 09C1340BF3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788589403;
	b=IRvl6EpRJohYlwTFWY10KOcGxDuL+mGoriCGkt4o2qEvDQmwJs61kAH+53gzzKqDOQBn
	 8YYwmCKM4Jt37QLxxEDhvl/pmbWh3JdQ60IO8BnWewnLtnF2r9wPxGD513CoSq4Abyir6
	 ZrdI42rUGfyQN0+MsCH7+WZIPrUoVWrEP1XeEUJnrlnlFPGudgOct3wWNaQgl87AUOQjo
	 U7SScOKfoNex4Ou4sYds0sEHj3qxES2CyB3fKzGRy4auAfBIiFBE9aJ1kV3xupvqom0RJ
	 uRWTE0X1JtH281C0idw+XnynsmmFPyWStYXHDFn0fBektRn17HextTmt05Hjb+bd5PQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788589403;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EC3HLaE+LEFODdQ8Ef1fhS9F3O3spX6e9Po3UmaAid8=;
	b=aAi/HRtdgugQ9g4AT6TP+H43zxcgq2jWo23/Co8Tb/n6fzSYpmgPaam//08lqchm8uwo
	 t3vIhboAeyRjhLKDIYghKT11wsBHeud1OTmCWiW++gPNnXKZRyIfZzC/Yn5nzbDbI8tfK
	 7AhlR+GrxfQGLc2pkhMDLE1twP29wxJkzz0SIU6O8Gj7uy86rQPCQ9lep8o98z7doqevI
	 KUvj7JZht4EUHbL2s9fzrZ/e11DEZSwYGx5NB/2BlrU9mZCiI+XPlZ/2hqvJ/D4TNzshN
	 QHfgi5NfXcayvjeAPOEz5dlllQY3K98RZLXIB+cKhYlJybEuegPXVlNQn12B+z1DrJA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788589403;
	bh=EC3HLaE+LEFODdQ8Ef1fhS9F3O3spX6e9Po3UmaAid8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QnKkZWeYuYTfes2jDhnFzBFgUNcFGcSrevqVqWNnarDXVwHS2G+cCFhZOcdRZrJJe
	 a0GZMtrWL0k0RyAvbK0zE61ihaeNHW+rASuTXZJdBBvUjDpyPHWJ10DmstTYeagNSI
	 nkwmDECMqBt9goDlhXHGY9F1VZteKe59owhSDi98Pjou4QdHOplumNcUS3ZNFaJ5Hp
	 zXnmmuHaTjPULQZbpMrZ4KqZceaOnSF37ExlgxlURVJGGXN1c3Aj+en3CJA+DyW20B
	 WG+6K1LCU7iK4gOYfGrDkqFZeXDxY8AKXIThn/kV6vP+repIDnq0m+M9i3jj+X0Bbf
	 qsqoLPwMGigow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09C1340BF3;
	Sat,  5 Sep 2026 06:23:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D22EE9CF
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 06:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3944810DC
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 06:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vC13QUGckjrk for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 06:23:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BC25480DCB
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788589400;
 b=KUXP+qtKsQoRfJjabmqjpHQJ0bhwIvq0h8zWbGdZEoAmh7zCwrOFHhwXkR+rP2shqdhZ
 1WSyntE1iXXvIJCybT7BcC323qcr4MoWLaifeDpVyF29FWw1E4ndZVU3bI928eK0lZrJy
 +eGpg1/GAOvVgG1QNZCx41DahCxF1K4mVbRA2tPccHo5TaSggYGtpeAuaxePMS2IDAfzu
 8bzA+wNy+jlGd9lpSj7Iy9srUt4oUdtBhoIwaiWBRZClZPUBmK92AKQKVMRNMjTq0+yvZ
 1hh/uu7vk+ufex5C/pS+rvziJASfvDC9iy6xMEi+QtDVLaw5vC3OqnziVRIHeFmgwdA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788589400;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=3y0GJak5ANdBTyNkPTaHor2/yU/DFzcof4XBYyiF+9M=;
 b=oHaZ8uzHgXal5iAjZ3uZzm14w2hoo9nSMPo0mRag18/UxQEPhaqXqEbEWRJiU5Q6u0NR
 vS7rzmcRu2J1wCVbU/X98vsPJZe+myl8cIcLXPknyTsaqOCxykLiE6+d/+LcOvXpqXTWU
 APOBp/lIjAu8yIiy9KMWIGLquB2ZZRD41uTL6Ulh/x9u162D2LjVHMvSmkgAjNrac9l6z
 LWua4ZvtBLUmv/7imKJ4CykvSiME2RgqTsTelgOJa+Q7hxvDFXiKJv+x220vC4Pl1EI1A
 iMWdka+fKRdP3LJ9beCRP/HS6ChPo+8VXaYxA6wdjen6oJht4DNu70Ue2GlwtjCXTQw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lkM8QLxc; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=lkM8QLxc
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC25480DCB
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 06:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788589397;
 bh=3y0GJak5ANdBTyNkPTaHor2/yU/DFzcof4XBYyiF+9M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=lkM8QLxc2JnegmR1nLwePnQREUI0F1Ufv+fOBFGSyYyiDnU3VzoDTGfxHQ+G4RF0U
 rVKzt+l8HVYjbp/Jr0uOzHorjJy5bKLVXFE0Qk4aF73sQK55Fr2M59unioPv1pH3XC
 08u31RRoGy6QDLYDpdtETMbVSIV4qNGS46tYl0at2fY4au/01GWKJsJUd31DS5qsY3
 UwXgCd7MCLsjIjL1xjlg6zRPBFbJTgbKCkTv6W+ChJMbVWtSLTmkjdtYaRZ2i5nlXD
 oP1Iq8RBASi5ajOVHWKoGMD8HNyaQGYbAk+NrIbApAQmFpFz3cC0ZNc2IfSglmDMCK
 vnQ+M3i9vxQkg==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0A3F8A4C0F03;
 Sat,  5 Sep 2026 08:23:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40936)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2jo4-000000002H5-3AG2;
 Sat, 05 Sep 2026 06:23:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  5 Sep 2026 08:23:15 +0200
Message-ID: <20260905062316.383690-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260905062316.383690-1-bernd@kuhls.net>
References: <20260905062316.383690-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 2/3] package/i2pd: needs chacha support in
 libopenssl
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

/home/thomas/autobuild/instance-2/output-1/build/i2pd-2.59.0/libi2pd/Crypto.cpp:661:49:
 error: 'EVP_chacha20_poly1305' was not declared in this scope; did you
 mean 'SN_chacha20_poly1305'?

The code was added upstream in 2018:
https://github.com/PurpleI2P/i2pd/commit/58c92b8405f5da687734c1b0d6f7ec63dbb2d3b0

The build error could be reproduced with i2pd version 2.22.0 added to
buildroot with commit 1035e80aaa7492fec12cbc2fc5faa9bf32ef1cf3 so a
backport to LTS branches should be considered.

Fixes:
https://autobuild.buildroot.net/results/bd8/bd8616f04df2e1b9e18d1e16921979a852bd566f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/22dfb2cf28943aeaf56911d53553585d6047adb8

 package/i2pd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/i2pd/Config.in b/package/i2pd/Config.in
index fc2f3b9367..563f165574 100644
--- a/package/i2pd/Config.in
+++ b/package/i2pd/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_I2PD
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
 	  i2pd (I2P Daemon) is a full-featured C++ implementation of I2P
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
