Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADB7D59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 21:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDB1860DD2;
	Sun, 14 Dec 2025 21:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TV5qy6QuGxwv; Sun, 14 Dec 2025 21:21:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1DE760A5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765747307;
	bh=eC0vyZnyHAiXfaBobcA4s7q2sWtR6/1oHuiGQCCwuRY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MJY+VT9+XgLR0VrgOqG013ZDhx7o7hjBa7hpUoZ56eatS64UJhvvy4nqzwm3lH+tP
	 V+AMkan6FFAUvgWgyNKjpbh8VOnnc4VcxhEvSfRxQZt2N5/kcb+KVvgR6JW1VzGDg+
	 myG1NLjp8Ums/44aC6bYGjrmUFn6lAgTg5OTHG+H884wGO5JyhNBQZFNy78l3+BePk
	 e0LD8JEsE3fMY5WdFbFwymPkoxz6dsBb1w8fjheALg7DIt7qPQnxfCaShGmPotPqyU
	 9T/e/PEBdxNfxxX6M/3H0Blfrs0095qIIqCCULbHAIs1rgpfaoeQ+KhvJZ2H1ufVBD
	 GYoZxGXyBsQJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1DE760A5D;
	Sun, 14 Dec 2025 21:21:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 58634117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC62660836
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qtmDlK_SRVxm for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28AB960909
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28AB960909
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 268608355B; Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 22:20:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc7b83aac5b75986d0b3ed14df04160876945a8f
X-Git-Newrev: 167d8460c3b35a9218ffa074d9ba5c662f12555e
X-Patchwork-Hint: ignore
Message-Id: <20251214212140.268608355B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-smorest: bump version
 to 0.46.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=167d8460c3b35a9218ffa074d9ba5c662f12555e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/marshmallow-code/flask-smorest/blob/0.46.2/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-flask-smorest/python-flask-smorest.hash | 4 ++--
 package/python-flask-smorest/python-flask-smorest.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-smorest/python-flask-smorest.hash b/package/python-flask-smorest/python-flask-smorest.hash
index 685464c7e4..f59d0a18eb 100644
--- a/package/python-flask-smorest/python-flask-smorest.hash
+++ b/package/python-flask-smorest/python-flask-smorest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-smorest/json
-md5  98b3b197fcfb944954d768f6d84416ee  flask_smorest-0.45.0.tar.gz
-sha256  1490291a59e572be5c02e0a769589584180eceba65bc1949456760856b3e990b  flask_smorest-0.45.0.tar.gz
+md5  048a22ef87f5a98d3aa9287259023cb5  flask_smorest-0.46.2.tar.gz
+sha256  7d9099a37a5add415670d6904ae032eefc1d2ba2432f060d7c048c74fc655a80  flask_smorest-0.46.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c8a48548bbb732a0bbd6a0dc2c556cfa1e6e5fe35d888cdf6a1974d69e0e312a  LICENSE
diff --git a/package/python-flask-smorest/python-flask-smorest.mk b/package/python-flask-smorest/python-flask-smorest.mk
index 323d1ec191..8298003968 100644
--- a/package/python-flask-smorest/python-flask-smorest.mk
+++ b/package/python-flask-smorest/python-flask-smorest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_SMOREST_VERSION = 0.45.0
+PYTHON_FLASK_SMOREST_VERSION = 0.46.2
 PYTHON_FLASK_SMOREST_SOURCE = flask_smorest-$(PYTHON_FLASK_SMOREST_VERSION).tar.gz
-PYTHON_FLASK_SMOREST_SITE = https://files.pythonhosted.org/packages/29/cc/ad32be9d2a2148000c4c845d234f12cee10d6ec9cc3724fe7a3ff9e93f99
+PYTHON_FLASK_SMOREST_SITE = https://files.pythonhosted.org/packages/20/09/70074c15a9644a1def601b4fc78c114d4b2f4275310bc3476d1411da3003
 PYTHON_FLASK_SMOREST_SETUP_TYPE = flit
 PYTHON_FLASK_SMOREST_LICENSE = MIT
 PYTHON_FLASK_SMOREST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
