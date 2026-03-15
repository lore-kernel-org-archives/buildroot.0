Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D429F3028A
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BCF940952;
	Sun, 15 Mar 2026 22:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MdbjHAzk508q; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CC5F40AA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613083;
	bh=YzFVzr6dQ/Bb5GIFlPGB8+N9PSVIWQXneMi0x/92Vg4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NLdIpH1kvQF0G4tqmAEcbgx7E3x3M0AWXuoJkBRk/vuQcczHfSou1UksmSf3J7CDX
	 zLE5l8Ltgzz5/4qu4yzBpCbxo6ZufZkP38wxY0g/WyZodc9IYZslaeMILkfO3vi37L
	 7K8MfuGj5HRgBz3R6MCYBHMvXZJqCIsa71msaeotIaKUVb4MWVBQ+YQv9323ERh6DE
	 0596jv8N9bTOCg8PWikew1ZToql5UAGyzq7zlT05d/c7rjp1YENpEzHxGXjtCvjXif
	 TCFogaEzg89YIB/JVVjy4OZ/mbWqLRfmHip8KGGwSrd7QKWzg2rS79jTxTUenYrytf
	 cpUyvF3IfeHhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CC5F40AA9;
	Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 895CE357
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F8B8409C0
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kLBM6_6twFlO for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A167740910
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A167740910
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3FB98285B; Sun, 15 Mar 2026 22:18:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 16:21:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09299bc5511d23432729fd33e72291609e106d65
X-Git-Newrev: 9beb705fc45358fc03f0887117bb1d7bcad6ec55
X-Patchwork-Hint: ignore
Message-Id: <20260315221800.E3FB98285B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-boto3: bump version to
 1.42.68
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9beb705fc45358fc03f0887117bb1d7bcad6ec55
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/boto/boto3/blob/1.42.68/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 29d4125fbb..a7e3ba6476 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  67045728a35f4e764ad826fc31006746  boto3-1.42.21.tar.gz
-sha256  9b92943d253bc837323079fe88460e741cb2eb80abaebcb558b2446bdb4049d6  boto3-1.42.21.tar.gz
+md5  8e39cbbb73c8eb861e2d2d7a5107c3d2  boto3-1.42.68.tar.gz
+sha256  3f349f967ab38c23425626d130962bcb363e75f042734fe856ea8c5a00eef03c  boto3-1.42.68.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 3d7088ddb3..7901c671a3 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.42.21
+PYTHON_BOTO3_VERSION = 1.42.68
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/27/36/999f23a821567334ecdfaec31fad556f5569383006543be63fdd1e17193f
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/06/ae/60c642aa5413e560b671da825329f510b29a77274ed0f580bde77562294d
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
