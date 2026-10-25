Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC095606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 11:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=W+UMmszW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB9A060ED8;
	Sun, 25 Oct 2026 11:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4o7Q-tqHzfmH; Sun, 25 Oct 2026 11:56:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D120360F08
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792929409;
	b=MXKaluc+rrp8gQJ/3gI/HH/v56E63v4nr1mtkTm3MyJoj31MauYZZ+IL/IVv3cLwK8Kw
	 nkrs9fQqR0Ax2M6tc3wTCMfPh2TcsErPVs+BDB4YDWQNfG4/ph9H33YCpeM69h1Kf10U5
	 YXQDsimuVpcuAGhxhSzCS0Z0OLWjoyq1TTiq4fhQd7B7UjE7ihnm+pfZZsP8EmwmHlv73
	 NhQXt8cLEWMk+woP8GKoYGy8nR9fZiKO7GH/8hroz69V6qUkZMExPXUO3QmTS5H21TIIZ
	 tsEChUXhENFUY+yLBzbr178kuJzIEvQVSec2qyuPf26KvdDXkgsuNaKidlKdTPK4b3A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792929409;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=N+Qu6f14Iebio+KYPyB+8X1jNBNbpHtPxX0pHxit8NM=;
	b=eHIfmXjwZlLOxvIun9KneOtJLdr8vnj96SbBm6F6xH1Z97L2lXHzczS/p1+UCcLCrU5B
	 TBdTDDvk5gNoVZ/bGHL4VMUh6GFzX/+jvQ8rhoL4pPSepQWKHaUO9ZtF+0fPvio30KjID
	 acQ8JP8ovy3cFi2oZgxuh8NUtT1wbu5SFp/QLdQklmSivIzp3D00Yh/whrvmvvTXWL0bZ
	 Q7ZnxsgiI+M9qsvixVm0cvxYCXcc+8jyVmSael8YCiiO3FsTrwdlebfZ79tcyNVqB03wW
	 TZXP4aVsw4TUI2cd80yPqMSCbvzlufdIoV355XZIwW5kUYNdL5oQ9HOdj17HFZdKZxw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792929408;
	bh=N+Qu6f14Iebio+KYPyB+8X1jNBNbpHtPxX0pHxit8NM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W+UMmszWS/r2J2x1qfArIk5j0okM2158cOaLW5VR38OyEL1JfbMmwPkDz8sae4WW3
	 tq5x9wMts+433nhkmrp+3j2UxzE9M9uEjug7QlCZ90tsSIi8flN+RIEWiyn/HtmGLf
	 KzdNrht+UTkrD9+GWPHO+6I2upIVPSCO6HvTVQM5rnZMfl0/1YKiUg0J1lG370twI8
	 rh0rfeeRl4nZPV8IErxjPiZ3jQvbzmJv8kd1aCdXYxt00DKnnwJtN1fRGqBS8RvS0q
	 CG1U03I2/SEjVMMRawzZE/00OjMgMyMVCbvqQ6UXjM9RtoSVfzJNRnA/u9edCU9DVw
	 RaFydNvOaccCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D120360F08;
	Sun, 25 Oct 2026 11:56:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A17E3AF
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A3A4406CC
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8vLeV5nfzrd9 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 43292406D7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792929387;
 b=eFYqee/l77XODx5tC4angFgqOxx7PWk16Gw+e24ckdPmKWc21aX5ifw9NjIOBXrgWxcm
 6Y1BlPbD42mH4+WWU05uW94RXM873kdyyxcmaTxRyA5i8yn+6JjC3fnecXFosFBZ4Kz1h
 2tQgnSQHwjLoqdpNGQnoUTUXvcNRUmyBmIlapVIQxbTayoFl25dimD/Af+rsMyiIdzSYw
 qY7jTvYVZYZ7Xr6LqdJCHNMxMubRmdyUE3ocGUWiOpHRXjhtW2vpFo+fIkYZKBNPsXMJ1
 klASbFX6s01mCJwIMGrWkzOY5pNGatOzcFrCWXuAbQNeoTLsFcjQ1igxE5b4E194tNQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792929387;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=p95yLbVYTHjwCoODdDT73OxF4kKQ1uB0UEMvDNO/6no=;
 b=UhNgsnnH/L2jRziEm21FhYUhD1zvt/020WFG8NkNaWNCghEDhVTG47kUft1I6JmcQe8D
 a3Oq31W6inSAlN6OsdwTtfnvAld74m3XN2dqqLhWUy9ZaiFbb34OcxAUhRrYk/CVqwlpw
 Awr/yfCrjeSCm0cjr+kO4nZXC1i4yXdgkidhf414uwF/hG4LJXY6rA3UWiEV+GzpkFVLD
 RoT74He5jMQMSS9uoJVuPT9itmPMKm7DrDGcExqYXfO00VwCwM4B9kSbJliJvtPIYB7Uk
 w7Bv0ErKLXEzCTBiM+W0pDcggKNIDvU5vUZk1cVCU9xBrnIlieeTstsl2l0BuVMCGsg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43292406D7
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D734F9CE82; Sun, 25 Oct 2026 11:55:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 12:03:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 121f2be8e7b265971e2a5d3a55f1352f7214c535
X-Git-Newrev: 8a5655889d7d212135a28133e716a9f2430ce5da
X-Patchwork-Hint: ignore
Message-Id: <20261025115501.D734F9CE82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-grpcio-reflection: bump to
 version 1.84.1
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8a5655889d7d212135a28133e716a9f2430ce5da
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-grpcio-reflection/python-grpcio-reflection.hash | 4 ++--
 package/python-grpcio-reflection/python-grpcio-reflection.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.hash b/package/python-grpcio-reflection/python-grpcio-reflection.hash
index 9d00dc378d..42540564d2 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.hash
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio-reflection/json
-md5  45379372e331e398a56919114493ea61  grpcio_reflection-1.84.0.tar.gz
-sha256  06bf3d7d8cef9afbcc721ee52191652b4483831774255e174404b0e0551741bc  grpcio_reflection-1.84.0.tar.gz
+md5  fcc7b785c8283697cba440e9c32e6260  grpcio_reflection-1.84.1.tar.gz
+sha256  09d72642fbabaf45f8fb9c86b0d3cf45945fb7c7c1c4a2dd3321dfdb05cbe2f8  grpcio_reflection-1.84.1.tar.gz
 # Locally computed sha256 checksums
 sha256  58c86a3f2b5cca0ebdf9ed3e7f4e6dc38e3b38796d8c3dc92064c62a4e39d0dd  LICENSE
diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.mk b/package/python-grpcio-reflection/python-grpcio-reflection.mk
index 9218fb0010..1b5f909727 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.mk
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_REFLECTION_VERSION = 1.84.0
+PYTHON_GRPCIO_REFLECTION_VERSION = 1.84.1
 PYTHON_GRPCIO_REFLECTION_SOURCE = grpcio_reflection-$(PYTHON_GRPCIO_REFLECTION_VERSION).tar.gz
-PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/6e/8a/94af17ae0738cc4508af96d5f107f352e2b54473eecf32f0ed9bcdd895da
+PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/d8/16/dc6673110945d3d2a17d862516b67e0237dabdbaaa6ea1c8ccd76fb704b1
 PYTHON_GRPCIO_REFLECTION_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_REFLECTION_LICENSE = Apache-2.0
 PYTHON_GRPCIO_REFLECTION_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
