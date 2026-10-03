Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B691CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 327F98081B;
	Sat,  3 Oct 2026 15:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kyDf88MrAJ-y; Sat,  3 Oct 2026 15:57:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 246BE818D4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043032;
	b=oHdZ3qQrhAUxHSyJ95Jpw8u1Z1rD9phxn5kCGYVBsenOm9YzZTTU8xBs5RUK3SMXZt5S
	 K+8q1SgClTShre6hCGawhCahHfZXe3nkaeSXbHiXamqf5Z4LibLulytbelRXHgXi2PYby
	 zvmfKqHo6I1NBGn4G3nLVg2cT+wss74ATOqcqr0jP4i+1ubwQ1KBfQIkvCjCcFwQQmx4G
	 B4+zHXkOuPjSBpeM5EgDd6k3Nr9ncVqO3ZN6X9maoTo+mLVgle77NxcxwDzaBJjbH2B+O
	 Ud+XL4rzMJyhMjCOczH44avIhH/2AEr+oH6YGmE9amBXCRQ/tbEvWbWON+V3gA1OQXg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043032;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mr9BseLo2aIzTLvOqjJJSJilAxtIw+ifBOJslqZgsf0=;
	b=A86n4ztEIieob+Rv+eq9SuIQmeqSpnCzCOyoPaA4M3PEKnRu/RIvSAbEJGVS/6EwzYqG
	 qr/FzT3X79/Q9hYILn9GG4sSSisY79VPtIWUQBnmJQz7MeAInLiZvK2zlNqUMpWhvWo4c
	 Tf31wGiqUCFH60+XkieBO5ep8XMMaEgK0LSzFOIpFwR0M1r1kfpm1L/RGrZVjBgmRk+Fl
	 JFQwwFJhijXf6ZHAd/j1K8XrhkgUKrOl/wRVFLOty6E216WiAipL/ieObpHqNxhu9zel4
	 g55++Gehu2dQP5nc1Y2sdc+RCetns4GqfHZIXfOgJCX9sSGqqQr4dXgqD9rA0191IIg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043032;
	bh=mr9BseLo2aIzTLvOqjJJSJilAxtIw+ifBOJslqZgsf0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Et87sDPtfwWpxDXHs5EAe2E01OqE7sdpHUWudEgtWgDQuh4ZX5vAC/acSfuaUkt4a
	 xVgsGp3GfuGA7WkMMXIMWsymW8QLyZ9xy13Gpocudo9RBOoO4rAXFSRgJ2ZjnV4u8G
	 ZO96rCht2Z9E2X6avWte12wRrQpLdvgveSz6qiW1bufwCMTuV3I8MW8p/n++Bqf7hZ
	 UN0hbbxyoLeO7MbjdfoQy6f0T8sdYRAh4Je+7Ey+WnNBZZdpeuyg+Y8Ng6OyHpli8g
	 dR0FqLAREiYzFdkwdlQqqAVQAKnT9W5RaFhVG44mkmYb0RdvkfBlspOaZBU0HtsbjE
	 kGqR8OHdQjVWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 246BE818D4;
	Sat,  3 Oct 2026 15:57:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BBD5476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 755156066E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ov6Rdgo29er for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C5DC4606DE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042848;
 b=nK+rYhVXYgOCzALOZ7rkjcWvq3ZkfVIFbcYAJsho+HhvC0MsPa95jjkougIp109UlVqH
 CE0tNmlB0nJLNmqr8grEbE2kRGltxPXfFPavxfkcp3gcVeidZEjQPjjtbes2k2bI/vIR6
 9beuPXq4InAC4Pon169A6FaScuKGwWt3lYZC6qQqUY/7MY01EcpHqJQ6WNeKMbDOgAJgP
 dLH9Meuz+qvb4cIPbi3urk4V4dmT180ncBZkwSAekxwxtAbDzW79PsfrYCmiMOhJ21+l8
 WdCXEKVgG4FmP+UHyBKsWEG0yZtmzqWGSHCurdFbx2LrUwQd6ipfKfHY9job+qCFkkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042848;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9/KGJ40IgGc3L5IxfH7e44tbL6LQWPAqsAjjfRAQGE8=;
 b=pm5PVb6h96IGJoONLjpDxWPOpftkw3iL0k2Lu7o8YIe8XQNJ0IHvp9dJcHAUDn6JH84V
 1nffZOfAslvTvPd1oXoNIPOGa7AKCEPjBOpKWrEv240QVsbkRlXaYoj9iPztm0RQYgsuT
 aLQuNVd2FZO8/xLobJHLsi2bUlaJC4nAd1c2LbEgAkJzot+Yd9GR3Ma9/0I/pp1Ky7BTf
 1OpH12C4/4DEbwjUdqLe5E5SA3xS4kh4g/5KC2tbeTbabw7OQiT3ibX49fD9LW1SqN+qe
 L4QwuC+g+Do7//2jmbwGYQtwiZf1n9uyUPPpmwrfY2DJfLN72DpeMc8SPdsaMA2FE8A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5DC4606DE
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1286D8A574; Sat,  3 Oct 2026 15:52:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 059d2bce5e0eba5ef47395d8b4acb913ed019f9a
X-Git-Newrev: ac14a83e91bf00034d83933766e4611e8c419f06
X-Patchwork-Hint: ignore
Message-Id: <20261003155254.1286D8A574@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pip: bump version to 26.2.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ac14a83e91bf00034d83933766e4611e8c419f06
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index 3ce6073701..427cd14ddc 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  c05fe5cfafe4cc2ce7a44318d8eed4e7  pip-26.1.tar.gz
-sha256  81e13ebcca3ffa8cc85e4deff5c27e1ee26dea0aa7fc2f294a073ac208806ff3  pip-26.1.tar.gz
+md5  f7e8dc36dcc6cdba3bf5c426ad076902  pip-26.2.1.tar.gz
+sha256  f6ad667e89a1fe78046c8f13232b247200f5258d7828f3f7883d660878e0813f  pip-26.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index d12bea3225..74c789e097 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 26.1
+PYTHON_PIP_VERSION = 26.2.1
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/73/7e/d2b04004e1068ad4fdfa2f227b839b5d03e602e47cdbbf49de71137c9546
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/ae/15/4500e320e6b101ec3b719ae85b697d9940b6cda672bc555bd6016fc60c6f
 PYTHON_PIP_SETUP_TYPE = flit
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
