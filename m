Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D84D4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 532AF83A73;
	Fri, 12 Dec 2025 07:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PkRTBupL2a1y; Fri, 12 Dec 2025 07:56:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5017683AEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526191;
	bh=VZXIMYsSCdU0ASnR1L0HRobCG1+luQacIYwiuCp2VPk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HllUqeyVdZucyYFSp02aw10Kx2FNl0mlodiQQhr5J+THQHYexoLhJSWKb9Qz6ioCU
	 dXIHcwPlMs7UZnLpEUJK1LMoc1f40hl3xJQxFQO2PYs/fFGpR5+DEXbE1gPVUhCh7m
	 RnBB6LnXKgKUSIlxTw9P8vejaauDNQC5OavH/6TnFeAAm2GVOQ2a7St2uFIhsIa7Ze
	 /bj9so8e8/HwlFAebkO0Ikpjgvb2nibAJt1RkXcmixN/llyCrSY7DvKaF7MoWKob7j
	 6dWx4f1SLFpgUn1B85FutBiQujz4LZRVIzMVR7DrDZkcHR+ke80BKrnjNrGM+Wlgrc
	 3mMl/PTG3mrLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5017683AEB;
	Fri, 12 Dec 2025 07:56:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2ED7F2C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C658D41190
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GwIZKN24tsxX for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DCBB41132
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DCBB41132
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7AA8386CA1; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Nov 2025 19:38:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f05cadc2e12028909081af09c0ed8d673a47d8f4
X-Git-Newrev: e4ddb6a8923e7e8e3ccf699ce6d842c1e5cfa609
X-Patchwork-Hint: ignore
Message-Id: <20251212075535.7AA8386CA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-msgpack: bump to 1.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4ddb6a8923e7e8e3ccf699ce6d842c1e5cfa609
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://wrapt.readthedocs.io/en/latest/changes.html#version-2-0-1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-msgpack/python-msgpack.hash | 4 ++--
 package/python-msgpack/python-msgpack.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-msgpack/python-msgpack.hash b/package/python-msgpack/python-msgpack.hash
index 6cc5bb14c6..d17cd026b1 100644
--- a/package/python-msgpack/python-msgpack.hash
+++ b/package/python-msgpack/python-msgpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/msgpack/json
-md5  abcd18fded80a89c486c0446f112eb06  msgpack-1.1.1.tar.gz
-sha256  77b79ce34a2bdab2594f490c8e80dd62a02d650b91a75159a63ec413b8d104cd  msgpack-1.1.1.tar.gz
+md5  b69973fa3325abdced4051f5ef3847d3  msgpack-1.1.2.tar.gz
+sha256  3b60763c1373dd60f398488069bcdc703cd08a711477b5d480eecc9f9626f47e  msgpack-1.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  492dedba85da5872f78e6091bcd1fea474d660d35acb4dee964b8aab3f007427  COPYING
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index d61e0963a1..76606268ae 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MSGPACK_VERSION = 1.1.1
+PYTHON_MSGPACK_VERSION = 1.1.2
 PYTHON_MSGPACK_SOURCE = msgpack-$(PYTHON_MSGPACK_VERSION).tar.gz
-PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/45/b1/ea4f68038a18c77c9467400d166d74c4ffa536f34761f7983a104357e614
+PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/4d/f2/bfb55a6236ed8725a96b0aa3acbd0ec17588e6a2c3b62a93eb513ed8783f
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
