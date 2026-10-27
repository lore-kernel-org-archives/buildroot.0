Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1922E606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 12:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MA5Jb3W7
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFE616075E;
	Tue, 27 Oct 2026 12:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RiBoGXfHY5fW; Tue, 27 Oct 2026 12:59:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2250C605EF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793105950;
	b=k+r3M/vZF+zG1sVlWwioGU1RoPmZevcalDXHa/32a4q606iXHEW//GN3cW4vkKqPrr6Q
	 cQhWwguk2ZpM2a/Hk13elZBuLaYzDqK4FYQk+Tr1xzAjsPFrqBRP7E07qfQrIY+1XD03X
	 0iRcmh7ima3gkiVYxWvTMuHT6LtXD2JP6763aDsmBs+OB65GDRzoP35SAUbiyZPcVckAr
	 7vFG1yjmpmqD3VK9iKJ3jthYC+1wm7MAv3NE9oDH76ckWJN1Ndtfdzn97EwJkKQjAEpUd
	 BxyxuaxCjkml1l/4JFc6xgqH8BL+tYWbJp1xm3Pmv4PKH2ob0/aCcv/r7qmMnKzDc9A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793105950;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1KSstcX4lNRquLfhnedmfbyhCxbSDz5VlpXi8RhLi1o=;
	b=gkPcoBrdM+VA4/js0LFmz4qzev6a22+yDvIUpRJwQaD93jElnjABLnn++DDhQAm4QJyU
	 6GWXDHfFQdM9S80Om8LEPmPtB22GJzMh0Oo0jmhiC+RbE1AYxIwu6p07wRwy/uBbNm82a
	 ZjtHTv0+TabMl7EuN39ael5ohUR+vzZwh6p8QeZxTO6bcyBz60IWJqftxOPIERp50BRBF
	 Sjm4Y1Ns2QIcPqbz0TDKkr9NOsEjkK8NMtYGoOW33dmm3DuyrRzJdyYYHxXWvjLrr29mV
	 zg18txNrHeOHgKMFbSPPnBe37t054ImQcNhP+2Bnb/9vaFRZFWzIziURL6vQ14eDdxg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793105950;
	bh=1KSstcX4lNRquLfhnedmfbyhCxbSDz5VlpXi8RhLi1o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MA5Jb3W7e69plwqAYBGZLs9Xujag6B0MB+oGYc1gOtZxsvHgdctuYfJvsl8EnoPSH
	 XUCxGX88ckRFyEedqbCDX/4MfCTVKY/WuOWJ+J19tFQhjrH5BKIMxIfjfKZyqU+zM+
	 3O422TbtCObOIpDwr48bWsNAEAyUhAUKdQI5bP5uTlYEGV/IL/sfaezdf1l5+PrJgG
	 iiUaq1uOwjjQeMVPf04bnaE+dqQw7hEXgByaI+uJbFcVkwJ0XmQFncHX63AAcicErO
	 Fi1Dea+ZXC7JQ9axWmD3hC1+vPwEZd4VwtvVvTo70Bu3ZxN6DniPDhWgLrzOX5Mi/p
	 UEGpfbvqV4POg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2250C605EF;
	Tue, 27 Oct 2026 12:59:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E07C235
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 12:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FC03808C8
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 12:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yzrmEblGtkL1 for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 12:59:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 902CA808C6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793105947;
 b=oahJDhWN1+nFxKfpaUQILmnbtYZgMPdeSkpjitK3Haujiv2lSOhvBhEl8ilCDLp+RtjB
 mjY3p/NIUKI16psk9pQ3kms++m80BMWFe2QOF2dtyK0aZH2/ZE3VqQl1BnH06jvXFa0mi
 8rqDHmQCmK2WsbTYg8iP9JccXCGbgSAFs8n5j3R4XpKuA+2R1/MvkCFzr7bbNnyrpX7E0
 lGMD0gKAiYOhCnLXSM8e00kyb9FX54agAPLw+NMF86ZNSjfDjzokW1vziie2CMB5az2GM
 IIXZkWTTB58q+Mm/H98wRsT3ISQw1r6FXaql8LRQ1mF7vE2iIeiE9BwDudM8jCrAaOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793105947;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dKjEo9DwVg+W237H9wlVFG1GdHIGwRoujGc5QGdOpFE=;
 b=E2fXHbjDK+K0ee8lcx0hOKGNbTJ19Qejst9eDDNr5GaqbKXoqwut1r+fa7Qu5+Is4l95
 uyksWzXu34rkVFrGxlhg5W+61kGmGMJgMfvz+k8BMm5xQZxNQS1pX9Y5g4D8w+27YooLF
 P2hkTlsq+i3bRugHxp/VLIVqONm6OHv3TF1VTPmsBdm9dw9uyIBoXZGXRdWUiyqZ830iv
 q9uztE5ug0efjkcItvlfDgcmpzyvGp5jR7eEFmTwoqRSOG4Tisr/lANFB7AkbQkTpsxdO
 9qKFHgYeOBANysLiuj1fapsmM3H3SgTMmS1fGScB5lYWwHuZl5Uw6BVlAHfWaT05mGQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 902CA808C6
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 12:59:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D82A9D017; Tue, 27 Oct 2026 12:57:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 13:58:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c58b443d8328316906cbc177beae0d1c4c50ab5
X-Git-Newrev: 7e49651e266d8bb7742cf8b2f312d9d1638168bb
X-Patchwork-Hint: ignore
Message-Id: <20261027125741.1D82A9D017@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-update-modules: fix LICENSE
 hash
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7e49651e266d8bb7742cf8b2f312d9d1638168bb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The SHA256 sum of the LICENSE file was incorrect, leading to a failure
when running `make mender-update-modules-legal-info`. This seems to be
the case since the introduction of mender-update-modules in Buildroot:
the license file hasn't been updated upstream for more than 7y [1], and
the buildroot package was introduced in May 2025 as Buildroot commit
a474642fdcd8 ("package/mender-update-modules: new package").

[1] https://github.com/mendersoftware/mender-update-modules/commits/master/LICENSE

Fixes: a474642fdcd8 ("package/mender-update-modules: new package")
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender-update-modules/mender-update-modules.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mender-update-modules/mender-update-modules.hash b/package/mender-update-modules/mender-update-modules.hash
index ec879f46a1..f6de69c42c 100644
--- a/package/mender-update-modules/mender-update-modules.hash
+++ b/package/mender-update-modules/mender-update-modules.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  4846f39abc254ad2ae2a9f3d5479b064bc1bae5034b9d276ebdb09d8c60f4541  mender-update-modules-d8c4683e6660af6c65069e10ee4b8ee50ec1af46.tar.gz
-sha256  d0f406b04e7901e6b4076bdf5fd20f9d7f04fc41681069fd8954413ac6295688  LICENSE
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
