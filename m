Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066E5606A31B
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 17:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HOgfbQYo
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8E8840533;
	Sun, 25 Oct 2026 17:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9YzNr_qEfUvl; Sun, 25 Oct 2026 17:48:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 86D0140550
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792950522;
	b=Gh0iKtojZ60fnqM34PBEN6wpF9cB5xs9GrJLjBHzvgzp77sJDqX6lpke/peRt9S5ViHJ
	 pOY8qxByQBGxBPD9Q7zSnGqsFEFmJ1DmGD9QA+clI6JkiJYxGCiMK8WhAvI/vJxvTusIY
	 oNTFtrLiEK8h1P30D00Gs5pu5Bm6324BaaT0q62NAPB0PPt8pMZ0nWLGMSR2h42jCNCzg
	 P9iUmkKgQmLeaszrAARC1eAgl1u7SavQjBI4qiaBvtaPNjIIMf13pB2C7BXuGUyPVxl15
	 igE7b21mmEflz611xPMKoFRmhAi19PSvEy/wWXLJQ3n3D/OtwYO64lT7AhznFOFWTvQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792950522;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=05Q4emoiyqGzcfUVQpEyTg4FedAgOfgyOuWxoa8WzV4=;
	b=BuJR/TC5swm66yvpbQ8Wmx9yV3T6Nmqk4HW/tmoLN+GbvLhL8ukHeOxArQ1kfwaVDu79
	 XOxOOUpew32jvisPrXV3F/aliJJoSG1kcwwvZ9V/ViQefcyS3JHUMYRcyBONhUH3/yYzs
	 abdF23AQISSDrlWXDyEre46wS/IKKMDpsMdKfgaxNQINSiCFIasb5XKAKkf9waS406ABD
	 wrn6Xb3sJUTh9ag2XpM8MIm6vnlL1+dSleyBTDBZ2VKYg8wl2uRpK+13rbsKAXyC5Cz2E
	 vZh36yQjnLVFr1yKHs/zD0AgFoArKrAQRNEqLGYEWjfuvItyrxIUeWUyfAZCMay6ywQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792950522;
	bh=05Q4emoiyqGzcfUVQpEyTg4FedAgOfgyOuWxoa8WzV4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=HOgfbQYoq5hqL3Ue7qKAc08HBSHWk6WVbRhfXxG0IxSTug67KFwa0cL/uuDzPdNw2
	 e0q3aMdedWwfiCm+1okdkZSQSj1N64dm7+ilcBr8QLqBoCGL7q0kyF2wjMSrz70tzO
	 Q77Qlq2WgBDO0/mSbzmiUblnYICu89DlI8TC0OuGVkr+hOw/C2y6Xm/Np/xHccuZyf
	 /eIyQafVXuhoYUW3w4h7W9d+HoSCVUohsnl0+KJ5Dr/Bcf2YoI1PwbRNXSomegRrsZ
	 OTmd38BCUupQDCDx+7Q/exwbs7RStnop501hPYxjYKa3XW+z5u5SCOgDC5tb5Qg/YU
	 kJbPfy8m6/omA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86D0140550;
	Sun, 25 Oct 2026 17:48:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2514E4D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16F27605FD
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id scJB9Uz5AW8Q for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 17:48:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5F2AD605FA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792950519;
 b=O0ZcAJbcb/T4YPRHYa+Dye3IlfHKWVgbyFuAau2bzTxkKviuvJAcbG/6s3/AB75xrkQE
 ZbKQ5xj4nHHwyU7Icnb/SRZEnqIwLqU6X+YUiVOFAzbiPAM3arsyWh7IJ5hRUw66b4u0N
 1wM56LEUMhFXY53q/38hX8v9qSqRsq/d0mP/vjykvzN/tyZl5P/BFSARMX/cBlU0FLmmA
 3AWAPfc5s5zCN9XUbgTxa6yAhvT674Xclyx73uthU9HOpioi6+FuddL+TirvTqe5ndzFu
 LGnPLs/8ECVBrf46FydxZxyuvJwycEzm2zazLsixzEnx1pl+phzG1W7x2HzJBaad0YA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792950519;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=4vv3oOTm2APK95dzkf1ok22bDHUdGacDm+R7fJppBak=;
 b=HDLxLp0hbTflBdNiLznCtIBdNDZMga9zTUvuXC+Jrr8xs+I2Y+/wI6uSO1nB0m5/cxnm
 3L2buuQ02/SmqPEr2SMMe4k0Q53e5s+S87bAc44ewUkzwABsciLqZgcfsa1Mzbrk8IW8k
 Jswjupm1q5ncXiTjUJBZxpTq1mj1rxpeYR2rPmTfnlgvxOWZwCD+igHHQXd+efbsr393f
 nzReMl6UiDCeKORuQT4KiK41GInwQ0eawoGQhmAYyVxddxvuJlVGWg4WVXUzeYFWGEZk0
 qqHKTRfooHBnrKkeyeKkFIR77xR+TDRLXtax8HKcgQU11n8TEVgwg7zIklMC3quReaQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=htXVYOWX; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F2AD605FA
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:48:38 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48e46e449e8so486240f8f.3
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792950516; x=1793555316;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4vv3oOTm2APK95dzkf1ok22bDHUdGacDm+R7fJppBak=;
 b=VsMvUGhyT85Y7f42pCyJI/oYVyaGcN3hSu2cRmIwOuIHrYxBMoS1O4Jq77zefmfDZm
 K8PDAcMZNT78/TIC7/GTAybWOEgNn59bNjq3cGWn9pnImmzlfE+v5Q4r9BNR6eL4vfAk
 Nme0vRUiqCuz8Eehdfhe7cdb5Col83NtMwWLkkiHlmR/UaD/k4t8T7LBZt+0HJzkvC1r
 KFwGkWMii4bwJRxdp6ZoBj5aYNu/LkGwBXqHPO5oLt+ym4MC9s8IgBvekU6sEcrFKvu/
 8EDLhgm0CVGCtDsNDSIA5qSmNd1GFnvMY507wLFcuChcY6kN5qMSJJB+Ih4NXqntkFOp
 S40Q==
X-Gm-Message-State: AFq9FYL9SaNQB3ZGtswsnp5CBn6IyRVP01HCgcLDknHFR1izqG1rutwa
 siv/8YJf2MPshTCYKxRhyEW0jveZipP+7nrsSX/h2L7ybdfi1WlpZDxFIs3q05HSfJ6+W8J5oBa
 JBx5x
X-Gm-Gg: AYBFou02Zf2OxLY8yXDugsZKm4ig99MHj7NxHp3LvHW+D+0lBfOX84axH7K/8h8d1ZY
 io25MM3XVQtYXRuNSLH8jQAreYjl+aBw0PezxKxXZAjLy3duJeVZ+3Y3PhFKbhG2egOOv9c4kIv
 ERqJEiP0ZKY97sq6B0AjAFWgQdurIDjt/uhgz+vwHNC6pNg/siJWZ9AjgXygJ4QkVLEmIBg/TAH
 sWLIcEAilX9CjOYqnRRlXRRkI5+Pj3HqAoptQGaJ4tYqaMhoMozkuVI+wxUyltXQE+kq6aLt7fl
 VwElzjKGonLmy/IkVeV3lr6cmnyxhn+Z+bl1hRWKDjGi44ip6Yad5PKLcmzQltNlFsbC5U7TxVY
 Gt2RUeX9hUerzPtqwCPAh3GXzlajhEu3zuWaFxVhSJDTfcPORgVtldWZgYJianMK0VdEvRK7cW4
 IRbFRoX52wK7d7+mxpCtFNnZ5g2LhU/CzF2nFTpLhpm7CKDlSdqDNcj/NjhEAwUeNyFpec3PxJ7
 Kn5gDwOXa8pbB7ujapFsA93PS+zKutdBe88BgnQ9T9wvdhY
X-Received: by 2002:a05:6000:2dca:b0:48e:d88:55e2 with SMTP id
 ffacd0b85a97d-48e3eb9406amr8238362f8f.42.1792950516466; 
 Sun, 25 Oct 2026 10:48:36 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e4115f496sm10631704f8f.5.2026.10.25.10.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2026 10:48:36 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Date: Sun, 25 Oct 2026 18:48:35 +0100
Message-ID: <20261025174835.190885-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cups: security bump to v2.4.20
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
---
 ...stination-enumeration-without-DNS-SD.patch | 29 +++++++++++++++++++
 package/cups/cups.hash                        |  4 +--
 package/cups/cups.mk                          |  2 +-
 3 files changed, 32 insertions(+), 3 deletions(-)
 create mode 100644 package/cups/0005-Fix-destination-enumeration-without-DNS-SD.patch

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
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
