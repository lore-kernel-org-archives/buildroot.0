Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFEECD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 445D941F8A;
	Fri, 29 May 2026 08:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OwUGUms8xFhZ; Fri, 29 May 2026 08:25:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E62B341FC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043136;
	bh=qvXGCCX3egWnLZQPz3H4Qnc0rehyzBRwae9nBSZxtXs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QkHNFqN85kJASgnJwIMqlz1tPVMz3OZlpjzddYBZF76ICYl7rXpqCUS7Js3sX40ot
	 GypKWDT96QfISgxZv0Du6LuiYbrvhHeDMp04q153geB00HlaHFHq1S/WsRAqtISMOA
	 4y9gUbPYZSrFvre59TTKQRHwnykTtpCpJIbPPpO0q33yj0SKXHfkWbbvCoOdVR51/M
	 V5KjuCdUe9DeqwW55PEGnM6jxzNTQLREO+zo5GYYv+XYIXqXd7TBhezTMTZDmiJ2K8
	 uaI9nsQXPzcUW3j2QYw8r+/fvcezH5IoZmUmY1r3uoOxRda0M/dCr0H5GFbITiCGIv
	 U7nIwbsb6AXTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E62B341FC0;
	Fri, 29 May 2026 08:25:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13E90288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63F1D41F99
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XaQTDu7ZBGsN for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1E0541F62
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1E0541F62
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 519C787334; Fri, 29 May 2026 08:25:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 10:47:34 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 43ade7f40f3b944e227421bd158060f88018f017
X-Git-Newrev: 4eed3816f468b46f91a452253106dbe82a473e71
X-Patchwork-Hint: ignore
Message-Id: <20260529082506.519C787334@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libvncserver:
 patch CVE-2026-3285{3, 4}
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
Content-Type: multipart/mixed; boundary="===============1800000502662152600=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1800000502662152600==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4eed3816f468b46f91a452253106dbe82a473e71
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- CVE-2026-32853:
    LibVNCServer versions 0.9.15 and prior (fixed in commit 009008e)
    contain a heap out-of-bounds read vulnerability in the UltraZip
    encoding handler that allows a malicious VNC server to cause
    information disclosure or application crash. Attackers can exploit
    improper bounds checking in the HandleUltraZipBPP() function by
    manipulating subrectangle header counts to read beyond the allocated
    heap buffer.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-32853
  - https://github.com/LibVNC/libvncserver/security/advisories/GHSA-87q7-v983-qwcj
  - https://github.com/LibVNC/libvncserver/commit/009008e2f4d5a54dd71f422070df3af7b3dbc931

- CVE-2026-32854:
    LibVNCServer versions 0.9.15 and prior (fixed in commit dc78dee)
    contain null pointer dereference vulnerabilities in the HTTP proxy
    handlers within httpProcessInput() in httpd.c that allow remote
    attackers to cause a denial of service by sending specially crafted
    HTTP requests. Attackers can exploit missing validation of strchr()
    return values in the CONNECT and GET proxy handling paths to trigger
    null pointer dereferences and crash the server when httpd and proxy
    features are enabled.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-32854
  - https://github.com/LibVNC/libvncserver/security/advisories/GHSA-xjp8-4qqv-5x4x
  - https://github.com/LibVNC/libvncserver/commit/dc78dee51a7e270e537a541a17befdf2073f5314

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 258128aefef95cae78cb5fba8572dc6ce285c801)
[thomas: backport patch to 2025.02]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...s-checks-to-UltraZip-subrectangle-parsing.patch | 74 ++++++++++++++++++++++
 ...nter-dereferences-in-httpd-proxy-handlers.patch | 64 +++++++++++++++++++
 package/libvncserver/libvncserver.mk               |  6 ++
 3 files changed, 144 insertions(+)

diff --git a/package/libvncserver/0001-add-bounds-checks-to-UltraZip-subrectangle-parsing.patch b/package/libvncserver/0001-add-bounds-checks-to-UltraZip-subrectangle-parsing.patch
new file mode 100644
index 0000000000..7fd7ab9347
--- /dev/null
+++ b/package/libvncserver/0001-add-bounds-checks-to-UltraZip-subrectangle-parsing.patch
@@ -0,0 +1,74 @@
+From 009008e2f4d5a54dd71f422070df3af7b3dbc931 Mon Sep 17 00:00:00 2001
+From: Kazuma Matsumoto <269371721+y637F9QQ2x@users.noreply.github.com>
+Date: Sun, 22 Mar 2026 20:35:49 +0100
+Subject: [PATCH] libvncclient: add bounds checks to UltraZip subrectangle
+ parsing
+
+HandleUltraZipBPP() iterates over sub-rectangles using numCacheRects
+(derived from the attacker-controlled rect.r.x) without validating
+that the pointer stays within the decompressed data buffer. A malicious
+server can set a large numCacheRects value, causing heap out-of-bounds
+reads via the memcpy calls in the parsing loop.
+
+Add bounds checks before reading the 12-byte subrect header and before
+advancing the pointer by the raw pixel data size. Use uint64_t for the
+raw data size calculation to prevent integer overflow on 32-bit platforms.
+
+Upstream: https://github.com/LibVNC/libvncserver/commit/009008e2f4d5a54dd71f422070df3af7b3dbc931
+CVE: CVE-2026-32853
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libvncclient/ultra.c | 16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/libvncclient/ultra.c b/libvncclient/ultra.c
+index 1d3aaba6a..5633b8cbb 100644
+--- a/libvncclient/ultra.c
++++ b/libvncclient/ultra.c
+@@ -126,6 +126,7 @@ HandleUltraZipBPP (rfbClient* client, int rx, int ry, int rw, int rh)
+   int toRead=0;
+   int inflateResult=0;
+   unsigned char *ptr=NULL;
++  unsigned char *ptr_end=NULL;
+   lzo_uint uncompressedBytes = ry + (rw * 65535);
+   unsigned int numCacheRects = rx;
+ 
+@@ -194,11 +195,18 @@ HandleUltraZipBPP (rfbClient* client, int rx, int ry, int rw, int rh)
+   
+   /* Put the uncompressed contents of the update on the screen. */
+   ptr = (unsigned char *)client->raw_buffer;
++  ptr_end = ptr + uncompressedBytes;
+   for (i=0; i<numCacheRects; i++)
+   {
+     unsigned short sx, sy, sw, sh;
+     unsigned int se;
+ 
++    /* subrect header: sx(2) + sy(2) + sw(2) + sh(2) + se(4) = 12 bytes */
++    if (ptr + 12 > ptr_end) {
++      rfbClientLog("UltraZip: subrect %d header exceeds decompressed data bounds\n", i);
++      return FALSE;
++    }
++
+     memcpy((char *)&sx, ptr, 2); ptr += 2;
+     memcpy((char *)&sy, ptr, 2); ptr += 2;
+     memcpy((char *)&sw, ptr, 2); ptr += 2;
+@@ -213,8 +221,13 @@ HandleUltraZipBPP (rfbClient* client, int rx, int ry, int rw, int rh)
+ 
+     if (se == rfbEncodingRaw)
+     {
++        uint64_t rawBytes = (uint64_t)sw * sh * (BPP / 8);
++        if (rawBytes > (size_t)(ptr_end - ptr)) {
++          rfbClientLog("UltraZip: subrect %d raw data exceeds decompressed data bounds\n", i);
++          return FALSE;
++        }
+         client->GotBitmap(client, (unsigned char *)ptr, sx, sy, sw, sh);
+-        ptr += ((sw * sh) * (BPP / 8));
++        ptr += (size_t)rawBytes;
+     }
+   }  
+ 
+@@ -222,3 +235,4 @@ HandleUltraZipBPP (rfbClient* client, int rx, int ry, int rw, int rh)
+ }
+ 
+ #undef CARDBPP
++
diff --git a/package/libvncserver/0002-fix-NULL-pointer-dereferences-in-httpd-proxy-handlers.patch b/package/libvncserver/0002-fix-NULL-pointer-dereferences-in-httpd-proxy-handlers.patch
new file mode 100644
index 0000000000..6d2438b317
--- /dev/null
+++ b/package/libvncserver/0002-fix-NULL-pointer-dereferences-in-httpd-proxy-handlers.patch
@@ -0,0 +1,64 @@
+From dc78dee51a7e270e537a541a17befdf2073f5314 Mon Sep 17 00:00:00 2001
+From: Kazuma Matsumoto <269371721+y637F9QQ2x@users.noreply.github.com>
+Date: Thu, 19 Mar 2026 17:42:00 +0900
+Subject: [PATCH] libvncserver: fix NULL pointer dereferences in httpd proxy
+ handlers
+
+httpProcessInput() passes the return value of strchr() to atoi()
+and strncmp() without checking for NULL. If a CONNECT request
+contains no colon, or a GET request contains no slash, strchr()
+returns NULL, leading to a segmentation fault.
+
+Add NULL checks before using the strchr() return values.
+
+CVE: CVE-2026-32854
+Upstream: https://github.com/LibVNC/libvncserver/commit/dc78dee51a7e270e537a541a17befdf2073f5314
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libvncserver/httpd.c | 24 ++++++++++++++----------
+ 1 file changed, 14 insertions(+), 10 deletions(-)
+
+diff --git a/libvncserver/httpd.c b/libvncserver/httpd.c
+index f4fe51c9..7cefadc4 100644
+--- a/libvncserver/httpd.c
++++ b/libvncserver/httpd.c
+@@ -337,10 +337,11 @@ httpProcessInput(rfbScreenInfoPtr rfbScreen)
+ 
+ 
+     /* Process the request. */
+-    if(rfbScreen->httpEnableProxyConnect) {
++if(rfbScreen->httpEnableProxyConnect) {
+ 	const static char* PROXY_OK_STR = "HTTP/1.0 200 OK\r\nContent-Type: octet-stream\r\nPragma: no-cache\r\n\r\n";
+ 	if(!strncmp(buf, "CONNECT ", 8)) {
+-	    if(atoi(strchr(buf, ':')+1)!=rfbScreen->port) {
++	    char *colon = strchr(buf, ':');
++	    if(colon == NULL || atoi(colon+1)!=rfbScreen->port) {
+ 		rfbErr("httpd: CONNECT format invalid.\n");
+ 		rfbWriteExact(&cl,INVALID_REQUEST_STR, strlen(INVALID_REQUEST_STR));
+ 		httpCloseSock(rfbScreen);
+@@ -353,14 +354,17 @@ httpProcessInput(rfbScreenInfoPtr rfbScreen)
+ 	    rfbScreen->httpSock = RFB_INVALID_SOCKET;
+ 	    return;
+ 	}
+-	if (!strncmp(buf, "GET ",4) && !strncmp(strchr(buf,'/'),"/proxied.connection HTTP/1.", 27)) {
+-	    /* proxy connection */
+-	    rfbLog("httpd: client asked for /proxied.connection\n");
+-	    rfbWriteExact(&cl,PROXY_OK_STR,strlen(PROXY_OK_STR));
+-	    rfbNewClientConnection(rfbScreen,rfbScreen->httpSock);
+-	    rfbScreen->httpSock = RFB_INVALID_SOCKET;
+-	    return;
+-	}	   
++	if (!strncmp(buf, "GET ",4)) {
++	    char *slash = strchr(buf, '/');
++	    if (slash != NULL && !strncmp(slash,"/proxied.connection HTTP/1.", 27)) {
++		/* proxy connection */
++		rfbLog("httpd: client asked for /proxied.connection\n");
++		rfbWriteExact(&cl,PROXY_OK_STR,strlen(PROXY_OK_STR));
++		rfbNewClientConnection(rfbScreen,rfbScreen->httpSock);
++		rfbScreen->httpSock = RFB_INVALID_SOCKET;
++		return;
++	    }
++	}
+     }
+ 
+     if (strncmp(buf, "GET ", 4)) {
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 082f838f12..1871f9eded 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -14,6 +14,12 @@ LIBVNCSERVER_INSTALL_STAGING = YES
 LIBVNCSERVER_DEPENDENCIES = host-pkgconf lzo
 LIBVNCSERVER_CONF_OPTS = -DWITH_LZO=ON
 
+# 0001-add-bounds-checks-to-UltraZip-subrectangle-parsing.patch
+LIBVNCSERVER_IGNORE_CVES += CVE-2026-32853
+
+# 0002-fix-NULL-pointer-dereferences-in-httpd-proxy-handlers.patch
+LIBVNCSERVER_IGNORE_CVES += CVE-2026-32854
+
 # only used for examples
 LIBVNCSERVER_CONF_OPTS += \
 	-DWITH_EXAMPLES=OFF \

--===============1800000502662152600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1800000502662152600==--
