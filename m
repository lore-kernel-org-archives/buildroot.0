Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D11606A322
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 09:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DlzeEzMw
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 240BE40952;
	Thu, 22 Oct 2026 09:39:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8BPQzs86An5j; Thu, 22 Oct 2026 09:39:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 377C94096D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792661981;
	b=h/55LuoO5N7wwJfwJc6ADYR/CAd9bvn0t/YxKEAJFYun4kpd0D2NlWjDx3CW4dcfnPXj
	 6/mRIe2HETsbspq6GPsKC48dQbw+8RpaxYjmPlIyRtYdQ802D20r1E+lCNcSQMZEi01X+
	 VlAsn/5RvrtRPh4rVd7/NSHxQv3vwl2/NtPWTmbuygVEwWeQjpzlM6bgxt9S3G3IIY8K/
	 jlA114+bp7CtG6MY5L5mlRN7mu8yEUjSCc20xEErviForp4Rq4G07liyfM7QybM7ZURo/
	 6+dKuqnOXyVqk9XYlJirhEclI8L3iPEiBGjZbhKYIHmj+ffboxWbfRYvElCg7nkLL1A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792661981;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hrIoJ2Tgj4DoiDP9iqmwEjpWobdwpNAXFkS+Ip/lOH8=;
	b=OB4wtEg7sQH1APAf/CkWvl+krvZPRHedbNKSUOqe8hGDs6kYW/YCvOPi1Nognx2LeeQh
	 vW7gWcS4tJPGdKcWMd46lUEoaK0GjNtPbviwfqoxFgoYohewhIm2tKTLKDlKO/hdFTRqH
	 +Ycx+bMzbiIDGsL+3rzqSvGscz/opOopZBbdRokLjNP59/WrQJwUOZD3a1gwC6enuYzTb
	 nMbrnsBYqeUQto2dV2U9PQcEFiItivvyjHMbJ05yKAWu4vfGDmYDaT+vBEogbwq5igkov
	 eRa2Ydw+3Yc/kY4WE0v/zkn/cNVtgNUbGusIPlr7VrTXfhep7sfYeJuoigz8R+XhLlg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792661981;
	bh=hrIoJ2Tgj4DoiDP9iqmwEjpWobdwpNAXFkS+Ip/lOH8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DlzeEzMwWa9sO+jFVimDgBjTwY8o7HklNhVqOUPy2W6Uz8yPbV0M2m0q0jxkXWym+
	 sWwvPjEJ1ZgRdRbPV4grWH+AvmGLuFWD2nrCybr5dhdmO3wiqbDT1BRmCxV6CdZuJP
	 m4Qs/H7wxA5dfDEyPJFMrTo7AXJh0sx+rsuD+/gc+ePgil/qGJAF7osjkHcazImvEJ
	 VzfxhM7sYi8t4t8w0FfYrC0A8+T/ngK0gIS/4pYWWhmkTjGn9G1O2KvkwFM0r4hnnF
	 nkggYVTPlR2dOQTfxEQq5DrYcPBT3x/aQM4XpYMYPNTdXMI2eB4HE/prXHOTfX4prw
	 nmVhXT/IZbF6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 377C94096D;
	Thu, 22 Oct 2026 09:39:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B433D1AB
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A675280CD3
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OBAQ9EG2Irsv for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 09:39:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C334380870
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792661975;
 b=S4EZDxNeyWcYDOxZfIN0YL6ARuzVHQSEegu/QKhzFJHv5UkXIyjtJA3JD/X4idLr12q0
 7MPCpeRAsKlDB0g+ObymWj69ZdZBHLc44TQNxIuif4B/hCaOMkO6ceyeO44KA6RJn5Up0
 E8SNMo+a+jInbBfHxXqgIVvK5Sy1qZx/79i3qeZbtgTKX/ftKIniE9eStPgU97ET8g5U/
 fE1gzveDzGDexABxMu1NFpIKvCQjCZf3+3sV4oE1SOSLcEMmq4QurSiFSzw2cPxc3zh2W
 V1y/f/im+zwdqp1XmJFOzp06xEeQEbXOm4wvBCVzDO8gWPFui0VDASoqD93q5Qv1i0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792661975;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=heJagCYCD6iuR9DBOSe7dVBfr+4RbXoLt4dsxwYemDI=;
 b=Ua/AXVB6GPHuf+bMC3hH3K8qnX0UXS4owf9GobWoOMg//KOtBHJvevVVxxKFfR9g/JMO
 ifaUcRvEKfxH5pO+GHWWW9mUX9eATVHot8nM6dUQ7bcogxk5IVR/uRQ8/6oRYFYphdu4e
 a+3s2L7s3P53r47/9axTRltiVFG/xeWr4sE7yVztbrnirCHVvVPPqTcyP+Vo5NxUFoEFe
 5sGXUSy9dGi16avRMoMGNXKrLBUztjxbwIN3eWU50AztrCOkG8zitz66xFBiCCrH2H7AN
 gkI0iBu5sm/qvcAqaaDDNuxchk4YL8EFPlIVh4QesnuqxyY7/64YjHovA+af7UvmVXA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C334380870
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:39:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C710F9B986; Thu, 22 Oct 2026 09:38:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 11:37:22 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 6fb12d67a19a9e0923dab2ca772097fd92f93a4d
X-Git-Newrev: 71b287c0298af6e59f2ee99ea0798df9c23b4313
X-Patchwork-Hint: ignore
Message-Id: <20261022093811.C710F9B986@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/php: security
 bump to v8.5.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/71b287c0298af6e59f2ee99ea0798df9c23b4313
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

This release include fixes for critical remote code execution
vulnerabilities:

- https://www.php.net/archive/2026.php#2026-10-21-5

See the release notes: https://www.php.net/ChangeLog-8.php#8.5.12

This fixes the following vulnerabilities:

- CVE-2026-109618: https://github.com/php/php-src/security/advisories/GHSA-w8hw-w9fx-j79w
- CVE-2026-109619: https://github.com/php/php-src/security/advisories/GHSA-6wmf-4rv5-p3rp

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e9be6e35d3da84c9ba1ea792169641b38e086e34)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 0f2b6785bf..e1e92781ea 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  d9be75c08e8c316f4c8f4194d8fbe1750a15f6a6d9d4e3fe72082abeeb800360  php-8.5.11.tar.xz
+sha256  08bc2eba2a588654ade1357174aa646b761556c862dda0678345ee29ed481209  php-8.5.12.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 48525b7e29..63078cf254 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.11
+PHP_VERSION = 8.5.12
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
