Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DCFC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:31:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DF1760524
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4DF1760524
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DA9040797;
	Thu, 26 Aug 2021 22:31:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jgwvYDOh9J-Z; Thu, 26 Aug 2021 22:31:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBD9B4079E;
	Thu, 26 Aug 2021 22:31:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1005A1BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00EA4407B2
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nrA29jhb1OEt for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83958407BB
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E59BA8DC71; Thu, 26 Aug 2021 22:01:31 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 22:49:30 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d19077677fc71fc8c8cd73945606f773d907a99a
X-Git-Newrev: a380e058338b5fc006cb76544a4b080e52cc0f4b
X-Patchwork-Hint: ignore
Message-Id: <20210826220131.E59BA8DC71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/haproxy: security bump
 to version 2.4.3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=a380e058338b5fc006cb76544a4b080e52cc0f4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes the following security issues:

- CVE-2021-39240: An issue was discovered in HAProxy 2.2 before 2.2.16, 2.3
  before 2.3.13, and 2.4 before 2.4.3.  It does not ensure that the scheme
  and path portions of a URI have the expected characters.  For example, the
  authority field (as observed on a target HTTP/2 server) might differ from
  what the routing rules were intended to achieve.

- CVE-2021-39241: An issue was discovered in HAProxy 2.0 before 2.0.24, 2.2
  before 2.2.16, 2.3 before 2.3.13, and 2.4 before 2.4.3.  An HTTP method
  name may contain a space followed by the name of a protected resource.  It
  is possible that a server would interpret this as a request for that
  protected resource, such as in the "GET /admin?  HTTP/1.1 /static/images
  HTTP/1.1" example.

- CVE-2021-39242: An issue was discovered in HAProxy 2.2 before 2.2.16, 2.3
  before 2.3.13, and 2.4 before 2.4.3.  It can lead to a situation with an
  attacker-controlled HTTP Host header, because a mismatch between Host and
  authority is mishandled.

For more details, see the advisory:
https://www.mail-archive.com/haproxy@formilux.org/msg41041.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 849d362dc0..9edf5def08 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.4/src/haproxy-2.4.2.tar.gz.sha256
-sha256  edf9788f7f3411498e3d7b21777036b4dc14183e95c8e2ce7577baa0ea4ea2aa  haproxy-2.4.2.tar.gz
+# From: http://www.haproxy.org/download/2.4/src/haproxy-2.4.3.tar.gz.sha256
+sha256  ce479380be5464faa881dcd829618931b60130ffeb01c88bc2bf95e230046405  haproxy-2.4.3.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 4c02b6d334..85d4fa7e8d 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.4
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).2
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).3
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
