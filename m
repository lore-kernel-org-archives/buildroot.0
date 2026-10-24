Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE19606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 19:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=B8cfzy5M;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=BBY8qfHB
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E955940585;
	Sat, 24 Oct 2026 19:13:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xf-s2CtfYlSV; Sat, 24 Oct 2026 19:13:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 06C6C40562
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792869239;
	b=rpIJyIRHfS4ANKq5PNJ89s6dYvBYgJWvp2DwbJc2GIQmeQIfKeIKhW5W7qagHmd7ZOTY
	 S4bISnkG7q66fnunmZosedAOZtHJfF5XFhcFgZHCju0DsF4SS6qEz+D59qkhbyMF2mXAS
	 uSbgMjozG/Qbl30IqbujHhvhOkUErRhBC2tcIxZi7jb4LdTsUTC4LzxS/a1tvPK5ALJTh
	 aidpF6uTiiOYtRylImMj0a/cRh+U7YNJqYucvgXbHmZWMlluN4JsVzX0GqnjugTjGfb3a
	 UrVos+K7WaLgwLw8VGIVgrAbJ7s63t2DmiMfLsx32bUmV78Ej3LGHeEbVAAiZeFKPiA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792869239;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xA9kzNgZMUytWFhq/Ci+lAiB9zotcwGsvk2Hdxknaqg=;
	b=cXl/FhGBb5pn5ZfCX9EtxG0couwQ8yvPhzxhyPckSjED0NbsYWm4d1rF+EcMs9vgf+tj
	 j5tIoRrNXB1WRl0yERj3n5CeZUwAq3izZBJHZfy5RdfoWiLorMmC/IK9ZbwiENwDfIQPj
	 Q/VcaaaNoAFXB+6HwOyL98mU+BhVzqLwzFWmzOna25nh6ncDnFRerTuZQyzvE9XysIsUk
	 X6wChE+VNnVBnM+6qWcqzz4ASYseGhfRrmCcVCoUAldFSF+BuWFF/hk043weTT5yN2DxP
	 34TdzZFOC0AIgVHbt1VWo/XBBjzBipectpZ72Nc//9OVw9Q9e8fl/BDf9QbvTvFAaOA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792869239;
	bh=xA9kzNgZMUytWFhq/Ci+lAiB9zotcwGsvk2Hdxknaqg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B8cfzy5MCJZT3eM1oHqYUI9E7fTf09h+xsn8iRHBKpcotYI18PwrpcGpeyV1qW3kR
	 wIHjvfeJnkxLz4bnP4r8SoMD8Gnx6p3HOuzijFT1PF/L3kBvNMfqH7nYnR1UAk/ike
	 0e16srHrVxChmUhzFKyMoiuI4e2XaDS/tJd/Sv+tF8lC+FMhEBoAB2uhvURJskXugM
	 Eo2IScgfwjNwdXJNkRRsIRqwewf2zGait9aOAIZUV2biQva0Y38BRncHKyA+1sVppX
	 kEsUlxHHc/ohhmH5I4ikt2FEWlKvsRv+UaaJjnatfCvwwn84L3lH+Xf7YcLlrmk4QE
	 6bgboinscdn5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06C6C40562;
	Sat, 24 Oct 2026 19:13:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F1D3356
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30DCA60612
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5mpYZsAJTAZ for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 19:13:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 50A2B6060E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792869237;
 b=ZI5fY+TGN97rLqamVaL5VkqyFfFuanBrV1Xw0AU48dC71URR2zgVAtvtk4Iq2GOI1Im9
 0hQkf6i9/7wip3vcN8+iZW13GLa8b3r9W2K2voBgbSlNzbCmBjUOrYJ4o0NsRmc6qpGAw
 9Vk1xotPowJLQ2ODjwNgv9APpv/GEojb//QgQ/6jPD1Bn8a4bu7ZQZ8G36i5q/FtXLYDO
 EClxOSRbAZirKMDPXIX6QEbuY+7uXrsTfDSXGiklZlnxbK+8uEyNew0njeEy+TydwD35n
 XZeghSa8T90z5/I9FfYQFiru2RC/dVBAkAOcScPbcD8BiQHXd7FzYEen4yknq4mgPGg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792869237;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=z7AlZx3F2xi/BgvLKWcDBlNU1lPXacocBb2bPS8CvM4=;
 b=hyd5aNkV7qAkYTxuqDR1/sWXSzF5sqNVANPz6d6x9YJD+2c0RAvnpVW5P+hRqpwhrmE4
 oZYgMCh7y6+nooI5swWnwVZHgy3VJESJszG7WbX/KOtMhOHvSGYSQES9wcsF6bZYgMPSS
 siWi919/qRLFxe+aEuIMUn8/QtfmDlakSvHl9UmzVlNPRbXsixu8l9STfZj6vqB7nfBJ8
 0bQeam5ecNjaJG45wNSjj0u6VjJAuCnXUdZOEVlP+VhPmXQTO/3p/QdakdrIfxPGnFm18
 n4PRSVpESINZhf4MnaIJbOuiF7qqKrDmwK0oEpiLAJw4IrsrFiojtjmQoacQ+Ca1WIQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BBY8qfHB; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=BBY8qfHB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50A2B6060E
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792869234;
 bh=z7AlZx3F2xi/BgvLKWcDBlNU1lPXacocBb2bPS8CvM4=;
 h=From:To:Cc:Subject:Date:From;
 b=BBY8qfHBjC7yhTlYxAeRPamENYHooy25JqwDHhAnGSw4xYzHPrCuk8zaE6/4gtvpL
 NwtTxNpeIGS3G7j2nnZR4a489SyGECjPzg3fZr6+YH8YeMnLHeNIbzk75vbkVmp0/U
 TJXDxXAvaxPjVM1wQSQDInnIJZzAuDbAaRZK21kEJpmoBi7rVuGtoT48sZkuFi3jSE
 +IqUlMnP2sG+lI20vrIvI3OfyAywMy+lU6N6tQwS/887kHzRckomSMnl2ND2wawO+Z
 NWAdwCHE431jRyVJdTBdUL5O5ff4bIZkNcLLrB1HYO/SB3JMfdkkkOJvj7gNJSpNpw
 heAelUgbrXRFw==
X-KAS-Sym: v3:f51bdf72230551df:LeAQDhOZ1+2ikTUoEi4XGJkQ/1RsldAnNoHtMl3bTtpa1
 QgRdRdE/7tGnEaFOAdpDbPMF/st29yIzmPop0e4lw4HlCJ4Z1I5xCOY4eSSMRjhkc9EOQsJP2hn
 88fD/gpnAW7gBNYhyQPGbeTJ17pQVnyHOt40t93aySsgjkceVjlHHmlT+8O34nVWedBCUrRQibH
 PhX9lR6x6PNR8JwLugdvEWlWcotyxrgyx0/pz3e+HDXX8M/YwhEjSqT9fkGxXhmulGbTc8hGMnS
 qMNyOHHC+ql7tS5zz1C3YNMZ6aRQtTQUCNKFXiz6SFN3okdKvfKrHxFJhQlvejRGJSHmgKug==:
 g8t9ieNTVKIpTuhjqqXbgdLVkGJTJHp+yA1LW2iA+PYmMpfQWoGG8Luo9vVULDXj2yLBmuWHn0F
 Jsc2DcFG1+GVGiArBWaS8Glb+n+SuesJNhbFhZJRAWrPeBShKZXv+5m/L83gbk1EnSnrRD9D3dQ
 tkMEP1uVzn0OpQ+qo2SYdU2Hol8ZM87Ac5xFdQKTdQzzfjZEcU18rBdU324/yvzoUnTEaeMLRF0
 z2ceynOFl45ucIo5+9XT0qwxCq/23HX9UwzSayuiq/xIbb6htoHSdotiejnlC1XqhWSSKAmIN/1
 U/n9Pp++udx/pHtLO1xhGmeXPD4vZtD8aVXROobe1hup+xWvZ+TBBUN2O1iMoIGhsKXXs+lRM06
 H73FnOevOlWscQ9R3eeQ/E6K+0eXXMYkhrt7pInMrIxkXcZEDSgZcrCokkTxVpcgQ7caUXe6ivR
 i9XFOtWz0xlavIbx/8BPBHDTJeNCcyqFpwPgSqAdj3sxmW/6ZYF5a4bM3B1soxhSz4lZ+92+nAI
 Nd55g+6HV2VZHJ3qgW3aivcFEhlHWPdOzU/cEFcPMv5UTAz8cbgohECXsg+P3cXVH5XjHnb7DKf
 Ld26ZuOENOvuadJlgvDcCNIod+1KhcsiQZFPbRbmshgZ
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C046EA4C6936;
 Sat, 24 Oct 2026 21:13:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48702)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKhBi-000000003eC-2eB1;
 Sat, 24 Oct 2026 19:13:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 21:13:54 +0200
Message-ID: <20261024191354.3287020-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20261019
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Updated the hash of the WHENCE file, due to firmware additions and
firmware changes, but no changes to the redistribution/licensing
conditions.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/linux-firmware/linux-firmware.hash | 4 ++--
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 4c9ac0f141..52397aaf09 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  f80dcb757a623deda62200c08e0e1a88c76fb6b54964f31b35fa74da1c90ccc5  linux-firmware-20260916.tar.xz
+sha256  a10d1ab5baf2c74ba92e8c7cf313e691696c26bddfa6df00db795e48d70cd4ca  linux-firmware-20261019.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENSES/LICENCE.Abilis
@@ -50,7 +50,7 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSES/LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSES/LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSES/LICENSE.sdma_firmware
-sha256  9350832c1e9afc35df50fa8b9793b31d60d78ef963152eec903fc0dbc6b4a559  WHENCE
+sha256  0dd59e46f1e5d33d112236b17cb6de9d8f46fbf8fd09685cb474eb70a55f4da1  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  LICENSES/NOTICE.qcom
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENSES/LICENCE.e100
 sha256  26b3c946f1f378ff25bb3bb7c365d108a2bc0bf08619e5e08bc0e4f9aaa6ee1e  LICENSES/LICENSE.xe
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 50c84082ea..86c6402cb1 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20260916
+LINUX_FIRMWARE_VERSION = 20261019
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
