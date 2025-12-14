Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53229D5B16C
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14D7481236;
	Sun, 14 Dec 2025 17:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mcXogJzwkhKU; Sun, 14 Dec 2025 17:05:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25EA0811F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765731947;
	bh=Y3Sg0yAXF+JX5sRiJVKRGO+fLV2niJHVVTzaENYqNQo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HPSVtaTeyfMifNGzMHGuVUs6HBnwPfDHbc2Bh8KeTmTFuNXdAk/udsSIuOpBb2YcK
	 LzWE79pH2ufVqaZh7RzW9n3vdUWxNire+eegLDqg8dF/Ti2eM4om5RcXpIfyLdTYtq
	 Jm+tFJcTqEQQNhUJOsZortPF9HjNMH7su7lIMgXi3N8icM6cbZTY9AsBmgMM2bdS+b
	 GakPBrzJGupqjSgkaOCrFHTxfaWzWkHi1RMClQ3TUGHUeTDhww523HbKqd9aPiSGK3
	 p76NuxDZK0QOlZdT1SEg/pCI9I9RV5SGfWTrMA2cVkrBVKpHTB/RKZqsMcVR89U8ab
	 RBIhEt+Fsbpwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25EA0811F9;
	Sun, 14 Dec 2025 17:05:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 18F382D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F259D403B8
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:05:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9DmDe8uPTcRv for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:05:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 162A640207
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 162A640207
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:05:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08B7686E71; Sun, 14 Dec 2025 17:05:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 18:05:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e513d6a5fdf6b87eff10f759535ccc7abcef7a73
X-Git-Newrev: f11ac644ea21e5702ce8aa6e030c1a28e6670686
X-Patchwork-Hint: ignore
Message-Id: <20251214170544.08B7686E71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swtpm: needs gmp
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f11ac644ea21e5702ce8aa6e030c1a28e6670686
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 2b449935c2e8e19a03a8962f49493a76ccca11f9 bumped swtpm
from version 0.8.2 to 0.10.1.

Upstream added gmp as dependency in version 0.9.0:
https://github.com/stefanberger/swtpm/commit/605e0ce8800201fca2a9a37dea5e99be7bdb2233

This causes build errors which are fixed by adding host-gmp as
dependency.

Fixes:
https://autobuild.buildroot.net/results/d14/d14b2953e04b488b2f357386870d557d50190d34/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/swtpm/swtpm.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
index 25377f5771..de7f2fa05e 100644
--- a/package/swtpm/swtpm.mk
+++ b/package/swtpm/swtpm.mk
@@ -10,6 +10,7 @@ SWTPM_LICENSE = BSD-4-Clause
 SWTPM_LICENSE_FILES = LICENSE
 
 HOST_SWTPM_DEPENDENCIES = \
+	host-gmp \
 	host-json-glib \
 	host-libopenssl \
 	host-libtasn1 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
