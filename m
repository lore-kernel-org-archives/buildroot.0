Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E3C606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PN6T9CX1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TrAuAaFK
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F73360677;
	Sat, 31 Oct 2026 17:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3NuzeJTQU6t; Sat, 31 Oct 2026 17:20:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 81672606BB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467245;
	b=J2NP7LQ27kwvH9jJslr3IplmoYWu7zz54Gzqig5vH9JFmdJJRT0cORHNZ2L8DapbPInI
	 HaG1v9IXtX+8gMxBigTKQXn4Ozwdl/rTUeOOt0EqoPAa3h3JZ4u0Ui+YteezxXBeq+WjW
	 ZfzJiXmNki5b3xVT8SLaif/OsPMOugW6XOxoqvRNjewQal4k8AdY57eMwXqg/2ONQK8sH
	 U+k1K6BywZXDKn1dYi9xbgFlZfWK12e5dBwB7w3s2v+VDbKjAnHkuF2kQ01fnMO8eth+9
	 qM34XMxYQBrBbX8/nWCuy9kJeE0gio7HE8AGeBntY8V+f/uGZDnwt34ITsbjYbhCeVQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467245;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nG4B5iStESrQMW/riMhn79ombZILk1g1pwL7s/YtEC4=;
	b=Fjtciad0GnJCZuCUgNvjLS5Zu7geEK5zXSy/fkPfI9U/mbN9HtGRKFamPzIfm1Uv6GLx
	 mWwE9jkgO9eGzSxSkuzMHbTagxLhMmWkc1ZqxS6GQVQuo7qaq6eRzoQ0Ilzk5xTdL7BxP
	 xbrHMidk3EYVI3EsMMAhHEvXzkCG4K+72Cyz46iYOdTGcEYeLYm3rolVwybGcmxPhCg/x
	 bPs+O7plHUJNFfrYDtHHcWzQbrZ75MsrSkWX1ZSAjwjwyMd6y+TjQ/C9rxZF/WlJR++Cl
	 uxj5/qvvk6j7nqPb8PAxiYra3G8OMW3ke1Q1vNkLfU6Upon9jihs9CLFR+u5c/a46zg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467245;
	bh=nG4B5iStESrQMW/riMhn79ombZILk1g1pwL7s/YtEC4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=PN6T9CX1HYh6uCTOHR/Scno2LNYTyPna0QbYL19/rg9jUD6suPVRuGStN0OT9F5oQ
	 PcNMGn1dmH5jvElnk0IQt1Qa/n+Drbr8ZjDdH8Y75LiwdTcqu/GvMk63XYMg5jP/Hj
	 QPwuAY6m5c5/9QSqGRc+jmf35CAPvmuYHSrcIp3E2PPUoQ+/jo1zeYlxSPecmjdygX
	 TqDAkyB6Z4/BjXeAvnwIW39y5gj2pvjHQZpWcXbx1ZpkfjJwX5zRyRNyJlnmMb49bn
	 QDBk5T4XgNm6azbcmiBDLvppfdUbawFAFy6DF3dk64rO6QWxz5v34QYQwQ++zgO03B
	 UMJOPniOvqwew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81672606BB;
	Sat, 31 Oct 2026 17:20:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CBB74E0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3242140360
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndy77OoPVJcE for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:20:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 40C6440355
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467235;
 b=dG+6ThkAxT9UawnAlFmixmxQ5KYmzEyJEjFdNBGZB0dMuiS7WkCz0POBA/9dTjbyMp43
 W2eg15WjzMLUrj4UkfpE27n9wLf0ri7MniJQOqwZ7noLTaynExsK/XkO+G0H7EnT270i9
 uuTGyrYvdLj1+QlnrY/Q2FMRHHFJ+OGXp3GaG01/fkRqHJim9Ec4kYdEvv7Gygsw0juCY
 ltL9MFV6K3BiISjw+I8DojtuoGEKjMQ1fZJ+vIdIU+TWfIG/GQTC6LDjJhKNKacN6Ojfl
 tceInnj9jluuhISFNLcaIIS6MCKleVQQ1roliK1X/xRhz8BFHN2fR15q47qYtneTVCw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467235;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=K5sDWPyRVGQMvSnZuWwRUp8x1vfxPO1/WMzn+wwgP/o=;
 b=q9WfH0yOEsVFp5LRIyXDBYq6OeKVJ7eEO+aVsDKPbYofVjZsG6rUjzqXl20gd3Mxqvqu
 wesyteFSeaepP66zFFZNGsNOaumB+2j+tu6HhpQPvctU+9Vx39PY6dySlANvMAXFSD/4R
 R8TTrQqiPOSjyYAA2uyPCG+l1eQfhLZ/OzhvDyZPDnECloL4g9VcpSP5yR7Y3bFY2PIvU
 J+sW3WmDTWnd+Mp5EBH3N16z1aWm/8qqg7EsfK7r02he77dJs5k2z+i7xNSreeS99ucV4
 KVG48WDNbYw8H7WMjmdyw6ahrmAvq1AiFp9lhzjflAs1fp+Bjgk2dPMeAKmH7sWIvZA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=TrAuAaFK; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=TrAuAaFK
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40C6440355
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:34 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-85c1135c286so1070978a34.1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467234; x=1794072034; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=K5sDWPyRVGQMvSnZuWwRUp8x1vfxPO1/WMzn+wwgP/o=;
 b=TrAuAaFKbCZt21QZUJDYP7C12R316lhA5Pralmn27ZEQ6BtfhQSxKRIDzIvxcBM2yI
 2KqAVgl4w8EygkW7JFqS/QWVgOtqASnXCKhFMeEnejjJGs5v+MUSLmXCpv4jQu6zA9iC
 7hdKWkXbvRloXgxpst0dJdhpbKp/fX46eWJDP0ymk/UjZ4+4HJDUTKRF0Rc0aO4qnXBw
 9y1TX8nyzUlJ7fd1ClZXD6PrbzE0ahpv2i93vLztsP0WnUeTNBYdWcnC2aFes21/+SsV
 qmuNFrITVm1MNRX/PQtv9wvVX9QDj3cyEieCzduhMXFUQA7FLHKlwaUgE4UQnQP4+E8H
 +dww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467234; x=1794072034;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=K5sDWPyRVGQMvSnZuWwRUp8x1vfxPO1/WMzn+wwgP/o=;
 b=xUvJ6m+GwXyhJHOrB3NKoHwz2lSjg1OPonA7GgfNORI41M2istCnMvt4t6dKG/y8Yh
 +lP531KAtt9EE9hzLGcoBWa5KF/F4WA4iaNbmvuN9oMIsWoE5fIryEU9mZ6lVQ/sHW9p
 p23neuIxwuMANd59/xjJVU8cMTKzG51e42+4PK723eo3FHjmUmh6SC2CbtJhsLaIMErr
 K3GYXQitcmz491I7fuw1Hgm6kUajTa2ra63ztXEKELd16K34qVNx0EJ+K+sbKDb+BsFB
 wLzGTDOfSRMA4abBkpgm4Lz05pEEyakDQuegevXzTmAQ1zs+CWH4GJlcUIfrnUY6q2gA
 wsdA==
X-Gm-Message-State: AFq9FYKO5KHmt25YMyG2PejTNeJuSq/r874Jxzjiagr52lPziRYQwiuW
 GQR5I2Gr9a4Z5KPHi0MDyberuZENuW/GpQ1+r07UCrVK381VutvCuLJuG2IO2g==
X-Gm-Gg: AYBFou0YFxebzxnTNln910m/0zIunauXMXt4qL9Cj9dWS/QtVtcrM9RAfYdj+qW+3ZY
 B+iFmWjJE04dNMhWwA9QMyxH9G3wFDWztZOnuyqozYh1KQfLZBsSiIbkUtD7M/VHqpCTFn+UCwy
 Cdc4n8HQ8TVB2+z0xCfY2lv3e71jbInSXQLNBzWfq5YJiY5QbtwVpU3zRBtE1T35tNZtFUWX0j1
 sHR8U8wHAw9g57obegn7TQXf/9iLyyBjoKe6CBPQbSRJVxZaZFJuNYHvimRb+yxIuwWYdvIaRmv
 0y8VwDlZG64xDI5p6IWgnrOZQdXKWE3edJYvDXd/aAbLA7QV4hbwdCcR04qBfWozIMVVqn9zGZB
 X1qylVgtZrDwwjWeZ84ooH65L5zga6eTJ2a+Fmun3VtTgARbGIDez0vhTPokWmhBXRsOFeIIHgn
 iDL5R+hHkHOHjvz+4/4m+V3T3+hlefxQkQSsBf3HcgnDteF5kc28PHOZaWF5X7xxSxEXNnU9SFO
 gEi2cUb7oZ46CMknCzMXw9p1QvZ4DDm83jubhFrqYsWaOKzGd80f20b48Kpa81Hk8NdfwgjnR9A
 TOm/IGpg9HfGqByaTMX3kHFP8ut/0k+jAKzqbfw0hO12d1zBwDPIHtDKXNm0ZFldL4yOXn1P0wM
 m8RfXhBmWyyVMiaZ/8+WUj8ApMy2SkekJQvatgTij+Irnu/sK5sW96hnkbJAdgoanG7BJRece61
 HJqIkMrOSSy8K9ErEyu1tDMszM0IwPDsC8NcWlA0ZR7/L6R4Ke8KLfymi+rfhDcVZ/LqmGDjCJ3
 lc=
X-Received: by 2002:a05:6830:4409:b0:80a:b8da:2792 with SMTP id
 46e09a7af769-85d364ba53emr4467475a34.6.1793467233868; 
 Sat, 31 Oct 2026 10:20:33 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:20:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:37 -0600
Message-ID: <20261031172019.2683287-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-iniparse: bump to version 0.5.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-iniparse/python-iniparse.hash | 4 ++--
 package/python-iniparse/python-iniparse.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-iniparse/python-iniparse.hash b/package/python-iniparse/python-iniparse.hash
index 747d403965..a64cc17495 100644
--- a/package/python-iniparse/python-iniparse.hash
+++ b/package/python-iniparse/python-iniparse.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/iniparse/json
-md5  2054bab923df21107652d009f2373789  iniparse-0.5.tar.gz
-sha256  932e5239d526e7acb504017bb707be67019ac428a6932368e6851691093aa842  iniparse-0.5.tar.gz
+md5  229454c1e6c5a36a3e8f1c9330f97a4e  iniparse-0.5.2.tar.gz
+sha256  4f4fd009d49e4290a721e9bc5716719e9a767c9c7fdc3d7ebc403ef3379d6129  iniparse-0.5.2.tar.gz
 # Locally computed sha256 checksums
 sha256  ff45637d8a96adc414179e502fbed40160e57205bf2e302140e79a0c71eceaa7  LICENSE
 sha256  9b02e3dfe433ccd2bd94636ef6eb08638b5a54deafe5f87a3d9d9104356c48e0  LICENSE-PSF
diff --git a/package/python-iniparse/python-iniparse.mk b/package/python-iniparse/python-iniparse.mk
index 05c9b3930f..4b62405bd2 100644
--- a/package/python-iniparse/python-iniparse.mk
+++ b/package/python-iniparse/python-iniparse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INIPARSE_VERSION = 0.5
+PYTHON_INIPARSE_VERSION = 0.5.2
 PYTHON_INIPARSE_SOURCE = iniparse-$(PYTHON_INIPARSE_VERSION).tar.gz
-PYTHON_INIPARSE_SITE = https://files.pythonhosted.org/packages/4c/9a/02beaf11fc9ea7829d3a9041536934cd03990e09c359724f99ee6bd2b41b
+PYTHON_INIPARSE_SITE = https://files.pythonhosted.org/packages/9a/5b/f8b3a923142f9e4cfeafce9b8f7343ead2feb71929365486ce96b5372335
 PYTHON_INIPARSE_LICENSE = Python-2.0, MIT
 PYTHON_INIPARSE_LICENSE_FILES = LICENSE-PSF LICENSE
 PYTHON_INIPARSE_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
