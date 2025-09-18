Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B71CAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A36B60ACB;
	Fri, 19 Sep 2025 12:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0iqRG3h8oEJk; Fri, 19 Sep 2025 12:48:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF5CF60D78
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF5CF60D78;
	Fri, 19 Sep 2025 12:48:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 944F3273
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B044822C0
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9y_1jmGOg7dj for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:48:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4B6D80D84
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4B6D80D84
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:48:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B365C85F29; Fri, 19 Sep 2025 12:48:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 10:36:13 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 466681da77f3e0b697ad9ab9c66e4bf83a30f92c
X-Git-Newrev: fe75232ca30c86d743c8327144299c1d15600f8d
X-Patchwork-Hint: ignore
Message-Id: <20250919124805.B365C85F29@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/kodi: Fix build
 with curl 8.16.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe75232ca30c86d743c8327144299c1d15600f8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

curl 8.16.0 bumped the enums to long, see
https://github.com/curl/curl/pull/18054

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3ed6c8e727934ef9c84699f1de14e46724bfa7f1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/kodi/0002-curl-8.16.0.patch | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/kodi/0002-curl-8.16.0.patch b/package/kodi/0002-curl-8.16.0.patch
new file mode 100644
index 0000000000..31ffa7b964
--- /dev/null
+++ b/package/kodi/0002-curl-8.16.0.patch
@@ -0,0 +1,24 @@
+Fix build with curl 8.16.0
+
+Downloaded from
+https://gitlab.alpinelinux.org/alpine/aports/-/commit/106a02411488e3f71b9f2085a4a857e4be27b9ea
+
+Upstream: https://github.com/xbmc/xbmc/pull/27224
+
+The upstream patch is aimed at the upcoming release of Kodi 22.0 which
+saw many changes to CurlFile.cpp so we use the fix from Alpine.
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/xbmc/filesystem/CurlFile.cpp
++++ b/xbmc/filesystem/CurlFile.cpp
+@@ -44,7 +44,7 @@ using namespace std::chrono_literals;
+ 
+ #define FITS_INT(a) (((a) <= INT_MAX) && ((a) >= INT_MIN))
+ 
+-curl_proxytype proxyType2CUrlProxyType[] = {
++long proxyType2CUrlProxyType[] = {
+     CURLPROXY_HTTP,   CURLPROXY_SOCKS4,          CURLPROXY_SOCKS4A,
+     CURLPROXY_SOCKS5, CURLPROXY_SOCKS5_HOSTNAME, CURLPROXY_HTTPS,
+ };
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
