Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D35D606A331
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kZpCwIvs
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE61460BC0;
	Fri, 30 Oct 2026 14:08:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jdzaiEc9SSEM; Fri, 30 Oct 2026 14:08:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8B02260BE7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369317;
	b=SXd7fbIndruEwNIEk/xnLL8Y8XTBqdhREGZwJwGtUgZ9zT/HUzdNs1QBHGhsYuqb8XHS
	 YteesCtwogQq6e9dYH1dWRDm5EWTPKuLuMVKDRwOEHrjf9bISKDrbs3RMeEwIYJEQ8h9u
	 9T7eEMFGbHblMYHNYfK6cI68KkM2y5tke6Qv6wv9nsfRo3hvO6lcBJ1b0FoI2feSf1aJw
	 9im8LNObIx3QqeQNFqkQql6fB4gO/wJqz95bYWxQzJK+RAOL1737w9yV/Ja6r/2kifhf7
	 LI6Sv6Oty8ld4d1GZwlNkUsk2L+PrCfj98qYaoa8mRo7DTRBvJTa/9Ux0fGK5ywTx+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369317;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=63I7qIdTWsz+MJ14cSBMD1ZgIBmK2IFdjUNTTKSQxsI=;
	b=M0nwPM3IWwWnSliwluBtsEs1IVferysvsMIyitaYewUbeKg0tTJKwyF7MMYL0/lHpwyQ
	 5ZHAI9FT8VZBKX2dkro771L19bUiGNMNyYdYF6+e1HZRXGXJm1HkclqZGPSr22J6835v8
	 31PPxz8NBRfMHnXV5pPxLERhW3Wo+l7uu1MyDEDZIz02ODOjgB3LeGP6k9G0tPtYUQyya
	 LAAAG8ubc/iKLAyHZg7JSZpNXr/lmGV1u4IdtB6YqrNU/Iwu+ghk3V9me5FefQwr7TiDD
	 Es+BErCvzhMNBgLto0NKizH9Yeeu+gqWBWHtIeS+7QmtMi5YLMMB0mXkVPkPMJ/vrhQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369317;
	bh=63I7qIdTWsz+MJ14cSBMD1ZgIBmK2IFdjUNTTKSQxsI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kZpCwIvs+w03qDrMU2yh0Nu5+b4BKySXB8lYjfPuD075ZgyVTeLygsCbJZQZ6J9sn
	 x3nH6f6qkN17Hlon29m5S4lE+NrS8pfIzIbsZkdIQoWHKRez7tHbdt2Gz8Nl1e6HBg
	 D2ZnuuhSDNEWhZx+sgMOybO8pW8MvvH/PkqgEXZYPuoq2povQZ/aEmFkWmI9ZfohkB
	 EKBA8SUssqciVH8o9pryffVYQTcyw5kIgRI3H6hdZNurFO2J94QcmnT/dqU3LRwjOL
	 kgfuEuijElEmR718i3P2nK7xgh+fyf3nzbwHm0ouBaAZj/DKyexfzCWXLBvK/ExYYL
	 DnWrWv0vVYWcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B02260BE7;
	Fri, 30 Oct 2026 14:08:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BD310362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AC7F40B2C
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jjqBGIxQBR8 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E140F40B31
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369168;
 b=RKI1JjxFqGNfmcIsOudHqE/WrYvHR4hTZnGXb8zfenbEgdezIh94xBojUALxK9Tq649g
 Qlu6JRfA8TpT5u0Ed3m4hxnrZN1+z1hNHEWUyfZBg72HqpcaFwLk3nHyh8hfXGT37ja9k
 qvjNDUeHBrSRAKzMUIXK7ybX61h5zh+7EIyhp7pRET6aD44XPX8uHLiVIOynfLvpccJ9S
 EB/eyk9tca67Lzt2kxD0UpdVZa0zqJnq1s31qHbYfzPghriO2SKWGjUg+YgRFX5Opo+Ib
 2dtGYrDFLHVsAsjL7r5dTp/+L5YCKgJT6afjwvzkhKxIRrJeVFVbGtz9OihaesMBc/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369168;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=RUlpNqCRV/ptOmuuVRcD+9xpkyAsAFcawFUVOEmUjvA=;
 b=ntpdyLcX11xRsNRc7BTvBmjQUuqUlHqM8T515LGucJetsxSt3U0UGXKhXPR8r6DHTe52
 8pKx/Chv9dIzRIpiPhA9wa+vhOuglCQYOdPs44BKXYbDNOHjIXwAtKagRofG7Vlece1Jf
 F0zDksXuFqMdA1/s3nrLxjiTD3Nj59VY5AHMGTISCclIuZtfOXkyrGMo6O9Z0lCUH3XV9
 vmApeINr5eoqV8k3cOpI7llX5/6IUuIc8KP3NwaqPbNCnmOWkpoxGYq9ete66M8XbR//S
 XDXmHKRB4rOOPaneqCpdT/cTL0Dn2Qf1o45e/bdO6C2NVYJHZkDL9U9NmNpLHE2viXg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E140F40B31
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D7889D388; Fri, 30 Oct 2026 14:04:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:01 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cb125666dfdac541059efc0931e843a89cdcbe08
X-Git-Newrev: 3a1585aa1beb70af89f47ba9ef1e028f33151d2c
X-Patchwork-Hint: ignore
Message-Id: <20261030140441.0D7889D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cups: security
 bump to v2.4.20
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7118372779731345378=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7118372779731345378==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3a1585aa1beb70af89f47ba9ef1e028f33151d2c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See the release note:

- https://github.com/OpenPrinting/cups/releases/tag/v2.4.20

The additional patch is required to fix the build with the option
`--with-dnssd=no`. This build error can be triggered by not enabling the
package `BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT` [1].

Fixes the following vulnerabilities:

- CVE-2026-55453:
    OpenPrinting CUPS is an open source printing system for Linux and
    other Unix-like operating systems. Prior to 2.4.20, the backend/ipp.c
    quote_string() function preserves carriage-return and line-feed
    characters in a remote printer-controlled marker-message before
    report_attr() writes the value to the scheduler status stream. The
    scheduler can parse an injected newline as a separate PPD: control
    line and persist an attacker-selected PPD keyword. The reporter
    demonstrated that a later print job on a Foomatic-backed queue could
    consume an injected FoomaticRIPCommandLine value and execute in the
    filter context as lp.
    https://www.cve.org/CVERecord?id=CVE-2026-55453

- CVE-2026-55467:
    OpenPrinting CUPS is an open source printing system for Linux and
    other Unix-like operating systems. Prior to 2.4.20, the cupsdCreateJob
    option-string builder in scheduler/job.c maps attacker-controlled
    destination-uri and pre-dial-string values from a configured fax queue
    to the phone and faxPrefix options. Unlike ordinary IPP job
    attributes, these mapped fax values bypass the control-character
    sanitizer and are copied directly into the filter options argument. A
    user permitted to submit a job can therefore inject control characters
    into the downstream option stream. The reporter states that a
    downstream fax filter passing these values to a shell or modem command
    could execute code as lp, while the maintainer states that CUPS has no
    confidentiality or integrity impact because the only known code-
    executing filter is optional Foomatic and addressed separately,
    leaving possible disruption of the affected queue.
    https://www.cve.org/CVERecord?id=CVE-2026-55467

- CVE-2026-55480:
    OpenPrinting CUPS is an open source printing system for Linux and
    other Unix-like operating systems. Prior to 2.4.20, copy_model() in
    scheduler/ipp.c creates a predictable TempDir/<connection-number>.ppd
    path in an lp-group-writable directory and opens it as root without
    O_EXCL or O_NOFOLLOW. Exploitation requires an lp-group process able
    to write that directory to predict the connection-derived name and
    plant a symlink before the root open, while a privileged add-printer
    or modify-printer operation using a model PPD triggers copy_model().
    The reporter treats an existing lp foothold and the privileged
    operation as distinct prerequisites, while the maintainer assesses
    high privileges because installing the relevant filter or
    administering the printer requires root or print-administrator access.
    If the race succeeds, the root scheduler follows the symlink and
    truncates or overwrites a root-writable target with generated PPD
    data, compromising file integrity or availability.
    https://www.cve.org/CVERecord?id=CVE-2026-55480

- CVE-2026-61702:
    OpenPrinting CUPS is an open source printing system for Linux and
    other Unix-like operating systems. Prior to 2.4.20, copy_banner() in
    scheduler/ipp.c uses the attacker-controlled IPP attributes-natural-
    language value as a directory component beneath DataDir/banners when
    processing a job-sheets banner. The job-sheets value must first match
    a registered banner basename, and the traversed path must contain a
    matching reachable basename; selecting an arbitrary target as
    demonstrated additionally requires pre-positioned path state such as a
    symlink with that basename. Subject to the scheduler's filesystem and
    sandbox access, path separators in the language value can escape the
    intended banner directory, make the root scheduler open the reachable
    file, and copy its bytes into a job-sheet spool object that a
    configured backend can deliver to an attacker-observable endpoint.
    https://www.cve.org/CVERecord?id=CVE-2026-61702

- CVE-2026-87875:
    The cupsUTF32ToUTF8() function in CUPS's cups/transcode.c lacks a
    source-length bound and can read past the end of the source buffer,
    resulting in a heap out-of-bounds read. This is reachable via SNMP
    supply-description parsing in backend/snmp-supplies.c with attacker-
    controlled content.
    https://www.cve.org/CVERecord?id=CVE-2026-87875

- CVE-2026-87876:
    Two case-insensitive comparisons on request-derived usernames outside
    the main authorization path in CUPS's scheduler (printer ACL
    validation and private-attribute filtering) could allow bypass of
    username-based access controls in certain configurations.
    https://www.cve.org/CVERecord?id=CVE-2026-87876

- CVE-2026-105326:
    An argument injection flaw was found in CUPS. When email notification
    is configured, the CUPS scheduler accepts printer subscription
    requests that supply a mailto notify-recipient-uri. The mailto
    notifier passes the recipient address to the configured sendmail
    program without ensuring it cannot be interpreted as command-line
    options. A remote attacker who can reach the CUPS service could supply
    a crafted recipient value starting with "-" to influence sendmail
    behavior. Successful exploitation depends on the installed mail
    transfer agent and CUPS network exposure, and may lead to execution of
    attacker-controlled commands with the privileges of the CUPS service
    user.
    https://www.cve.org/CVERecord?id=CVE-2026-105326

[1] https://github.com/OpenPrinting/cups/pull/1740

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 69a2d9084152c5c1f2318c146c0d6b6a183ed38e)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...ix-destination-enumeration-without-DNS-SD.patch | 29 ++++++++++++++++++++++
 package/cups/cups.hash                             |  4 +--
 package/cups/cups.mk                               |  2 +-
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/package/cups/0005-Fix-destination-enumeration-without-DNS-SD.patch b/package/cups/0005-Fix-destination-enumeration-without-DNS-SD.patch
new file mode 100644
index 0000000000..b342427023
--- /dev/null
+++ b/package/cups/0005-Fix-destination-enumeration-without-DNS-SD.patch
@@ -0,0 +1,29 @@
+From 23a183b63a4c94ae7cd0f36c63ee7eb905be60fd Mon Sep 17 00:00:00 2001
+From: Rui Chen <rui@chenrui.dev>
+Date: Mon, 5 Oct 2026 22:55:47 -0400
+Subject: [PATCH] Fix destination enumeration without DNS-SD
+
+Add the local destination fields used by cups_enum_dests to the non-DNS-SD callback data structure.
+
+Fixes #1739
+
+Signed-off-by: Rui Chen <rui@chenrui.dev>
+Upstream: https://github.com/OpenPrinting/cups/commit/a197d30e27b5dd4d8c41d7a8ab136727290ed7de
+Signed-off-by: Thoams Perale <thomas.perale@mind.be>
+---
+ cups/dest.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/cups/dest.c b/cups/dest.c
+index dac26f119e..676470e70c 100644
+--- a/cups/dest.c
++++ b/cups/dest.c
+@@ -125,6 +125,8 @@ typedef struct _cups_getdata_s
+ {
+   int		num_dests;		/* Number of destinations */
+   cups_dest_t	*dests;			/* Destinations */
++  int		num_local;		/* Number of local cupsd queues */
++  cups_dest_t	*local_dests;		/* Local cupsd queues */
+   char		def_name[1024],		/* Default printer name, if any */
+ 		*def_instance;		/* Default printer instance, if any */
+ } _cups_getdata_t;
diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index 7cb25fc4dd..eb029e8683 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,5 +1,5 @@
-# From https://github.com/OpenPrinting/cups/releases/tag/v2.4.19
-sha256  820984b12a67f98705785aae2dd1347fe0ac097828001d4583ff64574aed6389  cups-2.4.19-source.tar.gz
+# From https://github.com/OpenPrinting/cups/releases/tag/v2.4.20
+sha256  ab4d9cd7f3e58060091d2b24972223d6401675f11c49b65abf4f6ef31dea22ff  cups-2.4.20-source.tar.gz
 # Locally calculated:
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  977206f041b9a6f47ac00531e1242c0fab7063da71178f8d868b167b70866b6d  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 0df4f411bb..43728426ea 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.4.19
+CUPS_VERSION = 2.4.20
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception

--===============7118372779731345378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7118372779731345378==--
