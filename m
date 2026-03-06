Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EC3FCC062
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EAD241FC9;
	Fri,  6 Mar 2026 19:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4T59UQbJspAZ; Fri,  6 Mar 2026 19:52:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 313B041FB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826769;
	bh=Op/U3u4Qjy4+PJ2SMCXRbOX7b+7nHV7uKWUkOI0J9NQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Pu5WMjUW+NqSA6qzURY7MRSHaJ7RQHqHZLplU1S3JrW7YytKTw+7EhEkx9QyFoKLB
	 Ye0mj4SaQUdcFvyou1XgiOSaLONywT5iW5Ico2iAfd4a+9yxsm4+xpgl7zq2K1eDwe
	 Wc89MY4oAsyG8TjmjAXdY3HHAy6N87vKW2fLUOb5Jac/s+q50mz2SbYHTv7lzX4WP1
	 I/+K9R8OloeWVDALrOrVdSBwLo4A9KmsRv4kIiyQrSdduTFW1IVhmmLjjlD4yGkDwI
	 ZkxpP7oms/OZPdijZ3vwvyr6x3mLyYCzq4lmta9SggDV5wEosfzvU7ON/zxGBGPB4n
	 2ItaNOmw1TWFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 313B041FB1;
	Fri,  6 Mar 2026 19:52:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C6AA25B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B6D383A7D
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6W-jQ3-QnEI4 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59CA483BB9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59CA483BB9
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EF957FB67; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:14:29 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 763cd0b9a384bc0ccccd99bd9876e676d4050889
X-Git-Newrev: 4859a7b0f9d12c689a73e7e1f8c26f0f19234116
X-Patchwork-Hint: ignore
Message-Id: <20260306195223.6EF957FB67@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/squid: add patch
 for CVE-2025-62168
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4859a7b0f9d12c689a73e7e1f8c26f0f19234116
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following vulnerability:

- CVE-2025-62168:
    Squid is a caching proxy for the Web. In Squid versions prior to 7.2,
    a failure to redact HTTP authentication credentials in error handling
    allows information disclosure. The vulnerability allows a script to
    bypass browser security protections and learn the credentials a
    trusted client uses to authenticate. This potentially allows a remote
    client to identify security tokens or credentials used internally by a
    web application using Squid for backend load balancing. These attacks
    do not require Squid to be configured with HTTP authentication. The
    vulnerability is fixed in version 7.2. As a workaround, disable debug
    information in administrator mailto links generated by Squid by
    configuring squid.conf with email_err_data off.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-62168
  - https://github.com/squid-cache/squid/commit/0951a0681011dfca3d78c84fd7f1e19c78a4443f

The backport has been compared against debian patch [1].

[1] https://sources.debian.org/src/squid/6.13-2%2Bdeb13u1/debian/patches/CVE-2025-62168.patch

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8918f1c2c86844a5b4110cc71865838365324cfc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0002-Proxy-auth-data-visible-to-scripts.patch  | 212 +++++++++++++++++++++
 package/squid/squid.mk                             |   3 +
 2 files changed, 215 insertions(+)

diff --git a/package/squid/0002-Proxy-auth-data-visible-to-scripts.patch b/package/squid/0002-Proxy-auth-data-visible-to-scripts.patch
new file mode 100644
index 0000000000..2e5c67c8c1
--- /dev/null
+++ b/package/squid/0002-Proxy-auth-data-visible-to-scripts.patch
@@ -0,0 +1,212 @@
+From 0951a0681011dfca3d78c84fd7f1e19c78a4443f Mon Sep 17 00:00:00 2001
+From: Amos Jeffries <yadij@users.noreply.github.com>
+Date: Sat, 11 Oct 2025 16:33:02 +1300
+Subject: [PATCH] Bug 3390: Proxy auth data visible to scripts (#2249)
+
+Original changes to redact credentials from error page %R code
+expansion output was incomplete. It missed the parse failure
+case where ErrorState::request_hdrs raw buffer contained
+sensitive information.
+
+Also missed was the %W case where full request message headers
+were generated in a mailto link. This case is especially
+problematic as it may be delivered over insecure SMTP even if
+the error was secured with HTTPS.
+
+After this change:
+* The HttpRequest message packing code for error pages is de-duplicated
+  and elides authentication headers for both %R and %W code outputs.
+* The %R code output includes the CRLF request message terminator.
+* The email_err_data directive causing advanced details to be added to
+  %W mailto links is disabled by default.
+
+Also redact credentials from generated TRACE responses.
+
+---------
+
+Co-authored-by: Alex Rousskov <rousskov@measurement-factory.com>
+
+CVE: CVE-2025-62168
+Upstream: https://github.com/squid-cache/squid/commit/0951a0681011dfca3d78c84fd7f1e19c78a4443f
+[thomas: remove release note, backport errorpage.cc]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/HttpRequest.cc                  |  6 +++---
+ src/HttpRequest.h                   |  2 +-
+ src/cf.data.pre                     |  8 +++++++-
+ src/client_side_reply.cc            | 14 +++++++-------
+ src/errorpage.cc                    | 17 ++++-------------
+ src/errorpage.h                     |  1 -
+ src/tests/stub_HttpRequest.cc       |  2 +-
+ 8 files changed, 26 insertions(+), 27 deletions(-)
+
+diff --git a/src/HttpRequest.cc b/src/HttpRequest.cc
+index cd7ee71d4af..c6ed5bee45d 100644
+--- a/src/HttpRequest.cc
++++ b/src/HttpRequest.cc
+@@ -341,7 +341,7 @@ HttpRequest::swapOut(StoreEntry * e)
+ 
+ /* packs request-line and headers, appends <crlf> terminator */
+ void
+-HttpRequest::pack(Packable * p) const
++HttpRequest::pack(Packable * const p, const bool maskSensitiveInfo) const
+ {
+     assert(p);
+     /* pack request-line */
+@@ -349,8 +349,8 @@ HttpRequest::pack(Packable * p) const
+                SQUIDSBUFPRINT(method.image()), SQUIDSBUFPRINT(url.path()),
+                http_ver.major, http_ver.minor);
+     /* headers */
+-    header.packInto(p);
+-    /* trailer */
++    header.packInto(p, maskSensitiveInfo);
++    /* indicate the end of the header section */
+     p->append("\r\n", 2);
+ }
+ 
+diff --git a/src/HttpRequest.h b/src/HttpRequest.h
+index 6d369029322..28dc4daf99d 100644
+--- a/src/HttpRequest.h
++++ b/src/HttpRequest.h
+@@ -206,7 +206,7 @@ class HttpRequest: public Http::Message
+ 
+     void swapOut(StoreEntry * e);
+ 
+-    void pack(Packable * p) const;
++    void pack(Packable * p, bool maskSensitiveInfo = false) const;
+ 
+     static void httpRequestPack(void *obj, Packable *p);
+ 
+diff --git a/src/cf.data.pre b/src/cf.data.pre
+index 0a73020e111..2dce65a4d0a 100644
+--- a/src/cf.data.pre
++++ b/src/cf.data.pre
+@@ -8941,12 +8941,18 @@ NAME: email_err_data
+ COMMENT: on|off
+ TYPE: onoff
+ LOC: Config.onoff.emailErrData
+-DEFAULT: on
++DEFAULT: off
+ DOC_START
+ 	If enabled, information about the occurred error will be
+ 	included in the mailto links of the ERR pages (if %W is set)
+ 	so that the email body contains the data.
+ 	Syntax is <A HREF="mailto:%w%W">%w</A>
++
++	SECURITY WARNING:
++		Request headers and other included facts may contain
++		sensitive information about transaction history, the
++		Squid instance, and its environment which would be
++		unavailable to error recipients otherwise.
+ DOC_END
+ 
+ NAME: deny_info
+diff --git a/src/client_side_reply.cc b/src/client_side_reply.cc
+index d73bf3f99f6..fc2feccf802 100644
+--- a/src/client_side_reply.cc
++++ b/src/client_side_reply.cc
+@@ -94,7 +94,7 @@ clientReplyContext::clientReplyContext(ClientHttpRequest *clientContext) :
+ void
+ clientReplyContext::setReplyToError(
+     err_type err, Http::StatusCode status, char const *uri,
+-    const ConnStateData *conn, HttpRequest *failedrequest, const char *unparsedrequest,
++    const ConnStateData *conn, HttpRequest *failedrequest, const char *,
+ #if USE_AUTH
+     Auth::UserRequest::Pointer auth_user_request
+ #else
+@@ -104,9 +104,6 @@ clientReplyContext::setReplyToError(
+ {
+     auto errstate = clientBuildError(err, status, uri, conn, failedrequest, http->al);
+ 
+-    if (unparsedrequest)
+-        errstate->request_hdrs = xstrdup(unparsedrequest);
+-
+ #if USE_AUTH
+     errstate->auth_user_request = auth_user_request;
+ #endif
+@@ -995,11 +992,14 @@ clientReplyContext::traceReply()
+     triggerInitialStoreRead();
+     http->storeEntry()->releaseRequest();
+     http->storeEntry()->buffer();
++    MemBuf content;
++    content.init();
++    http->request->pack(&content, true /* hide authorization data */);
+     const HttpReplyPointer rep(new HttpReply);
+-    rep->setHeaders(Http::scOkay, nullptr, "text/plain", http->request->prefixLen(), 0, squid_curtime);
++    rep->setHeaders(Http::scOkay, nullptr, "message/http", content.contentSize(), 0, squid_curtime);
++    rep->body.set(SBuf(content.buf, content.size));
+     http->storeEntry()->replaceHttpReply(rep);
+-    http->request->swapOut(http->storeEntry());
+-    http->storeEntry()->complete();
++    http->storeEntry()->completeSuccessfully("traceReply() stored the entire response");
+ }
+ 
+ #define SENDING_BODY 0
+diff --git a/src/errorpage.cc b/src/errorpage.cc
+index d7a588d099f..06046de9ebb 100644
+--- a/src/errorpage.cc
++++ b/src/errorpage.cc
+@@ -792,7 +792,6 @@ ErrorState::~ErrorState()
+ {
+     safe_free(redirect_url);
+     safe_free(url);
+-    safe_free(request_hdrs);
+     wordlistDestroy(&ftp.server_msg);
+     safe_free(ftp.request);
+     safe_free(ftp.reply);
+@@ -850,7 +849,7 @@ ErrorState::Dump(MemBuf * mb)
+                     SQUIDSBUFPRINT(request->url.path()),
+                     AnyP::ProtocolType_str[request->http_ver.protocol],
+                     request->http_ver.major, request->http_ver.minor);
+-        request->header.packInto(&str);
++        request->header.packInto(&str, true /* hide authorization data */);
+     }
+ 
+     str.append("\r\n", 2);
+@@ -1112,18 +1111,10 @@ ErrorState::compileLegacyCode(Build &build)
+                 p = "[no request]";
+             break;
+         }
+-        if (request) {
+-            mb.appendf(SQUIDSBUFPH " " SQUIDSBUFPH " %s/%d.%d\n",
+-                       SQUIDSBUFPRINT(request->method.image()),
+-                       SQUIDSBUFPRINT(request->url.path()),
+-                       AnyP::ProtocolType_str[request->http_ver.protocol],
+-                       request->http_ver.major, request->http_ver.minor);
+-            request->header.packInto(&mb, true); //hide authorization data
+-        } else if (request_hdrs) {
+-            p = request_hdrs;
+-        } else {
++        else if (request)
++            request->pack(&mb, true /* hide authorization data */);
++        else
+             p = "[no request]";
+-        }
+         break;
+ 
+     case 's':
+diff --git a/src/errorpage.h b/src/errorpage.h
+index abca4a17d7b..297b306978d 100644
+--- a/src/errorpage.h
++++ b/src/errorpage.h
+@@ -194,7 +194,6 @@ class ErrorState
+         MemBuf *listing = nullptr;
+     } ftp;
+ 
+-    char *request_hdrs = nullptr;
+     char *err_msg = nullptr; /* Preformatted error message from the cache */
+ 
+     AccessLogEntryPointer ale; ///< transaction details (or nil)
+diff --git a/src/tests/stub_HttpRequest.cc b/src/tests/stub_HttpRequest.cc
+index 495597d9a1b..48a0f1ce03e 100644
+--- a/src/tests/stub_HttpRequest.cc
++++ b/src/tests/stub_HttpRequest.cc
+@@ -45,7 +45,7 @@ bool HttpRequest::expectingBody(const HttpRequestMethod &, int64_t &) const STUB
+ bool HttpRequest::bodyNibbled() const STUB_RETVAL(false)
+ int HttpRequest::prefixLen() const STUB_RETVAL(0)
+ void HttpRequest::swapOut(StoreEntry *) STUB
+-void HttpRequest::pack(Packable *) const STUB
++void HttpRequest::pack(Packable *, bool) const STUB
+ void HttpRequest::httpRequestPack(void *, Packable *) STUB
+ HttpRequest * HttpRequest::FromUrl(const SBuf &, const MasterXaction::Pointer &, const HttpRequestMethod &) STUB_RETVAL(nullptr)
+ HttpRequest * HttpRequest::FromUrlXXX(const char *, const MasterXaction::Pointer &, const HttpRequestMethod &) STUB_RETVAL(nullptr)
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index d445f005b7..c031f1aa03 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -15,6 +15,9 @@ SQUID_SELINUX_MODULES = apache squid
 # 0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch
 SQUID_IGNORE_CVES += CVE-2025-59362
 
+# 0002-Proxy-auth-data-visible-to-scripts.patch
+SQUID_IGNORE_CVES += CVE-2025-62168
+
 SQUID_DEPENDENCIES = libcap host-libcap libtool libxml2 host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 SQUID_CONF_ENV = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
