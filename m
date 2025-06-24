Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA49DC7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F13E41932;
	Thu, 26 Jun 2025 19:13:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5qqDEMID1hU; Thu, 26 Jun 2025 19:13:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7140141930
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7140141930;
	Thu, 26 Jun 2025 19:13:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F21010A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 595CE60767
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DH9pGeLzpo0j for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:13:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B3256074A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B3256074A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:13:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5983E84549; Thu, 26 Jun 2025 19:13:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 24 Jun 2025 21:00:02 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6fb63beb84b6335bdc3742bc9101b146e6fa855d
X-Git-Newrev: 3b609f1b0cba17493ce792f047af7d790997bd4f
X-Patchwork-Hint: ignore
Message-Id: <20250626191316.5983E84549@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libndp: fix build
 with GCC 14 and musl
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b609f1b0cba17493ce792f047af7d790997bd4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Patch has been pending upstream for a while [1], Alpine has merged an
older version that includes some whitespace damage but is functionally
equivalent.

[1] https://github.com/jpirko/libndp/pull/29

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0c2aa35fbef1d4f928433bf61323347d3c54c4e3)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...patible-pointer-types-with-gcc14-and-musl.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/libndp/0001-fix-incompatible-pointer-types-with-gcc14-and-musl.patch b/package/libndp/0001-fix-incompatible-pointer-types-with-gcc14-and-musl.patch
new file mode 100644
index 0000000000..6cf97e8afa
--- /dev/null
+++ b/package/libndp/0001-fix-incompatible-pointer-types-with-gcc14-and-musl.patch
@@ -0,0 +1,43 @@
+From e821ddbfdff5e1b14846421d9196978ffebac346 Mon Sep 17 00:00:00 2001
+From: oreo639 <oreo6391@gmail.com>
+Date: Sat, 15 Mar 2025 18:38:50 -0700
+Subject: [PATCH] libndp: fix incompatible pointer types with gcc14 and musl
+
+When compiling with gcc14 and musl, the following error is produced:
+libndp.c: In function 'mysendto6':
+libndp.c:212:50: error: passing argument 5 of 'sendto' from incompatible pointer type [-Wincompatible-pointer-types]
+  212 |         ret = sendto(sockfd, buf, buflen, flags, &sin6, sizeof(sin6));
+      |                                                  ^~~~~
+      |                                                  |
+      |                                                  struct sockaddr_in6 *
+In file included from libndp.c:27:
+/usr/include/sys/socket.h:343:49: note: expected 'const struct sockaddr *' but argument is of type 'struct sockaddr_in6 *'
+  343 | ssize_t sendto (int, const void *, size_t, int, const struct sockaddr *, socklen_t);
+      |                                                 ^~~~~~~~~~~~~~~~~~~~~~~
+
+In POSIX, sendto() takes a sockaddr pointer:
+https://pubs.opengroup.org/onlinepubs/009604499/functions/sendto.html
+
+While glibc uses the gcc __transparent_union__ extension to mark them as
+compatible types, musl does not, as such we need to explicitly cast the pointer
+to tell the compiler that it is fine.
+
+Upstream: https://github.com/jpirko/libndp/pull/29
+Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
+---
+ libndp/libndp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libndp/libndp.c b/libndp/libndp.c
+index fa20a31..315333a 100644
+--- a/libndp/libndp.c
++++ b/libndp/libndp.c
+@@ -209,7 +209,7 @@ static int mysendto6(int sockfd, void *buf, size_t buflen, int flags,
+ 	memcpy(&sin6.sin6_addr, addr, sizeof(sin6.sin6_addr));
+ 	sin6.sin6_scope_id = ifindex;
+ resend:
+-	ret = sendto(sockfd, buf, buflen, flags, &sin6, sizeof(sin6));
++	ret = sendto(sockfd, buf, buflen, flags, (struct sockaddr*)&sin6, sizeof(sin6));
+ 	if (ret == -1) {
+ 		switch(errno) {
+ 		case EINTR:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
