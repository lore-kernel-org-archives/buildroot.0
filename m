Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7190F606A326
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 12:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=N4tTBiYs;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gTiNNX1v
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49B8B60633;
	Fri, 30 Oct 2026 12:04:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XnLTE75_Xwpe; Fri, 30 Oct 2026 12:04:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3A48D6079D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793361851;
	b=ZaTunyqU3HA80tMolYfN2wBfzXrXJFtZ95dBz3LUrIy8NruBA6c6pguB+rXs5Mbf5K9h
	 zxL6LRbhoArBfHdj70iQmmhKxAUFouahlDFlkUKHCvUtVqLQZXwi1ItOj9cDbOgZKnV1h
	 Pa96pe65Q9VAMlCYL4LBvtXiWPUOUAZeOK3Z0h1mSnzkKaK4ki5yDuck35sSJG0NlqnE+
	 6VQtqjaHZ3vuSYYFdrRQI8sgcmLyJJjjCDRfUtXvKxVFD2VvG0tglX3OCbl6fn9GkwTqt
	 vAUinu173Gc8i7nlhyawCezA2mTOJYV27abvIsp1AZa8PGel9ZJn97XdoKh9Sr//Myg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793361851;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=mLQ/Dh1ycs0X3ztyAJPOJyT0nUopNxoaa2U6NTzNyro=;
	b=EMaRLl9MYbHNItWc/RFN5xhaJeMGRZ9C+RuOSwQqzbFD/3YA+cfsS5Kui3R6cmllsrbc
	 4YhcZ9p3VfZDg6Iwf/OeWaoxZ09RxCA0k1dsP+4TypAu/Oa2NLh4k3p3dzqxbkikKMmLW
	 S5CEKsmQxX0Q0JXbVTWVaO8xHvveBN+Gjm67FLHSMaPMYiJVed1RLTLzhI4s8Z0jalHEB
	 VrYA1Im+7k+Uy4Y4SksNvvLNRNxTeAgT/SlhdWDQyzVctBd0mNP4agCtjveSYvqTL3QML
	 brs5AElVwpm927S1MtSqTY71QoCMlHkTJHv5h2E57E0YgoubMQHC/J+xBSYr0W66tuQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gTiNNX1v;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793361851;
	bh=mLQ/Dh1ycs0X3ztyAJPOJyT0nUopNxoaa2U6NTzNyro=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N4tTBiYs2vEpjIFYGeDBXMIOH2kbmLpGdEOoJEBMG9H1BlkRonAvP7OTSXxe+RCPe
	 cU2BIyrdZcpasBN4oO4lRyBtRP0g7++hGe/+fSt8jRT0tQyKR/T3YHBCgP8/Nyc/pS
	 UWp1HvFaBbOprDhImONzsn04oDyn1DNFIEIyVRtDIhO3DVK8tRSB6+rrPaVYpk9XRJ
	 rV6sCs9NDnQzkFlhgGgHoA9FlENrUHjmxeuQEWN6JyfEHdXTM1mT27MfynfEwK9KAI
	 aYPNx+MSp3HwExsgOq+qQ/RS7cRUoDqjbAc+9tMHg4Vg5nTWw7i+4UVCJ0yyjnSIh6
	 IYvT5LjPUu95Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A48D6079D;
	Fri, 30 Oct 2026 12:04:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 996CA4BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 12:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B6CA605F7
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 12:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CUm9gITzpEQb for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 12:04:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4846960633
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::634"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793361848;
 b=rPqWJkJmsaZ1BzDEdahhTL1derBQaZoDXbpoRIX0lc8Ay6Qu046QhkT/P+JbqbAUvaed
 +jycXlxRWGkfgpXDPDObfsTsxa6ZGjKnM7H8/+ByUKFqoGORAtD2u7aWSqs0X9wRQ60VK
 L+FDjHx8c32gOT344QxycERMw64c2n+rQPeO5JoURZ5NKgAWIa+JC2pULNFD2+fh7v/7P
 HstmBaXG/Ez5KN3qVghxTG3TZMJwscIOlDoNYNt8uRlU5UMks7WESbAIKXD/BQrRqsNgP
 Q3ynMDB2OKWkaHTy7qUDjTkcr44Cul1S39lqhPCjQonZ3L+yj614eadA2TsvTe3z/zg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793361848;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=rHRVtlCWHAeR6Drzc2kZf+yqCs15z0ktj5WUve17wXo=;
 b=D/3BLgYo8eHWIiUQWC/ZJyOkicn4TYdR0OkvtlciIKvgbHjqR95dd5hDNpDNTpVBQ/lP
 W81m22ST735/NydRDIty4I6OyJxCVYPJyunL2UWeKaEGMgg080TZuAzSADpUU9GFxJVXd
 VvbcSZv2KOA6Dn1g1MRNLfytNCvNHC91G8+xGMzF2s8kY4sg+ZwcMvelzAcuAXoWd5zhh
 7QZiwV7fFz6wy5x1ZSEpUG8K3fytJXJWQ+m5RWp+XBODwRpVLkf7zMeJWO9SlRxlmKTQb
 5cDrJ5p9JAhXasj8yAPjKVMR7WWycD4Pf4ON33hFXU6r4vdc1tPBOK8XhWZ1LI3li0Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=gTiNNX1v; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::634"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=gTiNNX1v
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4846960633
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 12:04:07 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c46822eefb6so75859066b.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 05:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793361846; x=1793966646; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=rHRVtlCWHAeR6Drzc2kZf+yqCs15z0ktj5WUve17wXo=;
 b=gTiNNX1v9rgVB+eJ5tQ9zD7tz9hoa3bEXLyR3aJWK8TbOiPnsecE+zwknZ30WMWvPI
 n8Kt9EFJAgO/pUen9snrgA3jjxAeuIUTRjAZsGn+nSoqa9Uu+DbK4ip6li03oPQWn1JM
 K7sIoNoqWKs62hn0uQ/rvYT4ayHONwfzv8yqsZBEB5U4SW4W78K90OMW8RnZtQoqU69A
 f9OxrSE3471EJHq2Lsg8aegiIaNJXLAenm2X8ZFTxHlPsqXM9e7709k5g4SIZTgkK+7c
 Ct2m/EeS7aLSAz1tsg64hvBd7bYiZ1nw9zLxHDX0C4lhtaJPjR7B9vUgPH8SlISL0iaC
 X5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793361846; x=1793966646;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rHRVtlCWHAeR6Drzc2kZf+yqCs15z0ktj5WUve17wXo=;
 b=hIbq8885T4+lyrVH/QphGhWz59gPy9Xv8lUtP9dGFOHTG9+a4VWXPUWcSlgopy1Yu9
 rjC32G5lj+gxWWHnOZlHWtB4/85rhyjwczG9dpjUAaOy0SFS5KJ5MqdQC+GPVL3JMBfi
 WH7zzawefwIo6/2XPIf7wFMPLBm5Itjv6VCuJ1zWHF9XVODJNJ9pR/8yoIZ9QIL+5CgY
 +bqIQNfkfNECrk6ZRJj7ruFbcXXJUndIhX/3QbIsFml2Jm5R6Yj7OEreG5hzZqe70YdN
 9738vnVzA6eHstTDq0vjkdG+8yWRphiQjXNpWez5oWhErtNVE0uOph9A02Iz6YdDBUVo
 hYUw==
X-Gm-Message-State: AFq9FYJXwV+WlUy+VgBmZfGsnVJUCOYEDAejDKW/ue0AjLFh2ZvIfFDd
 wzSybQeXNW2+yc1Yxi5eySiSLJ0/H8gdyBE236b9/Xfnhwb3KTBfoNpkM/xbDA==
X-Gm-Gg: AYBFou0E/hZGx/Jo6WrKyvMMcPiF0g6EEitMbJCDOdlQF6gaMkxtjAg8BtN/bpVrx/u
 paJqlBISf0Atj0advT7f2mjiVb9LzJTPkDfvCz/QHyKk3HfucW5ho6dcdgxcDrMOtn6hnuDvG9r
 0PmSpoMwm5sRvatDoXnDtyjlV2uNWblUqowdro9azqYLC+iaWZgmfGT9CqaukowacGUss+JuLBG
 f8zHx7uzW5FVUoo0ASNSthz6o5pYqGUgZ+on+WMv8DGCsn9N/2ITxRM2vZfpq1Js9XaEWfNHXa7
 //LHoBGgNe9GqoSgd21u3YaZHb5v3k42HChcPF7i9Rt6JZifNQ83u/RvFHhBLoI3iQ8nNr1HQkI
 WmV9cHxWJDS/HkTaRVWGPRTp7fSCf6yF2PCzoFWD2oIxwSWEf9MA1aEhK8BoakuehOwiD4G/mO5
 sVRWxNNcMlCCak21VWGLB9H22JdN/kMRYCaAOrDyOS/lySftI7TCepFMu/Zk73H9HfhAaoXR17/
 V+C70zvVghQu0PQOn7VZ2d7N7USzcVtH0A6o3f62Xl20t70lOSohGF2JM3tsP34lSZeRscozLyl
 8m8MKjYYo9h3SL24A7pZeOa4V/IjD3sTHWLoFfp0PPQf7tnzdBuWCozrbKBoAGuwN3XExPVhews
 =
X-Received: by 2002:a17:907:d64a:b0:c3e:f39b:2298 with SMTP id
 a640c23a62f3a-c4ca7a0dca5mr197946366b.16.1793361845752; 
 Fri, 30 Oct 2026 05:04:05 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b81c74sm2848917f8f.36.2026.10.30.05.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 05:04:05 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 13:04:01 +0100
Message-Id: <20261030120402.3171912-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mono: bump to version 6.14.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The patch removing mono and the related packages [1] wasn't accepted,
so bump the package to the latest version instead.

Mono is now maintained by the Wine project, download it from the new
upstream location.

Drop patch 0002, merged upstream.

LICENSE hash changed due to the "MIT X11 License" section being
renamed to "MIT License", the license text is unchanged.

The corlib version is unchanged, so monolite does not need an update.

Release notes:
https://gitlab.winehq.org/mono/mono/-/releases/mono-6.14.1

[1] https://patchwork.buildroot.org/project/buildroot/patch/20250818140518.964728-1-angelo.compagnucci@gmail.com/

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...0002-Ongoing-work-on-the-cmake-build.patch | 34 -------------------
 package/mono/mono.hash                        |  4 +--
 package/mono/mono.mk                          |  4 +--
 4 files changed, 4 insertions(+), 39 deletions(-)
 delete mode 100644 package/mono/0002-Ongoing-work-on-the-cmake-build.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index a8c1baacbd..92da0a1858 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -598,7 +598,6 @@ package/monit/0001-Do-not-force-building-a-statically-linked-binary.patch lib_pa
 package/mono-gtksharp3/0001-Fixes-MONO_PROFILE_ENTER_LEAVE-undeclared.patch lib_patch.Upstream
 package/mono-gtksharp3/0002-Mono-compilation-error-branch.patch lib_patch.Upstream
 package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch lib_patch.Upstream
-package/mono/0002-Ongoing-work-on-the-cmake-build.patch lib_patch.Upstream
 package/motion/S99motion Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/mpir/0001-mpn-arm-udiv.asm-workaround-binutils-bug-14887.patch lib_patch.Upstream
 package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch lib_patch.Upstream
diff --git a/package/mono/0002-Ongoing-work-on-the-cmake-build.patch b/package/mono/0002-Ongoing-work-on-the-cmake-build.patch
deleted file mode 100644
index afe618f193..0000000000
--- a/package/mono/0002-Ongoing-work-on-the-cmake-build.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 17650f7e0f571287bb14bb9b4fbde7b91d842bb4 Mon Sep 17 00:00:00 2001
-From: monojenkins <jo.shields+jenkins@xamarin.com>
-Date: Thu, 24 Sep 2020 12:17:34 -0400
-Subject: [PATCH] Ongoing work on the cmake build. (#20428)
-
-* Fix some warnings.
-* Avoid creating netcore/config.make.
-* Fix CPU_COUNT test.
-* Add missing source file.
-
-Co-authored-by: vargaz <vargaz@users.noreply.github.com>
-
-[Retrieved (and updated to keep only update of icall.c) from:
-https://github.com/mono/mono/commit/17650f7e0f571287bb14bb9b4fbde7b91d842bb4]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- mono/metadata/CMakeLists.txt | 1 +
- mono/metadata/icall.c        | 2 +-
- mono/mini/CMakeLists.txt     | 5 +++++
- 3 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/mono/metadata/icall.c b/mono/metadata/icall.c
-index fa991bc72e57..f2c003ac1ff1 100644
---- a/mono/metadata/icall.c
-+++ b/mono/metadata/icall.c
-@@ -9605,7 +9605,7 @@ mono_create_icall_signatures (void)
- 	int n;
- 	while ((n = sig->param_count)) {
- 		--sig->param_count; // remove ret
--		gsize_a *types = (gsize*)(sig + 1);
-+		gsize_a *types = (gsize_a*)(sig + 1);
- 		for (int i = 0; i < n; ++i) {
- 			gsize index = *types++;
- 			g_assert (index < G_N_ELEMENTS (lookup));
diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index 1010f6d0ab..06a45e0fd1 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  57366a6ab4f3b5ecf111d48548031615b3a100db87c679fc006e8c8a4efd9424  mono-6.12.0.182.tar.xz
-sha256  923c7053ad0d430cd9b0b69a0ccf3abb7170a1ce50ecbf01915b565a35823d10  LICENSE
+sha256  3024c97c0bc8cbcd611c401d5f994528704108ceb31f31b28dea4783004d0820  mono-6.14.1.tar.xz
+sha256  844242559dbdb96cb9cbe103b06c2bc8a349f19ad0b89d5c3cf830a8914333f6  LICENSE
 sha256  fc488f3ec9f36856bea8cce5cdde1449176341ef93a3962b691970f8981799f4  mcs/COPYING
 sha256  2c3c3ef532828bcd42bb3127349625a25291ff5ae7e6f8d42e0fe9b5be836a99  external/Newtonsoft.Json/Tools/7-zip/copying.txt
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index aead85bac0..0c833fe9ba 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MONO_VERSION = 6.12.0.182
-MONO_SITE = http://download.mono-project.com/sources/mono
+MONO_VERSION = 6.14.1
+MONO_SITE = https://dl.winehq.org/mono/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.xz
 MONO_SELINUX_MODULES = mono
 MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
