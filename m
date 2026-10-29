Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A91606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Bx1b5Au9
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1837740C58;
	Fri, 30 Oct 2026 14:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99iAKtCpe8Qn; Fri, 30 Oct 2026 14:18:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3628E40C34
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369914;
	b=YtF5z5RsQFsNlYFlIVPT4Lszfnl227XeOWjRtzZkexlm+18ypNBkiLnm2OuYJBi2QvTz
	 NpW42pBD9BY8jTboBAOL8+VxVTwAMOAW2jaJJ1M9CkaB5WkYKAyAet+ZhqnYjsZiTFW/m
	 m4mF0Sv3Md/zwcAiMwyCpfNvPuePODffCItBwwAhMpG9eQPbAbRKjMSAbxwxAsMXbG9Eo
	 4Z4puvuT1dlTMEYezVSN0tvVR8VWY2/UCwkH9xgn38dsvQtImA9uTz5vE2ICPI0M/k6cr
	 /tpLAcqzfjkOhryxs3Vsy+CM/qaqAm3gh4he9Caoz1cF4HBe7vlsBLOuh5iQSlaAaxA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369914;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=G1zpIGu+mZrS74xS/ZkWQAvv97+CoAt7ja4b88g8BlY=;
	b=k21mX2MebLcfR6L2c3eooHyDxxam68HY9krLnLTGKqybVPMPxYJgGKU6lMtr+CdwCnXF
	 KnuWGxDH8IEffWPgbEFUsTRB4pjwoVe1P+ZJq1fwlU1cxMKAOgVc/k/lpN5TQebfsD/Pq
	 L2PNu1YuLBQdOomIk+tIfrb9kccVvmJaaY55geC3gMOvvhMILNlDtzx3/IQsSE5pcO4PK
	 tdluKW6+IEdX1gc6qvRQqbvxo/Tcl6DgqLEjeg5+e0+b6gGPIVpLcd/86fNnAufoxf8e9
	 KjOuxqtA1MdMDhvv/tzi9yoh3SeXfJWeDGlftX2taaZNOtyS62cTp+U472wiZXVUW3g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369914;
	bh=G1zpIGu+mZrS74xS/ZkWQAvv97+CoAt7ja4b88g8BlY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Bx1b5Au9YtRhbWQKygr4dFHN3lTQ4Y0KRSbz1OPTujQHAWMoGYP5F684hx1jn/ubd
	 TqEuJJVZT6NsrtcP4WMjafwg1+UAJuqk4TgM3kC3Buhw8oC8ZNNYxMURRajFC0Q8Zi
	 V3/+LY1U5cR8+yibSl7U3P3iKtrOrZ/8WxJ3HJ6O/t3MK2rev5Lo2xHHE9NBrxDt+H
	 FSOEQRJXQcglxTFndIX4JC12TWCOyO9ljRGvgPlpeeYisf6lyho1OAU+JXKUgF3gFw
	 rVrVlxHlLkPdfllz2R78HxUBYHE8cpjftEJNo7eY14FcHlL9c5rWbT4Mveca6bsmUi
	 zKpWTmQcG2Z9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3628E40C34;
	Fri, 30 Oct 2026 14:18:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71AC2D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F02160AEC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1We6rW2TGT3l for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B3E6C607B6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369884;
 b=WIkJ1Ik1CdZP8npu5xh/mdIjRFikO8I+HCJt0C08W5fGl36a2jVKB/4Q0iJiK4tseLaP
 cgklYVC/BQUdmnh1MyxMQKuT9W3YLso8B/vveDXjamHU27Zw7R7YaUn/4TidV1s22rHLR
 rWAbLpOSrh5gspNxGEhrPhRPYmU5UXr+EUBqYtZszd+GE4o8K1K1rjlj0FlpyFJIJw7rl
 sN7tnenLAuJ7F6E0bCed9vSjgBGKlRn/BwMtczbuv3OTPV3YYMZL6j02QZFp2goPImvOG
 KB54F0aKBN82slhsLbCA+rpDgxOysCPbmcA7xlK/XH4j5l/bPh6IZFXH9UYxiqwN19Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369884;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dIx+ZzzP8e31nOR2NVCauPNRoMz+vMuBV8Ew4aIUct8=;
 b=lEW1w6ZAMI5UvtBgHE0H3roPf6rGcuVLcJi2Z9sbvWEOCckidRwCTIHCBHOHt15glzcW
 S3j3Zh+v5V7OH0GmyC7C6hYt/zJ2HNXD5I3vjjdzIpiA7s9jK/25kmiZtQviPjxikAL0e
 DvfMf+BNC/3PTltL3RHSsMiEt9jl7iJ0Mxm6lBxMtrQc3FUwyoSE+t0xE4pQFB+On5N3D
 pA4HEz9vchkRKfC4+eeFeGF88rOu2AjggwgSkwBFgGxwyMObt+sRXBwCiueqwUGaR84Nt
 UE7jqsGvfusweuCcbSl501sM9w/5Vdh3hqrsvciQ0U0U6jxIIGJ+D010PRPXy7wQ0AQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3E6C607B6
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C627E9D388; Fri, 30 Oct 2026 14:16:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:04 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: b353abf467a52b017ec4d486284ba3407ddba7c5
X-Git-Newrev: 646c6348c192b4808af5858ea0dc6e565a76a65b
X-Patchwork-Hint: ignore
Message-Id: <20261030141636.C627E9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/network-manager:
 rework jansson handling
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7544910514982563105=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7544910514982563105==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/646c6348c192b4808af5858ea0dc6e565a76a65b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

jansson is needed for BR2_PACKAGE_NETWORK_MANAGER_OVS (which selects
BR2_PACKAGE_JANSSON), but practically speaking, network-manager's
meson.build detects jansson regardless of ovs=true. So we make this
jansson optional dependency explicit.

This commit doesn't fix anything, it only makes the dependency more
explicit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 450a2c4857f381251f5613e1c6234462c4521ab4)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/network-manager/network-manager.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index c96f613831..932009e6c5 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -110,9 +110,13 @@ else
 NETWORK_MANAGER_CONF_OPTS += -Dmodem_manager=false
 endif
 
+ifeq ($(BR2_PACKAGE_JANSSON),y)
+# No option available to explicitly enable/disable
+NETWORK_MANAGER_DEPENDENCIES += jansson
+endif
+
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_OVS),y)
 NETWORK_MANAGER_CONF_OPTS += -Dovs=true
-NETWORK_MANAGER_DEPENDENCIES += jansson
 else
 NETWORK_MANAGER_CONF_OPTS += -Dovs=false
 endif

--===============7544910514982563105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7544910514982563105==--
