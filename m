Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936E860A6F53
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MnUWQjJc
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F50E606CB;
	Thu, 22 Oct 2026 15:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9PRm_mLBtVhR; Thu, 22 Oct 2026 15:11:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7A7956069C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792681860;
	b=oFSJJnZL3yU/g4PCUbf5Qfp/Pkc30lGSUIi1/6xZUoSTnozYk726h9D0QkkM973YyxID
	 R14cq6NtbcbImvR6paR5UaEIHIV0y/9D6vQOcVGN1XhRld1jkzLRwYY7d0Pjv0vVNYyQJ
	 /TKocNYevPl6rx+6JZSiSxlJCH9y+7p/SOQEtM3BltOPhcSU4HUysc2o5FrsneoDuLcL8
	 6UJRusRqzsKyb2jkJU7Igv21NYV0/+60SzDpykLJi5nmg2r7uRZa9CnEbWFfBv+XIg/Fr
	 eztiWNjmqzZaKnreCO6nOO0sxebTWGMhujHAzTlNmRfLHwQzNyHlyYO7Wzb5pPI8e/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792681860;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hV2cQnNJl1Mz5rz0Pml26j+iOlvhZOpobGDer9GEcQ8=;
	b=ZhBJ22OevMNCIz2tOHoK2ICjUKfV5aowFMMABMf0mUKSi6X+Zk6pWO5DHl33PlQ+Jco/
	 xZmXIKKOjeEf4Cx8g/Akaw9B6MV7290gv1ebwat5uQzQASjzr0apriqzlQJdn/PTKSjHR
	 oQqLpb2hn33iiqWIgdVy49HAt9S3NyZPG6MMofF4qqIbU+CBdC7Rl3qgPQWYT1tI8NoNt
	 nrB4DmYTq0C/NPVOdwrDnM2vsMwHz4ast/wWMXKstb7+Sc0JZuWStxCC0elyp1sJB8XHd
	 6XVQlhgu14n0HurduTi6/l2KBriQ5xGnNo9MzSvUnNpS67qeaWM6U5wj0k+rCl2C9lg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792681860;
	bh=hV2cQnNJl1Mz5rz0Pml26j+iOlvhZOpobGDer9GEcQ8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MnUWQjJcew87Mebk3KjKkLnRHOBWpHFEH7Vvvxw+aVXRV3WRgqXPQPyFps03Z1yz+
	 cDqoObgrYALUIKMNAfaGQbLLi2DR0dqFSWcbCLsk54o+VC+kaz3SZh1QzDTwRUKq/x
	 intn19a3x9BAs+v+29QsbzLZSoACFB+VXIOlrxorn2pMBqrVgiw0O/e9AURSZuHTFY
	 ds7J/mrVSUow4+IXu2LVtU15V8zA3FRsbgDgMQ9iphki6ve3ixCrpu/WuuWQtLMRBP
	 j35077aOH+IEMv5Zl8P3GsiS40iR/8cu8CRV/tw4jYBcJNAtfOxRS7/QTKkB8CB7UW
	 Yrzn2fZIIf43w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A7956069C;
	Thu, 22 Oct 2026 15:11:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8009A1184
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 716BA408A1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5oOVGVGkoarq for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:10:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 88E7D4083D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792681857;
 b=JCqyi7hZaiCY0qaY15paP2YL7KMP6ujnT4UOesCfV5ZkmYIZUthZl4B5bMzOxcgiir0Z
 c6dl+UptrpbxVywgeWv3BibQA7Lp5bGBQOIWTfauymbbBBklvYEtPhfZ8Nn6ZbP7euDcI
 HfbcdJTtDUQroyl8gSgJRKoNLunSlVkYmA8Tw5ElbI1fzIGpbW0lRK4jUQX5GSwVGbqFu
 gSdAPs7FWCOcUN80bWsu0tQ4XVCTqSKuXtmlYQaZUC745cG3uU7wH2e+Pht4khD7zcfVo
 srgXrt1inyLRpkIhiwWpWXVGeq00Ra4uxJjpCVqd9eIjXx0R6i544aKcQ3JfV+GgS/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792681857;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dXvatJM1iShj0b+IIj2IAT9WBuC4tZPicw0Z1hX0Czk=;
 b=dgAco6rjMUPXtA/wyE/7W0ZfNWpCNwZ/EPcpMzzWKv2iDyMrWYrza3/ON8uYFrHH17Ug
 sKta1QcRFEN6a8hqAl/5ud/zUaw69WaDWWPZxvLFZloTOxSY94tl2hSsno/zRlobH9x1m
 xUqHUG4pCf7MgGdMY3dg3bIrGCJ2pSSA9LpGm3wY2n6kygtGgiUsfTkO6eImoAUPy2C1I
 DI41loVJeCUQQwZnaHvVi4tBsOMyjZFkYUINwR3LyBplEVA7N3wD+PpoFVRpMp9C7CWuG
 4HkX4IitnIGbwjdML6BlZnpqD9ZBg+Tf/rV/8UTdUiD3tkdDeTYP9tId7BlvEkX3HXw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88E7D4083D
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:10:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 756EA9B9F8; Thu, 22 Oct 2026 15:09:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 15:54:53 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 1f6d5b94bcb4254f490a8ad573d18751e16ff212
X-Git-Newrev: 419fbaa1423a08def0f423dc3e4001556ab69588
X-Patchwork-Hint: ignore
Message-Id: <20261022150933.756EA9B9F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/python-certifi:
 bump to version 2026.10.18
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/419fbaa1423a08def0f423dc3e4001556ab69588
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 32627e5b61d0a303ed6499cf589d8e2548cac966)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index a0c24e66f3..c6e0206ea8 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  926857e560a3ae443ee35c2de270d75b  certifi-2026.7.22.tar.gz
-sha256  741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55  certifi-2026.7.22.tar.gz
+md5  915d53b5fceb004991800f62b552e0c0  certifi-2026.10.18.tar.gz
+sha256  b9995d97b64d0431a5af837d8ca8cd6238104d1f319f04bd93ea43124d6c861e  certifi-2026.10.18.tar.gz
 # Locally computed sha256 checksums
 sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 17c6925ae7..5430596350 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2026.7.22
+PYTHON_CERTIFI_VERSION = 2026.10.18
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a3/c2/24167ea9858356b47a87a50d39908bfdb72ceeefe0041586e704e5376b3a
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/7e/eb/a2aa1ac3ea30dd3f30ca57f40232138b6b0040719316ecb85daf61167771
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
