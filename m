Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9834606A31A
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 14:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=B6DiI++l
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A44D8407A1;
	Tue, 20 Oct 2026 14:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZKDvkfw17zZK; Tue, 20 Oct 2026 14:03:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 92368407ED
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792504992;
	b=nJAe+wIskeSlFyo+K+lQWtgn13RjXl/1rjXAQKYmkQINa1XZvEM6VRW1e+pj7wPqbehx
	 ClJ8jVxNLssuuriVwUyFM/Tf7nDZIN6NuztnnZV1WnXwITpXj/9X6smGb8KXJ4oCqTxth
	 bKLug+6euZVMPOYbePA3tWLS3LaVxkSqzbE3ZoeK1Ecn4zv009vPzm9S4awtH6lbZnRvd
	 VfbdaNwQw2FeioC/NkXaZaAw8BTJcgeU5YE8p5Otag1YU8joUS3iEFJSb1+eAHvALJZr7
	 J1sTlK+ga8VuW1Bmwx8gtd112qtEh93L0JC0hj68mzcF0TMjm5UQ1gvW2ajHqXAvs9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792504992;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ysTtmwKecrWsCosGDeG+cPdy55xX3bmb6Im2nOsZFkw=;
	b=aNo6CoF68FVFsGKoMuAgwxH26GWnmqesYp3MFcQJGspiNqF3Z0uymmhMyR7qtFsBa7CS
	 tIV4rCtGA+0q8NDP06FH7mwxBelOmhQqm0vTllb6bRg5N7O6+e/4WcE1TvQ1PaG+MpV5Q
	 BSHjiir96oVdNLSEkSHMop0Q/007sYaOk4AUEZPcce2N7yx+Sy7qCB+pgZBk0IUcCVqJp
	 q3oK2yFeIOHfjK9efoK833rkUf3zKVmGmOY7iGc4Sr6xdlSrheBGEilYnH1kXCG5wZlWw
	 yr6+imEAclF9zbsvPm8SqPjTtvdcFW7V+iUymX4hl7oNXMftZRoyZqdLI4QIwjW7+Kw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792504992;
	bh=ysTtmwKecrWsCosGDeG+cPdy55xX3bmb6Im2nOsZFkw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B6DiI++lG1V+0qQmnRXT4hKtziL3Ejugecwc4v2znuSyWmWtVDaz2dh8nwOVG1TXY
	 psciAb5N8//7flPTR1542E41jxGi9hTYf9ql7wU4RGbvEgseaYkkZx13HgBR/DcC1r
	 8UUt9m930cnWkWQGs5sqUyCLHyTaYY524eIhPKskeYOpachZA0HI5rT2wSl8oZsRij
	 pd7ING84bPHW5FuJbP8PIG/1d5VAiSF5jt+jTqzlWiIh8i4yXJz+/haLx0LnSJSnDK
	 LTbFMDgr4mHc4oggfqPrXLtPpvOmVk1LbC+GxmROu00Xly+FxfYuoS/TWuf+jIfuXA
	 J5R9Qi2k1zDpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92368407ED;
	Tue, 20 Oct 2026 14:03:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DADAC1AB
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0B20607ED
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:03:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9beodIutvFOC for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 14:03:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0AF2D6076C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792504990;
 b=IgLi51KQOvMoa0BEZFQxU7kr1GqcnVVUE69yl11MIM0LQZO+uVEqReIKa5nvq/XXlBV1
 TBSqemkSsxDrxLWByP4qQ6YXc2L+fN0rztwPjoD27WMhctQ860jSunDSdieG1r/cQGvBC
 KFa0kSnLC9M7AaOMRf6Oe+Ey1Be8StQTnX7/Pq9GCs92BD0jrp3jB2Qd5gEm41A+tCa69
 NjThv0FHitHLu4c8n8OmEtFUO3nIsvFUDgy5+PhOj3tBTKSuizxVgfyXZ49oZ8eyRPQA3
 +IaZEzRaqTmDtiNsMtYBYybQ4R8qFecVgat8jVJzJvCHopLoHvjAldFYNjmtczgn4iA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792504990;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KZJUXzMJhjaX7k5yQTSPCdlAKCS3BfvmTh9TFvt+k2Q=;
 b=R9ZDpws/9GgAJ1bNODZN5sWKnZM3pNo2qIbFly6AICZRvmJOXEfJyRjM1IVNCIWQI+V9
 uI3IhtvNp6BRbBAECtc+cOeaOowAMBBQSSZeOazbipcAHt+zCyxsUHuOiw7lFDifA5cSV
 695ap/dM4NvDkveYLDYxyIt+ttyTRKbLgfAKygPXl8WJ8QjwykgLO9tVUy6Ahz+FDa+zz
 vFv1NI/zBpSJ0o5a8V35eQnCG3e5g+M/z5KT3jhhd4eQ0jo8vtvlrlhnmslSe8H23+BV3
 Jio1nBZmi6WoyYk151/zLXbz14OsmkgYDrbUvm11+Eu92CdWhTsnZ8UFdeZjF5E7Nsg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AF2D6076C
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:03:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4DF69974B; Tue, 20 Oct 2026 14:01:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 16:02:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af83dd919177a7bbef22ed315eed696705d01afe
X-Git-Newrev: 4e0cd646932be3631f87f37ee08e5d6c09e2565f
X-Patchwork-Hint: ignore
Message-Id: <20261020140146.E4DF69974B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: security bump to version 1.27.3
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4e0cd646932be3631f87f37ee08e5d6c09e2565f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://go.dev/doc/devel/release#go1.27.3
https://groups.google.com/g/golang-announce/c/66pojueaQek/m/tmWX2Pq9AgAJ

Fixes CVE-2026-111943.

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 6a4b03ad35..828f809395 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  03495da2ba64894d40f5c4992e49454fa78b50690604ff92b6afff5081b76e62  go1.27.2.src.tar.gz
-sha256  93dae4b7f463ed1e9c65e05561ce9fc5f7cd5c4ffca5e336248d48f3a2eab5fc  go1.27.2.linux-386.tar.gz
-sha256  ecbadb99091a3f46e31f5f934b068b1864eafa7995211b39eaddf76996045fe5  go1.27.2.linux-amd64.tar.gz
-sha256  94f3e30b8e374bc285e7dadc11e0865726b9bc6e85b841ccceaabc0214c6b7c8  go1.27.2.linux-arm64.tar.gz
-sha256  e25a174051d8675f87ac720aedcd25bf89ac652c4b82f26aa47919524725ed95  go1.27.2.linux-armv6l.tar.gz
-sha256  059d5f01b1607a724ea5ae87c5589041a51c577a6f3f20099e49d00f31c803fa  go1.27.2.linux-ppc64le.tar.gz
-sha256  dfd01d1e08e4dbece2cd91e259953f87b858752037fd151da2f674c4fa09aeef  go1.27.2.linux-s390x.tar.gz
+sha256  6e7749035cf360f06b2575d162ea79df9fda8ef671889e5c375f8e50777f26bb  go1.27.3.src.tar.gz
+sha256  cfc243057c03dd131413b91269d16b5061f87f312059c1ed78681cbb95d6afbf  go1.27.3.linux-386.tar.gz
+sha256  65efbc80fdc1fa2cd2631cad5b481777a68e8725f34e89f50fc6ac714e379b40  go1.27.3.linux-amd64.tar.gz
+sha256  a06e99309dbcbdca1a8ccd2282c3ee146e55930886e26b4f1193269587165f49  go1.27.3.linux-arm64.tar.gz
+sha256  d6f4e11dd7157030d7ac11c51c8f73201a2db932d593c3106b1da11cc32bfdf8  go1.27.3.linux-armv6l.tar.gz
+sha256  f180f01943865b7942ab3b4acbab6da6f0f669b61da999d004d16c537a49f7b5  go1.27.3.linux-ppc64le.tar.gz
+sha256  62e109a6280a073c9025e1b51ea298ec1d3575d3ce62238721311f5ff2c854e6  go1.27.3.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index df6f0049bf..88b4163ce1 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.27.2
+GO_VERSION = 1.27.3
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
