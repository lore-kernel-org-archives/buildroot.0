Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E97606A31F
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 08:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lQyjTp0A
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F1BE80DBB;
	Mon, 26 Oct 2026 08:10:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JFArJkClp5cH; Mon, 26 Oct 2026 08:10:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 06A4A80D84
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793002211;
	b=EWVyEHHFSrou44as44Ed4GpPZj2XnGfooYflHYa4CmakuHs665thwSwBqUtj1DW34gKQ
	 EyhUtwa8OQ1d06Mi0huIxlxbZAwr8AcA6CnxjOFSObnA4khcklMtyiUGXX5BvbooNYF6t
	 n8XexuoFduAc3j6IH58bKJzVn9saGp1v9uM/BIWh7K+dF5k/Bbv/pHY3G8I47+sN3zD8l
	 en+4sAlOragQy5nmqkzc7H61iL20d85yHlVi4xr4YSPrzsvFmerg73a0CiTsQuZlyXcom
	 i2umoSb6xJrUcvS00vnIMINA1xbtevZ7BLZCPg2ZXHl3Y323QAA5Dh+aAlwpsqH26pQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793002211;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QfgR3I+A/FeLfyjFxoiiyTYOGeYfiL4pN3sFj1+UIEU=;
	b=thlKexmCjmK9/1fPBPZuyoo3DMxry7oEb+npisheZ3OaV4qGs67zwaH9JdUAC2lU4/kH
	 pI8wx29Jo/mpgh20QmclGciO2Dehs77HdIvXRVi11eo/Ntl4uUuaIZEnI+jbW2zFYydji
	 iNRiEZhoY2cCCdcs3j2WGlaHEidH5oj1Fs67JCuWhX8fhilOC/ApcHb7vuqnXoWa8+fw9
	 O984WjhurDDWEEyk1LJzGvQeP2G8l+HFVmEQD/neI1ZYizv9Mdy2qiF1ceMy2TyS7tQN4
	 rxZ5smSOvS1kvkvbfPJIrNybRx7rqY/kylsYghDr95+7RVUBfHOq3R/iQ89dfyJPh2w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793002211;
	bh=QfgR3I+A/FeLfyjFxoiiyTYOGeYfiL4pN3sFj1+UIEU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lQyjTp0AOultxJrL25A9neubuJu9Sv1FekMqThOPHcdWrXp0odVPy/2tH2lZ+tq35
	 XCLa4mkwQsmaef2kxXSZdqvaTvi+581aCOES6zKtpduLA5W8VlbZMc6w5OH2CZYMm3
	 rVC3S+vp8lDbW1S/mAxMonqx8xmxWtn8Fn8Yu93u8hPejoLz7s6Zi4vOorHcsqIzQW
	 bCqlTnt3GtpPAkVx+yDhLHtkSznovpw8TtC/SyX+ypuJFcMEX9CC4xH6olLFmomt13
	 d/V9pYmDoqmaLX8f3qEwcfljXDFydGE91ndDGMSNUYi8olFUvzgY6h8MVyy6uJ+677
	 cS/OONxMLR0eQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06A4A80D84;
	Mon, 26 Oct 2026 08:10:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F6D9235
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 08:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06054605FA
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 08:10:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ree7i8r9Ecsp for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 08:10:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0394B605F9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793002206;
 b=dkM+f3jDtt4Eyt5dr8qfA/b7zOaW/10lb0NOuDqwXUG+M9t6XrtVj52r4fAe8hVv88CZ
 JykRmM4vcmS68VbtnQSncPPT3Yg9/WTmT8ozeUo+lqoz4/raqChXyzEsOAwe23n2ZLDnz
 fK/PUF0VOKncRp6POftqMJldNpakSNqb9IYjpndC/spFq//yJTBrpmpzyxLia8Vp808M7
 sFJD27zKvfmdpZW5FwpGsqH9zMBDG+0e4GqWcqIbLW9Sb3FGp/oq0KzQcfGCXl25WqF8Y
 0HYhrKAmuJpRqQCWNcQR/KWgNDdwSqaXHOKjJbhbmWTHwT3cvQQrQOezT6kPYkumxSQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793002206;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=X6NH/nWiSG29xWJOintxBT6E+XdRH9JjjIXoNNSXTEs=;
 b=djx7VSs5rVcFjqwdoisvtgcY8Dpfm9RdI9Jd4FpkJ6pvrSHtCmAiSpJ2AktG0xbQxoAU
 PdC9ZhFhT/RM8LYwJhaoYbOhTlgcOtn8/kLMJKV8jb9vwgwbjgmsTGuh0s3oi+hawNPgp
 mRPJ5A9gQymfSVWYD/4BKtsqhvQVgY/D72xHxTK1I7hvroXn9URpWs6rB6glJEilmWl9R
 X6tUYlllEv2UvfL52PEUzKYg5lkTW6xYBTz9aCtFh/slsySYUpwZqmjqmmsuwXGJ20EG2
 57m4ef9LOL8cSnq7nghD26vcRlCtdBNpFmKEAApeMi6zv26rrYjDA6TUENw72jqckkg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0394B605F9
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 08:10:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D01D9CF60; Mon, 26 Oct 2026 08:08:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 09:09:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3736eda341337a2ddd824111a5f065c84d44c584
X-Git-Newrev: 2cf3210eeda7f8f17b6d36904f6ba77db7890be2
X-Patchwork-Hint: ignore
Message-Id: <20261026080840.1D01D9CF60@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chawan: bump to 0.5.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2cf3210eeda7f8f17b6d36904f6ba77db7890be2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For a Changelog see:
https://chawan.net/news/chawan-0-5-1.html
https://chawan.net/news/chawan-0-5-0.html

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/chawan/chawan.hash | 2 +-
 package/chawan/chawan.mk   | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/chawan/chawan.hash b/package/chawan/chawan.hash
index 95f996d10a..020a42ed2d 100644
--- a/package/chawan/chawan.hash
+++ b/package/chawan/chawan.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e0a06e1504e10a51c6009751d79b798c98d8274e559fe195d4b4b7ddadf91bb8  v0.4.4.tar.gz
+sha256  67a54f10acd2dcda6c62bca825ccaf228f94d04ba9dc85c9369930c58d12ec21  v0.5.1.tar.gz
 sha256  7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
diff --git a/package/chawan/chawan.mk b/package/chawan/chawan.mk
index bef4816af8..609ad42b21 100644
--- a/package/chawan/chawan.mk
+++ b/package/chawan/chawan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHAWAN_VERSION = 0.4.4
+CHAWAN_VERSION = 0.5.1
 CHAWAN_SITE = https://git.sr.ht/~bptato/chawan/archive
 CHAWAN_SOURCE = v$(CHAWAN_VERSION).tar.gz
 CHAWAN_LICENSE = Unlicense
@@ -32,6 +32,9 @@ CHAWAN_MAKE_OPTS = \
 	--gcc.linkerexe:$(TARGET_CROSS)gcc" \
 	PREFIX="/usr"
 
+# fixes a runtime issue: init.jsb is missing otherwise
+CHAWAN_MAKE_OPTS += embed_startup=0
+
 define CHAWAN_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(CHAWAN_MAKE_OPTS) -C $(@D) all
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
