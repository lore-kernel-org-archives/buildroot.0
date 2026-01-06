Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7CDD0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37BB841466;
	Wed,  7 Jan 2026 18:02:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Du5y-2AkRBJ0; Wed,  7 Jan 2026 18:02:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AB6141456
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808953;
	bh=/q9SjX4eIdT2FP4Kbb267S6W0GqMQqqMe5VinFjn1ZY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l6MVevOQ6OPbyphJPHwMuBMaH+xf+RiQ/R+Qd3piluaFQEiOYAIojXvpQv3JNqmuQ
	 9/u0s3awIKikPydawdoUFPKpKpeCQ9Hd77fNzbKmUKkl1qVTiY0+CZWbO72tnbISj/
	 10sFZ7/NVQc9j9Filv3gfaUQ5c3VVH5TjYOEtDrBbci8r3GTkirks0OyFIHa1QaVwA
	 ybSH0f3GwVlL7TmfrgNLEuVtI+DrACDzmdZsBGXdyPCgTacmMDg89sFP+0qswvKmDN
	 XWXIlM3wkosbE/gHGV667Wwp7sQy5HVen17SsJolVLO3pjbsYLqATuX99RuvJwZQp4
	 9M8M09kZMxfMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AB6141456;
	Wed,  7 Jan 2026 18:02:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11B2BA58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CCB180EAE
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFbwtlqZpKum for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FF2380EB2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FF2380EB2
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DE1A883AF; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:51:45 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 3a2608c47a889c27e2e8a3be7893c67794b6861c
X-Git-Newrev: 42f81fae5b4d174a687db1b40dab4841dfd14708
X-Patchwork-Hint: ignore
Message-Id: <20260107180112.7DE1A883AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/pixman: really
 enable NEON support on AArch64
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
Content-Type: multipart/mixed; boundary="===============5169990958468186816=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5169990958468186816==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=42f81fae5b4d174a687db1b40dab4841dfd14708
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

The test to enable NEON on AArch64 is as following:

ifeq ($(BR2_aarch64)$(BR2_ARM_CPU_HAS_NEON),yy)

It cannot be to true as $(BR2_aarch64) and $(BR2_ARM_CPU_HAS_NEON) are
mutually exclusive. NEON is compulsory on AArch64 so remove
$(BR2_ARM_CPU_HAS_NEON) from the test.

Fixes: ba2fb599cd002b57fa70e978d91884c98d8aad05 ("package/pixman: bump to version 0.44.2")
Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d297569eb405d2db729dadf8dd86ac2d1070b742)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pixman/pixman.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 76e72d6d96..5d29fd7b35 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -68,7 +68,7 @@ else
 PIXMAN_CONF_OPTS += -Dneon=disabled
 endif
 
-ifeq ($(BR2_aarch64)$(BR2_ARM_CPU_HAS_NEON),yy)
+ifeq ($(BR2_aarch64),y)
 PIXMAN_CONF_OPTS += -Da64-neon=enabled
 else
 PIXMAN_CONF_OPTS += -Da64-neon=disabled

--===============5169990958468186816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5169990958468186816==--
