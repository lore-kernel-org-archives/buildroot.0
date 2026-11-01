Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B55606A325
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qA/6Banp
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC48E6061B;
	Sun,  1 Nov 2026 17:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id heRDSAvs2YmH; Sun,  1 Nov 2026 17:07:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E568460726
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552865;
	b=MxX3JJxRtFY5yiKbOVGtheA+X5BdDu8TOR2/erDSawru20kqXotXM38A6bNDCa1x7H1j
	 VNl6v/naWmH202oEhZY2/6Dh971+iSOvvoqlcTuQOh7gbdSNDKSE4Qz/11xWZRNlvYzpr
	 44ZFnwquvWEr1PhAT35GidnvC0GYpUZtEHFdE3Qh9ycbflJnCTvRNgfH4XtLFNL7JCLhT
	 h9Rh9kkfcca1jjppBB1qzkd3eiDAmZn9le7he8yUHBoNQ78eXLnmS68cAPOHvJz2Iwf9l
	 a3Gv+0e0p2Rpm50L1rbuqX7hlRyFiMQ5UMQj84sk5abgwZISpbgAqZPA058F9Ilqh/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552865;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QrOwIcjJzqRepqGJpSuFMhXUqKdOmHyIGoX5zEX/CcQ=;
	b=KFfTFDljrbcAcAl+YW1UI2W7yUnxFpY4zfmgx8buo0z0poJOrVXPyNEkc9RpZ3VBvGRC
	 QZ3mrcLeAMkrffyBp+nfq9GVAPhDzk5cUr9RRSDIZv9UCk628Uj7MWtXqaYX6PAH3dCga
	 lTG5xIOuOxvLgDYJGG83yWBHoCZu8tbbYiwXAle5vp0SwDbq4Yj52o0VZ7u3rQJ8d+L2x
	 xvS4f5ZaLo0zUtub3CvQSwBYW7HsPXyG0Zld60pj/bt7zDCy+YkB+OM6IxYtp9fDPcT3E
	 teNCT1nTbg5FsoAJVHAu8fw4/GrJbFdtVYpr/PJrY4cIk0/YveilZL6wuUSea2G3MAg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552865;
	bh=QrOwIcjJzqRepqGJpSuFMhXUqKdOmHyIGoX5zEX/CcQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qA/6Banp3VWwro9WxJlS0dTxeAWTNoZf7JHsMp9OLqB8i9PHPa5u4yUhPmJGpyjCm
	 5GznKvXQfQhkB9evyjXcpg7dCuIUwUh2ruYExKqRuWK1KM83zFPAC0p3eUpEvkAsW+
	 L4+xvmnTLsKv4TeZ6TXryvPxqzHrw+Vb9CvISCRh8fzQ3v8Zw0scpbb6BYvKXrbF4t
	 4vu4g+izW98I9HImifEG3P0mr1dkHv0yQLyQkBpDI6rPu4/o3M4fa92gtaY5nJKDI3
	 Sby/HbCz4nQXiO2CpqoWM/MEVdfmBN7M3ysx8D8XE8O6HtRCrUrYQl6G4Rbzynllz2
	 fd/7FhEZfyfMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E568460726;
	Sun,  1 Nov 2026 17:07:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ED51EF5
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35F2980D6E
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fYR90Ng_QVx5 for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DF90680D47
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552837;
 b=BbulIJrPdzkmLgim62yGjHemWdHMm6uZXxuiX7LOiVL9wcY9isT0QU12Kr9JFHKrdqae
 32HohyQLPRQjq9/LYRMwyCYu2rI79vQmfGPpU7J/vfpWUtLYtR794j2+0Y6aquoESMytm
 bBj2hk3LgHa4x3/qfLkp4J4Xr1Lr63A8ZsrjAXY0sC22lYkkdmWzYBXjPzayIuZBkKoa/
 Sd5qH+IjFiiUpArAJT5Lb/uA+6xk/1u44qySZSoQbg4bkAAjL4lX+gu41yY6dL1odK608
 nTMxjPYpipOUGGT8ZahI5H5+X+dXaz8F5Oe11E04+vELNNV599YHTCWCHdlOrFc0GYg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552837;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NLp2XOz25DR2DSLVarSR+B7eo4UwuNfXtfh76j+SKLc=;
 b=e6btJ2TBYOU8ZkhFm8w48XTWpu9qi5TTvwd6REzITpI4vwB24K5M6zly7SHD6DdgfWpT
 VpOEWRn08VAXFyarsqChrq0mTYIou8Rm52TqbbKv7/0KfmQSoj3PEqW1kueROzra8xQP+
 om+oO6BvvkK8U109EI3Ki6+v4LW2Ule0yNcmCPTXY2IpKZnvbTzK/1Ej3aAK9zScwUThP
 6fY/bTBq8vm91aKZEtZ/AiyeqWwRqD6Vq/m7thcHBVx/G6PhLTsd3atHjCOUuxzs3B09N
 qOJr+OuR1OixevXCxB5I+2CQ3O3wKLJUgcwcxqUwhgG04IJ6J1hGSZfVcAa13fTjGVQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF90680D47
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABC369D4FA; Sun,  1 Nov 2026 17:05:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9743540ed950b9ebf172d611f27d3fb4288650f
X-Git-Newrev: e28e07a7bcfc3adb2b67c78d3936b01757c1ebe2
X-Patchwork-Hint: ignore
Message-Id: <20261101170548.ABC369D4FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-multidict: bump to version
 7.2.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e28e07a7bcfc3adb2b67c78d3936b01757c1ebe2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index f6e2ef09b5..837cfff240 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5  fd85b7ce516e9f58c6b3029ea1c8b392  multidict-7.2.0.tar.gz
-sha256  f4110a13e264858eb00697751785cb2c58ee96707d8ded5ddb8239530d3b9ba4  multidict-7.2.0.tar.gz
+md5  3f9f08805cdffa6469e13ef33c93d091  multidict-7.2.1.tar.gz
+sha256  e8af3e6f1bdbc31fd762b094133b478b89988eaebc63cbe82b1d9e3bbd15cede  multidict-7.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  2e4be5fc6c4c72a466fcb665d726e049a6891981fe536c4f04b6366749461d23  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index 2004fb01bd..d388ab514a 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 7.2.0
+PYTHON_MULTIDICT_VERSION = 7.2.1
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/9b/18/0127fdb8aa54b1d29d5b8f752af088ad6aa47abe13adaa519377b0b331ab
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/7b/6b/29ef8e752f5854dcc267ded0652c475bec99b86f255957a0d4fcad657b18
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
