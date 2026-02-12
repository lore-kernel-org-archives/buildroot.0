Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16046EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBC6441E58;
	Fri, 13 Feb 2026 19:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dUjVD6s19M06; Fri, 13 Feb 2026 19:38:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13B1C41EFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011519;
	bh=vISgYZM2zNaNIon1HQO03OIrZUciaVEAeZQhIkZcHgw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=J53ZMeMhBaGUs1ho0IkNhwkdkbV9ZP8MzvwWldfQsbF2BwJTlvQYqL6duvkuYruvJ
	 iJchMktFTDnhhVHF7c7tZeVgirLVIyZ633G1LzGvUXu+O40wafKQjHbHFlDI3+fI7i
	 4zy2r989+23WpoCHwHP17mkJVBOZZzGdgrmNmuOBfS68HbHyDbWmGsMVbFsM/Z1Jqu
	 L9CgY0rYnKlInHWEhRHsyq7enGWa0XWlFYsyLSvZfi0Pp9WOaGD0cM8Nbccm4sCkR5
	 m2LAnV9D1J7e28+sUtmkMraE0luTQCsgwfnalX8UrzspeapgAwFCG3g93HeWan3EE2
	 hiH/jMw/omjjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13B1C41EFC;
	Fri, 13 Feb 2026 19:38:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FA89EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6EF1412CF
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tvTCTF_2-1Ak for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEB5F4132D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEB5F4132D
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E402383593; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 15:02:28 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 65f79ccea296127aa56b4847c9c946dce4f5148e
X-Git-Newrev: a4e1cd78d41721f4e62c107dfc4e083777f53d3d
X-Patchwork-Hint: ignore
Message-Id: <20260213193703.E402383593@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/aardvark-dns: add
 CPE identifier
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a4e1cd78d41721f4e62c107dfc4e083777f53d3d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The cpe:2.3:a:containers:aardvark-dns:*:*:*:*:*:*:*:* is
valid for this package.

See https://nvd.nist.gov/products/cpe/detail/5F79D5CD-D716-4190-BE08-31EB5EEB233F

The CPE version strip the 'v' prefix from the version.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 37152aa6c3a755a89c6ab85338ebb7119fee2f22)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/aardvark-dns/aardvark-dns.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/aardvark-dns/aardvark-dns.mk b/package/aardvark-dns/aardvark-dns.mk
index 09a3a421f2..c0dc7eb2a7 100644
--- a/package/aardvark-dns/aardvark-dns.mk
+++ b/package/aardvark-dns/aardvark-dns.mk
@@ -11,5 +11,7 @@ AARDVARK_DNS_SITE_METHOD = git
 
 AARDVARK_DNS_LICENSE = Apache-2.0
 AARDVARK_DNS_LICENSE_FILES = LICENSE
+AARDVARK_DNS_CPE_ID_VENDOR = containers
+AARDVARK_DNS_CPE_ID_VERSION = $(subst v,,$(AARDVARK_DNS_VERSION))
 
 $(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
