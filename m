Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F53F606A331
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 11:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=tGB7hKGj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tj25zSNA
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54633606F2;
	Wed,  4 Nov 2026 11:35:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EiaUrJNK220v; Wed,  4 Nov 2026 11:35:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3A6D06070E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793792142;
	b=gCrZUliidVxYpd5gIiyxFb30piLNUeZC7Z2a7vcQ0fTZjPgGDdxdDhYtuYUW5FbRSBqt
	 WO2URljOrjao9BC3ZkKgdBWj/MOosrRp/WqoyaroTWCwUtpoPvVbQ6ishdQXPRhjs+a6m
	 7EAeIxoa96Ig/vLG9nunZ50raqpRAR09yWNjDEEJ417EbgZ0jKMMPcWFYpT28EEnKdZgG
	 p30k4D/zvj8xRVqD1/NdzM5Aq7yE7liEs5EcoRbBm0QU1n9c3I5fsjd7ctDfgLtXQKzii
	 HZVPBsyCsC663kqMKQcd7zVjN/0WJYks9AbTVlYA8KGLu1xQ6OsB0WnoV45e1J7wfwQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793792142;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Cc:Message-ID:MIME-Version:
	 Content-Disposition:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=4UAG83ousBGN5GOil9/53DjAWlCJ6fAqDirKLgPuwbw=;
	b=iwbCVEFrPjzN35QXmwH543E+a+HPy0lCnSJn/j4ilLQK+6393xP5Vs+SOASLyUjfPAnW
	 /1MwdNxzIv5CZ8mqgofFsIIiLgkZQju0gKwzXtI32RRzFkwKx6uLXTUbSvWrlTYf5AJ4k
	 X/sxwjCqALlXq89bjKs04r9bZda33bXWGig7F0cgFk6emiV1w1/t/ZZGHrjeEKy8LCTiF
	 v4N5rfFuutgfb/tcnI+V0g4WWk/53cZXI37IKFEyTf1k9HJ9iEkrn/d+7KwD5Ku7fn3Gn
	 qq6btF9hjqvongkdG4QSgdtLBkoxaN/1XqdsPIi/q0IPndjcJPofqYGqmbGeIehyThw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793792142;
	bh=4UAG83ousBGN5GOil9/53DjAWlCJ6fAqDirKLgPuwbw=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tGB7hKGjHvXTEBBmfUSuAzKOZnsOYJJg/7XNVj5lbLfdMEJP5nL3ajVgcD5BYAXxi
	 8Wg78m1cBQ5It3yA7qK7PwsJxz0hdMmncECyFjsUXXEx/OmK9z5QnLC1ozcYOLGa+t
	 ci3GWqg/SsjD1zEe5lLKlaxLeijzpJqvHgmxSY7xA6TzRCyKH+qj1Dfz4JkGmv+ryk
	 4dSPxpGXVkHhn1epYOOsM5QG0ICMJpIx0BjkbQYj02cZbnQuJR1T1t1EZs8g/hLUsK
	 b06bYb6sknfY6jU3dVXFcDYTkbY8rQvCtd42Ts9URD+HvvFhJUrEqxoDOh3TlYfERg
	 6p1GmHkbH8M7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A6D06070E;
	Wed,  4 Nov 2026 11:35:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F0296A10
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 11:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4DC780FFE
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 11:35:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rzS98FDen9jm for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 11:35:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 86C2A80F46
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793792140;
 b=MhJuT0gGPK8ch91cXcHgFjtk42O4gGfMUYyWoxUHcC2kRkOnNPrHzGud4a+u1HFItmCV
 VerFytFZ0byY34wbQlA7g3K5RL9Bes2qWN7OLilMbRwFo9+k6CYjIt2ipFw44qZkgOasP
 T6ILvbsRgvLpiDbtojPbEgjKm7wT34hsQxRgNMC/m+FpTUehMFDU637PhbB6kGcnmr8+k
 13STwcjJFcgI9ctvSxKAEON5hETCvo1PzBoBjtAZ8ctsFbKQer0vwLYhE1pVHYLoItOvP
 CUAg7UeV3vNgTONT1aVLTzSs3isvFRnUwpuumVmQSMMf9O77DjLd6UB2Kbb/0+jYFcg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793792140;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
 Content-Transfer-Encoding;
 bh=bHenRU9GiDW9FgFBr8Kr7n7gv9E1NYLRhW38CEzp+nk=;
 b=fRSCfyjIZ3l78nl5hzb4t8uFUr85AXHtfhxOy+B3v1ImhlMcgBly+53Gw4Yea1u5qDKX
 0O8nQEHtkMbni38g4q4AyZe1bJjuxuNDi56SIRPXVyBhq0UuOhrGnnAShfPNQlNNkrrWZ
 5+UYyhpefeap/IJUM83FuwJGY2L2TGch6A4bftEdlaJt21aIE4PYSVDZTDHlIm2n+6aCW
 Yvp8xAK2dwcquwM4rCeFgmxOcnXcjaG5k3jalVk0Z85gq4DAWUkKVIdOLy+dEtNjoxlU+
 XjZqQ/tasjfs32z5VHg7Hq1pwkeColoYJwxPd9aiSsHkqmygka17QbGxqMSuz2KlzWQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=tj25zSNA; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=tj25zSNA
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86C2A80F46
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 11:35:39 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a2000d5fb1so3330905e9.1
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 03:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793792137; x=1794396937; darn=buildroot.org;
 h=content-transfer-encoding:content-disposition:content-type
 :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=bHenRU9GiDW9FgFBr8Kr7n7gv9E1NYLRhW38CEzp+nk=;
 b=tj25zSNAfqIOebyli1Tutlxc+hMLqzn6Vm9GOtmmtECB26Ca+Vy8DddRNKu7f8SQiP
 c/Og6vGhqRe5bhCtqO5hEBG/1vYkO5rT0Xg3OSk9kJvwfQ8sbPjJYdosXI2/ufcVtQHr
 KnmYgPW+jUeUi953MpSTaeS+Css0SWzTiYEfecWuAuG0Ci5VpNkO1Dc99ADAl8XWalSP
 F4IKqDsizJ1aK37253iUzcB3T+J4B3KZaRqr9AhHISrKstNhexPmFWjVL/lRJUjMDSlB
 hj3c4q43TfQWRa7ZgJNn1bkQxqD9gKnWUzLAeUXulJuQDeTHn0y4ylgigOQaoFX+dfW7
 dOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793792137; x=1794396937;
 h=content-transfer-encoding:content-disposition:content-type
 :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=bHenRU9GiDW9FgFBr8Kr7n7gv9E1NYLRhW38CEzp+nk=;
 b=UR4QAEoc3cw3vbImQcDrsrtpWvgqSXXA9NmdeR++lxVzqouyj40ikOsTgOKwGbTFHG
 nokNY6iJAkrQcB3leMwU7UDO077Ns3/bDGxImBi3L48jeq3LK++1lF7MJh5PCMFl3Cx2
 0ds7cHqhgquMd6/8TfXDll4mmunV3FPiKBPWLPOefaWj0SVrvxxS//FvFu6yL7MCHrAS
 0OVvsk7Urk+HUMVUGQ94wbnl6WIuT2RldgTpItaNmrN/RzH4xHMjfJPuoMcgsc5V6Fzb
 7u/0Y5QrXnUT7WB9GleehjFv3gI5fUoWOoiXJB5u5RQJUcagrsl9qD8ytiQicynvs4zN
 XbQQ==
X-Gm-Message-State: APuU4Z/b/5R1L1buH3dpVgHiJlhkNcL8AsiCtgh0q2hX0SoCYLlHK0AD
 t8ykLt5dere4GY7LLXP0DVNj8V3NibBT1FrGzKfJImW0nl0yr94TwuzYwUo27g==
X-Gm-Gg: AYBFou0zsfhUec7DtEa04bLjVlI50TKXecbFLwXqW8Dx7ssva5x6xZ9sDeyV/9qDOSg
 QE2pe+TvfMCVSZre53Cmzmj1y/FDuF/Zx65vpFFp3V0cEPdoWavifzoSSdOxDVSyCWEVAmUg461
 glG4X9PL3C3Fdf7weKIeLLnndjZwSB234Ykf6JopGiGjFQxYb+H6Y2h/YqObttHZN0rjnsxf5m4
 Io+aswHy3Mzq94e+HCkeQDkGp8UgWxkFIeA//M+gCEqUIUkzY34nH9x60KTOJnp5B90JIZtGeRa
 QkYn83Ta/OKUMxQjeJzcNw02ONquL/7LF83qGrS1Pgzi2RaNUr1DXwruZfhfb1n0ZS5xND1P52M
 Sg7dVXjeN5sNUupiblW8uH390/GxtxJcbhNE8yi9/KfMx38KXpt0W6CnAmPPDga9Be7tyhRbj+Q
 A9SeVzAv7Vsuq4/ggCFTuFT+b623DxBW5SBbKYtswUW73F2I+gTf+yImkNazmnl+G+xdPyK37i6
 mR3MFDK49HhXR5FSpv9OB7vyhgQ46DccpTLCGVAkQPmbEZt9PvvQrce4ta3ucjTZKB3Bzn6iWI4
 qYxgvqf6WDZy8IN6YOoAPkxCwZfrdHzJHf5dBoJb4EzgHAjr/Od2qYKeFauxDoRRCahfW9NMbCQ
 JFqnPPa4kjIMvHzz2lu6T7KxUZiQRB1fLlyomvcWr1g==
X-Received: by 2002:a05:600c:4708:b0:4a2:167a:c93b with SMTP id
 5b1f17b1804b1-4ac19234ad8mr360147485e9.30.1793792136864; 
 Wed, 04 Nov 2026 03:35:36 -0800 (PST)
Received: from leo-ThinkPad-P16s-Gen-4-AMD (free-mobile.vlq16.iliad.fr.
 [213.36.7.11]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b2a80e0fe6sm149070595e9.1.2026.11.04.03.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 03:35:36 -0800 (PST)
Date: Wed, 4 Nov 2026 12:35:35 +0100
From: =?iso-8859-1?B?TOlv?= DENIEUL <leo.denieul.yoshino@gmail.com>
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>
Message-ID: <ausYh9iXygm_IJ5A@leo-ThinkPad-P16s-Gen-4-AMD>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH v5 1/1] package/qoriq-cst: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

NXP Code Signing Tool (CST) for QorIQ and Layerscape secure boot.

Signed-off-by: L=E9o Denieul <leo.denieul.yoshino@gmail.com>
---
Changes v4 -> v5:
 - reducing the number of patches

Changes v3 -> v4:
 - rebase on current master
 - regenerate the OpenSSL 3 patch from the upstream commit
 - add create_hdr --hash without the private keys (merged upstream)
 - add create_hdr --srkh-file (upstream PR #10)
 - add cst_verify (upstream PR #11)

Changes v2 -> v3:
 - rename to qoriq-cst, to avoid confusion with the unrelated i.MX
   CST

Changes v1 -> v2:
 - bump to lf-6.18.37-2.1.0
 - replace the OpenSSL 3 patch by the commit merged upstream, as no
   release tag includes it yet

Signed-off-by: L=E9o DENIEUL <leo.denieul.yoshino@gmail.com>
---
 DEVELOPERS                       |  3 +++
 package/Config.in                |  1 +
 package/Config.in.host           |  1 +
 package/qoriq-cst/Config.in      | 12 +++++++++
 package/qoriq-cst/Config.in.host |  8 ++++++
 package/qoriq-cst/qoriq-cst.hash |  2 ++
 package/qoriq-cst/qoriq-cst.mk   | 45 ++++++++++++++++++++++++++++++++
 7 files changed, 72 insertions(+)
 create mode 100644 package/qoriq-cst/Config.in
 create mode 100644 package/qoriq-cst/Config.in.host
 create mode 100644 package/qoriq-cst/qoriq-cst.hash
 create mode 100644 package/qoriq-cst/qoriq-cst.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b4ada4e1f9..fe458c9d9f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2174,6 +2174,9 @@ F:	package/petitboot/
 N:	Lee Jones <lee.jones@linaro.org>
 F:	boot/afboot-stm32/
 =

+N:	Leo DENIEUL <leo.denieul.yoshino@gmail.com>
+F:	package/qoriq-cst
+
 N:	Leon Anavi <leon.anavi@konsulko.com>
 F:	board/olimex/a10_olinuxino
 F:	configs/olimex_a10_olinuxino_lime_defconfig
diff --git a/package/Config.in b/package/Config.in
index 796c4f1ad6..6ec28fd6d3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2748,6 +2748,7 @@ menu "Security"
 	source "package/optee-test/Config.in"
 	source "package/paxtest/Config.in"
 	source "package/policycoreutils/Config.in"
+	source "package/qoriq-cst/Config.in"
 	source "package/refpolicy/Config.in"
 	source "package/restorecond/Config.in"
 	source "package/selinux-python/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 595caf9e7f..6a27a6cd4d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -100,6 +100,7 @@ menu "Host utilities"
 	source "package/python-xlrd/Config.in.host"
 	source "package/python3/Config.in.host"
 	source "package/qemu/Config.in.host"
+	source "package/qoriq-cst/Config.in.host"
 	source "package/qoriq-rcw/Config.in.host"
 	source "package/qt6/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
diff --git a/package/qoriq-cst/Config.in b/package/qoriq-cst/Config.in
new file mode 100644
index 0000000000..9a12564d07
--- /dev/null
+++ b/package/qoriq-cst/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_QORIQ_CST
+	bool "qoriq-cst"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  NXP Code Signing Tool for QorIQ and Layerscape secure boot.
+
+	  The purpose of this variant is to verify the signatures of
+	  the bootloader directly on the target before an update and
+	  not to generate keys. It prevents the target from bricking
+	  the board by verifying the signatures.
+
+	  https://github.com/nxp-qoriq/cst
diff --git a/package/qoriq-cst/Config.in.host b/package/qoriq-cst/Config.in=
.host
new file mode 100644
index 0000000000..c1e5d36e1f
--- /dev/null
+++ b/package/qoriq-cst/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_QORIQ_CST
+	bool "host qoriq-cst"
+	help
+	  NXP Code Signing Tool for QorIQ and Layerscape secure boot.
+	  Provides tools to generate keys, create security headers and
+	  sign firmware images, especially the bootloader.
+
+	  https://github.com/nxp-qoriq/cst
diff --git a/package/qoriq-cst/qoriq-cst.hash b/package/qoriq-cst/qoriq-cst=
.hash
new file mode 100644
index 0000000000..70da431658
--- /dev/null
+++ b/package/qoriq-cst/qoriq-cst.hash
@@ -0,0 +1,2 @@
+sha256  6a4febf221c894cd0566d4c35722b8df753b386b8871deedfed5b5f4d52e09c3  =
qoriq-cst-lf-6.18.37-2.1.0.tar.gz
+sha256  7c8437ed27fc42fb35a90e3be5f1dfbe1b877058df1784eeb59057ceb5acc8cc  =
LICENSE
diff --git a/package/qoriq-cst/qoriq-cst.mk b/package/qoriq-cst/qoriq-cst.mk
new file mode 100644
index 0000000000..0ce3a68fde
--- /dev/null
+++ b/package/qoriq-cst/qoriq-cst.mk
@@ -0,0 +1,45 @@
+##########################################################################=
######
+#
+# qoriq-cst
+#
+##########################################################################=
######
+
+QORIQ_CST_VERSION =3D lf-6.18.37-2.1.0
+QORIQ_CST_SITE =3D $(call github,nxp-qoriq,cst,$(QORIQ_CST_VERSION))
+QORIQ_CST_LICENSE =3D BSD-3-Clause
+QORIQ_CST_LICENSE_FILES =3D LICENSE
+
+QORIQ_CST_DEPENDENCIES =3D openssl
+HOST_QORIQ_CST_DEPENDENCIES =3D host-openssl
+
+define QORIQ_CST_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		CC=3D"$(TARGET_CC)" \
+		LD=3D"$(TARGET_CC)" \
+		CROSS_COMPILE=3D"$(TARGET_CROSS)"
+endef
+
+define QORIQ_CST_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		MANPAGE=3D"" DESTDIR=3D$(TARGET_DIR) \
+		prefix=3D/usr install
+endef
+
+define HOST_QORIQ_CST_BUILD_CMDS
+	$(HOST_MAKE_ENV) \
+	CFLAGS=3D"$(HOST_CFLAGS)" \
+	LDFLAGS=3D"$(HOST_LDFLAGS)" \
+	$(MAKE) -C $(@D) \
+		CC=3D"$(HOSTCC)" \
+		LD=3D"$(HOSTCC)" \
+		CROSS_COMPILE=3D""
+endef
+
+define HOST_QORIQ_CST_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		MANPAGE=3D"" DESTDIR=3D$(HOST_DIR) \
+		prefix=3D/usr install
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- =

2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
