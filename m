Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC81606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 17:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PUvfOCnD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=LXBia7Ed
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2460C811D1;
	Thu, 26 Nov 2026 17:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0JWznPkn3pPN; Thu, 26 Nov 2026 17:50:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0F859811D3
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795715413;
	b=ipKdf/VfcC5xytXRh4yIfDBuYgWgxU0yENrWM/6a3yxhSeAyXMwCmZmjG6Fw2rEmYdZD
	 15ExOUYblepep82Hatke3LmbqY38aU/zRON+kYogkd/RSSSap41yw2yRYv1qAJ+Tw6hXQ
	 Z6/jZCBoWYkZV1IIqVBXXjVFHIue2PzMOUzGtNiG1uUsdjN5iHWe7IR6MtpMCaOCJdJxx
	 M1K14w/25n3x4ESCC0wMjnu8TUB9T6q+OK9tak2InrBWMZ4R9U5335NkZr5MDZWNoHjoI
	 9Fn0fH6gA8ReDn5kuyrGoSU9qSfEzYYzQQXiZ5763Ed6OHksYSit3Uj03Pj5kSjHZCg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795715413;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-MIME-Autoconverted:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=62LTPU+L9LLG63AMOeUH85SHW7TyqadYtvLw702/sVI=;
	b=oYR6IdBNYp0Qrnmx7Ta2qhl9SHVu90QkHEwR1UbtzKW1juQ+fDIrkZfOKC/qwDF+9peK
	 zRMtuXUKxqX1cUewvZohM3hpu/NYG1KvZaggcxnEDNx2N/T4MPzsRXXT/f6YQG9sAbfgg
	 WeW+aad9r1cdiMd7aDqx2+AAMp1xmK2/U/iAZ7Wc9TWm3sgGEGXPVHqQI3uUqrKcQ3iLE
	 u8UxdW3gHU0YyCdQMVwc+o0Y19UHbk8N+bBg1oPYOwGEsWMbG1XN2fIvE48kl6swuTQdx
	 JobZZibjwVY3PD5ctqNbgnZLKfAaSYh7DTTA2aorPNOBlPD4xq21JIFmd6VTiouseSQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=LXBia7Ed;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795715413;
	bh=62LTPU+L9LLG63AMOeUH85SHW7TyqadYtvLw702/sVI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=PUvfOCnDhAUvpOuNgATX5E+sAonvR3qTmOOdQ28D4npKXoD0T0eBC+YBzmkg3Uvv5
	 uke7KvTiEyav23FKeiNGXe7DKVJ0pXRJu3sstc+YmE6Z2sdX54mMePhSSqy3Co4KXQ
	 R8tOHK0L77+SYdm7G0x8lawveL7beJkysXTEJZ2OcNyl05sQm7uhpqYCACdePk6GzI
	 0oQbb8xRUEQmQaIKh9nnUlzq7e5YoX8zW1lUVF/fLY4PmZ9XghxU3FC0O+9KvEwVdg
	 mYnCU4x5MdWeWm+8/d80Z8XXhGVLg7IbWXcLUGdGDoW3FqbiAPAWlz02+Ja1l7VmSD
	 IGA9hh5yYY6pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F859811D3;
	Thu, 26 Nov 2026 17:50:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42EA722B
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 17:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34D1F811D9
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 17:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9RLZa7Wm5Evl for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 17:50:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 201A4811D1
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=LXBia7Ed
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 201A4811D1
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 17:50:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=LXBia7Edn2F+Blg4itnIIDSAtCIpl9BcBlG51WO1o3TF/EWwFpR6E5FLd1zyknBvaXg9mxhD6mfwtgU3LM/nwD9w5hSFn9JWIYMj87sdoRVRF7se1jae3hFt1miTS5iQg9e2II+7RTKsWnh1/1baBFcfO4QdCsllr0/gBjlo54p0XkGMU9kyuq4cEJjqwCSd4ZUyHl+NQz4E7YFZ32RshNE/AFk0G9s4nPu+eXDWmzc6F3ZYAm5KcdkCBDPPVTXaoZNBj+0kM2XAVuRokuAYBoPODRVl6ae3P7pWKqT/BeHmq+lKEGjSEthK6yqFwOQcRSiL9cOGE5Jwz6+1DVeT6A==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=sYZ6Cu6KShqQ0os8YLXzmftg51CQ85Uz+qSfEAuIDlo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 678448618; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 26 Nov 2026 17:49:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xWdba-0000000DP9N-2RO0;
 Thu, 26 Nov 2026 18:49:58 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 Nov 2026 18:49:56 +0100
Message-ID: <20261126174957.3194898-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH] package/{glibc,
 localedef}: security bump to version 2.44-92-gc7f65355ef
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes the following security vulnerabilities:

CVE-2026-100290: Double free after allocation failure in regcomp and regexec
https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=advisories/GLIBC-SA-2026-0028

CVE-2026-115819: scanf %s and %[ one-byte buffer overflow in wide character
conversion
https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=advisories/GLIBC-SA-2026-0027

CVE-2026-121758: ISO-2022-CN-EXT decoder may read past input
https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=advisories/GLIBC-SA-2026-0030

CVE-2026-126765: Double free after allocation failure in glob
https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=advisories/GLIBC-SA-2026-0032

Commit 2.44-49-g6b48c0b29 has now also been marked as fixing CVE-2026-86805,
so add an _IGNORE_CVES entry for it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.hash       |  2 +-
 package/glibc/glibc.mk         | 17 ++++++++++++++++-
 package/localedef/localedef.mk |  2 +-
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index f76bdd3d02..dec3d5b4b5 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  f262e6bd4c51015a2a3095f934cd6bfa8f0cfc46724be06a5d8a49cf2f6f8533  glibc-2.44-77-g438677ef498552b28c2060060c9e3947373f1e2c-git4.tar.gz
+sha256  5721806a1c59122cf9746a907381ebc73d32b82bf8b22a07d8345c61dd8e795f  glibc-2.44-92-gc7f65355ebd788c705ef6dddd6030bab679f7791-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 3e4585d014..7cc6e851be 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.44-77-g438677ef498552b28c2060060c9e3947373f1e2c
+GLIBC_VERSION = 2.44-92-gc7f65355ebd788c705ef6dddd6030bab679f7791
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -43,6 +43,9 @@ GLIBC_IGNORE_CVES += CVE-2026-18374
 # Fixed by 2.44-48-g1f5026241027260e9280039698bca031484c82ad
 GLIBC_IGNORE_CVES += CVE-2026-8674
 
+# Fixed by 2.44-49-g6b48c0b29c359dfa84c09c32373a48c8f663c304
+GLIBC_IGNORE_CVES += CVE-2026-86805
+
 # Fixed by 2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891
 GLIBC_IGNORE_CVES += CVE-2026-89092
 
@@ -52,6 +55,18 @@ GLIBC_IGNORE_CVES += CVE-2026-97399
 # Fixed by 2.44-77-g438677ef498552b28c2060060c9e3947373f1e2c
 GLIBC_IGNORE_CVES += CVE-2026-84243
 
+# Fixed by 2.44-78-gfcfb867c58ab5dc402a072fe23534fa3b8ff2616
+GLIBC_IGNORE_CVES += CVE-2026-100290
+
+# Fixed by 2.44-79-g063fdd4c7e034dfc1a0f14dbf3a9718a502033cf
+GLIBC_IGNORE_CVES += CVE-2026-115819
+
+# Fixed by 2.44-83-g625054f30f0e7a961519f045f2364aa3ca6c1c6b
+GLIBC_IGNORE_CVES += CVE-2026-121758
+
+# Fixed by 2.44-87-g809fd7179d4391debd553459e58c414ef59a32c8
+GLIBC_IGNORE_CVES += CVE-2026-126765
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index a4655da94f..e0f1f0acb5 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE, and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.44-77-g438677ef498552b28c2060060c9e3947373f1e2c
+LOCALEDEF_VERSION = 2.44-92-gc7f65355ebd788c705ef6dddd6030bab679f7791
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
