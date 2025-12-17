Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F98D65C63
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD25F40F9B;
	Wed, 17 Dec 2025 21:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RtW7bpUwP0JQ; Wed, 17 Dec 2025 21:45:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67E2B40F80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007910;
	bh=hCGE78D+YKUeMcFNfTUHT48IvyolagzG93GCSGxyu/k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WFGEZqyldH5AeocvalDRucKH6ZFeiYtAqffcafMqSpTZ6225z28Cs3KsmmZZvcvM6
	 t6p9BEv7KZ9tRCPwJrLU1CXkT8V10eaJLMGphd8nNilKfLbKFGFnCBZ8U7WPCFovod
	 246OkMZPjmrGmzB2d89GPtD8RIrHvOWHYoGN+GTWGtOEJ15veDbutXdUUTnsNDVNkF
	 CV6HRH06jdTy8x5Fb/N7Hb6+dJo6taUdQk34zjbKtciPPhMcAKH1AE9tXOEtV0J6Gp
	 rB/VC43w6FSH31buVTGqG+SzjwpGeyXdiO6SsoFEZv1AzFXrBTNSv3AkWNEjANVnB3
	 Rax368gvv1C5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67E2B40F80;
	Wed, 17 Dec 2025 21:45:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 204B1375
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6067A401A0
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HWp5idZ-9rE2 for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44A2B40F7F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44A2B40F7F
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4380481E43; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:08:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66d834b8f054573a36f0e53f5e6589259b47c86f
X-Git-Newrev: e3ccf2a7a0271018003a2ed408a71f80296c4403
X-Patchwork-Hint: ignore
Message-Id: <20251217214458.4380481E43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-types-python-dateutil: bump
 version to 2.9.0.20251115
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

commit: https://git.buildroot.net/buildroot/commit/?id=e3ccf2a7a0271018003a2ed408a71f80296c4403
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/typeshed-internal/stub_uploader/blob/main/data/changelogs/python-dateutil.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../python-types-python-dateutil/python-types-python-dateutil.hash    | 4 ++--
 package/python-types-python-dateutil/python-types-python-dateutil.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.hash b/package/python-types-python-dateutil/python-types-python-dateutil.hash
index 321e7f56c5..29cd158640 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.hash
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-python-dateutil/json
-md5  75621f393711ce76bb7a7e46902384db  types_python_dateutil-2.9.0.20241206.tar.gz
-sha256  18f493414c26ffba692a72369fea7a154c502646301ebfe3d56a04b3767284cb  types_python_dateutil-2.9.0.20241206.tar.gz
+md5  e55e57c4c0fc636b20f1ac3b48b49469  types_python_dateutil-2.9.0.20251115.tar.gz
+sha256  8a47f2c3920f52a994056b8786309b43143faa5a64d4cbb2722d6addabdf1a58  types_python_dateutil-2.9.0.20251115.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.mk b/package/python-types-python-dateutil/python-types-python-dateutil.mk
index f07e327b86..6a9c19185a 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.mk
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20241206
+PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20251115
 PYTHON_TYPES_PYTHON_DATEUTIL_SOURCE = types_python_dateutil-$(PYTHON_TYPES_PYTHON_DATEUTIL_VERSION).tar.gz
-PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/a9/60/47d92293d9bc521cd2301e423a358abfac0ad409b3a1606d8fbae1321961
+PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/6a/36/06d01fb52c0d57e9ad0c237654990920fa41195e4b3d640830dabf9eeb2f
 PYTHON_TYPES_PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE = Apache-2.0
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
