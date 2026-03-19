Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2282F483E7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B46D608C6;
	Mon, 23 Mar 2026 19:48:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yEWHvjel7Rhq; Mon, 23 Mar 2026 19:47:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79B99608BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295279;
	bh=+7jYZB5xymnwb7MXlNpekpoxEXpzQnNYsyRHHno7LUM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OdNi57v/UazZHZN0fLpc0Wb50GCS5VbLgsQC0XtfFBFprVATOiCDJaL4fcq8hfnsp
	 H3pySCEq6tjHu/SqLJRnDzwui3B7tqLOym6SBn90EHgigabFtA+knqQAT/Bx4tvJ66
	 ZDQRErWBLCVWUU0T5+r1IWJ5KYb+WVuTRhZLCtTaxumjmYKANTKxU3sNoHVu/lq9Er
	 Kb92CzaoxJ52/3mrY0J2JIZn2Coa1pLOxbshJrM8E3BTtFgoPSbVUIONAoKu82da6s
	 Umt4ZNCesxrrQJKjaQHwZ/OmdVpkz8XeFa5mgfIcBQvWy16Vp5T0St/omwEKvS/uxN
	 9+FRtMrpP6I4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79B99608BD;
	Mon, 23 Mar 2026 19:47:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03726F4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBCFA60871
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QPp_96WQQITk for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F130D60878
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F130D60878
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3AA7282B5C; Mon, 23 Mar 2026 19:47:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Mar 2026 11:56:31 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 588d37a5000a0180e9166194a502801c0ec8bd6f
X-Git-Newrev: aae6fb35a0ba75ebd4930d9e9854956b2f817085
X-Patchwork-Hint: ignore
Message-Id: <20260323194729.3AA7282B5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/python-flask:
 security bump version to 3.1.3
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aae6fb35a0ba75ebd4930d9e9854956b2f817085
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/pallets/flask/blob/3.1.3/CHANGES.rst

Fixes CVE-2026-27205: https://nvd.nist.gov/vuln/detail/CVE-2026-27205

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 52f46b24efc3b7ae86378d9d543cb74889c4ed5b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-flask/python-flask.hash | 4 ++--
 package/python-flask/python-flask.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
index ec2e5d39f9..a670bf2e58 100644
--- a/package/python-flask/python-flask.hash
+++ b/package/python-flask/python-flask.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/flask/json
-md5  62ae81cf2e91a376af909a2bc8939e15  flask-3.1.2.tar.gz
-sha256  bf656c15c80190ed628ad08cdfd3aaa35beb087855e2f494910aa3774cc4fd87  flask-3.1.2.tar.gz
+md5  4dd9abd8b17b66338a02ac45fafa710b  flask-3.1.3.tar.gz
+sha256  0ef0e52b8a9cd932855379197dd8f94047b359ca0a78695144304cb45f87c9eb  flask-3.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.txt
 sha256  1e07e9c25f2618a040560b70e63f42259eab24e558d0f3532e6163d751cb4eea  docs/license.rst
diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
index 8000489366..70994189c5 100644
--- a/package/python-flask/python-flask.mk
+++ b/package/python-flask/python-flask.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_VERSION = 3.1.2
+PYTHON_FLASK_VERSION = 3.1.3
 PYTHON_FLASK_SOURCE = flask-$(PYTHON_FLASK_VERSION).tar.gz
-PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/dc/6d/cfe3c0fcc5e477df242b98bfe186a4c34357b4847e87ecaef04507332dab
+PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/26/00/35d85dcce6c57fdc871f3867d465d780f302a175ea360f62533f12b27e2b
 PYTHON_FLASK_SETUP_TYPE = flit
 PYTHON_FLASK_LICENSE = BSD-3-Clause
 PYTHON_FLASK_LICENSE_FILES = LICENSE.txt docs/license.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
