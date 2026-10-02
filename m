Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236DFCA5FE0
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA9A340CA6;
	Fri,  2 Oct 2026 19:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RUI6cIzSEaSb; Fri,  2 Oct 2026 19:45:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9C21340DC4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790970313;
	b=DmeJ3l6ZDKR5hUFl3ZHOVI1YOAC36sTAoYrd61R/9GzeMKE6hXPSkJmvOXrjhAI3dz6y
	 chDrCKjDfjN3BGpJYChYHIPEgdCc8pcabsxPAAN9nZh0SNLrVbZvamVO9PrSnk3oCf0J4
	 wLC1andp0EWFI9s8z0IhQZ+Z9oMi+SWbvnrfUkfLJ1U+p81k9m1So2g/XIC7OgpwP/0xB
	 Z3Eno5Ovi5ZHQbwUr0NQif9VJsW4lBtJRqjuMB3Qr2nDjgd5BQHFIyr9zWdD+AwNkYV+3
	 tnsT5ifCoiW6VqrAmojkWC7wkCiZQs6UalvoFOwabDVAWW6jt94bYF1Piyt2GaRMFrA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790970313;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=MF/PYeThmsJVTPP/EGGxVPrpF3KL8RnhV8CK3nH/1VM=;
	b=RlylkS9dc3hbIZxcGnVRXMiV5+06FiG1U8NjwcPgrBLmm1Olj7t3uziPvu3j+P4VmQQY
	 1vliFLcbQQj3Ozp6kb7CI24dZqvtYstluyHgubfyEXJf2lW4nlgYXquloFcZIwNhxI+gp
	 7aILKG6t8XYSEGtNCE0fkpZ305bRbDqmED0vzJu6RQ1ROa4edf13zpwpu+4KmPs8otleC
	 TglYLyx18DIU6huPrAVFk3xahDKGodlZnhmTS2FHwyjmEpK9Q04ifoqB/Rvf2DG+5tTBH
	 bRmB+rWQeZr/bHo97O7t2RlsOCS1WcooFp2sPhsccxMc431uPHzjHIGQUA9bi74qhyQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790970313;
	bh=MF/PYeThmsJVTPP/EGGxVPrpF3KL8RnhV8CK3nH/1VM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O6QlZj21wfQx6kB650FDuKb4SkXXYGKGPZIe4ZGICENW8AzlzWmO0eM/+0xZeRIgs
	 O0AG6fPuY8jhXLE+0ixPc4wR7bMS6PSpgchTOvp9asuyVOtx5Q4blzyMuiUDTzqnTm
	 42gEBL0x8UHwXMKuv3r+Lb0un8bIrYkABlaFbv7kDHyblTm3QS5sWgNNalKhyFSa5A
	 /vGVcI+N1cPQFxrtC9BNPgvhpAvjbz+QlrziOf+CNVpSNJYnPnG1XSIOb6rujLPWXt
	 9tQh/nVhBuoEC/20g6Cj9dOmlFBzatqV7lOA4pH7pxVOL9jQ1lSEuWnCqZKVBp5rx2
	 i3O7gsD/bdmGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C21340DC4;
	Fri,  2 Oct 2026 19:45:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 15CA5282
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F056D60659
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VzjDfp4lBinS for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:45:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 894686064B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790970310;
 b=VRkcoktw+iA8fbyrShPnG/RBye9dvXcEJG0vA24fCucad0nwuEferU3YMCAlluPQmk/T
 gx1RK37jk8IypGX31v5VMiXfrDoNCKe8cUOC01Fk/auvwHLx1mNj1UYjo1V/votjMsidR
 dgO/1sCa0QJ/9WVpKFpuOFcYX7ZvxXnjwZHq05wd8t0pfiSWq+wu0cNK6OjX+GEsmL4Js
 HgqHSvfNmDTw22WKCfAPQ1Yvz4SASGuQTvxHEZ0h274Ag9yaxroURmVsJ2JryBoe8s1z+
 rO9cNNrHNYdUnfmotOcJHdzo4gNfpEdU8Ev7S2McPZrxWBwft8V0z+NH0zLHl7QtK5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790970310;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1qEB1qjtRYIdev3rNerFBLTyHzYoeT5ue9/FlTzqvSk=;
 b=O1QRRPwiGf2aTMU0AUkkFPaUYJkIZcutXJk7pamuDisw1sBRjZYVZxZDgD18RMj1CMjA
 b/9WFrlgPfK1U4rjqRr9azsHlPKsyrfB5E44lfGCuUCxDYC1fBK4mgfhgGkqu+R08Yemm
 6bQ/iHt5UQDeLRVL+j0VTROwlPnhXAPEDB5stZse0Bv1dQrRc4TbCow5g8WoibYfMjDSW
 4eSlWnuYzbiJr3ChYdqhZJQsO5vUsuRAqZeEFMoEyO3geOwY+QL7DawMFbUc38jM1uRbo
 JphX8CK6ZHcKyOIJh+5io3aG0jhtwYdbAA+zSB3VfOTy88UwR0qLjMou9fMLZXkcXMQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 894686064B
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:45:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BDB1886BD; Fri,  2 Oct 2026 19:43:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Oct 2026 21:44:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12961c9a23ebd76b2b5de44770effebe6d08bf8f
X-Git-Newrev: 47dfe8439945c84287bf6dbed11bce64a92d11fb
X-Patchwork-Hint: ignore
Message-Id: <20261002194356.2BDB1886BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apache: security bump to version
 2.4.69
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8788182135161661327=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8788182135161661327==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/47dfe8439945c84287bf6dbed11bce64a92d11fb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://downloads.apache.org/httpd/CHANGES_2.4.69

Fixes the following security issues:

  *) SECURITY: CVE-2026-93546: mod_dav_fs namespace overflow
     (cve.mitre.org)
     Integer overflow in mod_dav_fs in Apache HTTP Server through
     2.4.68 allows an authenticated WebDAV client with write access
     to crash worker processes and persistently corrupt a directory's
     property database via PROPPATCH requests declaring many XML
     namespaces.
     Credits: Zhen Kong

  *) SECURITY: CVE-2026-79768: mod_userdir information disclosure
     (cve.mitre.org)
     Path equivalence: '/./' (single dot directory) vulnerability in
     Apache HTTP Server's mod_userdir module when configured
     withÂ absolute non-wildcard UserDir directive (the 2nd form
     inÂ https://httpd.apache.org/docs/2.4/mod/mod_userdir.html#userdir
     )
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.68.
     Credits: Vlatko Kosturjak, Marlink Cyber

  *) SECURITY: CVE-2026-73637: mod_auth_digest DoS attack
     (cve.mitre.org)
     Use after free in mod_auth_digest in Apache Software Foundation
     Apache HTTP Server before 2.4.69 on all platforms allows an
     unauthenticated remote client to cause authentication state
     corruption via concurrent Digest authentication requests when
     AuthDigestNcCheck is enabled or AuthDigestNonceLifetime is set
     to 0.
     Users are recommended to upgrade to version 2.4.69, which fixes
     this issue.
     Credits: Zhen Kong

  *) SECURITY: CVE-2026-73636: mod_auth_digest one-time-nonce replay
     attack (cve.mitre.org)
     Authentication bypass by capture-replay in mod_auth_digest in
     Apache Software Foundation Apache HTTP Server 2.4.x on all
     platforms allows a man-in-the-middle (MITM) attacker to replay
     captured digest authentication credentials via crafted requests
     that trigger garbage collection of the client's shared memory
     entry when AuthDigestNonceLifetime is set to 0.
     Users are recommended to upgrade to version 2.4.69, which fixes
     this issue.
     Credits: Hyojae Lee

  *) SECURITY: CVE-2026-63718: mod_proxy_uwsgi Transfer-Encoding
     response smuggling (cve.mitre.org)
     Inconsistent Interpretation of HTTP Requests ('HTTP
     Request/Response Smuggling') response smuggling vulnerability in
     Apache HTTP Server via mod_proxy_uwsgi and a crafted uwsgi
     response with Transfer-Encoding.
     This issue affects Apache HTTP Server: from 2.4.30 through
     2.4.68.
     Credits: Qing Xu

  *) SECURITY: CVE-2026-63686: mod_xml2enc crash on charset
     conversion failure (cve.mitre.org)
     A NULL pointer dereference in mod_xml2enc in Apache Software
     Foundation Apache HTTP Server before 2.4.69 on all platforms
     allows an untrusted backend server to cause a denial of service
     via a proxied response with a charset whose conversion partially
     succeeds then fails.
     Users are recommended to upgrade to version 2.4.69, which fixes
     this issue.
     Credits: Lucian Nitescu

  *) SECURITY: CVE-2026-63292: mod_vhost_alias stack overflow
     (cve.mitre.org)
     Stack-based buffer overflow in mod_vhost_alias in Apache
     Software Foundation Apache HTTP Server through 2.4.68 on all
     platforms allows a remote client to cause a denial of service or
     potentially execute arbitrary code via an HTTP request with a
     Host header exceeding 8192 bytes when VirtualDocumentRoot uses a
     hostname format specifier and LimitRequestFieldSize is raised
     above the default.
     Users are recommended to upgrade to version 2.4.69, which fixes
     this issue.
     Credits: Hyojae Lee

  *) SECURITY: CVE-2026-63045: mod_proxy_ftp PASV address handling
     (cve.mitre.org)
     Improper validation of FTP PASV reply address in mod_proxy_ftp
     in Apache Software Foundation Apache HTTP Server through 2.4.68
     on all platforms allows, in forward proxy configurations, an
     untrusted FTP server to cause the proxy to open a data
     connection to an arbitrary third-party host via a crafted PASV
     response.
     Users are recommended to upgrade to version 2.4.69, which fixes
     this issue.
     Credits: Zhen Kong

  *) SECURITY: CVE-2026-59797: mod_ssl SSLRequire allows .htaccess
     ap_expr file-function (cve.mitre.org)
     Improper Privilege Management vulnerability in Apache HTTP
     Server's mod_ssl via SSLRequire and file-related expressions.
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.68.
     Credits: kimchunbok

  *) SECURITY: CVE-2026-59685: Out-of-Bounds Write in
     ap_directory_walk() Canonical-Name Rewrite on
     CASE_BLIND_FILESYSTEM (cve.mitre.org)
     Out-of-bounds Write vulnerability in Apache HTTP Server on
     Windows while processing paths with 8.3 names that may grow when
     expanded.
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.68.
     Credits: Dhiraj Mishra

  *) SECURITY: CVE-2026-58415: mod_dav_fs property database read
     access (cve.mitre.org)
     Internal state files accessible to external parties in
     mod_dav_fs in Apache Software Foundation Apache HTTP Server
     before 2.4.69 on all platforms allows a remote client to read
     WebDAV dead properties of resources it cannot author via a GET
     request for the .DAV state directory
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.68.
     Credits: ì�´ì§€ì›… (kimchunbok)

  *) SECURITY: CVE-2026-57941: mod_http2 use-after-free / wild write
     via shared session->bbtmp re-entrancy (cve.mitre.org)
     Use After Free vulnerability in Apache HTTP Server's
     mod_http2Â via shared session->bbtmp re-entrancy
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.68.
     Credits: Lucian Nitescu

  *) SECURITY: CVE-2026-56449: mod_proxy_html: crash in dump_content
     (cve.mitre.org)
     Out-of-bounds Write vulnerability in Apache HTTP Server's
     mod_proxy_html with crafted HTTP response bodies.
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.68.
     Credits: Lucian Nitescu

  *) SECURITY: CVE-2026-56154: mod_rewrite use-after-free via
     %{LA-U:HTTP:...} (cve.mitre.org)
     Use After Free vulnerability in Apache HTTP Server's mod_rewrite
     when using lookahead (%{LA-U:HTTP:...})
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.68.
     Credits: Nebula Security (@nebusecurity)

  *) SECURITY: CVE-2026-56153: mod_charset_lite: Heap overflow in
     finish_partial_char (cve.mitre.org)
     Out-of-bounds Write vulnerability in Apache HTTP Server's
     mod_charset_lite.
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.68.
     Credits: Bartlomiej Dmitruk at striga.ai

  *) SECURITY: CVE-2026-48005: mod_auth_digest reauthentication
     attack (cve.mitre.org)
     Missing authentication checks in mod_auth_digest in Apache
     Software Foundation Apache HTTP Server before 2.4.69 on all
     platforms allows an unauthenticated remote client to cause a
     denial of service (forced re-authentication) via forged
     Authorization headers when Digest authentication is enabled with
     AuthDigestNcCheck .
     Users are recommended to upgrade to version 2.4.69, which fixes
     this issue.
     Credits: lokerxx

  *) SECURITY: CVE-2026-47360: mod_session: Session cookie not
     removed during internal redirect (cve.mitre.org)
     Exposure of Sensitive Information to an Unauthorized Actor
     vulnerability in Apache HTTP Server's mod_session_cookie module.
     Â
     When SessionCookieRemove changes across internal redirects, the
     session cookie may still be passed to a backend server.
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.68.
     Credits: lokerxx

  *) SECURITY: CVE-2026-46729: mod_heartmonitor denial of service
     (cve.mitre.org)
     NULL Pointer Dereference vulnerability in Apache HTTP Servers
     mod_heartmonitor over unicast listener.
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.68.
     Credits: Zhang San

  *) SECURITY: CVE-2026-42528: mod_dav shared lock overflow
     (cve.mitre.org)
     A memory calculation bug in mod_dav in Apache httpd 2.4.67 and
     earlier allows an attacker with permission to create WebDAV
     locks to crash server child processes.
     Users are recommended to upgrade to version 2.4.69, which fixes
     this issue
     Credits: Zhenpeng (Leo) Lin at depthfirst

  *) SECURITY: CVE-2026-42356: limited RCE for some internal
     redirects to non-CGI files in CGI directories (cve.mitre.org)
     Deployment of wrong handler vulnerability in Apache HTTP Server
     allows the target of some internal redirects from CGI programs
     to also be treated as CGI and executed. The target must already
     be in a directory enabled for CGI and have no other extension
     understood by mod_mime.
     This issue affects Apache HTTP Server: from 2.4.60 through
     2.4.68.
     Credits: Feliks Penconek

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index e8ed8c0df6..453a22b965 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://archive.apache.org/dist/httpd/httpd-2.4.68.tar.bz2.{sha256,sha512}
-sha256  68c74d4df38c26bed4dfbdb8f3baf1eb532f3872357becc1bba5d136f6b63c06  httpd-2.4.68.tar.bz2
-sha512  134a5bbd3ffe97523ac750490531bcb9441c532cedf0229aa006aa1368e9d25040507c6f519bed6754044f62c371f7c7f9a11b6a311f79b9680d478bf4373eb3  httpd-2.4.68.tar.bz2
+# From https://archive.apache.org/dist/httpd/httpd-2.4.69.tar.bz2.{sha256,sha512}
+sha256  c5e6ebc66e349b87d7fc6916ae7cc2a808ed348003de134cf9e9d89d3e2cc73d  httpd-2.4.69.tar.bz2
+sha512  ca9c5808eef7a0d8d88148b0d2d6045b5a0151823f09afc786b283cef9990036a9c7bc53d043e2f67b6ec06db05f655aa961cb875fa7ad0911fa04fdd295bd93  httpd-2.4.69.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index debc999bcd..04400d5e4a 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.68
+APACHE_VERSION = 2.4.69
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0

--===============8788182135161661327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8788182135161661327==--
