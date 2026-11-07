Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9614606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 10:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=V+AAKlTD
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ACC64077E;
	Sat,  7 Nov 2026 10:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFPiqdLhS95p; Sat,  7 Nov 2026 10:13:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BBD4640753
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794046389;
	b=KGBQ+g+a4ShvxPZRUumSdDUpZ7zqSYkNVzIXWT0j7T0LUxv0XdUEiwfSdqA2jw7RwjYn
	 f5I5tw+cLdqHmirKxEn5U5fUJpOBo8ePz3OsCf11YffgyLeNDdfVEN5fXUmGktdQFjOYN
	 QTMs4q37XLc72c5iaUaL58GoXsKRUpMNeeb/D9/VIdMpksjbvllcZiEdXDGHPga08b6vO
	 oZhzavvL6Ia+t6GIO6uQ8jnpvypMSh2uIbDimUXOuO8MTyQFBNSqkKmejUr9aS7I+AJeI
	 lsTPUMpkbJ13+JEvC1lCjJtqJjSjL3TPv53bYnBjCp8HFtejD93Gw7MQS03X6La5tKg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794046389;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DCpYSq2WNiNb/3+YN28jJ3rclhdEVUoy8dnc+Yt3HYU=;
	b=GkaT474ZjRhjAT4nVa3JV+Juiwo0L/aeAdl7FS45ZlSvoikCLJHjlpQ+F2EPWIRzF6aW
	 VtFUk1SHli9TJFhjY8vYlFleWiwWHgU7RgBl6wV3R0n6ePhn4OvtsciQfQCSDpxxJb0uV
	 j5qRFEzcbL+AWbk3hfefw2X5tx2DdFglJ6RIFkYMEYK4kad53MNJ37nnoPRfLnkPEQOk8
	 pzIlsblYTzUH4HT2dmu9TOVmaCxllZjNnHZrdXS8Z6PibFJdgy7MzExb9WUCXq22WlpYa
	 4lGHdlIFiBiZXHVrDWTBzXeRgM7uPzfNkwDUut+G05I72um3QbwRybqXy8MpvWGPGBg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794046389;
	bh=DCpYSq2WNiNb/3+YN28jJ3rclhdEVUoy8dnc+Yt3HYU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V+AAKlTD4p7pjiFqQddMwOR8FLgXd39xrvf1AM7t0tHMO7+QeBWpXJp/WhhVWJQzT
	 +CM0y/JlJabIxtMlimO0EBbAa0x1o9BOLa5T+sOOllObu5EfQKAuwzOmbSLlfgDCxR
	 R8V07nIZisvY7ynKdYDcQ49gG11VuWZeeLzfBPIvmbZNHCHUopGMf/sDmq1BsXEJ+6
	 y+e7fpeUzhPYQ7wUmCR0yz8acZ3HR4NbzkSO7RIJkFGHYB6X8BnKzw4gLHx6oExv+B
	 I61RRjqtJdRA+HemzA6Cx0chhurRqeLm4NKaxsg2141d8iqZx7NMGHT6uR+x3lF3v3
	 HT5MAbPIGvrKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBD4640753;
	Sat,  7 Nov 2026 10:13:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DA0A1C6
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E47440705
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VV8GBxrDOMu5 for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 10:13:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8B50F40753
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B50F40753
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:13:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38C808A5E3; Sat,  7 Nov 2026 10:11:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Nov 2026 11:09:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66b775582ef89c4c15924a92f4bdb58dcfc7793f
X-Git-Newrev: 70aec3f489e20be3d0aed9199f7d37c92c9fed6c
X-Patchwork-Hint: ignore
Message-Id: <20261107101133.38C808A5E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-telnetlib3: bump to version
 5.0.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/70aec3f489e20be3d0aed9199f7d37c92c9fed6c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-telnetlib3/python-telnetlib3.hash | 4 ++--
 package/python-telnetlib3/python-telnetlib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-telnetlib3/python-telnetlib3.hash b/package/python-telnetlib3/python-telnetlib3.hash
index 65881e7808..ea1afcf48f 100644
--- a/package/python-telnetlib3/python-telnetlib3.hash
+++ b/package/python-telnetlib3/python-telnetlib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/telnetlib3/json
-md5  b60dff81a92a07ceba879130b48d1e4f  telnetlib3-5.0.1.tar.gz
-sha256  6fde197ffb71cf26ad27fe2c88694d8364f4b1cc962a37762e0cf7e79b9afaed  telnetlib3-5.0.1.tar.gz
+md5  ef45fdb8d87bad02153fff239ea3f6d0  telnetlib3-5.0.2.tar.gz
+sha256  30bee6ccbacc5c7540ae1a4fb990809eb81993d98900597c0795a5d1ad45e40f  telnetlib3-5.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  23bf24a5fe7cbfc70b962da94334649cf60a3b309834c72eb053d91d8caf60cb  LICENSE.txt
diff --git a/package/python-telnetlib3/python-telnetlib3.mk b/package/python-telnetlib3/python-telnetlib3.mk
index 60772a63ba..8993920e2f 100644
--- a/package/python-telnetlib3/python-telnetlib3.mk
+++ b/package/python-telnetlib3/python-telnetlib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TELNETLIB3_VERSION = 5.0.1
+PYTHON_TELNETLIB3_VERSION = 5.0.2
 PYTHON_TELNETLIB3_SOURCE = telnetlib3-$(PYTHON_TELNETLIB3_VERSION).tar.gz
-PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/b2/6f/92e130274d84487c48b149f1c5bade54dae3cf535b4c7a5d4ca3e6579590
+PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/5a/d8/f91aaffb489997de5cb04debb4e251d9523835737935dbed6d1fb2f20a9e
 PYTHON_TELNETLIB3_SETUP_TYPE = hatch
 PYTHON_TELNETLIB3_LICENSE = ISC
 PYTHON_TELNETLIB3_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
