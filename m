Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF67606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PiEScbVu
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59C83813F6;
	Fri,  6 Nov 2026 16:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uF7E91vgGZ_h; Fri,  6 Nov 2026 16:08:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4BC17813C5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981310;
	b=I2krzu7Rhqc9kVpoGcLKWnjdIswPuD3+n2pkQnet+g/+Vyi3UUfCCEbNu9tSakC7HqrE
	 JfoeueGtZTR6i+zIInfLS7bOX6O5GrtJMVtCxXqKBDv81JuNIquA33sLoh7p22RgH3wv3
	 ClcdXpvnbszFFAXVairiTtoTkDFVkN4miKOKtR426qqxJb5E0uEwEkj+HZ5n7enP6mDXT
	 wTRju2/39Gu0hgwtHyxBp7iDY3IDNxBmxQQql7DsN8MH8d0+S6h3xqGdBtwDBlmWmuU21
	 hYS6BBTGNeSsNQRqBaAJyTXjBdd0FJX1hVZaVgwaIImpSCFrhzmfG1YFJwHSN8EgEeQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981310;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=dl4+n9FcriWDcu0ldfVaXCBsxtbmnE2b/MD0jVdFjt8=;
	b=EQIpC2Fa+ZEo6ikF9g28oFi6olMN4Dr8Q+1yZAB9B0s14ameFAhvOml6HHnK8+3HqfCD
	 TWEUfo04NZRQT11mh06Fn6yBJWBvxil+sAFZ+K18xab7xSDfyB1By0GIb1LrTpMuNtt49
	 gTfmC259yVP0z3JtU4tnekuUvpSJAFdqvM/aKpX8HLsJC6kIHLHCp5JmxkDw5LHWUtTun
	 nWIexITWDc6bGj+gdIXty+WavTCaxqwNHdApbDhuG3Ueg30bygNjehBGuLSY2E/XjgYcU
	 RfbFf9xdZJq5492LI051sbPEcPLFvh12uleXF77BmBbEoDVCMxc/CWJhfMPuRSwr6jA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981310;
	bh=dl4+n9FcriWDcu0ldfVaXCBsxtbmnE2b/MD0jVdFjt8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PiEScbVuCrQF9vmwlTwRy5ZESq3p8a65MNxWlAFBkCo/NvweWsaHpMbNfXqEuIEci
	 Jv4DF0bFAOanrClzG8Ebk+BxgJ9dh9a233KmZuLDFnaNx+AtNFQhzd06CkGx04GKwM
	 ueKQd7jaeht9m2aLtdNE2PGW0paXvMje0xVwLeVlGdAmoTFbAB8g21C9Y3YTYwUhkR
	 3KUOuMjyyexdEhLf6epSuEf7ch8kzLNCV9wNhUKLet5XMBokr9A75fGubAR1LKCGA3
	 n7mZj5gM2xv61xl8PnDPcONQnTG4hXeW1K5eCpXlQjrMbVdixqD6l6IrDuH1JYiupP
	 BfI+b3gkBEj8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BC17813C5;
	Fri,  6 Nov 2026 16:08:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 96E932E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EF314090B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72jDgA8dZUlC for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E057240911
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E057240911
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16E879E0B0; Fri,  6 Nov 2026 16:06:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:57 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: bb5f6c575083b7828983e92bacd5f68295ef6f6c
X-Git-Newrev: 93f36d8d94136a24faebc0cb98c1d0d030817a12
X-Patchwork-Hint: ignore
Message-Id: <20261106160645.16E879E0B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/rtl8812au-aircrack-ng: fix build failure using gcc >= 14
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
Content-Type: multipart/mixed; boundary="===============8777886863966172479=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8777886863966172479==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/93f36d8d94136a24faebc0cb98c1d0d030817a12
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Starting with gcc 14, several C diagnostics which were previously warnings are
errors by default. In particular, -Wincompatible-pointer-types was
changed to a permanent error by GCC commit:
r14-6037-g9715c545d33b3a32ddc1ae817ba9356ade1fb9df
("c: Turn -Wincompatible-pointer-types into a permerror").
So let's workaround this by passing -Wno-error to USER_EXTRA_CFLAGS.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 750d353e3bb295b051ad50dfbd62a7cdff4a6857)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index 7981a382b1..f8c62608ef 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -13,9 +13,7 @@ RTL8812AU_AIRCRACK_NG_EXTRA_CFLAGS = \
 	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
 	-DCONFIG_IOCTL_CFG80211 \
 	-DRTW_USE_CFG80211_STA_EVENT \
-	-Wno-error=address \
-	-Wno-error=array-bounds \
-	-Wno-error=cast-function-type
+	-Wno-error
 
 RTL8812AU_AIRCRACK_NG_MODULE_MAKE_OPTS = \
 	CONFIG_PLATFORM_I386_PC=n \

--===============8777886863966172479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8777886863966172479==--
