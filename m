Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FC9606A31B
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 10:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gO7TAT/V
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2A8660688;
	Sat, 24 Oct 2026 10:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GFP3JUyomoCZ; Sat, 24 Oct 2026 10:33:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A74D660A41
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792837997;
	b=DOBJg6myZFefh4jrFj2yMenIT26yMEs2bsdom7sql+c4RAL5Im+6r0u4qtql546Z2enF
	 1oultowuLWMn5omtPcD87YqvfvJMuDqS2wlYyfdMJI2EC7XW8JuQXwKuYXJqJk8Q5rPUt
	 uYHt0lDL4LJE+gTQGy3pzsaPZYTic6h9DMQhdk3PwleYR1KWAVj5T6WZTfa92Aq5k9D7K
	 C3B/7CIc0BNHfiz9qKZf5yw0qTDsetLfYn49R95sWjsRDNWvteshKP/6b/QLqcSfwodZF
	 eOnYol8h8Dr7w9D7JjBGsoeCBDvA3A3jzBTnK1WecMr34nPTYXiTqZiyC7ZFO9VEWjA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792837997;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3ypHmdMnY+wqLmFxKM0WjsnMkHU7IY+DyndYIxSs//U=;
	b=G2avjC09+ot42m6/nc+ao0uFPo2aHCqBbO1FQAhrIfM8Vzn4dOHbjtKCrR3kjXkRt5MQ
	 8mok6ZXhsVgQsuu+EcV5K3EwatS/9oKWWYQOAI4fDvO++SOvenSz0BeZKBLXlXiCROgp9
	 hqIwWdUcBeVMG3jueupTRsjnEdNCJCNJjoNcBCDkRXVpgfwnQgSBaLZMaYd1qu9CJpcLG
	 K27OCIdkpSHcnhvb42bZ/O/PisixQ3aFo+48cIwOlrxkEtP6eL7tsPwfLhWOWMagJlTL8
	 5VMT0/sX0UK2rXEiOXHjQjDljmnzyyL8Shf0nmkhZtLaKqfUjKmgOumGznU/v8A3UZw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792837997;
	bh=3ypHmdMnY+wqLmFxKM0WjsnMkHU7IY+DyndYIxSs//U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gO7TAT/VmMKkGmwPg1UotSrDyGfM63WE8TXXvhlwRNVeXqET4ecBTSsgoHBMZihB4
	 dVeaJCy+2Rpt/oC8DmLH2HDfJ3yOWyIqMGIm+740rTavPNSFOn66rs0LsvWqay42at
	 3KNTV8GSaX0WCfivgg/umWdXxWwSPv72DrMQxJ3tPcmHi1UazJ39QGiusjP7/MiTB+
	 16BTAORkuzJOS4zy1Z+e4Zb6XzYVCfpOjfiBufY3vPkjcf6/3uwpqsjOob33iIkpju
	 LvRKBoFJ++4fw774dyNURFZNkpXwUmxs4LtPPPhzUpH3fqXXqsPSZ+FgZIaZ6lJmCX
	 9k8QaDbTI5i3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A74D660A41;
	Sat, 24 Oct 2026 10:33:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 17DF9D34
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 082A4813B7
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i-8j8QbLkZek for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 10:33:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 340598144C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792837992;
 b=EQbL6OsTYTI18qnBLId/SF+Siw5y2K+5j7zPpU/5Np9P8MaP0i9aFh7sTsOK4MiGKvlk
 +xlVV2QxrrTdMgRT0beyL2Pm5CEn4OnlxWKhx8uCkTbJHkur4dX7Mgu+UO0jyhfK4RDJF
 Sd1OGYCXr43Dl2ScuOw7Bi98z6uuY9GKRXi0DWqLlHgXFfcwjIui1lRBr0EQr/IEBYp+t
 wLWuCoBIVvPO2GWlvpSQwCslUPitWPmsJL/3MPRzZieFS5Vi9I5yR3cxzOHqvwAhMTIBT
 coqUVnZ6U+FKPUfLXWZk5UN2sISoFLJhdXMRKpKamy+xc+uxsDXd+C6zUJ+ESqaD5yQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792837992;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qrsmsiAP9TL9DCXBXymKh9JzlnZgLtFNoOre9qYMgYs=;
 b=LTYQ+YD7ST+Blb1z4yG/ISkkX821uubKjD0MmKS/tWOcieBagURgOe+utI4rknYlerTK
 lKueg6UWIs20ZzBBLvVItw1ApoOcZUlNkQrEmDKXzfD1i+1cmDZk2abQ4SIZqhO7Sy54l
 WwhzP9NUSrXoqnd5nTvQ5/9ktg1nL9mdynRSv3HaHVeQaJ8T4k+LwM/S+8lpnnuLBbv0m
 CWw84iq2P9KtbKd28Sc1dLu4YLoVXkpDjBFPYyopghlQ8s8vuD7llwWPw4C/yqch85ZJs
 rpAHzaIri5RVEjUp/X5rDc9/Hc/EX4TGhC5wa3Yihb4rwXkKzCxFRbllj1mTfKAohuw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 340598144C
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:33:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4EBBB9B3C9; Sat, 24 Oct 2026 10:31:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 11:58:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e9f4394b39e38eb8fa839992577fc523c51c500
X-Git-Newrev: 55a60382ae9a0e03a65186fbdf9e3afbeec56130
X-Patchwork-Hint: ignore
Message-Id: <20261024103147.4EBBB9B3C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyroute2: bump to version
 0.9.7
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/55a60382ae9a0e03a65186fbdf9e3afbeec56130
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pyroute2/python-pyroute2.hash | 4 ++--
 package/python-pyroute2/python-pyroute2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyroute2/python-pyroute2.hash b/package/python-pyroute2/python-pyroute2.hash
index a488951cde..8dc11452da 100644
--- a/package/python-pyroute2/python-pyroute2.hash
+++ b/package/python-pyroute2/python-pyroute2.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyroute2/json
-md5  a8c34ff9de89e55d5d50e9959937e56f  pyroute2-0.9.6.tar.gz
-sha256  6bc5e2ea9a372ded682b4ede4028ba00236bd6e35b42d833f39a96b219ef1db2  pyroute2-0.9.6.tar.gz
+md5  6d2b1eedc7f400d4bb411cce82cc15d0  pyroute2-0.9.7.tar.gz
+sha256  a678b098478c46ec51d6bf9a03c3cd2ac0172dffa590e9e8c1eeab633d0c17c6  pyroute2-0.9.7.tar.gz
 # Locally computed sha256 checksums
 sha256  4739b32a2478e9c204bf010bad5d565d188e59ff905e3c8f71fe3398098b7093  LICENSE.Apache-2.0
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0-or-later
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
index dabf7e923d..6a2748fbd4 100644
--- a/package/python-pyroute2/python-pyroute2.mk
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYROUTE2_VERSION = 0.9.6
+PYTHON_PYROUTE2_VERSION = 0.9.7
 PYTHON_PYROUTE2_SOURCE = pyroute2-$(PYTHON_PYROUTE2_VERSION).tar.gz
-PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/9b/3c/cae3aa8a07522d4fd625958f690ab6eb4ffbd9c94e30e2995f585fded630
+PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/1b/2a/d295013eb67b5bb3a0ebff7c6ae3f635a8f55929b3f5367889ddadd7f4dd
 PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPL-2.0+
 PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache-2.0 LICENSE.GPL-2.0-or-later README.license.rst
 PYTHON_PYROUTE2_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
