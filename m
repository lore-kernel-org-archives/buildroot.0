Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F56E606A32E
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dgde74y4
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DB028146F;
	Fri,  6 Nov 2026 21:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TKN3FoiO02D2; Fri,  6 Nov 2026 21:14:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DAF7081429
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999698;
	b=lYdsvGIM0QvwM2Xoqkn75iwPLf0XI8FSvSxumHo7s/+wgmI7nxcee9Kmack+aukeKHfX
	 /ZReh/0JvYDSkZ7GCdtpIfoCKZYN4hEA1aJGmafb6Xri7df5ZhVHzXXsStOfdMFmntutF
	 m3OdujurjbN8j/QXfMpfwdYsDnveiLS5eRBhPenkvxiLGZRhgwjDho1GAdTz9PZvOn1gN
	 aRpuGZAUuH/cFC+Ga5TqQ/moWz4CW7JsiLUwjSKIXfTxbMBfna28eT6g8eAyL5SnPLteE
	 7aQKP3K3Sb5sH8V4LrYxKlqGqJh3rFj3mOUgMX6jeWHbE+D/4nJwioNz1aRW3TqMTiw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999698;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lVg/3+JN/dAGB2qev5Xqj9cWVd1jbyEbrCV1AIh+5hg=;
	b=URYVqGYNZ9OeZ93n2RSZsaBWHov/JioCVe/7/5KMGoJURrhvTlcVcVAa/5MQo5eMtXPy
	 gK8DojppXU4eo2uFWQtxB6CJ4tPLnr9TzVAyhsdwiALk5xX965qnQyLg+D9aPqfRwYwV9
	 FHLGKnErsg0KoMDOSUd73b7sZrWOoLIL5+fooxRJkvsv9kzjp8zeIpc6iaKKdYewijGyY
	 8jcJelTsxKIWuls0rre/zAqZLFFwFDLphb+q5FALYB6yACFDH2xTo4rmnHTg0SsRT/m19
	 sC2FfKq1Vzac9tXAK4TRbV1imM/CNQHVgpU6xMqS1//qgoj2Wk625nmn1+h+UmehS+A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999698;
	bh=lVg/3+JN/dAGB2qev5Xqj9cWVd1jbyEbrCV1AIh+5hg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dgde74y4VkO8cIF0tQIYAto5naz7enTd5++6PnNDYoV73OabXp28ClGdixvAQ25Xv
	 k16RO+/w4c0CZagZ965tyUePAYi4V47ldB1iW3XzROdIHmVlp7CaGJ1fZKJHQUzWWA
	 ymWCBVC8EBxzomMbZbM8bwAOXHNs3XwAAkR+CEi0t8QiydAjZJxNFa+pGURAu3xD5+
	 D+yXBlAPToeRuORV3GQ/YVstwwiPEaAEonRwmLVjxVhvWWIbf8ardebvtP/Q83PqZv
	 8G0XEVpavzYI6/fVEpM0C1/pdeNzLOY08opxD8qByYJQI+5JlKyQ0/sdJs9JnL947P
	 bi41pocYWi9Mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAF7081429;
	Fri,  6 Nov 2026 21:14:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DE2A2A64
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2D7140409
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fgDa4R8Nu2EY for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 208BB40407
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 208BB40407
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D99A9E0B2; Fri,  6 Nov 2026 21:12:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c94f4848b8dcf21da8aaf0986276dc126737634
X-Git-Newrev: d567740691c8b9c69878c0c1e62f9c1afa3246bd
X-Patchwork-Hint: ignore
Message-Id: <20261106211249.3D99A9E0B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pymodbus: bump to version
 3.16.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d567740691c8b9c69878c0c1e62f9c1afa3246bd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 2e05002a8a..d0de4f0614 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  41a9113d266bc1839563a681c57846ab  pymodbus-3.16.1.tar.gz
-sha256  19e571826dff37860afc31c845c1fd2fb72acffca02a233506b32d94fa022c33  pymodbus-3.16.1.tar.gz
+md5  3b5cb50df8ca176257ac699393b802e4  pymodbus-3.16.2.tar.gz
+sha256  64057981fac117ed4b75ea8ef6035369f6ae803247700a5efdf75d76a2be8aef  pymodbus-3.16.2.tar.gz
 # Locally computed sha256 checksums
 sha256  572a4d6fa7541553f70cc6d494fbcbee7eb7d3f2fbd16080d39b20cccda26f0b  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 6f87d54c61..d79451b478 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.16.1
+PYTHON_PYMODBUS_VERSION = 3.16.2
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/65/ca/2552fdc467e87a04654af2b6cd994a29653cf767e371792810e15f4715f6
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/44/e8/910c866f041769d323df554835965571b054b10e1a3265427d246c4d2ccb
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
