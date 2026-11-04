Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2486606A31B
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 04:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RE/LgMNn;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=ThAqjaox
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 777FD808D2;
	Wed,  4 Nov 2026 04:58:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3GegDclcxx6h; Wed,  4 Nov 2026 04:58:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7E2AC80821
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793768321;
	b=iioKTe84RBnOPzLD9fxAkFeLnQ5tZlZsmOmz0iu88oqzWN3PGHYPaS5gudvjwyn3NdYV
	 DbNvZ+e6003MBJhrMp45DHFMVOa8aPf3eaSQry3kghkGZEMov8x1l4UiLlsI+wkd8KUZU
	 yKqz8M3/YpNCOKCLfodfNH5UpjGSgli+gpVX4ZDZa9NmL1+KgRTSOgVxQdLuzAChKptq1
	 jpR1WaPreRqveFMQDnpm4K83Jg5FSYRZz8bmnX56lsd6q5xaQ2N3jigsQ8+rpzCgNsMoP
	 rHXWmRSKz/pSOUT1nDnOB78tZQkoPuVD1I4ITg5PO4fqqA9B5I9iNBvf9jwEvcCuwrA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793768321;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nyNYsRczEtcdgz6ETxfhyrdOx6Wt4e+yxZE9Nro/CBg=;
	b=tRLNeGS91YDEaU5EEvWrZZV8eYXC/IXtK3bJr7AJXLhczvMqdBAvXcJ13Q6IAZTIJuO7
	 QSXXJwxB55j2Ai6pIhuQmcFHjkAc9XXVU5jf6bK4Kl6ucSkNn8uVRJeu9IQaGx1nGnMZa
	 IsNmSEwhDTlRDfy3xN2RwuTrxYH0ZcyDES/c/a+sewI9KltamgKwu6g8Mj7Hwh3RuIWtv
	 CowZ4nAlxF13LHXNYlJQ12JIU9SdfOIxyV3hOMFz2Y8Vz7aORpsrjY7p6EOrhtRADIuuY
	 XmPQID8SO30V2OrZOI+SoGoQ/w8laX1GBqtT8ySo54Grs/tLgl6+85Rz+oi755EapNQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793768321;
	bh=nyNYsRczEtcdgz6ETxfhyrdOx6Wt4e+yxZE9Nro/CBg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RE/LgMNnPxxMKbSp/huaHrOTyx6fkryqhn4SMN7KhVS07cVbf1qEbWvscOOYsdN0w
	 zu5Rpr2uALcoAR8xI2YMXXwmfKkVNmE8wT6CxOh7QF6j1P5XClubp9gXGKXxsO4b+4
	 b8hrql3RDjo1lc99cMvYBmQXd/u8nWZ7IVNTp/4HzMPKS5v8sgjP/LVYn5wX5GqqCq
	 R/UutkwgFVff2iXnDTJYLhMLcIOj5Y0+u/yK5oA3xwyOESGUc0dYLVoOU9e81CH7s2
	 y4rIR4WESV5SagY1tCR2XiipA4/ZnHrGHzWMkUmE+h3/gaj1Kc4B1W3YnkNs+xCcIF
	 FGIqHXnUu9K1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E2AC80821;
	Wed,  4 Nov 2026 04:58:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A1B32A14
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 04:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94B70405D6
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 04:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uSrpust4655O for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 04:58:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6CD97405C6
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::635"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793768318;
 b=JDMZ34vh3Fj43T1XeLwiZdo23Ff+k/dKZ7oqEfyomgFTO8ApTBh2Ac2q0eccKO6i6vhG
 bMf+zr0xHE6DHuQZNodKfdZieVjPu3ugDgprPGb3TLRTxopOKEzsREBx5gZDzooOjnPp2
 RoBw16dTKVesJMQ1Plcx/uej1luQB+5Y3GsPdaVxIOGHWWE4rEb2CPOfHXTIpG1Zd7b0K
 R6D5tHwgFZER4loUeMWfDCHV5w6GqBwEGalSx4PXMmHyT0EajSqKmi9C4zQIxt3jR8OqW
 RcAU26IOKaG7SzAwfzsT2PcxJ/S2gKQGnEeaCAjOSPV4j8CnrRMCM/v6t1uTsx38QKQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793768318;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=U3IRtvATEMlEQS5/GIMYZYtAo+Jb5Om+lAkjG+uIPqU=;
 b=JkhWgXsmWpwX6K2ZjcRMksWAhdOek2jtyTn81/JxgK0LpVN0DTJFtml6PtIRN22JJUZS
 6fLYGOKN51UC2zmnKlYOZ+MWLZqxgk6hsMFdfQruOWX6G0hKlHtmcyx5PjoyIy80pxPqA
 h9y6QnaMVPsAIxRrrDnm3lMPKNvjsxms2yumRXCx/T5nXPseSSC9+fJbLk2HQmAhAczHM
 rTm24CKVGKPNHz3nV0LdjDqlrtpKbZ7WlrOFPJJgse0E5Hn8wgDYIbTX+hzF4DH/wPVz8
 0yxAbu1qveuJrYujzz9aEtHZ5i/RKDtUOhbUPZP+s832FtBicAKjWJEfy4x1i5LRlKg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=ThAqjaox; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::635"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=ThAqjaox
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CD97405C6
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 04:58:37 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-c49b431f022so41998066b.1
 for <buildroot@buildroot.org>; Tue, 03 Nov 2026 20:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1793768316; x=1794373116; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=U3IRtvATEMlEQS5/GIMYZYtAo+Jb5Om+lAkjG+uIPqU=;
 b=ThAqjaox178c9ZvIzxxu1smdNawPO6x0QbDYB+IX9AeyVRLk7zukK1YwPNtXBwGFRE
 HUfbgnEcGGacHbjIP9f4qj3pzZykya862WxvtimHRcZ50IEcmUpRTn8PmkfxyF9o05Vq
 HeIzFR6sLW5ixMgVC+wK9wQXVRrxzbGn+WXXnsin/870mei7fLQBhXD2oI8zBM4rPC8f
 JL4TkJGtESORAjPivab9pWxJbqsi031MRrQ+LEIdBfAbCxpOKHpBbVWZ012Yrt/CxF4e
 vvYAu+njWS8/j1CmY4VcEkIjYyHwa5zhwTGyLOPfi0OpXRCr6zXFj9RdEPCnSL6vT4eP
 kkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793768316; x=1794373116;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=U3IRtvATEMlEQS5/GIMYZYtAo+Jb5Om+lAkjG+uIPqU=;
 b=saNWCN22WaBDRaI5ww04KVYeopNcTRiF54KFpvZZnHtaecT/RPr5prW/Si2gEwabRP
 dcdORlULYvkrG3HQ+5A5o+4FqFoI7UAzR46FxgDOgTeV0G6b8TM8a2rG0Bbxrh2Csp0Z
 +NQYGfgPpZqnTPyfKArSHqJvBD2mIFu593HbfhEzij5/OKAoqTEitn0zi8gPbCbItLnS
 cxgLNKU6rRq+JVZ7czNPMCmR+Yal6sfVpeumUE59zpGNz+7DrjADfomiTVwaqFqAJtYO
 ixjsaTjHu9hKEHukEA1GNKXq+qmiQHc3uOHb69IZDoLm9MeFyT1d4Iegct6dlNepJKeq
 2uKA==
X-Gm-Message-State: APuU4Z9AlNsEwzIvRhWYCyU/8Vbe+G+E/dWDxT9QvtcNJ37mayuGxGR1
 /NjsQerEOevtnbcT6OnAOBxvbOlTkszyN2eiujWxLvd4ogkq7nQBYJLabsQORQ==
X-Gm-Gg: AYBFou041cs3rruvu0Okp4IjVU2+gUisuPh4DbeGl1k8TpncAMywxcVhpYqEgRz7g2z
 EPBxrzh9MS1/2t28BP1NgGFHKUGk9I5mopDFATEdKwgXdQTocuXLqWTV2iEYPtx8sbmLojbUC7U
 3twkoMK77YHKqQTh1NlFG+EZi/F3Zfl9d6MOTrzO+xOZSDkeon66Nn/s4SP3U3IfmCiG6zGJqHP
 2W7tDW7fZCL5yLk/fm5hpAFewEZ0K/+4KFJRgaWUPQy4G+US3EchO9TzdFg7URWB42xxXfox074
 DClSMzqbh+OBMrfT1snk1Aqh8BGrMCmsJ7m68ET0hM/a8qc2xOPH5OSAzu08smypUOCH+oTnCNz
 ieJpIGvfibSce03c2PKRq4oOEuKiOww2zGrfqsN+C0q3tlxcNdtDyed6LU83H/CEJYAaFr+6PTD
 6IFhXVxAMabqwSMGfK0vPsuU5htBhYYcDwHqa2MF2cPU9yMsDJVM5nNDI6dVW76buYTSBV/3rpr
 kTBepMSFd9DuhqcTlE0XG2rqzT6D+40IWt3b3kOyoVIc8tjfzF3d0NQWcqa2w7WwHnZ13kSa1UW
 lJ9rZ61hcdDCEWSKQ2a1cplhVrNRVw9RsBu9DBns1DplvOdn34y5DlDEX07RZQRXqT/JRz95RsN
 Yb0tWdmaP
X-Received: by 2002:a17:907:72cb:b0:c3e:e677:563a with SMTP id
 a640c23a62f3a-c4ca7aee0famr1273875066b.47.1793768315730; 
 Tue, 03 Nov 2026 20:58:35 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e140fa1sm32233166b.7.2026.11.03.20.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 20:58:35 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Nov 2026 05:58:34 +0100
Message-Id: <20261104045834.3308280-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/uclibc: fix copy_file_range()
 declaration without off_t
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

uClibc-ng 1.0.59 declares copy_file_range() in unistd.h under
"#ifdef _GNU_SOURCE", while off_t is only defined there for
__USE_XOPEN or __USE_XOPEN2K, which <features.h> sets when it is first
included. Sources that include a libc header before defining
_GNU_SOURCE, typically through an autoconf config.h, therefore hit an
undefined type. tpm2-tss does this in its FTDI SPI TCTI, which includes
<stdlib.h>, then config.h and, through ftdi.h and usb.h, unistd.h:

  .../sysroot/usr/include/unistd.h:1166:30: error: unknown type name 'off_t'
   1166 | ssize_t copy_file_range(int, off_t *, int, off_t *, size_t, unsigned);

Add a patch, submitted upstream, that declares copy_file_range() under
__USE_GNU instead, as glibc does.

This issue has been present since commit b94d3eb72854 ("package/uclibc:
bump to 1.0.59"), as copy_file_range() was added in uClibc-ng 1.0.59.
It therefore affects 2026.08 and later, 2026.05.x since 2026.05.2 and
2025.02.x since 2025.02.17, where the bump was backported.

Fixes:
https://autobuild.buildroot.org/results/1408ad5881aeff754b0493f1a0d0970d1afdaaf6

Fixes: b94d3eb728546aeb196941472b98922843e36279 ("package/uclibc: bump to 1.0.59")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...lare-copy_file_range-under-__USE_GNU.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/uclibc/0008-unistd.h-declare-copy_file_range-under-__USE_GNU.patch

diff --git a/package/uclibc/0008-unistd.h-declare-copy_file_range-under-__USE_GNU.patch b/package/uclibc/0008-unistd.h-declare-copy_file_range-under-__USE_GNU.patch
new file mode 100644
index 0000000000..6cf0a13eb6
--- /dev/null
+++ b/package/uclibc/0008-unistd.h-declare-copy_file_range-under-__USE_GNU.patch
@@ -0,0 +1,45 @@
+From 9cf18aedf41589b11ce5328a85726441d3b86282 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Tue, 3 Nov 2026 23:54:41 +0100
+Subject: [PATCH] unistd.h: declare copy_file_range() under __USE_GNU
+
+copy_file_range() is declared under "#ifdef _GNU_SOURCE", but off_t is
+only defined in unistd.h for __USE_XOPEN or __USE_XOPEN2K, which are
+set by <features.h> when it is first included.
+
+When a source file includes another libc header before defining
+_GNU_SOURCE, for example through an autoconf config.h, _GNU_SOURCE is
+defined by the time unistd.h is read, but __USE_XOPEN* are not, so the
+declaration uses an undefined type. This breaks tpm2-tss, which
+includes <stdlib.h>, then config.h and, through ftdi.h and usb.h,
+unistd.h:
+
+  unistd.h:1166:30: error: unknown type name 'off_t'
+   1166 | ssize_t copy_file_range(int, off_t *, int, off_t *, size_t, unsigned);
+
+Test __USE_GNU instead, as is done for the other GNU extensions and as
+glibc does.
+
+Assisted-by: Claude:claude-opus-5-5
+Upstream: sent to devel@uclibc-ng.org on 2026-11-04, Message-Id <20261103230715.3240121-1-yegorslists@googlemail.com>
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ include/unistd.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/unistd.h b/include/unistd.h
+index 1956eee18..fb0ea0ff7 100644
+--- a/include/unistd.h
++++ b/include/unistd.h
+@@ -1263,7 +1263,7 @@ extern int getentropy(void *__buf, size_t __len) __nonnull ((1)) __wur;
+ extern __pid_t gettid(void);
+ #endif
+ 
+-#ifdef _GNU_SOURCE
++#ifdef __USE_GNU
+ ssize_t copy_file_range(int, off_t *, int, off_t *, size_t, unsigned);
+ #endif
+ 
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
