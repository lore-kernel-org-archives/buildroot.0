Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1D0606B11A
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 10:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UrlwOLrn;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=nl7EL2mD
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11E3180E0D;
	Tue,  3 Nov 2026 10:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2VRBQK03APE; Tue,  3 Nov 2026 10:22:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org ECCF380DEE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793701321;
	b=PHuJinhKTA49b36ngcrTY+lrl+4zTbYbK3+9SBQkH7C2wsz8XCcD1+GM4wxSbezqFbcB
	 ubQz6qZOxVG3s8/aG7nkRUcI6qMRFYhqq2Z0uH9rGtnUXFvh5HwpJgQo3cHPE3BWQ1HzF
	 0ZjVVtV9Af4h7Fe8SMzGUIP3Zy2KlKJVCsz0qDDGFyBHqI2K1uxFViIjrlh8WLKwuYssV
	 hxpkXyoXIeAzVVeUGEMQAJjogSpxy2PRNOGvcrGc7FsbvR0efKglJqRfuLfGG2HWN0Phe
	 GuEN2rCzvdcABMkmF2SasxGIFgdUNxzw9ukcBoKGVzcjHT9M22Y1RFWduvQ8MDSOXdg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793701321;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Hs3NpfBG4pTdusU8tTmOOrhfemdhqTIgZcLh4a2ahMY=;
	b=qKk3hWbYFOg5pLNR06qqDRCOi+CofXGJJ/UIVB0snMHdIi0LjSu161SZVX2U8gopmKkl
	 6lr2gSVP3J8dVxxZqmxbBMPQlFOS2RQ4qnXp7EDIkwAvCHBJmnNKCSZa4udObh4Zg+zSn
	 X/h6lV7ga876cLlpUSNs/ziKEtINeFwQeXXTlaV5mWGGek6ZIPBn+9an9OcxdLXj1bV9u
	 5QJgo4QRJn1nxn57ZWAY7WYQwYxPX1EV0rxQ+3tN8xbiXWG6K+psX6jUNwqZc7XvURRjr
	 D2mNsyZAPes5AGRdVdsjcV4YW6nA1wc2AuYMA03GIBoRJ9JON5KL7bH0gsIi0/HQt3A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793701321;
	bh=Hs3NpfBG4pTdusU8tTmOOrhfemdhqTIgZcLh4a2ahMY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UrlwOLrnwtkgfM8ZTyFkBXGSVtR8KtjSiL0Flvl/djt208e3/UfSzAZSpZ9FJIxLd
	 lwbwUG3sPB/kttFKzJhkwtN7EQPENdQbREoQTAv7OTFyZm641tjl+bpTanQhtnSNpk
	 mn0Ce/HjrSxjL480OqdKNyd0W8nOKoX30dZYyhRBA73LIzs397QdvicgB5lnQsXOeC
	 +tnSWrFDddd5XOj0QfzGm7IIkCA7/8GVGQ9vO06QrLuW2gdV8d6t2z1cQXY25BNT/2
	 LJOhkJhwXTM2qoISyqkNxYm9gjsjCeAJO/sTW0D0L4Du6jrMoHoh88So8pdacdWL3I
	 x29piv7EkfWkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECCF380DEE;
	Tue,  3 Nov 2026 10:22:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C52D9D3A
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 10:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB2514005E
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 10:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7L5-lJ_5a6_Y for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 10:21:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 58F8C400B1
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.102
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793701318;
 b=mC3jXRTD6y3Nz9jFXFBxSMz2SIYx1k+MfYfVVFlOG3NR1QrTdv8WDkUcBr7XskneOErM
 6br7A8bQhbe/070F7PiAspZatEUKsWrmwIk8VRDkjE9KpqHYcR/Sjoa/w3Cdt16HdvrdZ
 MBdhgrR0dByK+9A95ydGNQc8ZFdpTbrvaIwAf65rIB68JHpKZxkyYtkXi84UfUVY7hFRO
 Bmvh8bs3cVVHFpT/1rKgoyy2qduOK7NduzL4gAgImgiRCsOqApQT2W9y2hZCctUKeVQvk
 TgfLK1kAnv6+TFScXg5/F3aoEKP+0IjcaT6EvA/hm6jNZND43603kZkBIv6VXq82ZNA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793701318;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=po2QRmXI8hXaOH8YvzK3bJSjSl0x1NVO2dXDQjPEqr4=;
 b=JS/KY44oU8S3WCw0ofbqRYSOWYmkd9nYgKwjbt4sVptCfBivUsfgIqB4Fax2qoqNL/DN
 DicwzXN/du31IeGBNoNEVnoejUepVzoSwPAdkuRnqGib2wBXw5bl9Wk68W68uO9VBscdo
 ZI80LyDiLhInDMOBP5CgGMHnoxncK3i9XuM5gKFTYbrKlT4xsnzY1+uWDfbqAN5ZE7P/V
 5iCMutHp22uCLoEUKfjv5H1ElZ3xNwdYQepaUP5px4HDDeRdm262ZP7sUBdfR+6Hwr0Jt
 Heg4Sblh3tAI+NuFtEdjEqu2ZqJ/yGpwPahYr1zf8hSTDe8sZf9n5Q80bJ+5QlC8PVA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=nl7EL2mD; 
 arc=none smtp.remote-ip=62.149.156.102
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.102;
 helo=smtpcmd10102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=nl7EL2mD
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58F8C400B1
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 10:21:55 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id OBeLxqn6BW41bOBeLxq6B9; Tue, 03 Nov 2026 11:21:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793701313; bh=MjpE3nlgVUu51YwbsvatPSOEYnCIn33McHjU4nd9++0=;
 h=From:To:Subject:Date:MIME-Version;
 b=nl7EL2mD4taDQapYBpKIXkDkCcIzND41lf9xAGbb+Ke75wyVhzF0ZRZ0x3gmqxKcE
 uEU9FOq64eXdEI/sJaDiZzMG9oUk9WgtQOA8rcEmc5rPaADtw6IbMj44U98LrA++zC
 lPRoUGHnNOIzK5z9eUbS/ijwR2slRIexpqLwWyPNnxRHuwcYhikYxYTk5kvJLodWUM
 if3irzJs13CPpVF5FzbyP8nEQXAF2PBP3+i0zmnbCo5ff4MN2vRFWlHBtWTdzcDkOE
 XRdlshF+XxdPSm8rJn+xtjVXz9zCutHiZPCvoqu3wGcPCVGW5Ma9z2MM2umSGQsHSv
 iCy64MMZBHn9w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Louis Aussedat <aussedat.louis@gmail.com>
Date: Tue,  3 Nov 2026 11:21:52 +0100
Message-ID: <20261103102152.4140664-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBDKce7vM3KoSdvJyBzWK3Dgm1HXUkUN4uQiQQf6iBn8o0tSo8bjrE8o7dzxe/KugYJ12O3xPumT/XGtO10W5toaCeeM8h+2i7p6stNr8JWpBlz0X09E
 cxpXxWTuoOKhRAo1KHWiEXmbzcv2zkgw2hgmQiABANE0RBso3ASHef2MBvnlDpJrKrzdWUHNLD1kXhVGuunRSLadweh/pRD71ABeZxZ5joHbIiSw3eGsqIH4
 umtPJvoVvVQ1NJlNRUbEYBQoDEJjWubW52Jk8joETxougzZr0oQGs3XpTAh0gFkMDeNW+6ZYdpotjE5wOldNpg==
Subject: [Buildroot] [PATCH] package/rtl8189es: fix build failure up to
 Linux 7.3.0
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes:
https://autobuild.buildroot.org/results/63c3a272019d0a84b89933ae174c85a2db46c454

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8189es/rtl8189es.hash | 2 +-
 package/rtl8189es/rtl8189es.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189es/rtl8189es.hash b/package/rtl8189es/rtl8189es.hash
index 2eaa881d00..218feac40c 100644
--- a/package/rtl8189es/rtl8189es.hash
+++ b/package/rtl8189es/rtl8189es.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  e8beac10341e70779a7699cb806504d84107d59aee2b6c0919b1ffe5f8236bc4  rtl8189es-0a5d04114fac3c9f48a343cb905fbb6a3f9f5df5.tar.gz
+sha256  c65493802f1030756cd6978598819937b0a78f09d1210622c50847c040113848  rtl8189es-f4712611578312fcd67795a0d43d78eb70378238.tar.gz
diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
index 55536a5b59..26d8aee690 100644
--- a/package/rtl8189es/rtl8189es.mk
+++ b/package/rtl8189es/rtl8189es.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189ES_VERSION = 0a5d04114fac3c9f48a343cb905fbb6a3f9f5df5
+RTL8189ES_VERSION = f4712611578312fcd67795a0d43d78eb70378238
 RTL8189ES_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189ES_VERSION))
 RTL8189ES_LICENSE = GPL-2.0
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
