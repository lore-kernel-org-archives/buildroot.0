Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32705606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZHFzLrK0
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 137E540BD2;
	Fri, 30 Oct 2026 14:07:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CWV_rsVispun; Fri, 30 Oct 2026 14:07:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 028E240BD1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369249;
	b=IKLKGSQ06vRr9MIRVdWy9Tq6qQx94bSW7o/XYsApUJIwQSrDZ+HEJdqNS2sfu10g1F8C
	 Y5KQeUYhXoYSEPgEqm+VX1OEz8FIOvwv6TdPiVmks0twqPSgng2pl/Psi/JGKz1i5ECp5
	 cnYHaG3T+b94qn7EG/38m0Ro51jrIDp638F/l0hj5Cdez3X9nfz6KEn1F/R10IJAWuudO
	 Ys4S+xUgNthDQoeJe915OCpSsZTdFwx473o670G7bXOYGE6yXmVLclnG6nKTgM9NPwT09
	 BvrVKjtYkVrDN+3YLQmI0r4P+fYmQdHjJgz2UnKqmzVK07ALxV9TTrH1Vrf7f2OKmzA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369249;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=uB6aXyiQhfid6Tc/INPI/9isw4CGgSxhEpBCJvMQVac=;
	b=flrasTldIbwk3Wq5OZk1Eq3/9xzNxmCNwodBHCtvCbT7kBxhQUICNEgN88uTGhADGv8R
	 oTohGFN6DTGvQd61zW/+ej57It46QtwrD+gRYgxjG5NK7lpkIUP3GRVUFT2bwquraCLh0
	 7IWrhMdZqYqr6i2T8HaQyiAPmbEEvp0RXV4jv4EK2icV78PZLyye6QbDS8pVVvO2CsbzF
	 5nj8qQhQbINdIZoAjPbfqFaVRe+sIeWqpaI5nsPm4gBf6WeHdYJOlJzfG5Ns4fDN9XGBR
	 uXtaU1hx9JpsbOOi7qj6Ig46ysc7lL0CDGU+c3UdRoUWW2ZUz2KgP3fsJNK8RpJXDOg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369249;
	bh=uB6aXyiQhfid6Tc/INPI/9isw4CGgSxhEpBCJvMQVac=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZHFzLrK0u0ddcA7DSwamY3A0qv6oCbIiF+0IHy/XNufeWYjMot6kBGm4wPe/OuFPB
	 Lvo2M2a21qIj/E4lDxn8gveIUm+2AawFZHIHhfxfx2SxJhiVgCFptfBMITeaCK8iFk
	 6dXjaSotPv/UcDy/s8OgHhETtEicIw9hKFmXmbZqxYJXphohER0BeUu7Lu9g6ylPk3
	 7UaCL0tsnDNGJ6I42ehXKQfBWIOS8jFrSj8CL353ayxENRrGKvRfHDXHjRs0qX+MjG
	 CaKw5+gwMe3hotKB3mBXZD5osONxncl5bGbVRC8ydwtpye582hWs5hnW4SMr6eWvx/
	 dTj49nEcHNLzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 028E240BD1;
	Fri, 30 Oct 2026 14:07:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 71912D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 525608118D
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VmJN3vMlv-kP for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2B26D81193
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369166;
 b=fUCABa3V1ddpSjw6lJrodsCxIaTDsVRuGLZ/tCbTclNUsfU5nOyytIHaevzgQaxTU7s2
 aqfPU0zdhrct0cesN/WBixrtSpV/g0sC88y5tDbfFrYs1aS0Oil79FujM9o71AIAH/CfN
 b2uBWah+QVbph/B7KWZxG2ocWuK2q1TX9SNRSZ+pDQS8E4g88iWe5CbhI4AFGgN20L+ei
 H2Sjubj2ZQ6GtEQ54EWmmTPDp6i/ylwPy5JGQ1phDX3nbrKyuF2+QprMPYcY/Qqjrigwn
 BT0cIREC+VPLbrDuL9tkSDI48jvLngeKFq9LSnHAgYzYUywUYfZoROpKo4qZCctxNkA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369166;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ymFbyUh0n6Sv8na/nXT2H7JSTmjSZkQXUIwm3MMeACU=;
 b=X8DbeniX7BWmQBe7zfldGcQiKqdzwr1Dpsikw3Ri66a2shLqu8fGSPiwCz7clZ37vFj3
 pDxzka4Pq70erVJJLm+DCSLZymdrG1MPCJ/2Nudr0WG2RDFeqCAtOom/VgbZKesAkPtEC
 VKyDJNafozLRShIS3YjDywW5nO6xax2tXyu+W0VUNxxn7dIWI5H4CdjVQVIANqAQAzxoy
 ztAd6hLMuNgHl+lPZRHxgygZH5U+0WEbPS/c5IJ7JlZFrxoY8Zo5/vg2E4mDMsvpZBDJv
 aq6G+dqfHxWijl60Hj2CDOXqsV5TT2jvSz4ia0XORd3pR8oNvj2H0ZyPId1s46IXsAw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B26D81193
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 496249C668; Fri, 30 Oct 2026 14:04:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:58 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a2fce459c553f79579fda5fb239954c7f8ea488e
X-Git-Newrev: 56ecbbd904a075c80122e3248b8ee2bd78f44f9e
X-Patchwork-Hint: ignore
Message-Id: <20261030140438.496249C668@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: bump
 version to 3.116
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0680495590292522091=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0680495590292522091==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/56ecbbd904a075c80122e3248b8ee2bd78f44f9e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_116.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b0b77bb90d4151c989443524aed11025c4353c88)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index abd550d5c8..c839d58b80 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_115_1_RTM/src/SHA256SUMS
-sha256  b8189c030b528e57dc5290023c07eea429ce242912a51a0388c184c75a257bcf  nss-3.115.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_116_RTM/src/SHA256SUMS
+sha256  3938611de4ad1e3b71f27f3cd5ea717a5b5f83bffc9cd427e6d929dc67f2bb73  nss-3.116.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index bc6d71a7e5..9f05a3f582 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.115.1
+LIBNSS_VERSION = 3.116
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============0680495590292522091==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0680495590292522091==--
