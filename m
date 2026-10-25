Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1956E606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qB/3l69u
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB1DB80DA9;
	Sun, 25 Oct 2026 20:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-K0zVDDhuWb; Sun, 25 Oct 2026 20:43:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1E1C480D85
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961010;
	b=g+czDWJ74x3O+lBMFe2sVDJZtRCyWBOgV9+hcVZ9O/Yc3t5h5wBd1qJmbWfRtjaHOSLq
	 4H6y3/ahD2H1rGHiVX4KwnWZNzJOK6qHz18J8ghEZy+q9vOvo3s3vAP7mOKMHekszdySF
	 ksK7Gh8BPBsD/qjyyyWrWEZAKJOTI5/i6+m16ABRL9eaGdNg5DBhZHwOAXCV52fGgFF2S
	 /uckqdtDWaup7mWKLWYp5xj6T24SN0IYtKqCZ1tTuAtRetbXJf1WcLVCT5iVDjPp+oa86
	 /Pf1MqxCWIzHAr3x5d0MtwVX/SBeGuhwVeRuhOXc/TOyRupZy7s6nI3CWKxUy272wZw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961010;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8Dwk3jTKcaggpqa+nTC0+G7zgrODRP534Zbeh9zRAuQ=;
	b=dnocm9JooSeCFyearteaWSFuwF+exVB/7r2gJyt1HRf6CM4cD6jPhcIWBKVxkkCJuJNR
	 UfhSRTsdzjCwkmDQv8pBgWpNmiSAtGoMSGEyCJ8DzHRBDpSCH3tUZB2Ha7QmFP4Oqw59T
	 UdTWArp7J5+6OZg02JPINmTOS+AnJ9MirB9KVFLPr57SQG8cgGVUyTauuwhxYUycAMSuv
	 sHk6vjIgikhorQzTL1gYfmLSo9Nc0sSpYU+YWDycxpkkdOoaFiX+F2vXHElLOlcdES3gE
	 VnU60eRrvIW0kL6mbCEy1/oNr0KO5b49V0cglPabcSh41UUiUAJqAUz9Ak6mZidPkyw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961010;
	bh=8Dwk3jTKcaggpqa+nTC0+G7zgrODRP534Zbeh9zRAuQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qB/3l69unmxKH/RbDIv3AWdpnrDtaMUycBz35i0O08xhaRTjh/pUyc3upjPyh6h/C
	 o4DxT2JaQf2KrXggsMuAXuU6xzpMJ4Liq4NiPOYI/mFuB9uDMhXFYqmX6meLEu2Chc
	 NVtZ2lpqPwh5KMYJ9WTRr6beVOIi15pb6RsZRaOjbPgq/lf6jsdbnf6TNO5ZXOSWxC
	 fVEhM3FF9kHRtcKT3jTL8cXXD3hTjQH0oAJfo0KpUTfCXbhO16B+5ppvX6A4FCLPpx
	 LJLmAMxOaF6dkcQ1NY06EjCrWHZ5oNaNZsD7f509v5DOERPzio4qm5ieT1Ukm5C59E
	 Ye8ek4HFvzfgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E1C480D85;
	Sun, 25 Oct 2026 20:43:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 84E79356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B48180D85
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OO7Hr3AT1iZi for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:43:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C70D680D80
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961007;
 b=hgGgN4/VlqUGRWlLV5hiGJh5yiKVSSH+SoB5lY02cV77MyAo7fpV+pkE4px3eoEz0GtF
 P0XPFpAPfkenOQefMh9V+zuFA6pjsujn1fSKx+hntHJdzs8bZaMJ+vil8uuDsxfR0AYtP
 dC8IiUecParnTj814+BrkVV/bYG01s/QMdK58KifgRdBYs06O+yg0SfFrCotMQxdcBGmw
 at9qi7zXX/otrZz7RBw+p2WAQl7HuNWWB/SJpWST20wYtHfNtGdUauSh+gqsQ/olM/K8B
 mlL4tQIltyhufYdBrdjKzOJfS3OJlm1Yi5aC1vYn48ZwFoQanteMpGgoVV6XrbBJwIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961007;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=7z4XuYQ6FeEvlLoY1QkfUgz4G7fif2fiNIpPyu1y93o=;
 b=n6WdUSXStQ39G7VfCiO9dQznXwqMBHbtW4X/u8y4looK1dxAXRJy6RsPk7XIIvKj8RJX
 4JL4wCK7VfQjb9P15AUtG7mS1/+U649fDGHRBlBJ3b8QlB+jGlsLAq9x0ouDIid5mnra9
 ws1oW6emENanEdgCvY5Jnn8HRwgba/eclvu1Zim05IeRAA6fLZdd8CIKSDeNjPnXpK3tM
 vp+ajKzWGBjy2pYr1Tbfaz4mZIbmPWaVO1uGmHZOCj2U1x8FQwSSnUknA7apJ0qFR+hUk
 NRVF1jP/QyxY/E7b5iSn9X9Qany5fecAs2mZUC8Elpw+qxfVs7hc2Q1DhXZGBx35IBA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C70D680D80
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:43:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FCE29CE3A; Sun, 25 Oct 2026 20:42:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 21:42:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d46f1df72722855398efcb9771ae53d0a4484f99
X-Git-Newrev: 3259ab9f4d88b87811bfae6be291da1e5a91b22c
X-Patchwork-Hint: ignore
Message-Id: <20261025204202.2FCE29CE3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tvheadend: bump version to git
 commit 51ec612fa2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3259ab9f4d88b87811bfae6be291da1e5a91b22c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 8b18bb247b..6576b4f1d4 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f907bda7faf93fc95c3a705b70c6ce2a21f63ac824a610e39ab58075fca43356  tvheadend-c0cbd14550aa40b4f4eb32d1baea1e7a1ed89cf4.tar.gz
+sha256  7d871f5139c9e0394a304ae8e8c118343d99abd26392ccc73b6e0c9e134762b4  tvheadend-51ec612fa22c4c78b4697e4c262c943da9cbd6cc.tar.gz
 sha256  bd98338d78a253979b9b3040de83c8a6546de499c9a648b8d2d6dedb891c3605  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index d74adcfe14..a0ffd89f5a 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = c0cbd14550aa40b4f4eb32d1baea1e7a1ed89cf4
+TVHEADEND_VERSION = 51ec612fa22c4c78b4697e4c262c943da9cbd6cc
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
