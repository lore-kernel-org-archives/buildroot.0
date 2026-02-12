Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E40EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 643A1847C6;
	Fri, 13 Feb 2026 19:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 25aHZPplLY0M; Fri, 13 Feb 2026 19:38:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C0F3847C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011508;
	bh=25UdcTtisONPTSkXf/s2imEp+1BJQ0psqYnD9TWDuDg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q3WTqmki5dHjkqneKn9KAdceQBup3e1rkwSrXHx0UbNoyyOmnHdMi01dTe2nudh2B
	 0zN1NME6XPM4ZMkX3PLF0URmOMNFPQSEfVGOT3F0/dGBMfdSsjyJpCFB/28A+RtYVU
	 otFNEq64zM1hU0adsE0b2HnIJwgErKwv4VOlfDDuS+6b45FN/cUZCXPhN4VnE7Vxbb
	 xGvPu0qWfo0zmDlune5ETxaW2aQBforS+iMTXR3xH8Xgh1R7gUIdxLLcFH930Qpukn
	 XtMFMEWYd7eU9x0HM5DIJSQjYTS3Y2ukllqIz8fzRynuJVUn9eMoAtPz3NCqvTgDCb
	 ltuRdOyiqpLgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C0F3847C8;
	Fri, 13 Feb 2026 19:38:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D6CA69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C072941309
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jw21WBkQ2-up for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D530412C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D530412C8
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7293E83593; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:59:54 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 8b3854b54aa9ba6d74b18524f4c95266cc258445
X-Git-Newrev: d94991e1f0267dfdf385d8d463efd61523273915
X-Patchwork-Hint: ignore
Message-Id: <20260213193703.7293E83593@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/docker-engine:
 update CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d94991e1f0267dfdf385d8d463efd61523273915
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

While `docker:docker` is not marked as deprecated by NVD after a
scan through the CVEs the last entry for `docker:docker`
is CVE-2022-34883 [1]. Replacing this tuple with `mobyproject:moby` that
is referenced in the upstream project GHSA [2]. The last entry for this
CPE is CVE-2025-54410 [3].

Note: Quoting [4], "Moby is an open framework created by Docker to
assemble specialized container systems without reinventing the wheel".
The old github URL [5] redirects to [6].

[1] https://nvd.nist.gov//vuln/detail/CVE-2023-5166
[2] https://github.com/moby/moby/security/advisories
[3] https://nvd.nist.gov//vuln/detail/CVE-2025-54410
[4] https://mobyproject.org/
[5] https://github.com/docker/docker
[6] https://github.com/moby/moby

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Julien: add the note about the Moby project]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9abaa88df92f6ac1b18f177b21377280a6ea1af4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/docker-engine/docker-engine.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 37d42edaea..5fe225fbbc 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -13,8 +13,8 @@ DOCKER_ENGINE_LICENSE_FILES = LICENSE
 DOCKER_ENGINE_DEPENDENCIES = host-pkgconf libseccomp
 DOCKER_ENGINE_GOMOD = github.com/docker/docker
 
-DOCKER_ENGINE_CPE_ID_VENDOR = docker
-DOCKER_ENGINE_CPE_ID_PRODUCT = docker
+DOCKER_ENGINE_CPE_ID_VENDOR = mobyproject
+DOCKER_ENGINE_CPE_ID_PRODUCT = moby
 
 DOCKER_ENGINE_LDFLAGS = \
 	-X $(DOCKER_ENGINE_GOMOD)/dockerversion.BuildTime="" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
