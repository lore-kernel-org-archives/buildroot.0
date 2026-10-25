Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7F6606A31B
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lZeYMaue
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5F1B6060D;
	Sun, 25 Oct 2026 20:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eIlyIMFgt8YN; Sun, 25 Oct 2026 20:25:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AD08F60601
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792959953;
	b=AcALwvb9zDL05Eyv6GP+sl1BeLnxYt1Cs0yrCQH8DRuzJoEFMPuUFX/Ylu6ZuNlEjJdN
	 jhOVRTfzgTNV4h/uijU6SbOblCZu7GrQ9yiuIAnH7HIY0olmqAWeRmW/ZT5Wb3fWhQcoP
	 kG6T93hBPdRQPVkgjPWarwqRc9AmF3MMQdMRnUcHsRicOkwwWei3qImmc+9/geGHt6o//
	 Bq96ghIvEa+N2IptI3yH6pcEA0tqY3jRf1Zaf42JoNyPDof4vjtRdtBcBUtp/rVwG0j97
	 q9rH2E0tI4iJdVQb/+wwB+ABroukFYV0Aa79OVGTzvP5q+rf3z+NQQvisYEmkReRYYQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792959953;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Zp8XhgjvbNP2CYMOrfpLCRVQmzAH/ut+D9y29JUiUYU=;
	b=DKTSGsrJY+Lqoi+6MWhrsj87JbRv56/GRMIT1VRcclHfSKdvtqm+Qd0AAxC5L/TyG1VW
	 /7PSIC5T5xol2SRJ9K96m8Wg2tGjeos06R16nndaWFM2/cS3hSCo2xnbYYVelgiescKpi
	 o0deASehiCY8fQbYDCulnItu9p932Yr/Pr6IiZpvz/h4Pz+Y8paKGKHIC3L0HBHCHwbRH
	 jUtg7GHi4T9GkqndzEQ2SBHDRpRa2uGvQDO/5HfyleH41hw8mmaklvUuqi2yAk4PlSaMc
	 a3m6A9emn4/tpzJQmW9ioFOzYstT4tsXTflf3nutt2ftir8R9lV8Xh6/E+X0O4omoPg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792959953;
	bh=Zp8XhgjvbNP2CYMOrfpLCRVQmzAH/ut+D9y29JUiUYU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lZeYMaueFcGF/V477Wk7fe2M73j1YSNyJ4q4Z6J6uL0YLMkDlFN+neAiquwYJn0U0
	 q4dNBjcglGNewH+ujsZ1myLGWN6bCPEXPSxyo9ztlY7UH6mnMT52Z+sMZ6CTFLNMb6
	 llbudMEgptd59N0sTdirFixeZfTfIa9qw8Q7DRbRd7ksDgsGhY6LCtLiISaYoS0yZa
	 ksA+yVNDxwxsR68kGNPhXddyhcJXacRQskgejaOZ6OaaLHSvC1iDmVxHH6xOYhMLif
	 iwZ7XuI/h9N5Aq5K38osgJFA5D4k3UQ93MoTkCe8a3gzqIWZ/vS8C+CI/oO1guinCN
	 EylK/ALBcyjCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD08F60601;
	Sun, 25 Oct 2026 20:25:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EEC813D9
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECA724008E
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:25:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FIiCg_q-ROU0 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:25:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org EA42540057
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792959952;
 b=Hq9M4j1/03BEdAC4vECG7A8w3h3nqESmZ8w8ak9+5NesQg5Gh668Hp4Zt7fts7yDhhqC
 W8vNDC8HSVVo8X2TMwienYLr38hyy9wzMMWovrVtndKKox5yJuoHU0wOFCB6dGnHcuHnK
 PuX7dTbQ7ZRpmUw6Et7Fw28OsTRLtkXDeYGiPVAomjZCPzmBoUA/s91ZFnOZQyGIX5Gy0
 nPMfB0ppqROdGIfLSGaQXR1cKkBvozegsCFT8A5q4kCVddD9W6Cv9OwIrhGVYnwHgUbbI
 gIYkNw9xHrAnch0F7y90WkJwAfQQNdAwlyrAH3bvQ8d4aN3L6NJesfP91iB1ypcFp0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792959952;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=TvUI/Adjnloe3MCIiL7hVb8Vp82NTSM/JQsnMFOkwJ0=;
 b=ENEIMzB1zOVA309UHnsovhYkjOPAu2RQctjE8IfOmNjayzFgOPttFONIv3m+HUcAXUzx
 y1UHCOP4c6YcUyBA+tMfuoDrIq9/v70hYVmLMFJuEG1ajpLrqcanyEuEv/GlaxkEere+f
 ipmV87REgTGqtFev8yoYT/GPJEXVRQJtmy9NSujGDmzSPslw3HWbBIIOasS0AMdCyQX5M
 6QsIBAClbmZ1kZPgwhz3Xyj0FLg1QouaDnSBRvYj+04aOQcedwVC+WxxByAOD8MDoAij1
 216ee5xnh+EVAs6z5507JiFFkBOoKlAIGSwpJPLKmXolRWDu65Sl6y5scDggM3ONpaA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA42540057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:25:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D9929C67B; Sun, 25 Oct 2026 20:24:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 21:25:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f94566c11a85e54c5262c371eff076886c9c34a
X-Git-Newrev: 69a2d9084152c5c1f2318c146c0d6b6a183ed38e
X-Patchwork-Hint: ignore
Message-Id: <20261025202426.4D9929C67B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cups: security bump to v2.4.20
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/69a2d9084152c5c1f2318c146c0d6b6a183ed38e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
index 3e85a2eecf..2fbf65e58e 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
