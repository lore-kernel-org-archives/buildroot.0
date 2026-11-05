Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AD660A5BD2
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=a7pWjUkJ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6583D81586;
	Fri,  6 Nov 2026 16:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9d-opvJ8xePy; Fri,  6 Nov 2026 16:09:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 190738159B
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981338;
	b=mJL3BhvB/jkfR+7GYx81vOaK4SHsggTVadrK/l6HNO8qjCl1cti7A452Gqqm5RVSxfwZ
	 0nXaEovpSbiqFk/sD23eLe7HKF3zABDL8MfXf8gOvqjQcjIT71GEkqIctG/nQ5tMkXh6M
	 BXpUbrU+J32vE31gfUEOR0Bf0YfaXbKRliHRj+NKFR4jBtF9h7464cayZOGdyhVDpSfkj
	 /hUB+croa3rioZw7zZyIm/99XREtuM4P3GIk76cYDfTHwFEpWLvQn1MP1vjU21wliJ3U6
	 +e6OxcpX0UT14OSc7kbDJEWm4B7TOEj3WNgobovv8SfteM9mQJmzg+pyruClcQxCB/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981338;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=C5BhOiMWGUUS+gEbTTxQPcW2ngZM1gszDqfjy6a9bS8=;
	b=fG4F2Cb05V+WM2dfo20FAPIxyZgoQLy1A+NRItaR5AXHqUS4BmbMgf0ilEUnq+UQfYdC
	 ByOQOLq9rN2fm468TrUFS4mV6u+MKbD5ElLT7G4cVl6ic/1+2S5AU9DbEWJfu5ch9M0xQ
	 STmUzV6WNlwXC+o7HBeLMCqtXLwAev2wLbBinH3S/H2QF8n7BRv9mO6IJ8WZ0IOJFaYTf
	 /Iv1gVcpJYlLJ5y5wSOKZIDEbtysU2V4DDNAdE++zmJ1pbvE3peqe1tHTFNNHxwFO0TNe
	 DfgVGbLoBfJ0D4DXfqLitDGPgkK2FU27MG9QCD4nMoHMhUeIv5qPS/wemG8G1RXIDsQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981338;
	bh=C5BhOiMWGUUS+gEbTTxQPcW2ngZM1gszDqfjy6a9bS8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a7pWjUkJrgsVWCKoMuxS63VpQ6+gg+tSK/EvcL4gCePjcwsOi+c3HV6AyVZyl3wMP
	 49wYmEz+f4LxQRsv9u2vUCVzwnCjjIXXgh7z3BP4lU6mDBKTDvWGSyNo93ISddw5V/
	 j4dmCPztdLMO4iv1msStrhLolVLueiznHRHPuuM5RH2BCkP9G4wb3NpPGIIcIQS33i
	 uKhW9L0BrMX3g1EWcH6klpc47blP9gaqFI/wlBUmFEMWSMRY7CDxulc1RtM/qvfKOg
	 mhEqLufr0Hpb5cSIWAbWjtf+NGO6EhAdBU9p3HqJRB4YDn7H964yyv/QVDf1znh2M+
	 A+GhWv6xQF+WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 190738159B;
	Fri,  6 Nov 2026 16:08:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02CCC4B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCE8A400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g2Coks0d9HrZ for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 23DFA403D5
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23DFA403D5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59C419E09B; Fri,  6 Nov 2026 16:07:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:58 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 0338bf84c6ffa98b6df14137332ea2c3287afe98
X-Git-Newrev: fb63290ed615a4fa496d800e33b3a4105d4e283c
X-Patchwork-Hint: ignore
Message-Id: <20261106160702.59C419E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/python-oauthlib:
 security bump to version 4.0.1
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
Content-Type: multipart/mixed; boundary="===============1995100325872489635=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1995100325872489635==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fb63290ed615a4fa496d800e33b3a4105d4e283c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Fixes CVE-2026-49272: missing device code validation could allow a
client to obtain a bearer token with an invalid device code.

https://github.com/oauthlib/oauthlib/security/advisories/GHSA-3jp2-3mrg-2vxc

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9ddb57b60e500076b79b123dc12503a78c8288a3)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-oauthlib/python-oauthlib.hash | 4 ++--
 package/python-oauthlib/python-oauthlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-oauthlib/python-oauthlib.hash b/package/python-oauthlib/python-oauthlib.hash
index 5540760118..e001a8baa7 100644
--- a/package/python-oauthlib/python-oauthlib.hash
+++ b/package/python-oauthlib/python-oauthlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/oauthlib/json
-md5  f1eb96f8a4257d715ec8af21a217a0c8  oauthlib-4.0.0.tar.gz
-sha256  efb274799819440f95b4ab3b818869f1ce9ae26c5beacba0201d1a1b76b54f86  oauthlib-4.0.0.tar.gz
+md5  52700d6336f3766bd05d98b3696bec88  oauthlib-4.0.1.tar.gz
+sha256  3d73febdb6faa00f277c81fb04be7b7586fb96fc3b7f0b9c772dada69a25ede7  oauthlib-4.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0028aa4763a8a0b09ca4c68d585263474cf9aaa6ec69ffbef3a31a9eccdd3b91  LICENSE
diff --git a/package/python-oauthlib/python-oauthlib.mk b/package/python-oauthlib/python-oauthlib.mk
index d001fcd071..7a2e66c22e 100644
--- a/package/python-oauthlib/python-oauthlib.mk
+++ b/package/python-oauthlib/python-oauthlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OAUTHLIB_VERSION = 4.0.0
+PYTHON_OAUTHLIB_VERSION = 4.0.1
 PYTHON_OAUTHLIB_SOURCE = oauthlib-$(PYTHON_OAUTHLIB_VERSION).tar.gz
-PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/7a/d8/a1bcc8ba112a627f8ffbdc212a78ce18d3ac07e91a5ca65d27918eee25a1
+PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/33/17/2bb072de0b990303c985f26869fd47bb179024a051f47e7f9d208eb92f8e
 PYTHON_OAUTHLIB_SETUP_TYPE = setuptools
 PYTHON_OAUTHLIB_LICENSE = BSD-3-Clause
 PYTHON_OAUTHLIB_LICENSE_FILES = LICENSE

--===============1995100325872489635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1995100325872489635==--
