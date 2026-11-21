Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEA2606A325
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 11:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QAyPcUcQ;
	dkim=temperror header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256 header.s=2022 header.b=j/ejowCv
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B21C4068E;
	Sat, 21 Nov 2026 11:53:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gBqFYNqvdBnH; Sat, 21 Nov 2026 11:53:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7E6C6409D2
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795262016;
	b=OxVIxq6XVuONGXy4ynUlo2akejqHsEChD1qjEjatJ/AHK7vty6ZwwqCK6xsAtEPxEAg3
	 ENbdXR1uvrsCgf5Vz4SpoXTqBOG5rWAK12syLLCV3vYGUwU0TCmmmixNNzMlOPemWpudN
	 pcTU5NWGHeLqrU8vhCynUKK7D1r9sgZ9+zQSc6yME5O1ZdYPjUOEG5hiIUctn2tfBIoZt
	 bNbG7tgJB2C+54q5Ezopu9wqjK8vFwWSqcxsILE3qrAHaUqFApIDmiQNTywJsWwwjqgqc
	 J5TD4zLxxz6EA56ZKvk8k06Av/Q37wECtq0X7C7+YBda3Cg46s4JCP96xDBcZilVN+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795262016;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fO/qin4IXA9TRcxraIlrBgwPX2nY62r6vri6aBi4qyM=;
	b=G+rHx2YilFMNejwVC0qJ6BG9XNDt8t1riKmfXEslLsSO9Qp7Yny63GLf7dkV1Gk7NGHg
	 kRmiX4hnJLug4F7DvfFFywyPhg6Iwxgr43fs2g8qK9mDMq5sIVMsiM2d9rscPFGG2uIex
	 SOWBcWd0HuUp7hK537XJAjPXgZTUQAdSJyU71MCD8z2weJU2DGY3WKeaI31j6BHWwcp/G
	 OAEkgbDcuuWVy31kZLhHFojpf42iAX/Gv9OS9xhLNbWJYVcVu19LcL/q8tFeZ+51xbllD
	 XTwhCCsXzMsDhYohKqB+UBTCBX4/iclwtYh9yIEADIBLipZCgA5VhVyIBGdDHIG8QtQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795262016;
	bh=fO/qin4IXA9TRcxraIlrBgwPX2nY62r6vri6aBi4qyM=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QAyPcUcQ7RgbvpjeEf2RKE682JSgYgzGmQXtvGdXAfuGa6rJobnq4ipOFn83c63V4
	 WF2revFF4sVl//e7KVj4Z0EYxT758DvZPsFw+ZY80dF/wbanWotmX/pYG3zJy4XBfk
	 bMWrpDyiFp2gdEBU3bCD40OIYRSxtLOj4BWxdB7hxZBjN6ydxO7NZZJ2RUBshHMjyJ
	 AaSGyxT33BgY2Q42fY6Vl+jMkkgyHBlINZhABUl6BliqgTJang/z4diXd8PECMddPM
	 HkXjOZRyW9X/KGxlDqPvzdA2vl3k3NRjyV9pXtwGFdw0HX+x+q5hGaYqRZiSiv9C0O
	 7pEafv3eZF2RQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E6C6409D2;
	Sat, 21 Nov 2026 11:53:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CF8D465
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 11:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62D5A813D0
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 11:53:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cv8GvwORLnYh for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 11:53:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DA086813CF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA086813CF
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 11:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1795262008; bh=MpoPxu5pybnlaqbzuTR2u48HwO54cvZqHxkDRrCmwrg=;
 h=Date:From:To:Subject:From;
 b=j/ejowCv+WVvip2k3GIMUDrVctEprwThteeH6HXhWNosaWwgfuhczpzpVnrX7LsJX
 FQERWJZU2g2aqgT8UK5Do1PJR0AdpdN+J+/QiucTO01sKLTZdQ5cJnnG/NHIVPlfdR
 e+4oD+JTjm/OLWn0L2RWqZOau7F8L/Zg9GKZKPYEOeLXRXQCvUhecIFye7xxQJhCgg
 e8esoSrRrz1szzOCGl7JaM9brqayyGHI+2B2Ktygq1UM9J9vGv6sIudQAlYwBdnyYL
 WBqA4ugQf4B9+txxGjSUC0bZq1tTqEibZcFLs0+TqkPBWihOsFBiqPlQt0Rvt/olAI
 J0SAu+KcXZMTw==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id D9AA731E0B9B; Sat, 21 Nov 2026 12:53:27 +0100 (CET)
Date: Sat, 21 Nov 2026 12:53:27 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <awGGNwaZnjwHV98Q@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.113+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH next] package/chawan: update to 0.5.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

See here for a ChangeLog:
https://chawan.net/news/chawan-0-5-2.html

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/chawan/chawan.hash | 2 +-
 package/chawan/chawan.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/chawan/chawan.hash b/package/chawan/chawan.hash
index 020a42ed2d..c2953492d6 100644
--- a/package/chawan/chawan.hash
+++ b/package/chawan/chawan.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  67a54f10acd2dcda6c62bca825ccaf228f94d04ba9dc85c9369930c58d12ec21  v0.5.1.tar.gz
+sha256  21201936aa3a5ff0117fd55bfa1805ab77647761f4341fd2f77eca15bb66c807  v0.5.2.tar.gz
 sha256  7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
diff --git a/package/chawan/chawan.mk b/package/chawan/chawan.mk
index 609ad42b21..8654cdb73a 100644
--- a/package/chawan/chawan.mk
+++ b/package/chawan/chawan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHAWAN_VERSION = 0.5.1
+CHAWAN_VERSION = 0.5.2
 CHAWAN_SITE = https://git.sr.ht/~bptato/chawan/archive
 CHAWAN_SOURCE = v$(CHAWAN_VERSION).tar.gz
 CHAWAN_LICENSE = Unlicense
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
