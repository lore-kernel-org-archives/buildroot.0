Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5B5606B3AE
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=M3tUJve4
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 482EA811C9;
	Wed,  4 Nov 2026 22:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TphZrHyhx1v0; Wed,  4 Nov 2026 22:20:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 38301811B4
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793830829;
	b=KXJNJolnN13icz58Lt8saO/4I1EkY8S1Hv5WQhUrsclU5a84mB4B2ZcxjTsixTb7Koq5
	 mUUAZGoWOz6Ows6eZJL0fFZkYkzd1KBWfD5bI+yHJSX7oWh0P6i7xHGuziQJqgZWbTY4q
	 Ev5grumMYcVDAfX+6uRzML1slsLWjQD0np0wfaTXDmH8gNtgtjITlvFsOyCW2a8PNkRPq
	 wL9BmAa8HpuvSC22/2lKsfpC1LcZtFWjtiu3TpdA7rDzosK0oDT6TFUjOPhBIUGkNEBT9
	 f1OqF+J86b/5TIAlKS/u5hrjyCpWl4+hWvxwXcqnMahkwg7LyZSXEPbdOXURj5BizGg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793830829;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=D9QlSJq8Hn/fwAhe44Qf1v+eBTGrXzXVwza2UDibUpM=;
	b=Esfgueh9/BqlmO7hSqnXZgpi7UgRk6VvrhUpByX18sUu7xna6+aBrXGy6AiNlZCVgtSs
	 T/lOvLlxoDCj2h5HqVUok1ZcvYSj8TmkoWu8tJoSMIZxmnVdKZCrWoaAYjuGc04Hs08KO
	 wFFz1mu1WCf2alOTekY2lRdxorv+mt/lS+8kZ2GG/lQaFjZuUgTsEJc5fcKgJ5ZOHoYH+
	 avqDSWfc7w6/CZj5ld1EiMMEz95izWHnEr5BC4ZDd1erGnlbG52T655jBC4BdG27P5uD+
	 oPlfaqPPNEia+B1slj8VrH1G1TYI4uV85AlJzFhwLHew8c0m0s2upqU/AbKyBul01mA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793830829;
	bh=D9QlSJq8Hn/fwAhe44Qf1v+eBTGrXzXVwza2UDibUpM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M3tUJve4DUBg4lTOHYF8IYsYexfnnZcYPmYFduxH87ztZyDTnH15XaiGpcC0/6k/X
	 ed5gc+0iHc/sLJh+tPtRnMhUE0K3uxb5BuxIUBcJ/5yJImKtWmGRFPcB17IlqddWx3
	 a1nrL4bLOU7WN+rNv9CkFcivo14yw8LcWCevgnBIf+ouED0wirwiig6aZxZrir8btl
	 YybRZJ6Yb1XWDnJZpNvctCUJ68T7hhSxZdiuwPwy9senPfih6IwIsHianCvrlinOiY
	 vLzi7aK8nX14hSzmvepQsIIDEuR+DoVuh4Nd4Lc4ge3G6Us2Sbl1z46xjA95VtZfu3
	 QxPoKDGZTFhNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38301811B4;
	Wed,  4 Nov 2026 22:20:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E9CA41789
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D00AD40812
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zOjeOKVkBobc for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:20:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 175BB4080E
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 175BB4080E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:20:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37D169DE54; Wed,  4 Nov 2026 22:18:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 23:19:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10c2e1e45ab61d9cd2edd9078f13fcca8ef399c7
X-Git-Newrev: d923d33f7dcc933ab39e30eb26ef8e0d870e4210
X-Patchwork-Hint: ignore
Message-Id: <20261104221853.37D169DE54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-zeroconf: bump to version
 0.153.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d923d33f7dcc933ab39e30eb26ef8e0d870e4210
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-zeroconf/python-zeroconf.hash | 4 ++--
 package/python-zeroconf/python-zeroconf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zeroconf/python-zeroconf.hash b/package/python-zeroconf/python-zeroconf.hash
index bb7b23c268..5c8c545c8b 100644
--- a/package/python-zeroconf/python-zeroconf.hash
+++ b/package/python-zeroconf/python-zeroconf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zeroconf/json
-md5  0302be24e93b51a8f1908e9acb1c2a14  zeroconf-0.152.0.tar.gz
-sha256  8768de190d88124c4f69665c5547f6ae33366024db76007876bbff79cd2509ae  zeroconf-0.152.0.tar.gz
+md5  c0c51f9944cd79c016da81daf3e14ca7  zeroconf-0.153.0.tar.gz
+sha256  28bd0baa208f4ea481a386e9eefdd3a65663fada34233432301a0c221d741d1d  zeroconf-0.153.0.tar.gz
 # Locally computed sha256 checksums
 sha256  73b9e1d4dc992630bbc22b4519f437020446bc8e913d0ad81a3292a79275a251  COPYING
diff --git a/package/python-zeroconf/python-zeroconf.mk b/package/python-zeroconf/python-zeroconf.mk
index 625097cea7..5358810467 100644
--- a/package/python-zeroconf/python-zeroconf.mk
+++ b/package/python-zeroconf/python-zeroconf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZEROCONF_VERSION = 0.152.0
+PYTHON_ZEROCONF_VERSION = 0.153.0
 PYTHON_ZEROCONF_SOURCE = zeroconf-$(PYTHON_ZEROCONF_VERSION).tar.gz
-PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/15/d2/7fa1e89251245a7135f13a653ccf0c8db46ab4ce1877007285b9da7e8865
+PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/c2/ad/e321ee148e871fdb257e9fd5840748d06a72db132815ecb47d42d13b1a3a
 PYTHON_ZEROCONF_SETUP_TYPE = poetry
 PYTHON_ZEROCONF_LICENSE = LGPL-2.1+
 PYTHON_ZEROCONF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
