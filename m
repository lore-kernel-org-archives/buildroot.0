Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92234606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LeAXK0Hl
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 659F740655;
	Thu, 22 Oct 2026 15:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ouaqmg-7OKu; Thu, 22 Oct 2026 15:34:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7F22540721
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792683257;
	b=hh6uP3eo38bwXXg19g35fbEXhVapNnS2T7xR3O4Bkn8JedRnv1qowGc8RNzBgWZ5Rszm
	 93oYtanDMBzeb85vvlyNylCn+Ke7OGvWwrPYbMkeYo+zIQt+uKqTLbfuL7yChqq2+Fmo5
	 IJNrbGCco69XqQqvuiiU1AqfFmJSyc5LYBi016SpgLJMFkIp8HcrthUtxlk530nySdUjQ
	 LGNROjMA84QHyuZ5aTQpjO2scrVpkG5eOYS9nwx7MTS4Z1Nym/h74ehBpSddlx7SxltI/
	 RuRRJ/PGQfqNsxRvqTXWIPI+f9mgpq0t6DUJunellwDwcX0c1l2088Bu9HUelH9Ldcw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792683257;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ApYJ3jkt645jM2tak08W6GkwFGdl/1kUnlaxX6LSzW4=;
	b=iSuJA4YCJ1p3DwuBGpcINOChvu7pQHQe7QybpnsppQhcgOUCYfLBvHYq3mtUYBQew+md
	 YMCaavXBFPwWfEKDqXSFkhzZwL3qlV7aYtiirC01U+ktJ66utocoG8OS9+A9TzI0ZK4DR
	 fsvhWSamEmrWgzy4eofITiHKB3EA916SWvVPIfFvL1g5fnDgU7garMBm95ms57tdTp/HX
	 fClSYnyXRyTHagIYrcYamQ2IcDgjxidML/z4cnGjjz4NMFblqRZ4MpBBVZ5zmvKal59Ic
	 NfkVQjvE+S5RtX9tW7K3vlBmdApsvb7Wulye+4LjTL4GRjYt97/6tiaMA+Uhgi9z3qg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792683257;
	bh=ApYJ3jkt645jM2tak08W6GkwFGdl/1kUnlaxX6LSzW4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LeAXK0HlU3S6ghWh9MivFI6P9gW2eF7qjGjxQyIz25zfMYbHsfnrWc7eucI87zPMa
	 CgL/Issu5CCZkQpfojklW+PVf50HFW9jWoMWPPxiZM9vDJZDYCOuPWJSc+s+g62dYR
	 m+egqWDDMIkbjy/cTe/Yv6bTW5hKpEhnO+22M0UVoJ2xcGf2yBcM6UYLtsz0hOvoP0
	 6aFkeXOp7LwlDjAAe11V9V8EQTV+mFZ2yPhqnZIs57/bNysCo4nU4n3qBfhqTyrb3E
	 8iE7RrNIdHYsTjVe7PJEi7z+uHnIel2TTOWe8suoUxq8ODaMDn5aXLesFI2/xljer2
	 4K/acNF1HQkaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F22540721;
	Thu, 22 Oct 2026 15:34:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E9B93A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0521960645
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z0ipqv9KQEV1 for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:34:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4E2986062D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792683255;
 b=O+CfvMXTPHdJv/Rg0NqN1X5fEudarwYusMHtuToY2lEUIe4foHtpSM4tisU7zml2oCAz
 wv+fcvOam6Xc51qnbuUr87udOR9L69p0A6r0+5ygySJ40miGaKoysZxAOsNXGbgCHxjvN
 +z/RippCfO6nu/v4QvrItfItXjuJ3uHnkpaSY8KEYNFxJ1KD4ylWf6jzZTvDGNxb+uetN
 tNx5yS5/apsadbvi7ljc8HjGGPzmno2V3OEjwF/8Vul3exFfLkg0ByBRJZJz+P8rfo2SM
 C8sr0xdDLDReDldYTvHAvjOdmhUhciNp7BNVlaXtcOAIwklZK2dBUdp0uYeUZAEpbOg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792683255;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QNSEGsIWoxyioQe/0pBOA6SesviTF5NpqNhJdel/4r0=;
 b=m6PZ2WsF7/rKgYtirtd131hP4oMvHrGHkXXFtxEQo6VESlIQWGJwrfA6XNRycProEm/Z
 lgsjN5Y01WZ3WgPNYRq6u7cMstO33tjwaN9rYWYX98Vocmt31WhmXsbwc2mpQ1QvYzPTL
 VLyOrpqWmn739TnYunR5t6wNUWXPuPt4qBHSbRnzwaWyxBuV039O8h5GVI7bJkyILk1PO
 N6wa9iC/RdjBtNgHSaSiJMdz05g5FzP/gbj3kY5qPxmi3f8OSPDFqInKNXURvWK1rzubP
 C8Rv0EI7Ve91ExCyK5rdNkTvq2DpO1ZWcuxlXXhKcxEoA2uvJzVlPatLN15/ndMc5yg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E2986062D
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:34:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41B7A9B9F1; Thu, 22 Oct 2026 15:32:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 17:33:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a40bfdd8d6e6dc102e4b3f0038e1338b8063058
X-Git-Newrev: 333517125c1ae1798a39415292f1d242bf3f598c
X-Patchwork-Hint: ignore
Message-Id: <20261022153251.41B7A9B9F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gauche: disable TLS support in
 host-gauche
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/333517125c1ae1798a39415292f1d242bf3f598c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

host-gauche fails to build on build machines that have mbedtls 4.x
installed, e.g. Arch Linux:

  checking for mbedtls/version.h... yes
  ...
             tls/ssl: mbedtls
  ...
  ./tls-mbed.c:41:10: fatal error: mbedtls/ctr_drbg.h: No such file or directory
     41 | #include <mbedtls/ctr_drbg.h>
        |          ^~~~~~~~~~~~~~~~~~~~

Since version 0.9.6, Gauche's configure enables mbedtls support by
default whenever it finds mbedtls on the system. For host-gauche, this
means the mbedtls of the build machine is used, and mbedtls 4.x no
longer provides mbedtls/ctr_drbg.h, which Gauche 0.9.12 needs.

host-gauche only provides the gosh interpreter used to build the target
gauche, so it doesn't need TLS support at all. Pass --with-tls=no to
not depend on whatever mbedtls the build machine has.

This issue has been present since commit 73e836e13982 ("package/gauche:
bump to version 0.9.8"), which bumped Gauche from 0.9.5 (no mbedtls
support) and thereby made host-gauche auto-detect the build machine's
mbedtls. It therefore affects 2019.11 and later, including all
maintained branches.

Fixes:
https://autobuild.buildroot.org/results/14af1c847c09fd8df35c8923194c75931d8a568d

Fixes: 73e836e1398293abc1ec2b4297e1e680d2b29e32 ("package/gauche: bump to version 0.9.8")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gauche/gauche.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
index b635c488fe..c63a663ddd 100644
--- a/package/gauche/gauche.mk
+++ b/package/gauche/gauche.mk
@@ -11,7 +11,10 @@ GAUCHE_LICENSE = BSD-3-Clause, Boehm-gc, SRFI (srfi-11.scm), reload (reload.scm)
 GAUCHE_LICENSE_FILES = COPYING
 GAUCHE_DEPENDENCIES = host-gauche
 
-HOST_GAUCHE_CONF_OPTS = --without-zlib
+# host-gauche is only used to build the target gauche, so it doesn't
+# need TLS support. Disable it so that configure doesn't pick up an
+# incompatible mbedtls from the build machine.
+HOST_GAUCHE_CONF_OPTS = --without-zlib --with-tls=no
 GAUCHE_CONF_OPTS = --with-libatomic-ops=none
 
 # Enable embedded axTLS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
