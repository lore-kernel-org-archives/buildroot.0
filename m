Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B0FCA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA44F40689;
	Tue,  6 Oct 2026 16:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJsH21AEFT7w; Tue,  6 Oct 2026 16:30:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C9D3A4068B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304246;
	b=PbgoKnoeGVaOqJZ5WGY5Sh5JudqcFFCyDwxW3f5fAG3j6IhRHngV8N8y+ePYQTlNh+M3
	 gk7dM5l+J+IZrNk+m7Tbztmey4o3Mg8XVZFf5uZGY1ELp6dcsfT34JLdP0l3lchoJK9iQ
	 WJHLPps8Y3AV3VAq+l5C+xZErGJQOAM/XhQ8ADtT98+L4eD35nRhb0SjOSG6tFOJ01Vzt
	 9qy53eZEbSEbJI2f9S6ko2RC54gve38ch5GXJ42PzizkcculW/KpXAfyQ5UrALkDYHhbZ
	 D2jwnjjs8/Kk+faymcKxUPCk0KEG/iWp2NTe09Nl5Bukn1qm44Ja/Kd8d4EW2TisPZw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304246;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TWfQpNjR52zUTTlhw3uJ00hP+Ggb95bzv6uLnxUJLEU=;
	b=G/siCXkYw+eNJIgQIcgmBNaH2HRkGvU6geWnMagkTYV0gdVPKVc2Usfc62JSYvamZzyL
	 u0wA12zkECwZSEBLwfBbVIUYowhPTOvxQ6MYgWtj4A2ts36weTPLK2e+TmQvP0bOlc1sx
	 J/TMQJ5TW/1vV3KxmJgKmr1V63FdLlVB0C1XxOIfLHFxVZy/tAfWpq/8m/h4OdZM6YTDw
	 d0Q7u5KtRLOCdfE0KSWp5tsroR56SvMF6V2vvVGcHhjOCdFUDE68S0IaYVGRqS5htYGyc
	 LArD5e8prB8pjTrEs17Q8MBh1NuQ2ZanlzNFCb04axuMdFitoMkRjT88TgtxVbm+zlA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304245;
	bh=TWfQpNjR52zUTTlhw3uJ00hP+Ggb95bzv6uLnxUJLEU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gBsJ8iZKEazXceS7UEeBomTbpCzTpp8B7EpVxl6oy1ol5z1w1FI77nXKsAiugQlMf
	 Zk/Qes4pGX0pGv7nYplijIrK/60KqT1yJfYN5EqSgKV/J5h5wcRzMQlhmijrB5XhZw
	 4plP2E23PGZfDFebMtOhPQaj80BsF8cLk2itnjoR4X1i/vgZA6MFgEA3CjY61PTOP4
	 jnNHZg0Y6WyjbRKFSdc1UwC+XkAFCusaXkVRQRPW9FsqK+ULPV0kgrSHtFa+tDCjpn
	 E1aJHM28osu1u/pGGpGpwoNhDOjQ7VrDuJEbM/DBNjLvYSYSmmZyxFXod9ho/LhUkQ
	 uCFKuOQFY/SYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9D3A4068B;
	Tue,  6 Oct 2026 16:30:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67EA0361
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57C73402B9
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A8E3A4Rn_d3f for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7BEEB40274
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304041;
 b=YSi4jGGpwLnwOlqoy7Pjb7cS926aekoMSbQ6aYtlRXcwJme0SuW6L4Ct9Wi3+SwTW2KM
 8Ger7pxdeIwrl8Zx5sz4lNfkU9toNj5kOPGKp9srfdLv+agsm5YGeLTJceSgOF1HfizUV
 njJtIW/ffLI45DCw8vDipnWzjxYelp9BHB7iKjbOLXtn2UkU2pUp9J1TdIs7b8tf19//9
 7qa1May809LMbiq2ZgFKhCRTAbWU+9j9SUiX9TkNHFxLXVQjUWOKws4/p4nEw7VqCtzAn
 F4XgWnKfysnpgFCP/oqJjEc//0YpFzBHtLAsqHNr/s2kXns/K9lZq9yVj6TGppuleaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304041;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=HVcoFiw8T29PO51MuhTXcuuecsAg9Y6tEGosrFk5MrM=;
 b=XSwLN0aZvWYdLfBoj/1E0yLNg5qAeGt9OALpWDhiODTOD5zBNnapsogg2tfB3SAu7oJg
 Xz61JddrtT/mVaXtd7Th1vpJyP4aUyN/32esDlx1ZhN8/up5yzb+YVV6KZAEU7TaqYvx5
 sqI/evWD7AfzyRa8vlkjoiCzabxqhSD+sBgEzBZRpq2tB7mM16WTowFnmqiaF1CMpzlat
 xCz5hjKlD0PgjsBbSPXJiL+1rr+PVkE9+MJJeiBAhDY4iSeIkHifA42oYfhUDzZWd20+r
 RVJ0lxiDOVidrt0Zt9DVxmNZPgJaRCQ8QXlLMgy6fYvNAfBfgNWtRgLZAhMBAETnqWQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BEEB40274
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CD188DA09; Tue,  6 Oct 2026 16:26:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Oct 2026 16:53:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ae470b3aead2b34e88c834a8b0ed8a023b59d61
X-Git-Newrev: 2944d81ae72bd85d80528966414152a62c76fba2
X-Patchwork-Hint: ignore
Message-Id: <20261006162605.1CD188DA09@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-filelock: bump to version
 4.0.10
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2944d81ae72bd85d80528966414152a62c76fba2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index 6547677538..23472337ed 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  0bd500192b983fb9bafd2e5a7b4e02f0  filelock-4.0.9.tar.gz
-sha256  635e7d67fa92654eed444e75e9ca18426d34e77ad9c469bf4373f75a932f7b22  filelock-4.0.9.tar.gz
+md5  2441f82b97ae84b4dd06f6f183c1c19f  filelock-4.0.10.tar.gz
+sha256  00d6a81f976a6332551c2c10f39e12b4abb7e01c64d4c497b81a615bc9186f1f  filelock-4.0.10.tar.gz
 # Locally computed sha256 checksums
 sha256  608c89d5060ae9921adccf3236695bc654a9946e12323ef6c021dfa04e294d48  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index fa06e5f7c7..f24b309787 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 4.0.9
+PYTHON_FILELOCK_VERSION = 4.0.10
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/70/51/2bc9e529f154fad99b6cd0073e609291eb32fd23581b32362d33d164d316
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/4b/51/a182494d1d8dde1240bff84dda57d48165d982e59582ce8f167e8e3d7628
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = MIT
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
