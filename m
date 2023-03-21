Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A658C6FD20
	for <buildroot@archiver.kernel.org>; Tue, 21 Mar 2023 19:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D40AA40CC9;
	Tue, 21 Mar 2023 19:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D40AA40CC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7mKnyS-62Iun; Tue, 21 Mar 2023 19:05:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E4BE40C2D;
	Tue, 21 Mar 2023 19:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E4BE40C2D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7EE941BF3E3
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 19:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A4B0400F2
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 19:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A4B0400F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pIwrBBNQ9aEE for <buildroot@lists.busybox.net>;
 Tue, 21 Mar 2023 19:05:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E555640CA4
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E555640CA4
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 19:05:03 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.182]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MbzyP-1qCuqQ3SgB-00daBn for <buildroot@buildroot.org>; Tue, 21 Mar 2023
 20:05:01 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 20:05:01 +0100
Message-Id: <20230321190501.19240-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:Y61vkThR2ZLxUJXCbnG2IAZKzFW7xGcvfmJfueBqEoN9zqsd6c0
 p82tfQM/7/OCGXucGD2MzA4kl7Da+Ez5r0Ov/nDDC7XcSaoslv3Ud/JVCwZousATtNyZ/WA
 iluIUgFoHJ7bNGxrP0Qi9nC/i+wJsM7yHoAt27QBslPMdR0JhIWnMw8UugVGeobMfaw/X/o
 /n7meZM++37YOaTLGRXBg==
UI-OutboundReport: notjunk:1;M01:P0:8Zv70t9jDHo=;vSMW48KQH5ok7d0j0tq7Q49qwyv
 XlrC1ql5puVPWu6kJLK6GiZVPIumMBUYz2jlBK2ioOqHmD8YukLhztBiE15EjDTUTtOoJZ1HQ
 IeWaTjaHdQzB948+lhaGpWD+acgqGwjWlC1xYH14zl5pGmf9hqNzfukBAg7SQ1mPlP9j2yztM
 FYmEdwEz6A3dXixyMSlWcnwZlYasZu9I/O1Pm+IZ15ishMkAJi204Y9hQ0M+EN0G9KKLusvm4
 qIxeIxAUGW/ErXMv5qO+LEh2edThv3cjwLBg3J92bm5nsK+r9BGt3iwy5MOyOshxWYJ9g9YtF
 ri8QJCL6+WOSrEcn/x6S96lZz7/DRQ4VhoCzmU8plXWF4DzqugXghV81pJJYIn6P9d2/7AmHl
 hQF1rAsdlzkDQR2uCu3+bLW/5cmzpvZxUzyQcIjYUqkpstIcZvAflHbAyYpCtW5aRvnoyM9LF
 E+BRcoqBpZ9ploLPlcXhUuzrvUuwQE4q/em+G74koyw44xbBjwiMbgC5yKOexbMVZQuiYGBIv
 wV2EIlBxE1I1llHer00tx9zFDNJ46OQNulphH4zUNUumMNp8s8uPzpKNiGpGoZz4mtRAKj5LY
 VD/EJNLOs23PcTV4jU+LlsvGZAK15bj484fML1uNBPMi5qg8xHVwIfQ6UqdKjgNw3LBfTglMX
 sMF+1jALS2cAAA0w+xiUGPOkM6WOAloJSSRwLsBoraxRIo9FgTa9O0H1e8oQevy+IRNrE0LB9
 aCLgAYxLKr1bs0OVohzz1+/bnAHXZnL47nSBb8lY4YQc6avJa196KawGfhSsXIKZG0KUHvEHf
 ZY6UMxifTHpy4swFd+FhXMmibxKPDHKdfvYRzBrJhNyKy9GjWgb8Q4XDxXaMmoyiL7HZDZals
 auH8FDaTmhzLi5TGnmGrxwY5yAUjKjUDX0i05pM0t2lkh/J34vb44PWDxlaeMm9XjrPoNvsv4
 +0JS2hnL8mCmxQRodAKIVp2JJo8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1679425502; i=ps.report@gmx.net;
 bh=4pHHkHFZuQknWY6C5Map/5eEiQZt+dXbO+AdwV6kyGc=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=EL9GBfowwXXfZd9jCyQIl7hufJPcOk5OL5N/aeAGg+v2BXjhs3zZUjVPJxYCxy4VK
 +OWkfG+rSYoTqA+AjmjWsVAqTqS1GVJ8o2wVyJ3HpAVy0rWEPH/xsXuq3aNlVdV3iV
 lLDfZHPJTyBDE1KrtWtdgl8HFA8pv9/4kXDbNu8VPCKQNNVVbLJBM6QISkj1B2w6ku
 AN6sKUQ3F6TLGmUdkgI0QF7Lw+XJASSL5f78CSGEpym+GqAsX652YUkr1/nNUmw7XM
 jvkyRnCIDRzMu0/1STxTONr9uTHtfGLh50ZNo+sCGufortlzAbcJwyj/tkjzwuHFe2
 DKbDjCeF5IhCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=EL9GBfow
Subject: [Buildroot] [PATCH v1] package/openssh: security bump to version
 9.3p1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From [1]:

 * sshd(8): fix a pre-authentication double-free memory fault
   introduced in OpenSSH 9.1. This is not believed to be exploitable,
   and it occurs in the unprivileged pre-auth process that is
   subject to chroot(2) and is further sandboxed on most major
   platforms.

 * ssh(8): in OpenSSH releases after 8.7, the PermitRemoteOpen option
   would ignore its first argument unless it was one of the special
   keywords "any" or "none", causing the permission list to fail open
   if only one permission was specified. bz3515

 * ssh(1): if the CanonicalizeHostname and CanonicalizePermittedCNAMEs
   options were enabled, and the system/libc resolver did not check
   that names in DNS responses were valid, then use of these options
   could allow an attacker with control of DNS to include invalid
   characters (possibly including wildcards) in names added to
   known_hosts files when they were updated. These names would still
   have to match the CanonicalizePermittedCNAMEs allow-list, so
   practical exploitation appears unlikely.

From [2]:

* ssh-add(1): when adding smartcard keys to ssh-agent(1) with the
   per-hop destination constraints (ssh-add -h ...) added in OpenSSH
   8.9, a logic error prevented the constraints from being
   communicated to the agent. This resulted in the keys being added
   without constraints. The common cases of non-smartcard keys and
   keys without destination constraints are unaffected. This problem
   was reported by Luci Stanescu.

 * ssh(1): Portable OpenSSH provides an implementation of the
   getrrsetbyname(3) function if the standard library does not
   provide it, for use by the VerifyHostKeyDNS feature. A
   specifically crafted DNS response could cause this function to
   perform an out-of-bounds read of adjacent stack data, but this
   condition does not appear to be exploitable beyond denial-of-
   service to the ssh(1) client.

   The getrrsetbyname(3) replacement is only included if the system's
   standard library lacks this function and portable OpenSSH was not
   compiled with the ldns library (--with-ldns). getrrsetbyname(3) is
   only invoked if using VerifyHostKeyDNS to fetch SSHFP records. This
   problem was found by the Coverity static analyzer.

[1] https://www.openssh.com/txt/release-9.2
[2] https://www.openssh.com/txt/release-9.3

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index eefb11ec15..2be54431ec 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-9.1 (base64 encoded)
-sha256  19f85009c7e3e23787f0236fbb1578392ab4d4bf9f8ec5fe6bc1cd7e8bfdd288  openssh-9.1p1.tar.gz
+# From https://www.openssh.com/txt/release-9.3 (base64 encoded)
+sha256  e9baba7701a76a51f3d85a62c383a3c9dcd97fa900b859bc7db114c1868af8a8  openssh-9.3p1.tar.gz
 # Locally calculated
 sha256  05c30446ba738934b3f1efa965b454c122ca26cc4b268e5ae6843f58ccd1b16d  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index b70e327620..26d6bd504d 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 9.1
+OPENSSH_VERSION_MAJOR = 9.3
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
