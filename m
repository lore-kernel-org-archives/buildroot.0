Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19379FA3753
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E672C80E63;
	Fri,  2 Jan 2026 17:08:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jlwQKKhIzOVn; Fri,  2 Jan 2026 17:08:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B8F8812C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767373681;
	bh=k64GVmK/7XqNcBpQqXBWPaah0LtKwZkxn20HOtR6lgU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ARDw0l7VrhvkFTIFRwEU5EVlQGGqZPEKr2rhAB3fF0CU7/7vUUfQY9Iu76JgMr97X
	 Krd/TnqmoFoZCXfs4T3ZP2QJ/JsgQ28EoLcp+dWaSqB1zmf8ymaZg9dhRr8yLkkpVI
	 qNBWVs8SO6XpbsAxf280zADb0C7Rkim4YF/B4otQ3iCgt0gyW0W5y70hi2EDFjmyH6
	 F3awd498aMGjD+uMu5yTMbz6HACymeHNp0l7B/Lz+E53tEfIYGAEhZlx1hRup6U9cf
	 aqfO7nIpYZ54D16KyXl6y9QGKqhZsQXsOJIupYJzH6gh/CqPy88qfE3ATMhCpvdm55
	 qLbUPoMF90RtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B8F8812C4;
	Fri,  2 Jan 2026 17:08:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F72B19D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80C6A4056C
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ldU5A86jrQG for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:07:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3C5B403D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3C5B403D9
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:07:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95BC887FA1; Fri,  2 Jan 2026 17:07:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 18:07:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad5b251fca5e5615f7d881f6e5342490d54db1ad
X-Git-Newrev: 20f31f90ad55b3e0654b6bc1b1ed76e7a1e6032e
X-Patchwork-Hint: ignore
Message-Id: <20260102170758.95BC887FA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fontconfig: disable doc and tests
 for host
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

commit: https://git.buildroot.net/buildroot/commit/?id=20f31f90ad55b3e0654b6bc1b1ed76e7a1e6032e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On Debian 13 doc generation fails. Disable it like for
the target.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fontconfig/fontconfig.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index d9f5dbefad..639f6ed51d 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -16,6 +16,10 @@ FONTCONFIG_LICENSE = fontconfig license
 FONTCONFIG_LICENSE_FILES = COPYING
 FONTCONFIG_CPE_ID_VALID = YES
 
+HOST_FONTCONFIG_CONF_OPTS = \
+	-Dtests=disabled \
+	-Ddoc=disabled
+
 FONTCONFIG_CONF_OPTS = \
 	-Dcache-dir=/var/cache/fontconfig \
 	-Dtests=disabled \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
