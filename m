Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB1D606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 19:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kzSIgdZz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aoXAx6nX
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 933B840769;
	Sat, 24 Oct 2026 19:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QbsjFn4Dxhc4; Sat, 24 Oct 2026 19:19:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F314F4072E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792869576;
	b=Om09cVHSlnEedJzidfd/tFL5aM+HHmKRBBHen/XTOd92MXA2MpFKBsxvjtua2Zj6BYhn
	 h5AmsMMNJsvLcAIQp2hGoW3MKA84+wpTEAhYEHhQDJm/IMsbz2IGUaBLubDN8oGFoWsE5
	 +NHeg/E39Zj9dGsT0Q74PWHQGMYWsGJfCT4yVwSOH2YTp98nwL0xwjZyAEgnrW/ZLJESh
	 gc8KeTowlx0jjJdaOib+v1/EChx8V0rLtDm8v2K1VNruVe2+2ggnMp+ccBJmbfqgPoCQQ
	 RDzIJ40kIQEdqUZuojQfwUi2iGrWxoh+GNktU3D+XSN+bk0U6daXcor7grYxLiKx3Bg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792869576;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ajgUS0i1qatTwWU5hvzsBrcEgX/FrCpO4gHEVaSkSLg=;
	b=Dr9SKVgcf5C/4oBssRpYzjllSJ12EwZgWfK3YS3fkL1WHLGR1PVTGhqnJn8ZpzUHkG0N
	 hUpZpuI9R7zi0rXoThpnv1GpwKrkBdNWeOx364CylEBKlBeQQa6OryCaMAgPc2tHEaOOK
	 Sc+TRSb/hus+UrNuVwVEb8AvMRDQ+uFS+okfSKzz0E8yUT5XdBRifq3fH81sIvy4awV8n
	 y5WgWC1G9ZaiDS1zI/rJ9SdrShs0ispM6QIk2iOdDwfibZC/VTjYxhDORzbVdlP0mBZ+u
	 8oPUt3OrVP1hEn4jh1Ex6AmYsAlqQw4gWMykuOyVWBTPAvS1H+2SFO4R7pTNcBRijfA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792869576;
	bh=ajgUS0i1qatTwWU5hvzsBrcEgX/FrCpO4gHEVaSkSLg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kzSIgdZzxOcxkGOUo1q283RSNo8kNDhijV73tdHId5ef4G+KKwJk79KvphEQyYV52
	 Rz9Quc0DAlLtsSU8U22DpVE2JiC/tDQj5j0FDZYVqHCZVLGC3gW1Ul4Yio32BdYLN8
	 WMVTCzKH69soNLIQH465FXGbANYLggKjIEtaMej93dw4Hhuq4vjwGuzbKrBhOodNxc
	 YTIS59ryKlKt5MfOoRLfHj7moh00JTeI8yPIP3nnyImoOyOiEAs4mFDbvbKvKHRsKO
	 qmn8a1YcqieSQB2UfnuNtgvv/fM3W5xF0o2ZW0uCQvTxERMhaQiljlgROxL5aunVxL
	 wgoYpTQoXZULA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F314F4072E;
	Sat, 24 Oct 2026 19:19:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14B4F3D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF0D980E9C
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNK-xdmttj2R for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 19:19:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E2E2380E8D
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792869572;
 b=StkrtHAKTdwZbVfwOwHXfk9iIocSbBJ3qtlbR2Oh0EqPay01JWp0yg12iTP8mrvyNB4g
 NHQ8A6SgPAuxt75S33IubwOfB1shjKvdp0/q4yF5TZc81ODzZihD2cUVwxRX161TVRFa9
 n+sxaIl988XnV9B3rqf03g0VcXRvmGAnjN16vjaFNR3j9cLi+n8RfdxHXKtwrsDxfS8DH
 31DMqUZbPm7QErZ1B0QwIMrTarJxUktdrnA0k/vVQXTRMCqiw8XAnMad2Tr+ZnbIC7yXU
 2yz98R3tHTD4Ujm6ZJgN0Cf1y5Kc1ByI2/DXB+F4FB/65KPjjHf8ukZgoHtKUeezz7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792869572;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=D3MYwLiaB2EXLAkSxQzHvEKcdHI5dQ7lWyBvOWiEUBs=;
 b=m9d2kDGL/hijgNkmbg2tY/0CBgIGom+jwdLXfCUsjWV1+rGuwIYLqcalCCRciMnPT12t
 qVlID+sSzhkFNwil9zkPadE00C9BjMxUqwySh2JMA1IH2N3dSuTmn+ekhbY68mmvnf8Vs
 x24E+8k13Jh1rl7IV8HO7BiIzn2fXr7FK+mn6MD5HqP0KRIp5rYqCVjcoShmeQZqT/aMo
 yvAL1ZQsX91EhKj8rv5pohGbBcOW2RmofIrY7+DDCXIQiBix9PRl+QLJQkzdYXboiQOxp
 QF8I1sr9PvH4H8TBi71dYDvydhZILebDzJ+KaSWqFYHuzJmpYpMZ404v0UG+YQm5AOA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=aoXAx6nX; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=aoXAx6nX
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2E2380E8D
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:19:31 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-84a248254f4so1244536a34.0
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 12:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792869571; x=1793474371; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=D3MYwLiaB2EXLAkSxQzHvEKcdHI5dQ7lWyBvOWiEUBs=;
 b=aoXAx6nXta9oxyGmmIRVekOeFP8jyNw3MVqEAw9StnDFvbZfHJuZjPgMTs3fFwLCrS
 FRBZNA/poa1oDKlTh3zMGpIvdmICCtKt4/zoVpKAvljqOaEC7f2CE1WtbMMxhuHVFMsp
 WG2sxk+YRDAoN4s9H3llpl8tpnJNLk2746cOn9YHh2uanGZA4FvXJnwVLrzRn0EazBLb
 C5geCWMN7+C4XRw+FNCmQmg7DF3ZCp344wgi4Su6NNBhCCdH5+i1CRmE4X4M/CaXShCs
 gG0TxQb/+xA2xqsXLfNIPiDZKKFtjKIujn/V8YTqMSw4VAKXqQpTG4e/38jwmX0LUA9C
 JXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792869571; x=1793474371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=D3MYwLiaB2EXLAkSxQzHvEKcdHI5dQ7lWyBvOWiEUBs=;
 b=LcJVutHo9GLb8H8X6AxgfG75cazn0b2n9ukacs6COFtcvFkXOq8d4s+lUmXhW8Yexn
 0mCJlkNpqEZDPTWRH4NlqEUeYVtao7t6gtZmcGPq6QlGrMlh6imUdmLfMS3bYidXAz4R
 ZUd2i/nSz3Np/gwUH0vt6DrSeXN6DZNrDCVOMLvepmaByW+QXzMkRO+renW2DEX2e2wz
 tWpKCd0H6dioN5IO+dMpZef03L0rdcA80XCWxJRQpN4IGR8aRqRJ70pYfJzVDeDwaBop
 JJ1Y+YqRcr9gmmesqCQOut8QMM2Ya4snJWM/Lmv9jjz7llNA88VqLk3AYPCJY0ffs61p
 reMQ==
X-Gm-Message-State: AFq9FYIzfZbya8AIkCKs00XELAKRqBMpKxMbaxBQZMbsFhXlowtvJAQW
 reNbGem88NDiW5YIw33lfEy+Y3apnkL4hYDRLP64Wg3hfRZNKMYuE4fO7YtYkMix
X-Gm-Gg: AYBFou1JNORpxtDWbOp8py4HU5FOVXx5krNok98WrV/gLe2eZIPQ4Oh7qZcXn9FhYIS
 BHyXr6u27ONwZbThHlBUOVTC3YxIukVr6ucvBk/W2D8zw2ggHdrZAwR+Ttjy2n937C0XA2Dp+CT
 PXIyWA4uxOqUhEWCdIGtXExNrelMWBSXOKSMFVOwaZIInyfl82RjYDf3/XKy1KgdNtFha1e8d29
 7tTN+E3cXnO/eCWQdNBc70n13HDtnvxhZVwVcG6vHunZYcE8Xb3vQoquv2j9S67gGYQgp9einWl
 QwU2riDTNq9UcGx+hjbf/wWyiNkgd0+YqB/InjX0f1SLjF2cgkkpPbwRWihhk5hLW9S10u1n9S9
 TMO2JScNuYwkQsmMpbzxMR++dX0Y8YNnJXEStmlmnst1f0JyfR28lHSkzviTT65HeiOgEhIVdBs
 a1urns3C+JKaiQtepNF+aX1Nn0SdwoM7q0tFkg1/uHdAzvB3kSKzRfiDyigxQpo5BKM1z6Lu24t
 RDZlsrVQJIF/VETArxKopE6aJ4kwAJtXxVKAxwGzvtCcaldcyiYrO/tu9Wce3bLURS2t/0k8uRb
 iTUVCHYwZkcxXzveNyvmXFr3uVWNT+QIMGOLZeUUIAmC0u/t0TI+ZgblMQPYHHxjeEXQflMAEP0
 dIBYoaocWKluoi2PFbBx25gY3G3/Hw6sdVl5WdA7ZwGxBA4wN5ZPKvca9gb5o8FzCCHiv111z9s
 x06waxsUBtIlSMK9mXeHVFw7NH
X-Received: by 2002:a05:6830:2b22:b0:81b:ac9a:5681 with SMTP id
 46e09a7af769-850ff682860mr2362259a34.29.1792869570762; 
 Sat, 24 Oct 2026 12:19:30 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-850fc005bd7sm3018896a34.24.2026.10.24.12.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 12:19:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 13:19:20 -0600
Message-ID: <20261024191920.2149450-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261024191920.2149450-1-james.hilliard1@gmail.com>
References: <20261024191920.2149450-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/python-mypy: bump to version 2.4.0
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

Add ast-serialize for the native parser, both at build time and at
runtime, and propagate its Rust architecture constraint.

Enable sqlite3 for the default cache backend. Add a host option that
selects the host Python sqlite3 module as well.

Record the MIT license and collect the bundled typeshed license notices.
The existing LICENSE hash is unchanged.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in.host               |  1 +
 package/python-mypy/Config.in        |  3 +++
 package/python-mypy/Config.in.host   |  9 +++++++++
 package/python-mypy/python-mypy.hash |  5 +++--
 package/python-mypy/python-mypy.mk   | 10 ++++++----
 5 files changed, 22 insertions(+), 6 deletions(-)
 create mode 100644 package/python-mypy/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 595caf9e7f..33f3691309 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -94,6 +94,7 @@ menu "Host utilities"
 	source "package/python-iniparse/Config.in.host"
 	source "package/python-kflash/Config.in.host"
 	source "package/python-lxml/Config.in.host"
+	source "package/python-mypy/Config.in.host"
 	source "package/python-pyyaml/Config.in.host"
 	source "package/python-six/Config.in.host"
 	source "package/python-uswid/Config.in.host"
diff --git a/package/python-mypy/Config.in b/package/python-mypy/Config.in
index 2ac5bd7c76..3237bb17f7 100644
--- a/package/python-mypy/Config.in
+++ b/package/python-mypy/Config.in
@@ -1,9 +1,12 @@
 config BR2_PACKAGE_PYTHON_MYPY
 	bool "python-mypy"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-ast-serialize
+	select BR2_PACKAGE_PYTHON_AST_SERIALIZE # runtime
 	select BR2_PACKAGE_PYTHON_LIBRT # runtime
 	select BR2_PACKAGE_PYTHON_MYPY_EXTENSIONS # runtime
 	select BR2_PACKAGE_PYTHON_PATHSPEC # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	help
 	  Optional static typing for Python.
 
diff --git a/package/python-mypy/Config.in.host b/package/python-mypy/Config.in.host
new file mode 100644
index 0000000000..b43221e001
--- /dev/null
+++ b/package/python-mypy/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_PYTHON_MYPY
+	bool "host python-mypy"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-python-ast-serialize
+	select BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON3_SQLITE
+	help
+	  Optional static typing for Python.
+
+	  https://www.mypy-lang.org/
diff --git a/package/python-mypy/python-mypy.hash b/package/python-mypy/python-mypy.hash
index a31cb5dba6..6b52f15231 100644
--- a/package/python-mypy/python-mypy.hash
+++ b/package/python-mypy/python-mypy.hash
@@ -1,5 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/mypy/json
-md5  a23b930a86aa298a97b72da06ee84084  mypy-1.19.1.tar.gz
-sha256  19d88bb05303fe63f71dd2c6270daca27cb9401c4ca8255fe50d1d920e0eb9ba  mypy-1.19.1.tar.gz
+md5  ec1d664d1e3304484e63381a64136227  mypy-2.4.0.tar.gz
+sha256  77bdaebd452f43fcfc4cc3ba94352a3ea537cd01e3f2d0879f48673d2ec00d6e  mypy-2.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  fdf1cd17f50e1305ed8cfd37467312d27a984648dba622cef70573b5512e4e1b  LICENSE
+sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  mypy/typeshed/LICENSE
diff --git a/package/python-mypy/python-mypy.mk b/package/python-mypy/python-mypy.mk
index 4b02753978..7e4b69d936 100644
--- a/package/python-mypy/python-mypy.mk
+++ b/package/python-mypy/python-mypy.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-PYTHON_MYPY_VERSION = 1.19.1
+PYTHON_MYPY_VERSION = 2.4.0
 PYTHON_MYPY_SOURCE = mypy-$(PYTHON_MYPY_VERSION).tar.gz
-PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/f5/db/4efed9504bc01309ab9c2da7e352cc223569f05478012b5d9ece38fd44d2
+PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/34/4e/64300736cf0a0373a27b94a91b664ee7382e36f77b0621bae6381da3e180
 PYTHON_MYPY_SETUP_TYPE = setuptools
-PYTHON_MYPY_LICENSE = Apache-2.0, BSD-2-Clause, Python-2.0.1
-PYTHON_MYPY_LICENSE_FILES = LICENSE
+PYTHON_MYPY_LICENSE = Apache-2.0, BSD-2-Clause, MIT, Python-2.0.1
+PYTHON_MYPY_LICENSE_FILES = LICENSE mypy/typeshed/LICENSE
 PYTHON_MYPY_DEPENDENCIES = \
+	host-python-ast-serialize \
 	host-python-librt \
 	host-python-mypy-extensions \
 	host-python-pathspec \
@@ -18,6 +19,7 @@ PYTHON_MYPY_DEPENDENCIES = \
 	host-python-types-setuptools \
 	host-python-typing-extensions
 HOST_PYTHON_MYPY_DEPENDENCIES = \
+	host-python-ast-serialize \
 	host-python-librt \
 	host-python-mypy-extensions \
 	host-python-pathspec \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
