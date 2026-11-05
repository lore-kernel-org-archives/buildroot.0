Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB27F60A260B
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rOkjz6Po
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 821C38165F;
	Fri,  6 Nov 2026 16:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id anMi4AwoWXNr; Fri,  6 Nov 2026 16:08:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B478C81496
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981333;
	b=CN54sEE47/RYdxIlC7I8mN5W2mvT8YRIW+q7JQSuH3+7uR+HfJCiUNCOKA4j1g3jY98u
	 vaj0jMPWk86qGnovSg/C/Eva0gwecjyvzIzNsaHP8neq4juywmnyRXZsl7/QlacMMhQJc
	 5mK01n8jycuUKQYncXinCv0jMxgpt1Z8SRzcypCt0HJA7OYnjrvEbcOlJDswGLnuZ9QOB
	 LMZk0CLomoS1w+oKpi3mVHIJ0naaQCv9ukLavUBJVPIFMR4dxpVqmjZYo3+K7Pcb4IAjr
	 XVpjztuuxnncDlfjUgka5qNvB9WkSkOaWuFgG8T8jDF8t5EFuccmWz5Z06VqwiZ+YMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981333;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=D5mu00xZEPJxU7hCAG+KTDrXjf3jR570XoDDTl+cR44=;
	b=X7SWUZqp47A3XGMmTQhoOuZ99nbAkmfR2PMJrF0w/071C+wz8Oq+Bjk9dEA95rhM2rSY
	 ydGsN2q405Q2de/wqQ08kfq0ik1zwmQBxLrX3AjkfXAAFWfPOV6eFvOv6IMbjyUDYIb1J
	 J4987sktY5VpN0973+bFpvYvt6FqpzrK3OQb+MrbaTp0HK+pemITVMnpHpZ8IMHMpNhTL
	 GJ+oUE5AlmtqVtZdnwt4m4VesIeznh9EzBiTiMNumBt4EH9d5lJheiEW5Df4JXc6v6jpA
	 Ubbjp/g99TALKhlH9wndNLlt9dFFOY3njNYO1JA4w7555UUxq2z2nJrmDL5OkWzOWpA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981333;
	bh=D5mu00xZEPJxU7hCAG+KTDrXjf3jR570XoDDTl+cR44=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rOkjz6PoP1b+a+sBO6lXJveAvXIbr1YAg1YWNzCC/Qt1ceVipRZUXzbRB/tJvTw+Q
	 JhBH642bsIAC3lIPMz1GcXIUn4kypFCfITXIvoSWQjPwR6eugs2lQtRLbt9knNTiaD
	 5AH6NwTwuyHSNfozBbeYUNas5CqJjD+Qb9yxdAJpDYFQJo8gh3NvvkaOtHlL17tq2A
	 kVI3hNoWUHQT+E6l1a7t4bE2Ft9Qpc7Yczqllwgaj7lGuyxLB2FmiIeIEFRRib7xXW
	 Z5KHnsXo/lBbp9gyBSRIuU+UE72gUMDFaNldwWIAWLP/8XHtmK40liVqXpwvz8j1Re
	 /n0g/7nI66FGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B478C81496;
	Fri,  6 Nov 2026 16:08:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E5FCC7AA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7AB4403CB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EwmNZ0q3i5Wn for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 38332400AF
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38332400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E9AD9E0B1; Fri,  6 Nov 2026 16:06:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:58 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 5fc943954b484f44056bb3a92227a670be68cbf9
X-Git-Newrev: 879799cb6ade4c00752b6733f4c2c92e3ad6c96b
X-Patchwork-Hint: ignore
Message-Id: <20261106160659.6E9AD9E0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/python-twisted:
 security bump to version 26.10.0
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
Content-Type: multipart/mixed; boundary="===============5323094217549523112=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5323094217549523112==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/879799cb6ade4c00752b6733f4c2c92e3ad6c96b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Fixes CVE-2026-83813, CVE-2023-44487, CVE-2026-115778,
CVE-2026-115775, CVE-2026-115877, CVE-2026-115774 and
CVE-2026-115776.

https://github.com/twisted/twisted/releases/tag/twisted-26.10.0

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8828cca1d64615cc8b74f24aef8add8e3d3d5572)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-twisted/python-twisted.hash | 4 ++--
 package/python-twisted/python-twisted.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index beb1c7f3b5..f65e733411 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5  931ac3e39a52c490f85d36bcb4c77369  twisted-26.4.0.tar.gz
-sha256  dbfd0fe1ee409d0243fdd7a6a6ff14f4948cec1fd78e0376291f805e1501fae9  twisted-26.4.0.tar.gz
+md5  02a15261bc2c23036399954941d951f4  twisted-26.10.0.tar.gz
+sha256  5f0355403e507fc23ceea85e9dbb4bc59335aabde41dd324e8b8cea180dd38de  twisted-26.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d7a2f74fe5c2b3f610052b75b5a131728c49823b28088893dacacf8d58849a4d  LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 09198d2afc..d45d2fef0f 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 26.4.0
+PYTHON_TWISTED_VERSION = 26.10.0
 PYTHON_TWISTED_SOURCE = twisted-$(PYTHON_TWISTED_VERSION).tar.gz
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/db/97/6e9beb1e78247ae6dc34114f27d538cf2cb183c4afcd3609dfdf2b0439c8
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/fe/31/a5f99ae7f1550914b0702b8f78118d95a79da20525d26fbc1b2ab42bc8ae
 PYTHON_TWISTED_SETUP_TYPE = hatch
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE

--===============5323094217549523112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5323094217549523112==--
