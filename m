Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C665D606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 20:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lV2w8V9a
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A72BB60A5C;
	Fri, 23 Oct 2026 20:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lr0MBfPuede2; Fri, 23 Oct 2026 20:27:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BFF0A60A5E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792787248;
	b=OkkmlnEFiwx+nYLFTR6bgjvqZZJcWWtKV2HF8vXfue1oe8YQL1xixvoJy0l7kGDBW0se
	 H+6pn3t/A6VfYMxArYcQktLWwnNq1hwJngP22FWGQmkbbixcy2hKslK5+mPpR+6Pk47F0
	 qdl4TDkFdkkyfazpW/CGTOrTtE3ZSLz1OA6vn/lEq4AizwFDfAYWue/cnYcibfoKfdB3H
	 wdjkoqQvWJip+JrYBpnlihyxFLLf4Xz1HzXigifJglLpaNumkMvldgPe4dHzX4rD5zRzE
	 PHwaYCuyUabRZE4YtISDi0UEtWnnR6/fXCbkOqcYogiO9fR/xkov0vsN/Y5u4Q1vnhA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792787248;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mGaEe25tt8uoJTQe5ODE7keAeBqFR+0guytS+9GR/4A=;
	b=ZKWq/E48D8dA8hsAPoV83Y+5p/QvCOB7HqRnkTUmHOWdwueYqdc9PZZL9rZU3BSeb1sL
	 WvnTaTCt+SvSmEeMJuJEKkKV2JgZ3cX5mXCJXSa/pM/3lISxn8lQvYf6EDJ+lWBHSOeG8
	 cI/qUyQCfQpxnj5fUEdLzwrUv/X+hdlg9aV455mdcqeSyX4dDE0pETLRbGkA2aFTSApKh
	 mXb3f4+PwKUzw2+DURskJp6ZykFzSO6Nu3pDwjnhKQOEz1vX2Rgq7TWe5FoR+azsmoMQl
	 +kW+RBU+pdUPgy4iBdG33xqueBV5ntm+hJNS8Nvfwrh9IChwDLcjO0MjDeMOB0EnHhQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792787248;
	bh=mGaEe25tt8uoJTQe5ODE7keAeBqFR+0guytS+9GR/4A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lV2w8V9a7xZbb3VjMLiZzMRJm9d6kMAh1p2m6U1HRTXTE0SdDnGnzqKYHM0X/Mpgf
	 aKapntoz40iJGfwUrxPiKybKOtt6B1AfnVoeiXkUEwV2SpDG0duVbrFhQhVKzTDpsb
	 LypThczMfMJqHvfTqdAS5KoCUg16K9fQAlvpS7SHcYGHvYtJs2x0NBp+XNGi85sH33
	 HQdNY8g7hNi3wvsOb1kGHHMD/5c5NqfZfe1v0zQsLhCl7LfQg02wGj2IsBKmxQAPJw
	 U15L3m7lAu5MECgylq+NLiV5XGBX1kg5nJ+jLFGA8SxcEEIcAgeq5EaaF9P0E8RHLP
	 ypUD4I1KK94YQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFF0A60A5E;
	Fri, 23 Oct 2026 20:27:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 886A0356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DC6581685
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pbp2N_E6rTmV for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 20:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 908AD81678
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792787242;
 b=SSMZllwhFPbvZ3XMm3xTDY49xIEUONbuJYxKRwBRCVtaywf1P649FQE0e44kO1E0O9rA
 G8sQEL+mOWteYYWn6eJb1nr3LrDKuhJsqPLPjJLmhwb0ehRJG/WNV3YYXXgDENN2S+9Lr
 P7Q5+N5p8Zyg+lhNHs2C2TE8kvMxS0KQvQa3qm0pLHiMvvJdJ47AaBZNZXINsh3nHrL39
 MD507VFLarXOC/yngiW7/kvOzD+t+yhB5VG53Eqdl5wu4Xh3Sgi+o/0jaq6EiTCIpuYLo
 fE8Cj9Eh6UzUZO9aF4Bu1vlqGnyfAmTK3JjtUskoNcbfDqh1gfF0jvkduz736zeQ0xQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792787242;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DzYumAEybMxDpzrc+C/z1Yopr0KtyEtetaGtVzik8NM=;
 b=eWqqSa+WmVv9Iiejgablt4q7b9CNR9uVNB9yCMPR7kpLC8Y3fSxB1eOn5yI11vuj/KVG
 rwSHgXShL0DDM1dlYdPO+iMm24+DDh0Cydb6k7Oo1bonQQvHL/Sc1EelJEFDngYk+THPK
 7yg4xA/+dsgpsaT3Amxf4mb7wl8Obyfjck65dY4zKdHJ/oSskDELJ3/nqfsc0S6Lqdd6d
 8en/sq8kwC6eTlLnS+LIJbKvU7T7WK4O3hfGFm1DJVLXnHsc/pg5crRQVEh/3PlUEXA4o
 zxXNxm8zYWiEojosbJ2HIgXsj+XR/a0tnr/JCHFwqGLBwAPv/IaOxiyoVB8ePByiM6w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 908AD81678
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:27:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFF1B9C675; Fri, 23 Oct 2026 20:25:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 21:59:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a52b7828c6e5c7e7569712fe2ee84716014011c1
X-Git-Newrev: 2d69b7f3aba9e386f67a0a403075570ffd1211c2
X-Patchwork-Hint: ignore
Message-Id: <20261023202557.CFF1B9C675@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cachetools: bump to version
 7.2.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2d69b7f3aba9e386f67a0a403075570ffd1211c2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-cachetools/python-cachetools.hash | 4 ++--
 package/python-cachetools/python-cachetools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cachetools/python-cachetools.hash b/package/python-cachetools/python-cachetools.hash
index 3145620cb9..0d1ed1532d 100644
--- a/package/python-cachetools/python-cachetools.hash
+++ b/package/python-cachetools/python-cachetools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cachetools/json
-md5  cc17ff466a8a3c11920c5f9744719db0  cachetools-7.2.3.tar.gz
-sha256  e6fafd06de4a5bd915ff7d247588ea497e28c9a568c62db8678d9a5f11515a9a  cachetools-7.2.3.tar.gz
+md5  cc09f6909df2d4c8c1db9af8572f47fe  cachetools-7.2.4.tar.gz
+sha256  e0203b04b75fe13e62098eeb5b2018c4eb1a14c04e2b5b450e70db3ee7e92ec5  cachetools-7.2.4.tar.gz
 # Locally computed sha256 checksums
 sha256  28c000b52b0ee27138a68ef778227e4057046e86b65f62f1cacb99b0cc49e0d2  LICENSE
diff --git a/package/python-cachetools/python-cachetools.mk b/package/python-cachetools/python-cachetools.mk
index 73bd924bc2..9d1e337d61 100644
--- a/package/python-cachetools/python-cachetools.mk
+++ b/package/python-cachetools/python-cachetools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHETOOLS_VERSION = 7.2.3
+PYTHON_CACHETOOLS_VERSION = 7.2.4
 PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
-PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/09/88/27fe0785c7a9aa285c753db0b4ea967adbf76128fede66379c35a4b8d054
+PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/3a/5d/15ea0494ebcb9062c7ca79bf026cbba380a50538ae73753fb40bdffa79e2
 PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
 PYTHON_CACHETOOLS_LICENSE = MIT
 PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
