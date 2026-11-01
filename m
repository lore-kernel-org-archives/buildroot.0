Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B99606A326
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AveegiN6
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DF9180DBA;
	Sun,  1 Nov 2026 17:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QdhlWLsKXPGy; Sun,  1 Nov 2026 17:07:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 788B080DCA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552854;
	b=Y8XDSFfArobx/7pg/3X2ImJPLOPrmEPazoCS6AoNwLyRDzhDTdlSHb4CSZfQnPT9Wv9T
	 h3Vg5IuIElh10Wzsxw4BdK5AfMcQr2yl+dtc8NIftOZcd2E6ZU1FYlyUz4OgHO5TGUvR0
	 Zb1raEr2h59QjSy5ZtBod22XfvaSSDdA+KYKlapCIYfZ5YkLozIcUTmhUlr9slBeLaFl3
	 rowi27fvaXtG7QPS4TJxLNjr+HHl58eMuZglgf+oXXcNG/go1iPVbQwhZufBUnHonla52
	 GPmu6HJvfi7D6ZSu3pkBxtTuGmdYfeHb2lSdMTYXo/7rVSDGbYBdQEV/ZxvloMUad8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552854;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BzPyyLT+qCmBvZ/Zc6YoP5pVKjcXQOBHLOhyQazMh4k=;
	b=OKqnx96YiEFJq3YbuQKvjZENrx67T25JitSzXads1h+gpsmbhIwTQZ71PaN9VreL8EQG
	 dOPCe6kYzg/4192PkgXOAWx8dfpXI4eoNZKkkQvRRcnpGIrmEllHYKSBFk2SkPDUF2SK5
	 O4uyKUMtVKcNmKDnWd3WjNAhWWdIau/pxYvovWGEDzBq9tWYougCpVlPL1+wFumliVCNt
	 LGwVviNCpMG0EnEMZqKcmjHWl5PwJNP9S9oVDg/wj9/BUbcmmHRAn2FBCXxLrzUHDAwVx
	 znkyIIJ6gEBT+dlKUHzd9ace+ml72yQV4yUbgUnzPVFXMG5wVY6i7sAylXXqdJPc1tA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552854;
	bh=BzPyyLT+qCmBvZ/Zc6YoP5pVKjcXQOBHLOhyQazMh4k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AveegiN6a9U6d8JeSJl/4Af9sPcgCWoiEHgeUr4w5P08EFeBntt4eYQ8xYGxaAjbX
	 MqPXkQ1oQf5AuLb7hkQzoeZgwLN3xBV+YFRv1f8u6ktGWcCJDoaqbx6MEOqxvo94yX
	 /w5IYYSP/+94vxxJKW+CWE2QMNVUvLiRh/lIsnYozZJzJlnBuLUAbaC57Bb930dJS1
	 3rHO0+ZeyEVAV4ihZv7VWgnQ7mX2HU6Os8+slWyEI9wfmPYQF/BNrMOepCvArOVvv8
	 553lsHfLZk1+eHjngRvAGklwtxl3zSREwz2L7JVzLzAK4034HRDziMaMxT+kUpYLB+
	 yi8cWtJ1//Etw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 788B080DCA;
	Sun,  1 Nov 2026 17:07:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B0FB3EF4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 935FA80D6F
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OFXBZE2cWqjH for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A96B380D1E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552837;
 b=HXaQQdC5QE+lFurADdm83oa0i/E8MEdWche68vM6nzHPeHWNZR5gdAFm76ETVNr90744
 nPIhG56nnWh3qSHAnctJZBIdaDAQOJAFOiE9gF/hXDQp9rare8bsdod/VeymIX8p6By/K
 GwSabxcUTEhVSXT5S+69nwKnfDVVbk0WIL09jScC0nfYOngxQiKQRHaMcl+PJnC0wt3GJ
 lvmAM5uoy688nz5x1aq7wiAkRF6jL3BIugU+sdY7Hg7TU58oZWy8a1D6/aK/btAltIM8e
 6vqfgbJcCnd7hM1zblL5Dr7ImKKJiiaaT7AS9pZfmA4aoICGafTWO/ecU2u2p3KSj+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552837;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=US3uzCFZocJTOmmYvU37oeZtEFtVOLnaJJW2kFhtJkU=;
 b=cqKNOekIqPPPmZrTmL5zbDnBkd5Z+7bxWXdd0sY3+CI0mTjdS7lt5nV0SkgbSMhrc0Nv
 C3Z413nC2+FWjkD9aAPGdLIj74ULQk7ZmeGXLUITj12PdWt4SGHxfzkRvKDrq+GRDebrX
 7HumfDaFyfaMUKxHW4v1MZCsHPq5W70sSoPEwyrqIDMSv3M6ci5f7jfwTKWHBrsRM7ppj
 gUdcyuGzXeRLj5Hws6VPWsui8BgMWJEIvhFJZExUM8ZeMeySdFardrOcbtqhzmLm7lIU3
 iUTu22ofObEToQ+raCKN8aaaWZeBgtTpURFDwJkOQ2QeEweXC8RkCb9RMsvyudZS4cg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A96B380D1E
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 768B59D4FA; Sun,  1 Nov 2026 17:05:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1abff70e816a73b426c8d0969c8f43b19f62423
X-Git-Newrev: 974cca19ce15eadbe259a17cf6ac43e9cdfb2e96
X-Patchwork-Hint: ignore
Message-Id: <20261101170548.768B59D4FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ipython: bump to version
 9.18.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/974cca19ce15eadbe259a17cf6ac43e9cdfb2e96
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-ipython/python-ipython.hash | 4 ++--
 package/python-ipython/python-ipython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index 69db31319f..3a5d5fe34d 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5  4f33ddba6d57ba2a760d2f3436ff3006  ipython-9.17.1.tar.gz
-sha256  8919be8c27f20a6f4423145028063f6637b42a03ce57665bb12015ee1f073529  ipython-9.17.1.tar.gz
+md5  05d70129fbbf763d51ad3d61f179926b  ipython-9.18.0.tar.gz
+sha256  93ec98e27d5ce494c962758111c7dff1ef45f9efdd55604ae70a7d4cabb3e1ea  ipython-9.18.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8387aac32433e5b121c355aa9e6ce2b9a399da7edd59ab94b19d4f5326b1ced0  COPYING.rst
 sha256  e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index 1c8682cf36..716d75d386 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 9.17.1
+PYTHON_IPYTHON_VERSION = 9.18.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/b9/32/99451b1283ec5d92ad77073f12e1c667dc10775384d8f15c2914207149dd
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/c6/9d/fea7fe7e360b6a4992f00600445849374675d82d665ffc194aee50c314ab
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
