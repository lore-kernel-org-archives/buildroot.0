Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8133606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pLBi95S6
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC1D180D85;
	Sun,  1 Nov 2026 17:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pz6BzJfEBytr; Sun,  1 Nov 2026 17:36:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C0FA280DB1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793554583;
	b=Llz6tPy31VoU4lYfiIBBOqqRHF3kymVyPyeh52DcB0/R4oacu623uNIuxQ+BLxtCjV+l
	 EukQjWvpBx7UYKjZNASD2J8PVmDgg7TTMiax0dafoVxaqVGoZgSNEBADGIY8IMiiPMq27
	 dChtFwg21g9Rgwi3SzPoc3qsMyw4xXkgaitX0/b7+Ut2ZKYV8NKSHiap+doJPU70jcaSD
	 1EHN7Kvx9Kl1L6N82fPRvpZV/QZiPhtTKzImUI6IqgBY3fqA9hdOOEeSLQR3EDjSQEi8y
	 iLqqh3a0kF/NshtrYUObzxDTK+r6nX+jibiQFOkOkD0Pph2EOPpAu+BEKnGv2mpgorQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793554583;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bi/HYGoas8BkPQShYYcCX2lUmRgS+ZFq56l+7WLc41s=;
	b=lRxvXHpsLz4H0quHo50z6zGUyL52yvFvmzryfYNTDMJRoQaJz5jYfHae4eA0m8B4iuHK
	 jiicdcYKIemlzJlItvbtx7xN1ZWhKfF60jc2AS0U1MiOUSALtCgdp4s8iWv7Kwd/PbjVZ
	 50YfQ/o8z5q+tgjHC7mwDSCIB32jRPFJx44cxKvNXxQ+AVpI7CVvaPmDQrdCtW7wQBR7z
	 H/S8bHOTSxQiUSXorKEogyudXlHNGri4U7fjGdSJ+K35V75C+JriKLhvFDABl03iO1gr9
	 3ZwHNV+JSeIFw0/sw7OoH+eD4LUlPouB3lFyVbRgYdbH5RP4+CKcrI7F3F3SveDiCHw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793554583;
	bh=bi/HYGoas8BkPQShYYcCX2lUmRgS+ZFq56l+7WLc41s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pLBi95S6/w4rgi0WZoc1ycYNMzUO3BVHH79QHq4zcM/zsMf1OlQJgJXR4+cXvDS1G
	 QbX6EiJ7dF/nHPhbxHzVIg0xKsPWF5CBl+EuGuNzf+yGxH1POQOgArQmmuNwPo3u/n
	 W0NAmzlNXzjsM82jA/K6hJcnrRDiXxq4b/NfmEi7hkwSb0jJSfSI91JK9VLi1neG4f
	 uub4FiUGEVPXH6ZaGMUlFPpZat6K81jKSHEV3nEWyU1/dHDO18nIVlPXajWQ436b4i
	 u6N6me7ZHddjcDweC3GcBKeHR3/9Wmm1D3UU+pWUUtJqxibckuXhSKyswrhP5zn+NP
	 C48t3J0C9NRhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0FA280DB1;
	Sun,  1 Nov 2026 17:36:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B9384EF4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C5E080D8B
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:36:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 10W2XeUDh6PB for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:36:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C393380D87
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793554577;
 b=R+c1bseN3jgQuzmvYewInIhA2xdC5s9NcbbUM4bJdAS7z2XVzNearuflcBB4xH1RfDnh
 K4XAZpPPX40hG7K+7FNo4pzQNPO4NJb9AMXufarI7majHbMJ+VbQW9fX0wP6XWH4JveWC
 Dzbhetj5qS+jDpTMWrmzxLbc0tl6WE9DrKW01v4D4KbYIbWf0leegOPib9qd+fmAuHm1K
 MYRC7Cu/VZSZVmfT2AqyyZmxl4jmHpAinIutaxSapYtVKFtDM8/N9LLnlXEv00o8jC5Pe
 RIytg3H/FYYkM7GXykNCj4fIrMoYBEZ5JVo5PetDVBccrE/kJ++/hMEaqtFMAO79G3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793554577;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4IALoUBWXf9kdTQD8ibXAagONtBoorUpYgDbzFVO/RM=;
 b=GJDerAk/h2Wgtipm3hV7OUtZWmBIomI78MMXXdBQ6T9DgDWtMmT1RItlcDv36m/Q/mrS
 Mcn2dX/n0szgkw+fv7KOv+s4lM21YNl+gD6SmkhtERl10+t/7VO11g0S2p+yAzakkheKt
 XR70fCcRWJEwddx+cS3ltnz+JURRg1UShVOHri5GyKENLuro+/vx7gJHybERQnqH0B0+u
 5GOeodP4Bus2ZfEL5R9/TD5ouqarCvBUWwHqScTbZxF6p6CDi6wZ0JnEkomBM7o+QNGHb
 zOapn7gEp7gVhkaXlwvXcrlp2tg4kKMlWCTWTrjDxeTwzCV5po6KVNuEtoj5QIjCfGw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C393380D87
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:36:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81BBC9D425; Sun,  1 Nov 2026 17:34:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:16:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68458f39d17e56acf627534f29a939353036410c
X-Git-Newrev: b8b2c911faa952dfb5904273464ea21aaa347518
X-Patchwork-Hint: ignore
Message-Id: <20261101173448.81BBC9D425@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-socketio: bump to version
 5.17.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b8b2c911faa952dfb5904273464ea21aaa347518
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-socketio/python-socketio.hash | 4 ++--
 package/python-socketio/python-socketio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-socketio/python-socketio.hash b/package/python-socketio/python-socketio.hash
index 4d08c01e50..d8360cbde8 100644
--- a/package/python-socketio/python-socketio.hash
+++ b/package/python-socketio/python-socketio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-socketio/json
-md5  dc6b5c68686cf88a4919e83fc0896719  python_socketio-5.17.0.tar.gz
-sha256  c3bbfc4937dcfea7c4d1b182afa94d4a30335d153987e8f2078b344beacf95a0  python_socketio-5.17.0.tar.gz
+md5  ed364a997052808b3d249630ca907817  python_socketio-5.17.1.tar.gz
+sha256  2a3183d7172e5ff772b9c24ef94f1fdf84a09b746925c997b7687ae8017f7247  python_socketio-5.17.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-socketio/python-socketio.mk b/package/python-socketio/python-socketio.mk
index a3a47e43d5..c1a2d6a249 100644
--- a/package/python-socketio/python-socketio.mk
+++ b/package/python-socketio/python-socketio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOCKETIO_VERSION = 5.17.0
+PYTHON_SOCKETIO_VERSION = 5.17.1
 PYTHON_SOCKETIO_SOURCE = python_socketio-$(PYTHON_SOCKETIO_VERSION).tar.gz
-PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/b9/04/8647675c93b5e74a3daa41a2a03930bac0cbdcfcf307900f0441ae6550ba
+PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/f6/a0/b3c6cfac960bec64ad52b83e7baed825ce256f8506b343aed10d2dc5f747
 PYTHON_SOCKETIO_SETUP_TYPE = setuptools
 PYTHON_SOCKETIO_LICENSE = MIT
 PYTHON_SOCKETIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
