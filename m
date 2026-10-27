Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEA1606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 19:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mIU5Q1y4
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F1D6606A8;
	Tue, 27 Oct 2026 19:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qsHYPH30C8O2; Tue, 27 Oct 2026 19:52:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4B6B9606BA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793130770;
	b=agVO22tFVZqSadGWDSOR/CSxop2mK7LEgv6XVYKVSDTexfFDa6lnVDpdKISYSbGN+LDw
	 rgtHHOtJ0eDdGOfAfik2vlZYxf4rMLgLhWpOgOKThBeYjFIe4sfVxVcN3qeWtC0MXL6Pr
	 KdN4AXNLZPmmI1DwoiK+uMEx++yg3Go+g6t9dRZydMTLQphMe/MOA/tsGMwb9Etz5Ufb6
	 zk1lRg2Rqm7DYlHS90/Ov7wgnofPZQrYhb9E8YnpGLo7ae+iz+QUuDsHGpPyJptj5i7on
	 Wnyzeu0H8JEUxYh/PMicUHYT0lvT2VD9LuObpHeRlBr1eKB75lmqe/Y+O0OdS4qhwXg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793130770;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9tlCb21xcCYVTV0SHvLyOk/x3aX59xFQO5r4bKQvgAU=;
	b=WcKkiMOtJtHUHW94YeoKrmyqdEYCA3hXmetieWKb/oxi5ujrnWuFSuZXtcxbGLZbgDph
	 Ud73y9bjZm8iZIap29qEcfIKUoOrhcYQix/LuxTHuXMLEUqkIs2GEA/QEqo1RZ27yVhYm
	 ORCv3TRy2wsSZjDuR3lhO6wDlzmJzpebzp4pItFq2MNZ/ozGNwMgigE11dfpe05L9PM97
	 05Y4+y8wTZPPiLydACmFss2/MYmXSo551wpMMea/L505D5q6CWci9nvquiB7F28T/VI8B
	 LrkcapZh9D0x3F32H1y1BehU2573BE4nCX6w1M0DLSAJ3KcUwEcsKeVCvXxjwtDl9ow==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793130770;
	bh=9tlCb21xcCYVTV0SHvLyOk/x3aX59xFQO5r4bKQvgAU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mIU5Q1y43T8U27nQ+OEiRAyjtrX61VNKttKRs+cXIFIFc5n4X8YinuaFwUZOUMgGE
	 ky7YAB2x4TruaUmBS7LrDOksUB/XOBF7gMylIDdc3+JX+uIlHSXEOQ8Lnb+MjzIVuo
	 epqUMCKka0HOwBxZY7cMXxXEBocmX/U2wtolGy/fe8XKMR/DduFIstvkaG0aFb7cHL
	 JKOVfnBfZ4rty4IPDDhK+dbXYUZEp7/R9D4Pvq+zqRvtFSDf44Pji4SqPEpx9PsA+B
	 +YKUd9wJwC10HzbpBNGea0apwTkEJm6ueVxo7FdvTBBZwgXh5nE0gPzzWROP0BJx8r
	 jUyEgEWHGsRtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B6B9606BA;
	Tue, 27 Oct 2026 19:52:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A89C1729
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A359180F3E
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFzFnd-d5Gyl for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 19:52:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0986880C9C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793130768;
 b=aWXIybsqbgyT7a1gGqsqeTaFG6djxDh76noCKYbq8dEj6FFu1nu+UfuT1meVC9O5xHat
 ZHQSoY+akQwVXy8Eu82s7VKLugvf7Lx0PHH4eD4uriP5gd4hcElD1C/awo7wWuekwra6E
 nVM/NAS4CvPaRh4g1LiBTpaHtyLXrKSHc9gYMa73NXCbLagM5GQ6V6P93uCyye2Sil7DA
 S5LgUvzUWWGVdc8s95EWlNdViYE8k11s8/ZtlSs91AL9U0G2HH0YZAzcy+iJUAqXM2nOB
 ojaTEGvhaCG/HSmEOq43jAmRnX54STxO7m15MeUTo1jhEqPVV7eRIjo/uUCqjMJJ2aw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793130768;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Ya0RmnovuwTeb7p1YWlAzbusK0ZU0c/T99zb2TE3fcI=;
 b=o0SbX7VmTyaD/bUaWjvUOSEA4M8/qVXnHiSB9vvMCcnYCUV+SF7Gc3u3SQBLz21+YWF1
 Gg8GTC93HttWTOjjDw+sXkuedC2yRx4Gqew0NcKa2Qi7Bq10KuZifHigs+c2eGpCXXu92
 Q4f++++aNVOOSaKK5+hkWeBTwbOGYbkJNPukKE96jdu25bAneF0lUoOesRnU2HKycC24Y
 Swe8x3jzIQ1c3QN9ebqtQ5vwf3L9V5x1RClVNuK//7u56/Yqbr4Wg9Y5KEoKQaVXLpwO/
 /47SHm1AB+ZzWSJDNs9ZthsDBC+i7qkKzCqZ4KshuQTq8Di0sthXr87uykPyJdIWF9w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0986880C9C
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:52:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75AC79D13C; Tue, 27 Oct 2026 19:51:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 20:46:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6816da11a3d043c0c73325616b951e83c1fa16c
X-Git-Newrev: 6979e8d3db3870dbd5aba1c8e6633f0a5f3b7554
X-Patchwork-Hint: ignore
Message-Id: <20261027195121.75AC79D13C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-artifact: bump version to
 4.4.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6979e8d3db3870dbd5aba1c8e6633f0a5f3b7554
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender-artifact/mender-artifact.hash | 2 +-
 package/mender-artifact/mender-artifact.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
index 5dffdbb7df..bf00b26464 100644
--- a/package/mender-artifact/mender-artifact.hash
+++ b/package/mender-artifact/mender-artifact.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  c7002052028496f230c34ef6f0488bf5e8ca32b075b7a96555532fe928aed984  mender-artifact-4.4.1-go2.tar.gz
+sha256  d8e9e18e48a2124e5e367ffafb3313a3dcba7a8a8a8b162b1dcb8791964c6385  mender-artifact-4.4.2-go2.tar.gz
 sha256  0e7c48f6471ca81a2fce9e3f605dffeb0385afd4dc3b5eb7f4e86ece4aa9b068  LIC_FILES_CHKSUM.sha256
 
 # License hash extracted from LIC_FILES_CHKSUM.sha256 using the
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index 9f235b55bd..e881529c82 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_MENDER_ARTIFACT_VERSION = 4.4.1
+HOST_MENDER_ARTIFACT_VERSION = 4.4.2
 HOST_MENDER_ARTIFACT_SITE = $(call github,mendersoftware,mender-artifact,$(HOST_MENDER_ARTIFACT_VERSION))
 HOST_MENDER_ARTIFACT_LICENSE = Apache2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, MPL-2.0
 # Vendor license paths generated with:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
