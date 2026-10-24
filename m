Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B072606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 13:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VC5N8Ec+
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49DBC81154;
	Sat, 24 Oct 2026 13:41:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXitFCx-ilfB; Sat, 24 Oct 2026 13:41:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 539998116A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792849304;
	b=BucZiQGahrrIkrHECs8OID6Sh0gLKwAx/JwotlaI+vyCwwLKDEaIpYmNBwUoNjOKUrJa
	 V1J+nHT3Gwu0KQye6h9rVGN+2cKGOQK4mJnJs+sTtA4NaYoR3mn8aShYJP+ySoMMvumea
	 lVuGwuUbH9hIss7JwWXKGIaeKOhN9BMhPgreduNk3l1yZNHmYfN4IT2+IS+i+3R6lOPYY
	 vrBlpyc3bP1wb4PN/lv2KPMiFe74MPAwlftm2sFg5sU9Fd1t7Jq1V5vkQFm9kGbuH0GIQ
	 sEhPbhHMO+sqWirKgzWqvhtaKprq2ADf/d2Mu+8vpTL5ozIhuj/VonJwf86Mrw+EMkw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792849304;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2kdt4C1zz/Ijyx+RxCDStqbWkxtrjtqbPNsObdxJuM0=;
	b=H75O0JME2qCoZCkBksGD5GTpz0np0hrz/0hIbs54Yr3gmJD9EsBQj2uLzX968D99tEWW
	 mk1ISIFl8UE45GF5MY9rLvL55GbnWdIACzE8yKPr7EcYPKG49CvdH3fGBSRe8e5vcjUJc
	 4+ra13YnCYtJYeRMKPi5WYlvmiN2cfg21Yb9Uqlrvm0mPRIPUEkUQs2sOnU3Gap4L65hb
	 1GmUeDkByzL6+1bU5T81LeqEDhDRSPastq8hYOmgZYe7644Jpkxnmwiw8nLyG0ZjALWDO
	 YZG8O3+Zr30JXFg/WKyAk5EMBm+/tCx6uPsjon2P8pCMFV2S/K9OBXtiWbN0FOQWOGw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792849304;
	bh=2kdt4C1zz/Ijyx+RxCDStqbWkxtrjtqbPNsObdxJuM0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VC5N8Ec+oHtU/UFsoudELqDuLV2S9DZYc86FxDCfoc2V53jiAJ48a67C1UsLhazZQ
	 KF/8iV0CXUHfG+NbgwKuddY58h5QJ+mUdzA14vos6oiGts03IC0uKURwagI19fZ2I1
	 E9/a8YYpT+/KUYWRR48givhmZb4sGliCMFEdc9DYhMeA2zJl6O0AEz0Iv7iq6z+eEd
	 dWMppstqRP2ZghiTVm1rn/abw2dvJEQYc8HvPWyIGcRa/Gz8Q8VGr/Q8KweaERbCjV
	 KnKJlKc6X0jDXys6tQx5EOY++IExJRadlKoSRuTsPerDtucCUNbQWkxGpIG4A1Km18
	 j2/+DxEqLy++w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 539998116A;
	Sat, 24 Oct 2026 13:41:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DA3164D1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C02A54067C
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:41:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LF9gzjd8_5dO for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 13:41:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C445B40412
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792849301;
 b=D/TW15FLcAbmz+HsquHDJvolpYeK0xWLKA2GBh4SFSYlekcAhl4nT3HE7HxqjGyZya58
 C9296VmBePb6shL45BQFnWdB9aN5uty4RKbMD2h1j/uaVqM5xtaov1BbTNzKggBbjiRab
 4KqzncdBh6X5RQGGnkRnhh75VTwsv7y6a2Kwt3+XQkAGV2pH0G763XlEAAObciwN/0WEH
 psKBRGPKM20zGLo1hs2AKSNFVidcJGh2k5LBleBFFft68yCQxJ24TPqOC3avhEQwXBWaC
 ICWugfDNtk2mrjdg6t2za5SGEUkOjCZsF/ZdokSECj6RevAunwggsTZxoESVQLn3pqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792849301;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ULSfi9XwNt6jHDqIxXpiuHKisyK3h1jZaNDOmbR/C/E=;
 b=IHLcB0QOQ7XKuV5TLx5w8J6E66g6IMKpwmXPOzRjpdWh//SySnhsXwXJpEcLdik4gKsH
 dCEaMG5wd7ABjRM2so4gGC6MuQ1VxwTjS10tE5QpS22m30ujR+ipHXJDwDKds/4uIwGwJ
 IsSV7uPxqljibIWRCnVKlAj61gvx4hxnwXsCNywwfzKqeMHlGZAko6ia6MJyR2MpUquxG
 dQlGDuddfYrSXpR8y9KRCbrMUQAjxVLER0Y8Cy9LOkw781nRlZs7qL+xmxPASS+rEDseD
 hzUsX1aEKcRyhBTV1pYjZ7sRCX+ikX5tvMETExISDuKPpVC0GKQMyJDmvwCJ4TWDOXQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C445B40412
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:41:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE9739C7C3; Sat, 24 Oct 2026 13:40:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 15:40:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6251fe645541609bbbeb84f07a3b53f367186c22
X-Git-Newrev: f904d35dce2f40226a115cb0e440bc486a7ae48f
X-Patchwork-Hint: ignore
Message-Id: <20261024134016.BE9739C7C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-brotli: security bump to
 version 1.2.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f904d35dce2f40226a115cb0e440bc486a7ae48f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log, see:
https://github.com/google/brotli/releases/tag/v1.2.1

This release includes the upstream commit:
https://github.com/google/brotli/commit/b418fa81c48262a86a95332b0bc6d62c30aa78b6
which fixes CVE-2026-111497.

Fixes:
https://nvd.nist.gov/vuln/detail/cve-2026-111497

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: mark commit as "security" and add info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-brotli/python-brotli.hash | 4 ++--
 package/python-brotli/python-brotli.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-brotli/python-brotli.hash b/package/python-brotli/python-brotli.hash
index ed8eea72eb..da2d58aa44 100644
--- a/package/python-brotli/python-brotli.hash
+++ b/package/python-brotli/python-brotli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/brotli/json
-md5  af164f216cba527bf6f24d09c9d3576b  brotli-1.2.0.tar.gz
-sha256  e310f77e41941c13340a95976fe66a8a95b01e783d430eeaf7a2f87e0a57dd0a  brotli-1.2.0.tar.gz
+md5  ac1e85a7466ee46d0ca594e041d7ca78  brotli-1.2.1.tar.gz
+sha256  02b2f7b5a83485efe448a44ddf7983def05c3bb1dcf917d4f7154070260e13de  brotli-1.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3d180008e36922a4e8daec11c34c7af264fed5962d07924aea928c38e8663c94  LICENSE
diff --git a/package/python-brotli/python-brotli.mk b/package/python-brotli/python-brotli.mk
index e2343a24b2..6f5e966a05 100644
--- a/package/python-brotli/python-brotli.mk
+++ b/package/python-brotli/python-brotli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BROTLI_VERSION = 1.2.0
+PYTHON_BROTLI_VERSION = 1.2.1
 PYTHON_BROTLI_SOURCE = brotli-$(PYTHON_BROTLI_VERSION).tar.gz
-PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/f7/16/c92ca344d646e71a43b8bb353f0a6490d7f6e06210f8554c8f874e454285
+PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/cf/81/1546c983678a9b4e77cb4718eaedd1b2caf24a6cdbf1eb8775938d22aff7
 PYTHON_BROTLI_SETUP_TYPE = setuptools
 PYTHON_BROTLI_LICENSE = MIT
 PYTHON_BROTLI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
