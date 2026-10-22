Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87E6606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CrwKGNN/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD7B4812D1;
	Thu, 22 Oct 2026 21:27:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qjA3V9Gq4Jeu; Thu, 22 Oct 2026 21:27:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BFCA4812E1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792704425;
	b=g+KNbF2W2y9VojqWu4ugUviWbP4/eKmlMCWEIecBTOtTub0bKq1BA12SUvDBwmGy+bNt
	 sGL8uDbpanBWEoh03HaHxkw4+nrOjWsiL4xUCDQTCiWOn+Ps5b5875fqNLeTjREDa69Sz
	 eYSrOe0EM/NHluxlLqx0WLvn7xVJ49CmRqo1M5+LrWZqraMxNYj8f9cmmEeO22UnQZrRC
	 Gmnz4sRay4MfphSgWq/1dqND2r75GI+EYuCbD4t9JE3RR1wdO5Ifq8WL+0GZ/6o4lp9NU
	 GwSvnWA+hm7DkMuwx6KvTiNSmEnD5Fpe51B0nsnKsicd+jKAj5xe84F4RGerpdjEAVQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792704425;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KY1tkk2EzbafcwJsuomqyNwva8LEcbbE1bOd/Jf2M3s=;
	b=l8LfnSDOreAIWHoVlDxzh0Mmi6GOCj09htCqOG+6hPV7KmUXGYmkNt69zeMXpgmckBvL
	 iicyFuGbebUlCjzGJNVHoqhRQrRyWnq/RWEGRuLgCSBX8mjleq48nWrN3aeGnbTIg5NCH
	 XSxwjNYY6P02vsE6YhqQjzDAwK1do7IJIOiWNbYqYazWL5AYLDBPrdaeZBlQccfXUjkd0
	 Ob9sV3tueR5je6XS/Qn4LY0QK69UYVWihcm/sIAmGgCRlgrsJrW8KpTSbPUi5uEj3mrhk
	 fepU9WkdtM/zBDM7/WTJB5wgAcGebfWm8TbLl2jDlYWm7x/+B26qsVOY/U50chxCWHA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792704425;
	bh=KY1tkk2EzbafcwJsuomqyNwva8LEcbbE1bOd/Jf2M3s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CrwKGNN/id4CUPzjIRm8p28p0ifP/cRjE8pPqkbnNlSpaIGCWyESyOWRSpqvinkjZ
	 SpEpJ0VbCmnlKpH47QSj7RGlue7TEVg5vOVRdWkm7Vnkq8lf6JKppG3kDCeh3Bs/6Q
	 J+9y99wnGWtCpx3UbQ11SKdn/fIDXRVnZUZOPmq4+snSMJftFvIpNIv9+sG0/vUxpU
	 PFPKV60kf8MevZ9/omj2uzL2nVrda3LGMdsSytTl8KEHvBqW5aCGHrYHYEaNDx4Eeb
	 hNkQxx9SHDdZiY1thu3YGI5P47H6me1RYCDytrGkYorgZwEoPWeC3UvWoEBfB1qi/a
	 E34O91VaRgv3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFCA4812E1;
	Thu, 22 Oct 2026 21:27:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 516D9499
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 438E14099B
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sJatnUqCYYoQ for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:27:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8AA564099A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792704422;
 b=Gi44kRm5D0cXMS6MI0KU3zc5RgaNeghlJizrgLhCqPQnT0IXfAbjScpH9TySCNXAIksu
 pyIVR7/PN1tEKj91FzYM0fGTMj65waYnFKpHatUBM9YzGitXX5y4TIECBGrK7/TvqegA2
 vbAWWhX4/cp8H6FdL+4VXIPtXgKCXihP/7HQ8wW4aR1x5E/SY3PqysjpUSeDaOf0S1Ual
 pjNZDZNsZIeTTgQCozktvCfWD829tce50n7wM+aiRrE4JcVHefxDV3OspJzTR16uBDTaQ
 nZq6LMRtzQeaf2bwQpQzsO03tAwh+3712F7ErR5tE15crD3X3Gghq1IbPgiZHtJUDNA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792704422;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=as406fkf1AkFTjMPhA1hRf34ocCnn6AZX1iGE53WfqE=;
 b=aX/wcgOVEsaNTzCCzb56CihFf+Qk0ihprqsqRvLx6MYKY1+TtDK9BOCl8xCBR6DxNPMS
 mSsBeUUKXF5YtR9JQeRVxCDhzIbSK4d2JC/J1o9zoLYB5PlsuAsO2t0qdAUUPRyk7Zp//
 3hWJonmw5dKcQBs2nYrnVaNQuBrk6wl7RCGsIKYak7kQF/t64SzZb9JWsnVeE3R1+4qaP
 kM/+QFXqmvzJTzgJymCmbQXGIX4QL/t8LYuwL8sFzFd5xkpRHX0LiYJcGhwgCSgLOSg1t
 YwRKCZumjUGHT3NYiuBBkGMjeG6DLIxi+u7FWXdK3OMsQcJMaOJLs8bphZJyZTkTpqw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AA564099A
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:27:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54D409B9EE; Thu, 22 Oct 2026 21:25:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 23:25:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b3a0ed2cb245e7873e7fc6d792f8ee18e02bafa
X-Git-Newrev: c0ec4fc8d88c15c45905511ae916b0a680f1beaa
X-Patchwork-Hint: ignore
Message-Id: <20261022212538.54D409B9EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-mc-binary: bump version to
 10.40.100 for lx2160a
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c0ec4fc8d88c15c45905511ae916b0a680f1beaa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

NXP tagged 10.40.100 as an engineering release on top of 10.40.0. It
sits one commit past upstream master and only ships the lx2160a
firmware, with DPNI shaping and DPSW fixes over 10.40.0.

Use it for the lx2160a target, and keep 10.39.0, the last release that
still ships them, for the ls1088a, ls2080a and ls2088a targets.

qoriq-mc-utils stays at 10.39.0: upstream has a 10.40.0 release of it
but no 10.40.100.

Changelog:
https://github.com/nxp-qoriq/qoriq-mc-binary/blob/mc_release_10.40.100/CHANGELOG.md

Tested with Buildroot's GitLab CI (test-pkg on all toolchains):
https://gitlab.com/vjardin/buildroot/-/pipelines/2909708426

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qoriq-mc-binary/{ => 10.39.0}/qoriq-mc-binary.hash | 0
 package/qoriq-mc-binary/10.40.100/qoriq-mc-binary.hash     | 3 +++
 package/qoriq-mc-binary/qoriq-mc-binary.mk                 | 4 ++++
 3 files changed, 7 insertions(+)

diff --git a/package/qoriq-mc-binary/qoriq-mc-binary.hash b/package/qoriq-mc-binary/10.39.0/qoriq-mc-binary.hash
similarity index 100%
rename from package/qoriq-mc-binary/qoriq-mc-binary.hash
rename to package/qoriq-mc-binary/10.39.0/qoriq-mc-binary.hash
diff --git a/package/qoriq-mc-binary/10.40.100/qoriq-mc-binary.hash b/package/qoriq-mc-binary/10.40.100/qoriq-mc-binary.hash
new file mode 100644
index 0000000000..006422ba88
--- /dev/null
+++ b/package/qoriq-mc-binary/10.40.100/qoriq-mc-binary.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  1b647fe30203e229124d76ec05684674c4b00e3dbdd73d3353065197f1e30f3b  qoriq-mc-binary-10.40.100.tar.gz
+sha256  d69738ee3595df930dafa5194de2455216bd613cac1130904bce4af11dcc46e6  LICENSE
diff --git a/package/qoriq-mc-binary/qoriq-mc-binary.mk b/package/qoriq-mc-binary/qoriq-mc-binary.mk
index 5ae2e48c65..1823853f9c 100644
--- a/package/qoriq-mc-binary/qoriq-mc-binary.mk
+++ b/package/qoriq-mc-binary/qoriq-mc-binary.mk
@@ -4,7 +4,11 @@
 #
 ################################################################################
 
+ifeq ($(BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LX2160A),y)
+QORIQ_MC_BINARY_VERSION = 10.40.100
+else
 QORIQ_MC_BINARY_VERSION = 10.39.0
+endif
 QORIQ_MC_BINARY_SITE = $(call github,nxp-qoriq,qoriq-mc-binary,mc_release_$(QORIQ_MC_BINARY_VERSION))
 QORIQ_MC_BINARY_LICENSE = NXP Binary EULA
 QORIQ_MC_BINARY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
