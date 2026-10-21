Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDDA606A320
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KDZpcEj2
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10E7160B7B;
	Wed, 21 Oct 2026 19:21:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sjxn3q1copau; Wed, 21 Oct 2026 19:21:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1C6526103A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792610505;
	b=O2mHjNFXU58DUFttlkor761aWJ4j1xQ6UgNDiN1sRJstIM6IlvS5wcBsR4FZVe0ju9dK
	 R6/NVM8+VW+Lr+Vt9i8lC0Jd8twlI8jWCCRGvxdcI/bERYtOtxR6Sr2K5cQABub6Ll0hn
	 HMz8NK0SRgZKcZWnIluHJTcTTO9EuWwdZ0id9kb0EZzMW+RbFEIYM4nioCnYHHJNtFCtl
	 XTm6IVjRwKo0Mk2cKWpqeRpk8Z02BRwXA+wFW0aYbULRZkaOJkUW3pP3OXupMEnhs5i1Z
	 J37wjK3sUS8u0VYGMl9pgBp9DcmcOv4WEb0ydCf0u6nzxaKIIjPprnx11xf7cyDimQA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792610505;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4dPKHTf+pv3YVzzXBrObSJfA8dx06IID6cK5ZnNVsak=;
	b=aof30ItGBxdndEYuSE1s7w8CQNSEnHMSc3h+D3+pkHeq2R+nuvIJvP2ffoFqpGbmk7wq
	 VWE2p5DOX8x43oa+bMMlxSAMOYmrumjt8k6kVY/lJSJapFuKaZsVa6DRi1lXxS7LOKB9F
	 StVWD81FY7V6wDMwmbZo5w24k5sIfc4OLlmiPlGRCL4r9uSaxzeYDAQxhInbhZp5TEGsW
	 XWfczRqBBSlngFNB+fubOzCibxr24NBeSDIpc0Klrw3DxdCkO5XGIBaIB8mZqGSk7R8WJ
	 L1HZz+Bai8LBNbKWEbW11pZhZDPKmq8oykl9jUeeX+Ci4tywf0D5XC0umtZvx8/IyKQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792610505;
	bh=4dPKHTf+pv3YVzzXBrObSJfA8dx06IID6cK5ZnNVsak=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KDZpcEj2puWMr479YkhHFfvDeI9T4aSseb6vxQ7tbdYddFNHOvS2AHUjCnK1tTtsO
	 MekYBiwWb5Of1pnxX9DcTsT3lmAn/s9wwF6KfFbHzO+Re7KCeR7hHfINLfRAoDkm2a
	 htnYfRdEJnI/nwkbazATijOQpifHyxYyAmqrWXoCqDPGiNSry2fnkWf5M5s3i5duVE
	 SAtuoQiVIpa/iDAX6XCpACXjD+BEUbSwz9Q0Xy4jmEfGzmmtNBD4iczm5k5/Yf6KYM
	 V83j6RVSjUHDu1Y9FIijjeRD8m/qo01UBGvRnrEO/P83RHRopGOmvcsNMVChb8zc0+
	 lc4agSqrojZNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C6526103A;
	Wed, 21 Oct 2026 19:21:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BDFBE3A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3C036103A
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ad8niXzjVIE3 for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:21:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D5B6960B7B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792610502;
 b=eZb012Mtkvvr2CVJ/60OQWKlBrn4tBA6sb50NWhtZ1DA4BIQ5Zmjr1rCSyJ3qjZaq206
 XPyi5QXfn29bZtMRlY7DGUg5KRZ+CqE9iGUdW0nTDJJeDdvNQm/LHNv8PAXx4fkFuodsx
 O9BRWRGvDlm04zGy76SocxoqOWaKJC271cTS6kDVLXBDArCACpPPBFOKyUdqZVtwDfx87
 s/N7T+07f/40+jnTrG1eN3434AMFTmrZcH9qELX+oNn6L0tbjhps3Lt+5BiYDT/PdvQQY
 QEG9HsSWKStJGG0KZc+IfFh7PzS+4aNvWm7D+l7xaLcHdvbwnpgOsI3pCOcWF13NDFQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792610502;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CBhSIDKqWROZ992wWUek+ai53DEr6515f/19OPmpe/o=;
 b=GWggtKoqL/57Wrbwi1sABU6r1OfUklBbQChyOX5CtTXNBeuJD/FWNr/Y5gZgvkL8q9D3
 9cnKibXD3SE+kquwo2AwfL0v1uJ/f8Xoq8PNjpM0iwX8dkxfG7es8+JwnCzmW9wC93mXA
 iTCmORmxsYIbfbCyS8XvpcJ7Ux7HI5X3UQJYMqJljkQoTUtismkhkRoe+hv4apSv+2ANO
 s5XFGJ04MmMsYJssUeKNZsXWVG0FC3PNxuyQP/vObDStJTOdi4GKzJtMtWZFAOUprTasU
 GEZdbxQeEick3+nToKrRuKPPYjRjxqnjwFe7GL3DLTeKAERzl4v4LCNR8X+l7enZ8uA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5B6960B7B
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:21:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3066F99AA3; Wed, 21 Oct 2026 19:20:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 21:16:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6890b01e33036d5dabb8df06f5c5a37184d2b140
X-Git-Newrev: 91e703a5f18f32eb5e39d6d97db8abe648ac4618
X-Patchwork-Hint: ignore
Message-Id: <20261021192019.3066F99AA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tailscale: bump to version 1.104.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/91e703a5f18f32eb5e39d6d97db8abe648ac4618
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tailscale/tailscale.hash | 2 +-
 package/tailscale/tailscale.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tailscale/tailscale.hash b/package/tailscale/tailscale.hash
index 5683610ef2..761fc9b1c4 100644
--- a/package/tailscale/tailscale.hash
+++ b/package/tailscale/tailscale.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a4c0e5916bb4cf5a8a46791788534e8931a622ffac32dbff5bd8f21df7272029  tailscale-1.102.5-go2.tar.gz
+sha256  40e552cdf23c09c413fbb2f8f9744502a1a923bbb7a899708912dd201c689240  tailscale-1.104.1-go2.tar.gz
 sha256  a7ca6186a7963a0a60740f6047760eecd7a0234e8c38bd7e1e0bbcb324bda45b  LICENSE
diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 9c24d6aaf3..ff4c68f0fd 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAILSCALE_VERSION = 1.102.5
+TAILSCALE_VERSION = 1.104.1
 TAILSCALE_SITE = $(call github,tailscale,tailscale,v$(TAILSCALE_VERSION))
 TAILSCALE_LICENSE = BSD-3-Clause
 TAILSCALE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
