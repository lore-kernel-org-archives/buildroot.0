Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAAAEF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AE5942150;
	Fri, 13 Feb 2026 19:39:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0SrOMCiw-sWV; Fri, 13 Feb 2026 19:39:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E2914215B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011544;
	bh=zbmX9/DBvNJ7CcSh3+0s4Ls5bTuqNZ1q+DoyM0wJ/iY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZcgoBeQCfCGWucUxHoy69t5dhtPQsfGPfRIGxG4N28UA4dJpyX4jcl+PD+tBpSCug
	 1F6iomziXHGD6lb8voQv3e5f+Vos2CWmWPanyC2kWTtNeIC7bwB8W8YIlHJ0BfVJzt
	 6/pJikvMx6PJD4j6+W+0inIguw0xcGAf763vE3JGWu1KYF6YW1Edj6FRuPcYV27bdD
	 Tqv1FCZKD4ZfHt6Jh/5+XfS92EIr4mt5UrW8wwC21u77FNaDBhM6gVoIPjWuTFFzj5
	 5VL9oYn3RsTZ88xgsHGNXRYIiMtrCjlxdnDu9C3UDzY673/bmUACnHlFMRqIyqsCgj
	 q/5QuWLo3AeTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E2914215B;
	Fri, 13 Feb 2026 19:39:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 66ED369
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5F4541324
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YhP1-x1Do6ZW for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB2434131F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB2434131F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0564825CC; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 15:01:02 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 03f10d4ec277ef123f3a5510a6dd6193fc7ebc07
X-Git-Newrev: 02eb83314545e06728d5413cc4687b7c3b2c55bf
X-Patchwork-Hint: ignore
Message-Id: <20260213193703.B0564825CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libucl: add CPE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/02eb83314545e06728d5413cc4687b7c3b2c55bf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The CPE `vstakhov:libucl` is a valid CPE for the package libucl.

See the latest CVE: CVE-2025-6499 [1] that reference the upstream
repository.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-6499

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ef5293307478bd9487c890facbb8de85240d4156)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libucl/libucl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libucl/libucl.mk b/package/libucl/libucl.mk
index bf5e368f2b..7b0e5b8e8c 100644
--- a/package/libucl/libucl.mk
+++ b/package/libucl/libucl.mk
@@ -12,6 +12,8 @@ LIBUCL_LICENSE = BSD-2-Clause
 LIBUCL_LICENSE_FILES = COPYING
 LIBUCL_DEPENDENCIES = host-pkgconf
 
+LIBUCL_CPE_ID_VENDOR = vstakhov
+
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 LIBUCL_DEPENDENCIES += libcurl
 LIBUCL_CONF_OPTS += --enable-urls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
