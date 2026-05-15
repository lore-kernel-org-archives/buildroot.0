Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BEECD4F49
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADEDE842A2;
	Fri, 15 May 2026 13:30:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Byl66SUnbAme; Fri, 15 May 2026 13:30:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8795842F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851827;
	bh=07/to5JGl2HmHgeYfB59QMd5ota2VmHwjep3LLLrChI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JR+3ozp+yGV98zcpFrYl0to3DvKBmti6RwKV0kNEXA+VFkmKL1TCAVd8sR0KfmgLV
	 FOtwdxM+tHMMOgL5561NwLrfK+GU683DBbNXzRJWyz6DVmvUJo3lZvzm7BWVNFmnsA
	 aU69Av13jYQavoQLZJ9PEVVyUi/InIFLgDSJKny0rA/V5xh2nyf90be6dTrflYqGFu
	 MMsh9CCt1wNOgx+vBksp6Cyzrm6r1eZsTQwEy8SnadGhn/Vs3Ai7IIHU7pGMN2gUE7
	 GNlXXSrDxYmcrhmwxzhZYwnL11NA6kT7lxJ4lLaSaKkOHIO2EqDZmceI/ZcgOM04wt
	 fCtqureLQQIXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8795842F2;
	Fri, 15 May 2026 13:30:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EE9A36E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1991D41A69
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1T7KcfkdRNrF for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E63DC41A67
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E63DC41A67
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 462F586352; Fri, 15 May 2026 13:29:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 13:59:29 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 68b00849326279ab6fe5c30f0faa358ab2cbe1a9
X-Git-Newrev: 44336bb9a790bc150bd4d22832c017c80e777dc8
X-Patchwork-Hint: ignore
Message-Id: <20260515132949.462F586352@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/nginx: security
 bump to version 1.28.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/44336bb9a790bc150bd4d22832c017c80e777dc8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Fixes the following security issues:
- CVE-2026-27654: Buffer overflow in ngx_http_dav_module when using the
  alias directive with WebDAV COPY or MOVE requests.
- CVE-2026-27784 & CVE-2026-32647: Buffer overflows in ngx_http_mp4_module
  when processing specially crafted MP4 files.
- CVE-2026-27651: NULL pointer dereference in the mail proxy module
  during CRAM-MD5 or APOP authentication retries.
- CVE-2026-28753: DNS PTR record manipulation in auth_http or SMTP proxy.
- CVE-2026-28755: OCSP certificate check bypass in the stream module.

For a full list of changes, see:
https://nginx.org/en/CHANGES-1.28

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit 8008da299f2d7321b3831b1cdca315aa3973ad04)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/nginx/nginx.hash | 2 +-
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 7b79036b20..1d11937987 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  40e7a0916d121e8905ef50f2a738b675599e42b2224a582dd938603fed15788e  nginx-1.28.1.tar.gz
+sha256  2c96a946bfb0882a21744ed429770a2123ae1828c7c48665092993ddee91a918  nginx-1.28.3.tar.gz
 # License files, locally calculated
 sha256  77c01620abf36ed747b7eca4bd271e49023fe3a8e2b3525bcf4b09c8e3aa28e4  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 41490caee2..a8b7ee7319 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.28.1
+NGINX_VERSION = 1.28.3
 NGINX_SITE = https://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
