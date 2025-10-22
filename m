Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DA6CCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7812612BE;
	Wed, 22 Oct 2025 16:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1o1H89s0wt3c; Wed, 22 Oct 2025 16:36:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F27761371
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F27761371;
	Wed, 22 Oct 2025 16:36:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C23643F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F4E241130
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cd86TFz-gqe2 for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:36:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9970E4111C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9970E4111C
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97711866C6; Wed, 22 Oct 2025 16:36:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:35:37 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5a489da1aa524be8583a23a6f59eb7b33cfdfe80
X-Git-Newrev: d88b247633f826a5eb392dd28639eb3b860d4335
X-Patchwork-Hint: ignore
Message-Id: <20251022163634.97711866C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/squid: add patch
 for CVE-2025-59362
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d88b247633f826a5eb392dd28639eb3b860d4335
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes the following vulnerability:

- CVE-2025-59362

    Squid through 7.1 mishandles ASN.1 encoding of long SNMP OIDs. This
    occurs in asn_build_objid in lib/snmplib/asn1.c.

For more information, see:

- https://nvd.nist.gov/vuln/detail/CVE-2025-59362
- https://github.com/squid-cache/squid/commit/250a18e0a80694b919972a1836cdfe20f2e1baa0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fb13611e6414e01f5a34cc065913fb1adcdf775c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch | 52 ++++++++++++++++++++++
 package/squid/squid.mk                             |  4 ++
 2 files changed, 56 insertions(+)

diff --git a/package/squid/0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch b/package/squid/0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch
new file mode 100644
index 0000000000..695ba0255e
--- /dev/null
+++ b/package/squid/0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch
@@ -0,0 +1,52 @@
+From 0d89165ee6da10e6fa50c44998b3cd16d59400e9 Mon Sep 17 00:00:00 2001
+From: Alex Rousskov <rousskov@measurement-factory.com>
+Date: Sat, 30 Aug 2025 06:49:36 +0000
+Subject: [PATCH] Fix ASN.1 encoding of long SNMP OIDs (#2149)
+
+Upstream: https://github.com/squid-cache/squid/commit/250a18e0a80694b919972a1836cdfe20f2e1baa0
+CVE: CVE-2025-59362
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ lib/snmplib/asn1.c | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/lib/snmplib/asn1.c b/lib/snmplib/asn1.c
+index 81f2051fbe7..2852c26b220 100644
+--- a/lib/snmplib/asn1.c
++++ b/lib/snmplib/asn1.c
+@@ -735,6 +735,7 @@ asn_build_objid(u_char * data, int *datalength,
+      * lastbyte ::= 0 7bitvalue
+      */
+     u_char buf[MAX_OID_LEN];
++    u_char *bufEnd = buf + sizeof(buf);
+     u_char *bp = buf;
+     oid *op = objid;
+     int asnlength;
+@@ -753,6 +754,10 @@ asn_build_objid(u_char * data, int *datalength,
+     while (objidlength-- > 0) {
+         subid = *op++;
+         if (subid < 127) {  /* off by one? */
++            if (bp >= bufEnd) {
++                snmp_set_api_error(SNMPERR_ASN_ENCODE);
++                return (NULL);
++            }
+             *bp++ = subid;
+         } else {
+             mask = 0x7F;    /* handle subid == 0 case */
+@@ -770,8 +775,16 @@ asn_build_objid(u_char * data, int *datalength,
+                 /* fix a mask that got truncated above */
+                 if (mask == 0x1E00000)
+                     mask = 0xFE00000;
++                if (bp >= bufEnd) {
++                    snmp_set_api_error(SNMPERR_ASN_ENCODE);
++                    return (NULL);
++                }
+                 *bp++ = (u_char) (((subid & mask) >> bits) | ASN_BIT8);
+             }
++            if (bp >= bufEnd) {
++                snmp_set_api_error(SNMPERR_ASN_ENCODE);
++                return (NULL);
++            }
+             *bp++ = (u_char) (subid & mask);
+         }
+     }
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index b021170d9b..d445f005b7 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -11,6 +11,10 @@ SQUID_LICENSE = GPL-2.0+
 SQUID_LICENSE_FILES = COPYING
 SQUID_CPE_ID_VENDOR = squid-cache
 SQUID_SELINUX_MODULES = apache squid
+
+# 0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch
+SQUID_IGNORE_CVES += CVE-2025-59362
+
 SQUID_DEPENDENCIES = libcap host-libcap libtool libxml2 host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 SQUID_CONF_ENV = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
