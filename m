Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25159606A31E
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 07:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MDJSH/fy
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 984CC8121A;
	Fri, 23 Oct 2026 07:27:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ke3TAGrYy_Hn; Fri, 23 Oct 2026 07:27:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 805288122C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792740427;
	b=gdLFAHs3ilFEmMbIZQg6HICigKwq1TEnTQxMI3gjFxlC7xr1DW4uiN8ZakBc5cUchfL4
	 U6IJqwUzWXpFKa6M6XnW2cOTkW2XemZK+l/xqmRqrjDoZp8iV6dWP+slAN73JIjFt7Pk2
	 ONkeM0skeixhdGUtcrkjsS1kIxINPVl2iyl0La2xqpJN7uA327kIQrnVYk4hEPxGmR87S
	 QhxX6ooSgDVzEChf0e+n8r52/J287LiZf/nhQCi+oG4VN0oyTASK24iMaTo+PoaVfMBKy
	 Zvgw4ckXklRNAoWyQ/BycmDBBjlFRvgKxXzv5Lki5w8Pnf4f4jQvqqxHis1HOuvuaDg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792740427;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=S3N2E1pXkbJyX5eJ4AXaohXjWc0rix6GaIQJLJRm9rM=;
	b=a4ITU94Q5JFqNBEx+bwgUSzOOxpvUxyKnHpeAvdeoGb5oZvj2xm1180ymMDFSwcCsjEZ
	 6LHelArJkIJRQ2iFTHIe+VHI/yHbp6ld68tButU2l4Hit5wtcOKO5QGnipgTGDBD1Ug+b
	 nKvazvDgtB2JWUggGLNI1ZsWKg+SCvsrFvkFtzEmFwGMZZMn/cIoHeizCoWqTzTwbwOLM
	 oFgAOMOXEPozXpv13X6KAFwqxz7Yx92EcZqBPFU7r9R4abbksVS/iWlFHtmviTzOzTmT6
	 rT09lziX5yY59ThKBYfSjuO+LGOpB9C3ez7+azBU2sg6GlHAPhF8Hci2NMyDs+DkfQQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792740427;
	bh=S3N2E1pXkbJyX5eJ4AXaohXjWc0rix6GaIQJLJRm9rM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MDJSH/fyV1THoi925uajyRMOktExF7xlCORHEYx8QM66nqdxD52uqUuQo9MRZO2y6
	 l0xsn5Og4kpj3JEqF5rpLnQdRsOuONucQBYMPkB8ogxqV3gTRsLBr0bqaZT9gxDued
	 y1TnT8stjAEatHNvuxeKNUKfjV618fjsELkw8WtzZyfxK4AStsi7QhzG9H0UdmpXb6
	 /G212dX0HH1Rgp2v79oguJ5YegBZsi8gLHEYuNJnkhX7owT7t4oawKLMNX1NiJP/pR
	 kwVqTXc26HLToFEuEPXZOhREGTlbFL4IkOLrGdd6s3WsVJNAdUaX7ni0Ja4O6e8HHQ
	 yXihiQiyAvYqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 805288122C;
	Fri, 23 Oct 2026 07:27:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 76C0149D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68CEB6062B
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOu1EYL7ds9P for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 07:27:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EDA9E6064E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792740421;
 b=ngiOIk7jzmcRNzHlgRgSfN2ocqTSjNHNEVWYNc+ROos0hwnycrI08y0CT1yDIlBbAIKj
 Nxmw06cq/d1J8otqxx8fdy85/lpIrybMf5uIZXghtKAgd2RmQY7uu/nvZ3Y4hAC43vOO4
 Y+s+ibvcsmJOSbSPFKmwtUgsNjK0XY/7iEHS4568vFxpqAa1h8XbuWmvqOe7bWU09NyTA
 dC8p4xag2AagXAg4rf9CwaEtQbN8viLa6MU56L7dg//+4qDwTy1Mtysl/xirjRV+x0/Pw
 h4NApvsNe3sL8LWB/8n2xFmoYhXPV8ujVEVIq5/X+1mV5gtZOqBqK5NcspA85UVtG7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792740421;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xUk7vOK9ibptL6OwltJcyAHFtsAUfYNPR3JqOyR/QY8=;
 b=cinal+GWkdOxl1P4xmLYk9f2TqDASDCFQMKDC+9kLehkjSUp6UBn879MpFLpMW8tfH9k
 D1NqfrLH20vt7AYu54zoypOGoWOIu07XiNONCnxWlqAbnyQHm0LotOO816nPnk8NRbkfM
 d1ijiph8ajjhLNadcMa8gFyfx7hJqVaJa7eroribyFIwtX0lZVZTjgf0ZFWC1eb7Ljh9C
 gUdrpZ2DyqLPLAC+tmfMKHorWLhKJOXVX0380zB4j0pTfySMhxnK/kLE1unEczOJ9E0GI
 3CoC0CSyS4eLa1kNLXEyXbmActc5JFZrR2z3MtGjsb6ZlWXlgCVl+cSHdB47IyT6kRQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDA9E6064E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:27:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 890869C640; Fri, 23 Oct 2026 07:25:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 09:14:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3480dc023332bed084dabf5f0a3687c48d9c87d2
X-Git-Newrev: 15c73cbb31768c24849333f2a793ac712e89bf26
X-Patchwork-Hint: ignore
Message-Id: <20261023072536.890869C640@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nghttp2: security bump version to
 1.70.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/15c73cbb31768c24849333f2a793ac712e89bf26
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

CVE-2026-58055 [1]: nghttp2's nghttpx proxy through 1.69.0 forwards an
HTTP/1.1 Upgrade request that also carries a Content-Length header and
body onto reusable keep-alive backend connections, re-adding the
Upgrade and Connection headers while passing Content-Length
verbatim. A backend that resolves the resulting ambiguous message in
the attacker's favor enables HTTP request/response smuggling and
cross-client response-queue poisoning.

Upstream changelogs (no specific mentions of security):
https://github.com/nghttp2/nghttp2/releases/tag/v1.70.0
https://github.com/nghttp2/nghttp2/releases/tag/v1.69.0

[1] https://nvd.nist.gov/vuln/detail/cve-2026-58055

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nghttp2/nghttp2.hash | 2 +-
 package/nghttp2/nghttp2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nghttp2/nghttp2.hash b/package/nghttp2/nghttp2.hash
index 6af7b3eecb..f77eb6a67a 100644
--- a/package/nghttp2/nghttp2.hash
+++ b/package/nghttp2/nghttp2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6abd7ab0a7f1580d5914457cb3c85eb80455657ee5119206edbd7f848c14f0b2  nghttp2-1.68.1.tar.xz
+sha256  e05cb1388eaca3830aded4ccf20044b6e1ac1a61411dcca11b0437c4285c8bc2  nghttp2-1.70.0.tar.xz
 sha256  6b94f3abc1aabd0c72a7c7d92a77f79dda7c8a0cb3df839a97890b4116a2de2a  COPYING
diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
index 50b94582e1..7d02877561 100644
--- a/package/nghttp2/nghttp2.mk
+++ b/package/nghttp2/nghttp2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGHTTP2_VERSION = 1.68.1
+NGHTTP2_VERSION = 1.70.0
 NGHTTP2_SOURCE =  nghttp2-$(NGHTTP2_VERSION).tar.xz
 NGHTTP2_SITE = https://github.com/nghttp2/nghttp2/releases/download/v$(NGHTTP2_VERSION)
 NGHTTP2_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
