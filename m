Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA505606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TCD+DOgq
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81BE160B76;
	Fri, 30 Oct 2026 14:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_xbSrvVwCap; Fri, 30 Oct 2026 14:08:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 988FE60BBC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369295;
	b=UENB19LLFkBrnxlsbcFq50oSj8eTY4I53kic5CnX/PARex5abpE2YudhYDjAV9TI1OsE
	 MXK509A4W2JjpmFNJr1YrY91G2qA/IC6u5ll6QBYdElz5dVFr8La/VAOQT/yfIrqGDeWc
	 1xCfin3i1Qm3yOogeC79g73DC1KaCYAwJlwxzyTLaq3gtDIUzBiXI/GoUh/saYPwfZ5io
	 lJWTQNxBRiXg8PPv08DqzR3W3JOdkFD+7YkNsM50YKFoiMlWN5RVHwRt5OvBUsDD2RDbD
	 q0bBoiEQBs3H1xNLFotT8p9WQsAD/wzml9kfgk/pLktYepkUvFgGEG/k9jNO5dvsZXQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369295;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=G1R2U33ap8zqiwVPi+b6tBLjkRU/fRF7FUiMgkbxnAU=;
	b=ixmS9U601uNyWsnvotEchIliKRBpK1yz6US1mGY4Mos/6WQPv75MiAy+FQjzmHn+oNS9
	 FuQfn7owmSWUT2dMp8lbmoNRa0erEkGmvCoyHd3XVL0cxpciMP8hQ78ybFA1hqnJoFa+B
	 nJ0NBrnyETS6bxOdXfP1iW329rQKt63FFWf8hx7hByZf/qaFd+jh4BXa2pBlu2dvMCsMx
	 MQRScDTe7FSUzTMb2iRyjc1OkBZ+dcXQUD8FWikIz8nDZejxSalcBtKNIx59W7KKGL4Pz
	 By+v2LrDatJ70KfMXsj4A954BKUoBc5vxx0MoCZfZXUG41d3KYBReN5VO38zmVu8Zaw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369295;
	bh=G1R2U33ap8zqiwVPi+b6tBLjkRU/fRF7FUiMgkbxnAU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TCD+DOgqzVvAW9roMM1WT5YK4nZKbRSLt2jvPeEi4WSEJnbZQ1cfC3zxejT7GBvxB
	 gau77g+Ebccpz//VIwQNKtg3eKde2jFpSV68APtOd6R6+IvpgIoJiEYelGrhy8Yb9v
	 f9N4ya2hyRpq8gcE/Q8LhiWfLj8iOROcI0qVTs3YifDUrD//ag5O9dZcH5UrKZjU3Q
	 7FpRj0dsisC0PgmmrGfju/vX7AcvQPowpBHSZwJEoeQk79YMG0knOWVpYIHTFGpAh3
	 0x+4nFjNLlOPawAtvcMViS0J3G0I0C8gTVHDR6Ll+j0hwTW2dHKy8b73ZyH6tb5gSM
	 N6Mllwsw3EI5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 988FE60BBC;
	Fri, 30 Oct 2026 14:08:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E7F4D362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E324C40B36
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w3zY3PKVO3kH for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 393E940B1F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369168;
 b=U2aVfBNwWY6bgLc+lvVCEL9lLDBiCcs8GrERvSHsdRrEP9hreCxRZgaXHTzivVH8VpZu
 1TrHaEpjjtnVTNCK+v0/i71xdCefl1gtvyEPmvfxNMRogY6ylRIKV0A1QzDDZpRNWbZjy
 KbZXoyVXbtfMr2g01GWhonxypAwUwIDcPigQ+6duXMsWEfOCN1DPT5/vflF7hlETXEFs6
 1Bn+oFzSSYP6dwsTIJQ6DZJUbkFff+ea17MnfFBDg6iMdOIAqjzwYhNiLtj8dYK3WoGTi
 TeWtXWVo/HJlmS6tvXkJnAKf0KV3hgyf7hFHhX3jYD4bF0unWId3b5a4WVxRmzxyWpQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369168;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=JqJ5NcmBVv2s/eEnSP0OyfI2l3bbrZS1xOA6wnV1Qzo=;
 b=tJ+JUstGBSKJo3wWy29HdZuzqMM9RqqURfu7CExlxeLI0X/kMqBpiB3akrrqo8XyN5F3
 HJDnIBCWbmdWDo+J6O2XcIUB3W1z+V5XcULWgqAn8dPMpAZbMsBikT8eLHP9Ax/N5RpHP
 LrBKHW6ODs4vHoWEyze/gInDiy6hzXV2uW9NdUhrSvYOhHKl+oqKTHJkaPSyIiCpT87m6
 uLTMx+95wwePBNPKVgej0DW5sBBSYEs/mC2BOkb5ihv1yNS/SDT5xM/QYF5sT+osS87pE
 lXtx5G3xTbUTZaBjnYIRvS4lKokNUbxKhlcXV0N1NE7WjWLhI5ioDRYmFYNeg7FPESg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 393E940B1F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5840F9D388; Fri, 30 Oct 2026 14:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:00 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9062a525a07462bec226138e90bee0c7341f64c3
X-Git-Newrev: b637e48eb0f7d53479f8eebe05d47f883b76a321
X-Patchwork-Hint: ignore
Message-Id: <20261030140440.5840F9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/jimtcl: install
 pkg-config file
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
Content-Type: multipart/mixed; boundary="===============1021894230925386928=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1021894230925386928==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b637e48eb0f7d53479f8eebe05d47f883b76a321
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Install jimtcl.pc to staging, so that packages can use pkg-config to
find jimtcl. This is especially needed for static linking, as jimtcl
lists the libraries it links against (e.g. openssl and zlib) in
Libs.private.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b712fd22857dfeda4d95280323d987d060682557)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/jimtcl/jimtcl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 3d68ca8f64..bcf9496405 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -71,6 +71,8 @@ define JIMTCL_INSTALL_STAGING_CMDS
 		cp -a $(@D)/$$i $(STAGING_DIR)/usr/include/ || exit 1 ; \
 	done; \
 	$(call JIMTCL_INSTALL_LIB,$(STAGING_DIR))
+	$(INSTALL) -m 0644 -D $(@D)/jimtcl.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/jimtcl.pc
 endef
 
 define JIMTCL_INSTALL_TARGET_CMDS

--===============1021894230925386928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1021894230925386928==--
