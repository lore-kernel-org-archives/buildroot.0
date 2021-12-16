Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BCEC433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 19:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1E36417B7;
	Thu, 16 Dec 2021 19:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cVhJyrtIJW0K; Thu, 16 Dec 2021 19:10:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33A09417AF;
	Thu, 16 Dec 2021 19:10:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A07811BF3A9
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BFC4417AF
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dVQnxcgec652 for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 19:09:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C34CF417AD
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 19:09:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4929E821EB; Thu, 16 Dec 2021 19:04:23 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 20:07:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 086d357dfb177ef28d7831716707d2424a2ea4bd
X-Git-Newrev: 44a97dcb93ebe279f15ce625c23930c50beeb009
X-Patchwork-Hint: ignore
Message-Id: <20211216190423.4929E821EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/privoxy: security bump to version
 3.0.33
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=44a97dcb93ebe279f15ce625c23930c50beeb009
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

  - cgi_error_no_template(): Encode the template name to prevent
    XSS (cross-site scripting) when Privoxy is configured to servce
    the user-manual itself.
    Commit 0e668e9409c. OVE-20211102-0001. CVE-2021-44543.
    Reported by: Artem Ivanov

  - get_url_spec_param(): Free memory of compiled pattern spec
    before bailing.
    Reported by Joshua Rogers (Opera) who also provided the fix.
    Commit 652b4b7cb0. OVE-20211201-0003. CVE-2021-44540.

  - process_encrypted_request_headers(): Free header memory when
    failing to get the request destination.
    Reported by Joshua Rogers (Opera) who also provided the fix.
    Commit 0509c58045. OVE-20211201-0002. CVE-2021-44541.

  - send_http_request(): Prevent memory leaks when handling errors
    Reported by Joshua Rogers (Opera) who also provided the fix.
    Commit c48d1d6d08. OVE-20211201-0001. CVE-2021-44542.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/privoxy/privoxy.hash | 8 ++++----
 package/privoxy/privoxy.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/privoxy/privoxy.hash b/package/privoxy/privoxy.hash
index 92ecd1dd21..cf1056ecc4 100644
--- a/package/privoxy/privoxy.hash
+++ b/package/privoxy/privoxy.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/ijbswa/files/Sources/3.0.32%20%28stable%29/
-md5  3a0a8ebdf80e0a29154683e74cbf510b  privoxy-3.0.32-stable-src.tar.gz
-sha1  3a298ab2599fc92555c86dc29a37742d7396a0d3  privoxy-3.0.32-stable-src.tar.gz
+# From https://sourceforge.net/projects/ijbswa/files/Sources/3.0.33%20%28stable%29/
+md5  d6caf3eaad4812f0658b68d5b3ba3a06  privoxy-3.0.33-stable-src.tar.gz
+sha1  688da305077d8ecbcf6423e02201f01f7a7098f4  privoxy-3.0.33-stable-src.tar.gz
 # Locally computed
-sha256  c61de4008c62445ec18f1f270407cbf2372eaba93beaccdc9e3238bb2defeed7  privoxy-3.0.32-stable-src.tar.gz
+sha256  04b104e70dac61561b9dd110684b250fafc8c13dbe437a60fae18ddd9a881fae  privoxy-3.0.33-stable-src.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/privoxy/privoxy.mk b/package/privoxy/privoxy.mk
index c1859ed5f2..06642200df 100644
--- a/package/privoxy/privoxy.mk
+++ b/package/privoxy/privoxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PRIVOXY_VERSION = 3.0.32
+PRIVOXY_VERSION = 3.0.33
 PRIVOXY_SITE = http://downloads.sourceforge.net/project/ijbswa/Sources/$(PRIVOXY_VERSION)%20%28stable%29
 PRIVOXY_SOURCE = privoxy-$(PRIVOXY_VERSION)-stable-src.tar.gz
 # configure not shipped
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
