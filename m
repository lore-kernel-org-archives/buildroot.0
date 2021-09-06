Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E87EDC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 14:53:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B766960F6E
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 14:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B766960F6E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D2A881D18;
	Mon,  6 Sep 2021 14:53:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zeRmJoRrfLSp; Mon,  6 Sep 2021 14:53:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE86080E0E;
	Mon,  6 Sep 2021 14:53:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B53D1BF34D
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 14:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90D264028E
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 14:50:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7yjRrLMYpKl6 for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 14:50:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12B22403B8
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 14:50:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 82C73886B5; Mon,  6 Sep 2021 14:49:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Sep 2021 15:35:08 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 4dea3daafae14969b9d5ed00983eee086b626988
X-Git-Newrev: aa853e4455615f8987ef35d12faf1d139c19da30
X-Patchwork-Hint: ignore
Message-Id: <20210906144908.82C73886B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/haproxy: security
 bump to version 2.2.16
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=aa853e4455615f8987ef35d12faf1d139c19da30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

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
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 66a6f40bda..20be7deae4 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.2/src/haproxy-2.2.14.tar.gz.sha256
-sha256  6a9b702f04b07786f3e5878de8172a727acfdfdbc1cefe1c7a438df372f2fb61  haproxy-2.2.14.tar.gz
+# From: http://www.haproxy.org/download/2.2/src/haproxy-2.2.16.tar.gz.sha256
+sha256  b81e03a181070d1f7bcdaeec9f09af701fb1ab015c3c9c997a881f4773e29375  haproxy-2.2.16.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 6254819a9b..641ab03668 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.2
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).14
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).16
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
