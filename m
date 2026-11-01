Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA95606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=H5bb1ZIu
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D4D680D1E;
	Sun,  1 Nov 2026 17:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F4iCrfn5Cj4O; Sun,  1 Nov 2026 17:07:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1FFC280D3E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552850;
	b=AtCEuuQFt2gWrb+yq7mjhK+fXUTG0SZvJV4Ni7Of4A/Nvs9VcytJVH838tsuzBs4g1Xx
	 ooMSGUIHTP682e2nCkR2sFf92z5HiRof9eMYJnAclENvp4fFmAz2S3yukpMWzlgO3+wT4
	 pXYfnTqLeHXGa+ZElcgbQdbwu12nuVzrfQCrYed5prprRqccaLlGnER6+ga9p9dMkrsjx
	 thosoSYz/nQQxh1MMrv7m5C+r3GEy4JpfsLI4K8OEmEWhXHS+LOykDVuyDCUGGV5wy/yK
	 NkWShpJNWVLNllwxv9ICeP4qrsBD92QFnuqVD7xVVE5SxlIUjzETFZAZ2xOYLvknECA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552850;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=uxRTX7jRbAxBzELl6z/zVosHeMWpiEu4K8+V3aA50zA=;
	b=SLbJjgdp/lEDIm22mcnpONbTZAoY62W9g5vqVGG1+qCRAqAsQVQZPWc//qz1Eg5iT7U4
	 BA082pLwsVhVi/Hd8UX0mtGX2BoUsvqCzRpGsP8z8uK3kvx1/TEt1ZliVfz4wXCZAGGpj
	 4XzGS8Ca6l2rA3p5NVO4HCJL/BK3ihAhO415ZSKYjcdxws8NlOCt/ziVpK+Yve0JFEv9e
	 JbFp9j3nIQlj9Jm3BBI87CiUZkpqMVtE1QkhOil8NZanFe4oVNLrcdzcKuoOTBsU+skdl
	 zchr+gxISYoruxnO1N0uSXPVg53gfmfI+tBm3Pzu+M0C0G1mxvPP4jdH+OdomBz8I8g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552850;
	bh=uxRTX7jRbAxBzELl6z/zVosHeMWpiEu4K8+V3aA50zA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H5bb1ZIuXJ2OgP8Eoa15uYUK3PyVkM2JaH9Ii3YJZE+09EfstQL4qX9RDj3MOmbGp
	 rR68XN2uypoZEbCl2v0VplE76Uq27CGHoNzjC4Fhknk++0q+jCE/lMkgwSFkeGgNPB
	 f/amXjVpaKHgTtswlphepz6/FhuYsamJ2hsxXedyUADwwX4iLH/3qhB6SgwUAblotm
	 K7DyBiZw4DjzeRsUvSTqdNqt889vlKHYwThHtUY3/MoL4F/iYVpeVwOQGv+VUob4Vh
	 Qi8C4DhG2kXb+ACFvIXeeeiUK8vMUUWPS5436cJ37sYkDuUSVMOfIgl0hZWzfdVTcN
	 +z1Uw5vWwimuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FFC280D3E;
	Sun,  1 Nov 2026 17:07:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 87885EF5
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 797D5405CD
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKTf5U3Ief36 for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8E2B9405CB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552837;
 b=QWizS0UrPF+71ZMtP6HXjZaS8bhefo161CatFhoDNoewmOy0jZhTJgW+ntdBeLflN/Zv
 Z34du1fmalScLi+8L0QHpTBUsOMrGp4JmXK7p9vUf6Yhq00mi3cborsxTV3Cx67w8p+b0
 8vNnBJi/KQlUAG2rODtldwslx3Rw9s2sWUeofzzy+9LY1RQ1Pyuiow9ztwn2mun6itZza
 zffuaSnekz4LzGJFl80w9s28w+2B7t5aDPr1GzjFobnnh8MYBg9szRTJdamnGWUk1+9EB
 VqkjZvAEt59H9vugFjZ+NdjxGoQ3Mk0lJMzhfEWBZwrp/SZHUw04C63bj5WiEFlth9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552837;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=5LxX2ofykLMJuBgI2QZBEsDOBsk0CcAIQgDqxS9WKKg=;
 b=WeG4DbTei7x5fLK07S+ErmJ6b5mBi5YV9IZcadzU8wV/qhdQXWW7uDWdhz+ZMgAhWlcB
 e+K+vfzdqz2j830ib0Ol3jJz8UE3hhMz3vnJiHdH5I3C8L6E21yHhu+mvf550ePffGuli
 /RNYUP2KSlsgGeQM2/o5tpWLHoc89noTqYVINyFsi67EVLoBqD7hha6cBE6s2vy1n2pm8
 dmM0C1NyfewdQ7uyr1Y/6j4fXS4sqiwhIxV5hfZf66qTqIaLsUnxFOPOK3QAH/QhUBWWp
 ApOQAR2UH/7taTdQdF/JmLttaot/I+6lD6v09+z5wwyRVk1sV/3hsq/oMYwboypGzlA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E2B9405CB
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5914B9D4FE; Sun,  1 Nov 2026 17:05:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b3703ef0d2c8ba0352b1db198cc8e29a13f7e0b
X-Git-Newrev: 70ab32df6ba7474acc117993a769cc8311dac86c
X-Patchwork-Hint: ignore
Message-Id: <20261101170548.5914B9D4FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hatchling: bump to version
 1.33.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/70ab32df6ba7474acc117993a769cc8311dac86c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-hatchling/python-hatchling.hash | 4 ++--
 package/python-hatchling/python-hatchling.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hatchling/python-hatchling.hash b/package/python-hatchling/python-hatchling.hash
index 82a28deb79..e99faa0f46 100644
--- a/package/python-hatchling/python-hatchling.hash
+++ b/package/python-hatchling/python-hatchling.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hatchling/json
-md5  537991c82a1c02b1c5023fec65972966  hatchling-1.32.4.tar.gz
-sha256  c4468f73144c054d2aab4ef0f0378c43b9878bf07f8ffd6b79690e970d375f07  hatchling-1.32.4.tar.gz
+md5  ceb27e40e3f0adc9247db08816d8c853  hatchling-1.33.0.tar.gz
+sha256  4c422bd4d554fcff5de5b73e9596f85e41e9f97f7e553d8f7595ecb31a627bef  hatchling-1.33.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7f143a8127ad4873862d70854b5bd2abd0085aa73e64fd2b08704a3b9f5c07fc  LICENSE.txt
diff --git a/package/python-hatchling/python-hatchling.mk b/package/python-hatchling/python-hatchling.mk
index 4a116d8837..ce8654cbae 100644
--- a/package/python-hatchling/python-hatchling.mk
+++ b/package/python-hatchling/python-hatchling.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HATCHLING_VERSION = 1.32.4
+PYTHON_HATCHLING_VERSION = 1.33.0
 PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
-PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/f6/97/b5312f01a8c6daf729a9d272dd442e0c546dbcc630495788786c4b567ed0
+PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/7a/f1/e47b937226ae3b093bbd0132eb0b7ee5bfad12c2b5324afd10ae49946b05
 PYTHON_HATCHLING_LICENSE = MIT
 PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCHLING_SETUP_TYPE = pep517
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
