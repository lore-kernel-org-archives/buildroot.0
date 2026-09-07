Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CCEC79F99
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 11:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06D2880CD3;
	Mon,  7 Sep 2026 11:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id arlqYqggFswl; Mon,  7 Sep 2026 11:05:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3DEF880CCB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788779139;
	b=SYO+iBJUHQJ+Rvv6FTMlqKdBOSLONC5Xj9Ro9RiSOb1wyIV9pm4CrKGFdK/QLUXouELE
	 lkEajWmrHO/pDSJ8q8VqUFq1HR+XeOLepiaDFplNi6LwuOftdCC0vohMY2iwiT5+jnMJm
	 pmvXMfxyekFOF22SpqMYHUiKAsvS1oQ+uyCKdchXB9kbBv3vAsaMo9y1usUIupGx/Sk3T
	 gH8y/2R21/Y1Cz+pzwyerDRPZEVI74niB5c8M1Nqg6F/r1fSVFbQCxtLWFDeCyhsKIPSf
	 mivr0ngCrmpFXMuIIyF4FohTzWC8pkLn1VrPiBOZn7tcBNYq9gM7b4ab6Ew7yB9c8VQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788779139;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=50GyfuXStJL8fkDEwMiWN3p73yd7mQz+R4bvZj5kW/Q=;
	b=p3n7Qnm2FBrmVAvpKVQ/z8LKxfGdWY+H3krP2Z6kyAuOd7Q0TMNw3LNHLguP4qeBsV0Y
	 uLYhVSSCow4gHksbss/mQZ3kPuSVt8AUpTqFvmbMPjT5A20X9d4kk20CUrOB3Cps/pQS2
	 eg1NXqs6XXc9sgOFyBTrp74Bi+EvEMrnU344MpKgltgWgYHyh4DcU3Y/tT2nCxXtqZM4E
	 XyOR0k3XnGm+o3PGqsib1Kq2RRKTKi2woC9d9GtHcZMngK9WD1/73l8cf3p/6Bd6xs3DB
	 Gm9qD/8+Gw+dQjCvETJ1pmSk2xdrsXMot3hlhgPFpIFKSsI0J3aeoMHbwIwHfvlnAjw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788779139;
	bh=50GyfuXStJL8fkDEwMiWN3p73yd7mQz+R4bvZj5kW/Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Dt0rNRTQ8eLojaNzXmstWalIAoX94q0COQlwwDdDNgcKYLjHy+PiUBooi6Kg+XxJE
	 +UkyaZE9WviixrDTo7wwanD/Jf+RafhBcFWZ6tnJqlsF5VMiE0Xd/oYg2505LReVQm
	 V9ssAA6X1gjQR0CH4VzGT1AYdH9Ezq9TreRQHrBFxmf5l6ZN9zQPLYpBZtY3AEGJ/b
	 93yKw8gbd2xnI/3rqaFxa961SRBi/dpCWOnQ3oSYgb7Uje2RHBZ6dJDhETjpTUbq6y
	 +fqOwhmak0Il2v8xYS3fYYbEelaszfe1KvWhHfIShp5tFFNGfubUTEp02Z5+UVKgbq
	 +lr8VhXBAt4Ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DEF880CCB;
	Mon,  7 Sep 2026 11:05:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C6BA4A48
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 11:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8DAD605D2
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 11:05:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5XMIKEMaONaJ for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 11:05:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B0DC260631
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788779136;
 b=GO1gv4apK07dbJDokjc8A6mtu2lwyfgl/KNqS8ibvlzSdiTLbmZxPei3OXCfH4upmIR4
 FaFnegVT/YXgISz30KFyQgZ0e+UJ8JsopywtQE01ZnOBY1OfUlAUT5O2zjNWrzgezFPH9
 CbudUGZwBIRdNW1Zoan45rRAWRcvPZN9UmB1GTpNIWITtPCSKjWhLLA45basMylpTSA9v
 +3AO2iu0udoogyt664ybVxP6aqGEo5YqDKUptRS5mu5pV/GEvvLnOy0mJHpI5CY3J7+V2
 ak/DZpScuAzV2O8xQvP6M6wtcXhBhR5mFvV+0F0KusCHnOB4p3Vc1Pj9Wi4il0EnG8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788779136;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=QagaGKxnaheOuKKIgNJqXaV3KN4LjgRYhT2a+ZSqEPU=;
 b=qAaohNa3F92CwwiFqUCCFR802NPWmZkt0G0+bcfo/590onKPeUcUkcf/+IE+f40oewl7
 OFn1Xp4ZcEJGHxB6z/QWJm9rtwdoqhnIpZlmb8KIiIm1+X2YWX3tk+MgGPmk9Ipr3HIGu
 ARCodRQsMipxn1u9Hkjd/+np76etU+/XpLR6GqEwx9cV4q8dIQyK84VRFrEu5E3KLdRfv
 b4m8UM9Fq8C4w5RbeiwrzTAhDQ8/sblojMxhzjPoDTA9ySOC4zDN/1x1rx76gcTAIS2Un
 g5F0QplV6H9QV2fBNnAQydBFvlQ/vKGKxg2v3a08ztzJU65NDb7ZlsOKA2MMblJ07Qw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rGSwnBYZ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rGSwnBYZ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0DC260631
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 11:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788779132;
 bh=QagaGKxnaheOuKKIgNJqXaV3KN4LjgRYhT2a+ZSqEPU=;
 h=From:To:Subject:Date:From;
 b=rGSwnBYZfGYj2qgwPjZ7DBtIl8ut7UGJSODDL+L7pmyb0G3a+H8C4lCNSLQfI6Eub
 y6MHO1wYHMUOHaLV8ZFRAwATCUKS65t/G+o174Ol4801i37FQatjkIfmdgF1R+fdtX
 qioX0hZDP4/i56J8pH3lcvicd+JwW+4J9PTYoCJ2Ypfv7kcBjofTvAqKqLJX9G8Bme
 EW0KFwAv6TnJpomF2djxIYjI9Dm3ylVthoIbp7+NMVqlweW4GlmaUhKg5jL0f2uKMS
 5eSKCO+ygw31jpSsLyB8Mpts7KQnqbUpqbZlME/48kOagDlqTN0WTAoFOAWrx5pDly
 +mMnjEHAQBp6Q==
Received: from fli4l.lan.fli4l (p54a1bccf.dip0.t-ipconnect.de [84.161.188.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DF720A4C2E1F
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 13:05:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48940)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3XAK-000000000YZ-3Rwg
 for buildroot@buildroot.org; Mon, 07 Sep 2026 11:05:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  7 Sep 2026 13:05:32 +0200
Message-ID: <20260907110532.1071687-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/taglib: bump version to 2.3.2
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

https://github.com/taglib/taglib/blob/v2.3.2/CHANGELOG.md
https://mail.kde.org/pipermail/taglib-devel/2026-September/003127.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/be2ea4ca953c43a38e37b61387ec8b1988d1b710

 package/taglib/taglib.hash | 4 ++--
 package/taglib/taglib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/taglib/taglib.hash b/package/taglib/taglib.hash
index 6c47694c28..6b563513fc 100644
--- a/package/taglib/taglib.hash
+++ b/package/taglib/taglib.hash
@@ -1,5 +1,5 @@
-# From https://github.com/taglib/taglib/releases/tag/v2.3.1
-sha256  a19d90e6fd41d09a0281ec0fe762d51491d7a6ccffc923c4f7868c5e647ca230  taglib-2.3.1.tar.gz
+# From https://github.com/taglib/taglib/releases/tag/v2.3.2
+sha256  3ca2d8afaa7f1cf7f6ed10e511ebc368bfacd6dcaa3dbfa690b89e502e8963dc  taglib-2.3.2.tar.gz
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256  53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  COPYING.MPL
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index 0a8f371371..c4503f23de 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAGLIB_VERSION = 2.3.1
+TAGLIB_VERSION = 2.3.2
 TAGLIB_SITE = https://taglib.org/releases
 TAGLIB_INSTALL_STAGING = YES
 TAGLIB_DEPENDENCIES = utfcpp
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
