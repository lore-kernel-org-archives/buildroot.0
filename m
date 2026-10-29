Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5DC606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 21:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=L66zHvZJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C037360A70;
	Thu, 29 Oct 2026 21:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5sE_FK_EjZM6; Thu, 29 Oct 2026 21:42:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 07F0760A79
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793310155;
	b=lF6B9QGeo7+lPsB4LIzyRwmZQYEPXKfJNZQfQqN1/M9YssL+LGblkfx0gnVa3dD7OnyX
	 OVhOqBGQo+uKzU0A8sLBrouTGYwfuvdD5QDF5U9YWgGFKkcf9p8rFWGmVFocBYX5dhITw
	 bA69xzkLWALqDcVIu6HmRKSdUtzzt3jpAIG9GrkhujBrAoKOM0DyRndxRDNWrcacKExGQ
	 F2/4nzs87ywmF1dtzsi/xTvq8ItQlLuEJliVHRrmGE04Yin+TpL262e/k8EPAng4Umdg0
	 976aFdLZYBPvKU0j3M5hDG/la8CzZD32WC96jWqA2Jm77O0R7avZSlWZgdumAnCPkjQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793310155;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=l+pKWTF2HaCuQCmSf36tB5wgGsXKkm/eyJC55bUY2YQ=;
	b=nqK4p9chBTa9b2++yOXLGygccO5CoFatOGh3k4Wl+1Nzzf6E4+6jihhDsZoMPo+Axf+f
	 e3zjXWgckK9jgbOD1qXqv9G0q52AGNp831dwFQM7UHdrYvJVbOpH+fLaMqS8h4zbkogUn
	 FFhXZ0omVv9VBjwJJMbfI2BUv7PGYGOW+I2lNM8kqgYc994GYLsNqgh0Gb9AlJuthABj/
	 9XyRyqZnuakMdipl0rL5gUTlB9rqkda5Hb6NTNO86ffLDZRQbgMMq2X4FlcjjLYS4i6mN
	 UPE2Xf1V8OjhIXHwjkK7XZMlJQHg7kFnLy8qOn5RjN0CwPSK1ajmCJAfI/GtIlmMu+w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793310155;
	bh=l+pKWTF2HaCuQCmSf36tB5wgGsXKkm/eyJC55bUY2YQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L66zHvZJnGHNzfK2maCwFb/8kHX/WVyphxmPaXFZ3hTxxVDWzxGY3LWcYL9+ZyZaH
	 fvKtjb1kHhbswdnxbfT13FXazcQP5tjDFJfMkId+mv0zVia5uQIhgKkl+EQvg1KMqn
	 2RJhFqY9rs7CvH8Aeh3cXhdgCJ7bvEsx5HF935Wglr5ntwcO57KvrMJphdqvA3EeK0
	 0Szzss4kHIdBpOTlkAmaPr7+U6e57rWiWdmCRX0iQvWvpc/v8CS/ZflrOat7dHLsIv
	 BrkGDsAqwfteZaaSYvOCw278QU1Xs4zsJXYCgECFcv/3MioMctcSZFqfap8Y5WqaZ/
	 BkPOrJsuoTO0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07F0760A79;
	Thu, 29 Oct 2026 21:42:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D4B562FE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB33C81061
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OebMjuHxdwvk for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 21:42:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 92DCD8107C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793310152;
 b=rQqsEV1/ClZnE9pxeNdHxnKhth4uDUfVJB88kHTN8a5PKm2/JKIViQsmfsDeFwOWq0sB
 1TSfnDOWE0J2OAHmIWA5dHYgDJBIoAQOmLavvXgkZZObKahbadozSsYYktzN0/+5NY26k
 Ho7NhaDvwVdpuIqg7Nl8ze8f15hptQ39UroLCtjFTV3veMLORqFLCpFFoxW1whmrBBuss
 1WJmyBsIe5NIuPfDt3EY4jnSe5l0DO2tAmnFczF3j3qF75Jvf3L3R2y4ebqc4pXe3/K8E
 nZIWV/q5OiAnJ/otgJu0EKbPXgNI/+7gF22iS9fuli2SH2s8zm2/roaRxvaRLi0FgFQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793310152;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=tIVjBup9jhfJS+Wq4LpZCAoQCWLcaEnyjPBvDUtIL7M=;
 b=ijf+5JXo+OkmqvuqO4XjptN7MvZ0++R1fi6t5+K0vr1OO3WEaRTBdMjtcl1gRHYXzpJA
 yuJev9GuaX7Eg2HgOj+nGHassmRaSldB3bAM89C+26bERwaQ2wfqRU9Esi6IFMUOTKwGa
 rNk/u21ESqk+tesXrYSSXpBAZ5zAGH2Twm38VC29eJLFOn3QMI0dd0ALQfPN83XVIDDp6
 QE4Gz5sd6pTcQd0bOcz4soEiqg1wDsBXQiOW8gKVr1KgKWfzaQdxOsPqgfXDciCSD3Q/X
 +u0DG2lldXNTtidyExowjS5EVPWeTpyBc/QkURzaOpPktRf+rDNOL2+C9w/Tf+EmGoQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92DCD8107C
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:42:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F09309D307; Thu, 29 Oct 2026 21:41:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 22:36:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7227d18384e2807ae2cb25a67ff0a2e0bb6d9d73
X-Git-Newrev: fc7d8b6b899ed85fa7c4ee04653e390751bd3711
X-Patchwork-Hint: ignore
Message-Id: <20261029214104.F09309D307@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tor: security bump version to
 0.4.9.15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fc7d8b6b899ed85fa7c4ee04653e390751bd3711
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.15/ReleaseNotes?ref_type=tags

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 37dd1e6000..dc7d35fa67 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.14.tar.gz.sha256sum
-sha256  182449ac1c8ff43278da27b69b02040e11d03d0327db6d9126e4190ec6235e4a  tor-0.4.9.14.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.15.tar.gz.sha256sum
+sha256  1911f5b216a6814ed143a08bbcff1c6dc96d2ca3b505df9a21876080a92963f3  tor-0.4.9.15.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 49b9524c26..3f07cc356c 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.14
+TOR_VERSION = 0.4.9.15
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
