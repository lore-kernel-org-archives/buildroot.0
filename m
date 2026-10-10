Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C95CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 16:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 490F64069F;
	Sat, 10 Oct 2026 16:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wrTT-mjVpsLJ; Sat, 10 Oct 2026 16:32:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6631540782
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791649973;
	b=F+w1weXpZLRqOAIGXrESLxo2/ZDWZh7CUj/2/m2QURjnLiyN+5bMs8611S4Hp8PWSC7s
	 84XfZ6m3oZY6H3PDAwGJZUmk+Om3XWfY9xD+2OyOmtGm2/12boGgEG4gCpkFwdwD55GiL
	 GLDdtwL44G0upeTUQ/PSJRF5f1Xjv4O3KHD0bDfpv36DD4WjrqJK3BvaFBeCqYNhISwLE
	 cIM80dgAfk9X4cBdki+Zmvmx2PtM9DRgbRUUkFEdDK/8t5sWJoJRoDXiBvLtZbPPE+ydp
	 GSXDtwIKEK1sAeSYDOzWBMyT2qvfdOVkZUPFv8fCBbmRxyPK/hjq7K9tbYSZtvBFd5w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791649973;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0I6SB9BqgkJDe+A04roqkrjfgK1VBbrUmJKzx4D7iiY=;
	b=QGxSgNub/Kc2A0pg229vbV1VaHukd+/2F6Gz0H8chwFaz3Md7VvDVmHvNa+P8d3vNKE3
	 +RpDF/y9Rgb83tqSndrmRSc7PmBqNo/F95lOiGHccDCUnsKjEja2fVF8Us65RYg7f5r2n
	 5KEhbd7iR6NJrVyFFhK2skEYZjtFt0JZ4weJ4oQPEDnBkyAyIYDI+/rkWueabRFdL4J+Y
	 FkxRSX8ViGi8i+E4bdBV7jqe5+fLOfiNvQxtUs4L8M6IAhKrahEabts6Yx7iZx6NUlPF9
	 Nn0f2z7HwT2doleVQjVl+IYcBIpwSgc2MNB02yUNUn+YAlkbdqmeg9p0dTlTw1+dMdA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791649973;
	bh=0I6SB9BqgkJDe+A04roqkrjfgK1VBbrUmJKzx4D7iiY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nbR6PyjSDRu6WmDnVOqNiFnmUAJzUeYzHais1aSHME2QiHczKDFB+D9xgPJh0PdWH
	 YSOY7kIyGtJ85iwv1NbL3z6mEGOJYozBBIf2S1Hlv5PmrN3/3bpMBvNWj9+mdbr+fN
	 Q4sVExa1bFQJmV4gkZ9Wouhp8Y6GQiYS4GQ+ziMG1X9GwiP6lqsAwWLp4B2nlaN3sq
	 HzCpYIMeVQBF2ITU9QiK+djVQf1kEi57JZI8U12macpVkNuSF9Q+Ythoe+Kv0qY7s3
	 a+XlXVct9tOdh8+qMRfNvQKQNSatQf7tej/ejPSvtu97xRqVjd+F3gOiJl8kJWzadV
	 GQsbMA4R5+u4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6631540782;
	Sat, 10 Oct 2026 16:32:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3514D105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B55B40004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:32:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o40gf_8eMIrb for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 16:32:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4DBD94005E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791649971;
 b=bikzNt/SKkgqgXHtC4bXn3AdDRpZjgkQO6RXfohUm1HogZ26UcS9mnR3/GWagaKX4NUF
 y9qIi+9vPuwSMzWU3+FKwUEUcHe0/Q5jJmUeyu3udOQfGCrO1t3oLPEqtO6oAd3lKi7oE
 BA6HIYRBG+qIMiZyRft8hart9oUcH4GRBFbTZdPJH31mhzdXqU+n+LSbPJckay5BKLgl5
 q1+/I7YgwV1HLP6IsJ6sLXuY9Sz6Ojxenyv+cpluoGzBOojhQrrjb0eKY8ftvKFbzNmnW
 ht2kYNOrKVan3iB+W8TaA0MrIQub/QeoSHFsH7Fu7wJLfjsPEnzySYBXbPCaFoIoCAQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791649971;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=X7qugRK6/7a6Dif8buogWfpCAbLIDVRRyniwZMoymCw=;
 b=aGkADgE0FXgCbAN8+f/Fp2LOXz59ncXsbjlhi50DC/pl17ScMASoLMcHbdfnoLwBO0YS
 47zr+bUTX3qlh4ryxrIO4QQ5QahZl5viyzgm+KnPi7oULJYOO+hq491ed9UTCpBsqbPb6
 GfD9GI3AMT6Scj0i6NoXRHCLsD1cuEsrQF5JZ+h8OdeWZKS6sWa1L36t8k0Sgqx8p8EBj
 X3fGi+EmOwSTLWRLMRjzBRJkvv7eDquyPnBsDC7tOkYaihXnG7vgWKEjYpHvUW0zT08uI
 pxFDM0pm9HRRsld7BWn/UX6qHDxiz8flP5X2DTGKsKNcO1XsjtuGuCk+zPaChf47mUg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DBD94005E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:32:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05E11926CA; Sat, 10 Oct 2026 16:31:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 18:32:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39fdbe5bfe31ff2c7f341041aedeb5c35839be87
X-Git-Newrev: a9d690cc5ddb7f75249b5544a52fad269dc1807c
X-Patchwork-Hint: ignore
Message-Id: <20261010163133.05E11926CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeradius-server: add upstream
 patch to fix build error
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a9d690cc5ddb7f75249b5544a52fad269dc1807c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 8af3e34fd4a085ea7c25291e50d81fa1a69d9eaf bumped the
package from 3.2.8 to 3.2.10. This bump includes upstream commit
https://github.com/FreeRADIUS/freeradius-server/commit/d8b95979c710d4e2e3f1115245062fbfc8e9ccba
that breaks the build when OpenSSL was built with the option
BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK disabled:
https://github.com/FreeRADIUS/freeradius-server/pull/5874

To fix the problem we add an upstream commit.

Fixes:
https://autobuild.buildroot.net/results/bfd/bfdf51b3c28753a50b9cd63d75388ee6000b0444/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...psk-checks-when-not-supported.-Fixes-5874.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/freeradius-server/0010-skip-psk-checks-when-not-supported.-Fixes-5874.patch b/package/freeradius-server/0010-skip-psk-checks-when-not-supported.-Fixes-5874.patch
new file mode 100644
index 0000000000..3319118b94
--- /dev/null
+++ b/package/freeradius-server/0010-skip-psk-checks-when-not-supported.-Fixes-5874.patch
@@ -0,0 +1,37 @@
+From 7f2a41eaff5a58cb0014dc2fc95438b6a0a55ee1 Mon Sep 17 00:00:00 2001
+From: "Alan T. DeKok" <aland@freeradius.org>
+Date: Fri, 5 Jun 2026 09:55:00 -0400
+Subject: [PATCH] skip psk checks when not supported. Fixes #5874
+
+Upstream: https://github.com/FreeRADIUS/freeradius-server/commit/7f2a41eaff5a58cb0014dc2fc95438b6a0a55ee1
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/main/tls.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/main/tls.c b/src/main/tls.c
+index 3018f34cc0..4f4cd0c280 100644
+--- a/src/main/tls.c
++++ b/src/main/tls.c
+@@ -524,12 +524,17 @@ tls_session_t *tls_new_client_session(TALLOC_CTX *ctx, fr_tls_server_conf_t *con
+ 	 *	if we're doing certificate auth, and not PSK.
+ 	 */
+ 	verify_mode = SSL_VERIFY_PEER;
++#ifdef PSK_MAX_IDENTITY_LEN
+ 	if (!conf->psk_identity) {
++#endif
+ 		RDEBUG2("(TLS) Requiring Server certificate");
+ 		verify_mode |= SSL_VERIFY_FAIL_IF_NO_PEER_CERT;
++
++#ifdef PSK_MAX_IDENTITY_LEN
+ 	} else {
+ 		RDEBUG2("(TLS) PSK configured -- verifying Server certificate if presented");
+ 	}
++#endif
+ 	SSL_set_verify(ssn->ssl, verify_mode, cbtls_verify);
+ 
+ 	SSL_set_ex_data(ssn->ssl, FR_TLS_EX_INDEX_CONF, (void *)conf);
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
