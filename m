Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B9D606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nasoJFSu
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5ED160D93;
	Fri, 30 Oct 2026 14:20:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZZ0225cRD2kN; Fri, 30 Oct 2026 14:20:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F1A3360D7F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370015;
	b=b6S6P9MnktFTxKXcIF7xS9b8uLvyBeGdWkGWGwNkM2j2bk/a5MNSKaU5wmrf+vYhGMq8
	 oEGwm4/XBXo8FSJULNIG0Sa2cvmwDXMEZWMUVAZ8OTGu2TzyBgwxOHceEQVavDYmkcVFt
	 jnUIuJWIn0x4SBD/UBLxwieoLH4j0ayWKzaYMasmEcrjlBTIGPiYyPRMjWcPfFdgts+m7
	 kPfeDDWgs3wxJHRqO2EoBsEX1Sm8yZTlSBJuZjtpK5EBkpHBI970RuTbu6ElPg+2Bep2B
	 creDtLf2Ng1gsJ/ij2Gnk2oExK1tYG6V3K+D+HmjZPPqydc03qAacLu5r6Jlo1KT87g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370015;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=oznjfQPvLK888kQ/vj069QxeDjHgcfxOBjmM2F95xd8=;
	b=CgspIZjPjW/pW5I06occyC91eQBZedsJSlwHhBduWpvktpCvoKTi4QbMFtNRxMHrGjIj
	 wY/E6/kG+iQ265Ak1sCIwY/Dzuyu9bjG+N2nfhefy+NylNErnm8QJEl/dJifeD3muZYVA
	 HFX+aegZaJ3T8dHYzZHMPHJ99ri074wUWKZY2yIqzHjVydocoIrsHxJTPeMUJUcIOxSnC
	 TzGCdUFc4Mo7FiA1EP2bsTjTeWNzCrpiFv4R0mAf14UasIj88I+k6h2HBDi5bN3Sa63FE
	 so2ml8wlfNwouNgNaf6iczm5ZRqNvq39J0OQunfmenFz/w6UQgnhpwD5o1dSAY0zoOA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370015;
	bh=oznjfQPvLK888kQ/vj069QxeDjHgcfxOBjmM2F95xd8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nasoJFSu/JUUWcXkofsv1JutqEzFowHZU9qVO7xvTyQYrKkYNJhkcYkHggwyisM7Z
	 63wg43vvJBHFm9yBbB6PO57yE4c10Dc/AqunooabUbCqI9+FAZRssOosObaUMR5QUK
	 VlCx7U+2FpuztsNATQq5icVwdhgQf1fM/+2J2uIjwZZlNNW4ALU/s++oQ6ZjYzUZJy
	 KVVDjeC6vwyo3SEz5Kbcvc82twhVxM3q2f64DGZklPU1ew23+/vE9UuGZj9uPqNx7H
	 VD9f3fAEN8U3RVqUqzDvf/x0t9GPOzLbVZtKuV06t3fi99UDez5fdv+T8EtfIocnF2
	 S/SfZINjUxdDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1A3360D7F;
	Fri, 30 Oct 2026 14:20:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40D0D362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2761B4053E
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GB0G09bL4Z-S for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7C46740530
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369895;
 b=MhOpQTMAFGeKxPiVzHykZnV7U0nGFpclseYneGxFPFHY6gWQHxKQMnpVAN2Nq23BGUO5
 UtxKV356Fby+TvWQnowzBHLvwZu3Sw/Z1i+inALHuYDzYmx9lFSzVD20h5g8Benrdb5z/
 LcFIqz2tvw7eyyAof9IBTpxY+H8SPbGwhXHQCQ+z7nRkGSy7FFUPHv2uyrwzwRBwaLyXp
 Aqyo/mW00G+whm0a4V3r9EYIdBu24sPLK5z3Ns2IaP4eb6gKhIU//YMWUzkfY+HlUzFn4
 qaPp7l0xzC/hMW3tozTRAWoGuo4Ppg5j3MP+J4pbQVe0rCcWGPK4yvBtdlbGHZo8tqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369895;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=YSg+I71GxfIBMVyCyT/+YZEaVEiwUyJ/lked4Q9CIxg=;
 b=sfvBd8LBfriYvSBZLPP0l3bTDv7zwrENft/oI6nQay0S9X19aASfMWECy9Q1QWDpQLXJ
 PnvQdiG539Nh3Z8F3RD4n9bo6fPsyrowbg+pHQagHAvbaXCAwZrJ6judwO3k9LEGdp/kx
 mkrgBZBwQd2WPGpPXS1WkVpPu/iTItoV/+c2/oA148TJnbf4TWM7lja1X5C1e8fSQqWuy
 J6mGN9Bzvo9rPNMjYS35loSvkWXTO1XNVBybaxdEu12kXuLP01eNYPIGlSFEsAj8FI57/
 +OVX1ksq8wQxt1DehSR5+2D9s3eseA7rdMlLrPm3glGOchzLmWoJ4N7FH0vDWfXK+9Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C46740530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A1169D389; Fri, 30 Oct 2026 14:16:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:11 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: cdd9a34415c1138cbf548a3ed7969c39f9209af7
X-Git-Newrev: 2d6fbe9245542ee5a7fc8a154515fbae1fcfcc2a
X-Patchwork-Hint: ignore
Message-Id: <20261030141647.9A1169D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/jimtcl: install
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
Content-Type: multipart/mixed; boundary="===============4307716678193848855=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4307716678193848855==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2d6fbe9245542ee5a7fc8a154515fbae1fcfcc2a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
index f2d59265ad..5e09e776ad 100644
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

--===============4307716678193848855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4307716678193848855==--
