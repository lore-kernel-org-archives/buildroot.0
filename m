Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9FF606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FUq7aKsd
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A98F605F9;
	Sun,  1 Nov 2026 17:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DNqZRnqkA9TM; Sun,  1 Nov 2026 17:07:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8049160711
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552878;
	b=D8ntoZMywd8aOSwQmrrIcz1hghT/2Xx3tUwjmooTMLWs4OfiTODj3xu6zRESZvYwSG/w
	 uODtW8zlS0OWkeDK1zSM1nE0OSRbf+YrgWrEclKBfymyuJCcF1sTR3ca2svMibnp6KUPA
	 XPiqT1lYTwFa19f1DFXLDpXiiOfcYSS4IrwQa3+zG4eEFWQPzIsFkCOd6if92kasvBndl
	 hKBjcR5H9eUlz4q1O81lDQ0MJ5VT0oTrJA6omTfU2WJjnvG5txfT557/jIMDo7xRuGaVO
	 pzfWgP9MR1ffUMxhkWJ/BKge8tIeRH3oRhVeCLRySOA6DiDc4i5JIZVBIcDT8VBKEkA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552878;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gReqpurP0oo20dU/oZeuAZvDZ3DQpa9LIJGAtEvG2kg=;
	b=HPRJJtsL87nxvo5iFie3PoDhvallUnvROoUtLMEB3aygdq5fGky8bgIyvnBUqs3jcP/z
	 dsDrfFPPTptIq8HZ12BR9v+ypAGZOQNRRP0tOg/79MEBFu6AzC+1GmkAMqXEvJzVslahT
	 lqc7WWpl0cJBL98pIZU9b8jqGePi+PaQpEpEDhQdopvsDgqbRog0cgRrtrfKueoQHUmIL
	 hawZWEoEUwymZtihF5GBc/Ldh/C020bWDZfp2Jfu3+hmQQd/HjvNPtz48UT61civOO1C/
	 DueWQ3ym3aHPwJV5prMiL6bnYxEpA1gje6jVnsElyLHtuFKG4rx1ljqMsfYEVt6MsFw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552878;
	bh=gReqpurP0oo20dU/oZeuAZvDZ3DQpa9LIJGAtEvG2kg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FUq7aKsdb9U492NT6XOXSd34jQ0cwEfhrdN2wq4jN++B2NwsbNuzObhpxkpkQM4L4
	 Ini1sqP0L9XilW0HeOxTYef47AcGtNF2kxMfVV5G95UoqkyoXf6kW/VTUQZyNc5JrJ
	 cQs+r8mWTBYxSVlGtlI9/6tKMGR5ZX/qqS+4o1e2jPM/rd33vcnN4gvd3On5UTc4cm
	 JPtx7JQJ49/0dN4GXn/7sFKwutR8RcmQfcdNDMFAz540evKlKO9XW+fiPm3auI0FYz
	 2xrcY/5MxrPtXq8EhaScKRJhfWN2R+m0Pk3oakYfD6G1ZfzQYRkSGDsQpcxvJXLT6o
	 /Ea5AdYIl3iDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8049160711;
	Sun,  1 Nov 2026 17:07:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C760EF4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4295C80D1E
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dUMtm6tv8UE1 for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 46F6380D47
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552839;
 b=ee/JhAHeq3qxW8uacMl+FftLNkVnjZVexlD7aJaf0FQPN2sDf5xkOovVV7eglTAJ7FBs
 V2PQlr0B/X6cpsBlsQ9r107FrW726XsUhZo/sbaPX1QWI3zvGyHMX+4xMkkeL4tSQe9vb
 zXe4u8ZF5E0YEZ6er9lvt8qSf2bP8VPJdBJqEuruQXWl7NoDDN6twx+rA6Vc6fYKuVKst
 ehCfXPTuJj/XQCqKq6chCpIP4geedKPntV9gFo0TWKRDLwP/LXqQeo9tkfKRm6XUGdy8A
 ruDOwdPj88TK03+5ClCaKyasc+E8SIGCdPCtixcjHf9xmkdm/ntpqJUke60ja6QmUSA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552839;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WPaCMW0C0bjLEB2NvXP++OOzegSMC/BwBgzl6kM0yww=;
 b=m+YVz6/Qm7xVzPC9P6pUp1Qq9HQDOwZzop+zLzv7Tw00/vaP3Y4d3+kcbafm5yrXPFw5
 /eZU/TPny2AkP8XSA7l5vdMB8WsPOmHIzo2ckcP+yK2ipIKd99H/aOr7wqKyYccFcBfY+
 QGxJmvMAwEbbarK7Vt4JGHF1R+cRyqckyJLi7yc7E1TnsFg+s1DXAAw/rU4mqfRRFaoyo
 JBWDJ3DFPhTkAVwk65NDWmkvkyQuSNsTfxqzBBkJXAHxSV7QjMBIASTqKPIgGnyjsvRwe
 zUoRuksabbwa8+StMj2tnJDixpKMcW2CAAVoho/tOHRb1xqAQbjkQIOpipAkPi29EQg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46F6380D47
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 143B19D3FD; Sun,  1 Nov 2026 17:05:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3bd1e58f30df6e32a9872bb4b3f526b4c5b6817d
X-Git-Newrev: 1db5919ddf9c0539dee9b5958498f2a58bd160b4
X-Patchwork-Hint: ignore
Message-Id: <20261101170550.143B19D3FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-xlsxwriter: bump to version
 3.3.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1db5919ddf9c0539dee9b5958498f2a58bd160b4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-xlsxwriter/python-xlsxwriter.hash | 4 ++--
 package/python-xlsxwriter/python-xlsxwriter.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-xlsxwriter/python-xlsxwriter.hash b/package/python-xlsxwriter/python-xlsxwriter.hash
index 663b09f426..2a396846c6 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.hash
+++ b/package/python-xlsxwriter/python-xlsxwriter.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xlsxwriter/json
-md5  f715b29253890540a5892fed5b2aecb9  xlsxwriter-3.3.0.tar.gz
-sha256  0a6bf2e4dcec8b29dd9b86d1e622132134c48bb6fd10f925fdfb229f0447199a  xlsxwriter-3.3.0.tar.gz
+md5  5ff0e214918865da98e084153c2a5d1b  xlsxwriter-3.3.1.tar.gz
+sha256  0867761912cceac76f97ffa76eeda18c623ae9217f601be8512f55b1af4bdb6e  xlsxwriter-3.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  79cd3a88b65ecd9996f4bbfb7f3adf0a75df366aa1d3bbb7fe150b9e43d5b4c7  LICENSE.txt
diff --git a/package/python-xlsxwriter/python-xlsxwriter.mk b/package/python-xlsxwriter/python-xlsxwriter.mk
index d6f841a219..6f92aa7b77 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.mk
+++ b/package/python-xlsxwriter/python-xlsxwriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLSXWRITER_VERSION = 3.3.0
+PYTHON_XLSXWRITER_VERSION = 3.3.1
 PYTHON_XLSXWRITER_SOURCE = xlsxwriter-$(PYTHON_XLSXWRITER_VERSION).tar.gz
-PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/93/f2/98b45e52bc0330256bd4bb039cc44b28f838ad85602ce4f358f355d501bb
+PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/9c/fb/31bdbf3737222d92ef7d2db4d50089b2253dbbb63ceb6d20a4447f6b7ed0
 PYTHON_XLSXWRITER_SETUP_TYPE = setuptools
 PYTHON_XLSXWRITER_LICENSE = BSD-2-Clause
 PYTHON_XLSXWRITER_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
