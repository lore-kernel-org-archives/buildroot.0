Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28D4606A33D
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YVPeXzAz
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC0E0608C8;
	Fri,  6 Nov 2026 16:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MO_dFsTDOJZE; Fri,  6 Nov 2026 16:09:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B6E6860A45
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981352;
	b=LgyIeptTJDJoYLNBjwWqaqu2kjx+usAFXIs+Di7KwoZXydbavBbg669aVklLrt0U6MuE
	 3yLeKEteZmIeSqTUZPNx8mStDfvBGhgh6KxtoDSiapXYf82T1lNvGn62Cu2H2TLbJWou8
	 gMev/IncibqTHXdCujkLtkD6kPD2Io5g7AmbbIMZ33iOhy6rxmdzSaF6t6FDv6Qpw40kg
	 qimFX3gCYCFC1OWlhEu0EfE9mGdlO/R8RP+dis/R/aI3fdXiBQqXvc9pu9nwQC/Rz4Xeg
	 GTI8/nUYNWuk7o/te5W4Yz2+JbNwajbszRY7wAhJ2GyFE6WCA3fMrmPwohhGR4WDmAg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981352;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=JVTwdKR5XGswEok9a69wsj6qVi2r0llDg7wBfnrg91M=;
	b=lHiPY6jNGsbpKQA5S3LqUjYXreOo/uu1TdReM87nHpgf107Fmf2ouFiELPAOAEF+/zSY
	 Sn/wzZzR27wy1tGwIwXaQ7ZdEzbcKzuse6JN9/vkuFqS9LrsvMJWYfYLizzlfwpD+M0EE
	 Any3HnPt1ASUC1d7jEZYJ1hQiTu+bGmlCh2SdKZuWL4wNND2DhaZczWWwU+HJdIUquAjl
	 st0V8Q4ae11yMzBBhpXPM2F0wQ7GhOo3Rj9pNq63lCdb692DLndx9m4uwT6aYn9PiMsfM
	 4lHP+jplP4v8/R5dToqkBLvKBUZXJWOnfOBy1ynxvACNEPmFo3vtdyJ3xsYKBHQzYcA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981352;
	bh=JVTwdKR5XGswEok9a69wsj6qVi2r0llDg7wBfnrg91M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YVPeXzAzifUv1xBjFAGA4XWlmnktjDqnq237GYVwF5kXd5ix0euFmOErDaEzUmcm5
	 1R4c8kwQBMcsCkA53b36z9/OdcifCIg830MN/fGTseulTLcK3h+AudhnH2mC2Bmqns
	 kIvOed0ca/9Ym6OQnm9Mz6B27zNpyJ3lfaN5kaBo7zAeAVD/YFcg0NV8GaCNoLJraH
	 qbuarCW+1SrYc+ecvcNWWt6i5bo8kHWu5z9QLQjpQnwSp0cfIzRMowag4+U0h6VMmR
	 xS1NDvKGxWfXijv0ELGNCnSLkzNtgkzWdoCKQw3VJGZ6OUE7psA1JW/0HbddVpQ6j9
	 dDPKnwjd0lM4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6E6860A45;
	Fri,  6 Nov 2026 16:09:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 457044B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 374AA403D5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJRNpqQKSf_V for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8C35B400AF
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C35B400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B67EC9E0B0; Fri,  6 Nov 2026 16:07:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:58 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: eb40246f82e9b9dcea9eb79d8c6241ddcf5d532a
X-Git-Newrev: 8470e451256151ddb3f16ff6de0f5a41dc91a055
X-Patchwork-Hint: ignore
Message-Id: <20261106160709.B67EC9E0B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/python-platformdirs: security bump to version 4.14.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4560884360951915657=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4560884360951915657==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8470e451256151ddb3f16ff6de0f5a41dc91a055
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Fix unsafe Unix runtime-directory selection and multipath site-directory
injection:
https://github.com/tox-dev/platformdirs/security/advisories/GHSA-2gh9-8m4r-2xwh
https://github.com/tox-dev/platformdirs/security/advisories/GHSA-jmm4-8x35-q6fq
https://github.com/tox-dev/platformdirs/security/advisories/GHSA-9w45-w2cj-r5hx
https://github.com/tox-dev/platformdirs/security/advisories/GHSA-5pjc-393q-rwmf

Add the host-python-hatch-fancy-pypi-readme build dependency for
both the target and host variants.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e286327742d04758fe997f6bf0f5eefa9e73c8e2)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-platformdirs/python-platformdirs.hash |  4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index 641b1e62f9..073f9b002d 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  9df73f0389c5b7093ea0c73af181eb95  platformdirs-4.13.5.tar.gz
-sha256  05831adf87d392760f4b5c3a0a95579ab5a10b18b9b9bd43680dcb47544788a0  platformdirs-4.13.5.tar.gz
+md5  07dd523bb5ca12c4525df2cd242336b1  platformdirs-4.14.2.tar.gz
+sha256  6d13b4c1d66b7548dcec9e3db13c1ba9d9adb65041b5d07869313afc07e6e41b  platformdirs-4.14.2.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index 0aebffb6a9..f6da1e5498 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,14 +4,18 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.13.5
+PYTHON_PLATFORMDIRS_VERSION = 4.14.2
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/58/e6/d0abbb256b44e6a05748c6942511ff67db8dbb068de0c35b24bf1b395b09
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/6e/4e/2684728d9f2c8c4110738dcadca7e0bed4b60c8dc68c40c2a9e0cf017900
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
-PYTHON_PLATFORMDIRS_DEPENDENCIES = host-python-hatch-vcs
-HOST_PYTHON_PLATFORMDIRS_DEPENDENCIES = host-python-hatch-vcs
+PYTHON_PLATFORMDIRS_DEPENDENCIES = \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-hatch-vcs
+HOST_PYTHON_PLATFORMDIRS_DEPENDENCIES = \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-hatch-vcs
 
 $(eval $(python-package))
 $(eval $(host-python-package))

--===============4560884360951915657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4560884360951915657==--
