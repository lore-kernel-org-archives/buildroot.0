Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFAC606A31C
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 20:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Y3TJV34q;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eg6l4aM3
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA3B380E55;
	Sat, 31 Oct 2026 20:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gmv17IEsqRjZ; Sat, 31 Oct 2026 20:19:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BC49380E52
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793477981;
	b=ivKy7QuK+7Pm1PVxSF/od6SOXlpzze/7TylIgTxo4Vi/g6Jrj4D7tgVjDtY9bw07/39S
	 ghwUvDfXb9u9Do0Xqo7IN1F0hfo4I32MPcUoAmLWM7zjP/a01as2S5y+G8//F4njlv3oH
	 NL5piG1G7sGNPjs0nfniWjv8lQioZXkhcj0/uiyDDX1i9lX/T/s1hnpVn1L+5k1MU9Ibd
	 p0REcU40f6TD0pm7k55IXPnht/tq5Lj1i8Aes+F0R1gZVvJh1wTP9qTm5jvfE5zdJ3rrd
	 owJoRdXVoEUlg8PeqjEcY+d0nb/FhJvfNs0LScIv20J7x81X5x2gcnobayGbEM0yk5A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793477981;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7RLP/GF6K61gtCgKx/owdm0yqr1+aM7ZtT03v6BHakI=;
	b=JWesCR+A1574l7Tq8818WJ8x0adK+vYWQXiCrlliDSdPXrPraUsd3SKdSQReHx0D743L
	 WSqSRjQfamrlRAj6mnoYinP7pB1V6081IZ1A1HN+wmQvlplESspVjX40RZwLTwlVHSF5T
	 gzAprHSmlKok7o6ii3DqJXRzgGa/5xWISTT55QpzkMSCLpdy8JAeWQtDcX5dnFUrzVD65
	 gjpXqr3UcDBwLSwno8mBhzSNq5L83bMK6M0cdo6/n/+rDeu9Rl/oOQ7cr97FnVkho3XGL
	 YTpYaOrkyb+INg0teB0NnHBqtgKtjBD5pY6a4ROFiUAiFM68jq3co8rukpbIzBSFCVg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793477981;
	bh=7RLP/GF6K61gtCgKx/owdm0yqr1+aM7ZtT03v6BHakI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Y3TJV34qKCjszovItEfiwjOYO+e+NhqWdiEB9GJHy/I3PPeU9hdYt6UE0qcw/zwsQ
	 5MhciQllA1wBZLd3dg+GK0KAp75v+DfHpjPs2xCmje12jqpTN/pJJv1IZoZGERpg1I
	 LUIelDm9wU/LFx5+g4D3aot55oqrSlxJh3TYRLk4K2cyHAZIof+T7fW+LnGtl3jvjY
	 KeSyAbxFeHLiDp3UKmtLi+OInmXXz5myJAUSMIMIhrcbEie8v4mpBIfDxozygh0aQm
	 lL1aMWr7zLjp+bKaLSncxjtFDldwYlVi61K77/s35DW9Rcm6wKZaJlwis1z9hWrPmV
	 s+iMv4fsifrwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC49380E52;
	Sat, 31 Oct 2026 20:19:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CCD09380
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 20:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1DA1406AC
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 20:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_3wgTMcxag5 for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 20:19:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D046340676
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::36"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793477976;
 b=oECtUvHTLxet8DAn7mrbiXhlvjOJcODTzh8qN7ZVL2h9qB4afoh+GySrIFqqzqAZafUb
 y/Vrfh2J8a3sxhca+5khE05S8bHLpQcRYD85KEtal5SxNL9rk8VJR8P0+46TppJWptGV+
 bsywvZIqSvcE9gLb7Lf55ArGIolaORaa6K3xKqjU0ldlYRbJn/36IkP6xwutyRW9a/OA3
 ln5IXpnMLJgLS0KkOkvLHFEgOdBeZAqK/Ox7FFKEadKSG2Cq2RJgXJuisnSECDqMdtsfd
 0Bgp1G/OI1Se97xchZPHAAkQb6UTIjpNtFZaWtxDQ1/ihB5ik7kWb+jBurZ7D4HI8TQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793477976;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=G0E8EizNPRYEs5uYM5N+clLr2Y6baVH/Glaas+NscIY=;
 b=p2go86+ycMw2ddajphsqam6YHwAh5cEe/NLz4wt6bdPCxu+JD5gSYhh1/F0x5CS8ilF3
 wBZlCvecnDfdWCldBnkBXoGVgAxkaGCwvmt4A+ZLU0REzswws4sc5/8GVCC9oS3IaxP5F
 4hpGIeL+ZnE/5434JphKcF2enrRvR2sk3VjzxHLE/fq9pY2dxdvUg5e/5KjmTytQrOTE9
 rlBtxBmkz92uQ5q7pFoAoN7qFPH9RX5QjvND5oB31TubH3cLEHjTwEmdjD1lYaw1yvFdV
 VtkejyaOSR7QaXBTRelmw0JwLU9APLj3WZ+LFEPp6cmqwHVkVqCbc8Gi481CZSAXUQQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=eg6l4aM3; 
 arc=none smtp.remote-ip="2001:4860:4864:20::36"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::36; helo=mail-oa1-x36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=eg6l4aM3
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D046340676
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 20:19:35 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-43bf9548df4so1758406fac.0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 13:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793477974; x=1794082774; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=G0E8EizNPRYEs5uYM5N+clLr2Y6baVH/Glaas+NscIY=;
 b=eg6l4aM3Hj7M/ykLDAUeOKyYFRCpDdb3j7QUxwDaanFD2mCmd2ylHHdKhwiTuosg7e
 rIZL6KNwTi0B80G45CF6oHelcaMTlyu38/iAl+2vU+qi8zovyJOZUIWf2D9jtJ4ChQlc
 0hAdPvnMq+yu8iDnohgnsuBOX+jM6iHHnxLnGu/Fo/TvloQ5N4OLh7FTHXkv6tL2WVnI
 316aOZfoy3dHu1xZC3SCetcYTap0sUNOFMwLCSPoXTghsGBUIcaINZq9PyPvuYpndFmh
 bB0EIalSooHmNg9eN/t09rKyyv56HAfyOROR4lcUmGZdqC2KqnmgQSwleAYjjBfxBeE1
 p4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793477974; x=1794082774;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=G0E8EizNPRYEs5uYM5N+clLr2Y6baVH/Glaas+NscIY=;
 b=LKfmyMmlXXl8LreqUGLsAvFTbWSeaKaV5Z71EojIFyoIfTD++TQxJkWKpksNkTjQ1B
 94h3kx1h1Ahggh/07HFzrc/htHHvCK3SFB9gJi/IP81WH5akcHP0y26vtRL+8Lz96Kiw
 SvV9ok1YZqV05PE/jVtduyjxNVU4zTC5G1qkKh8+KrB4G64AE5K1qLNPtOcL6JAzN41n
 SJrtoE54VTjIzmgeuyRzg68/3rqCvefF3Va6WeZeCtSg6HDhnoq2hSwcoqItjS+wiIQ6
 iIvR6AnyinboykX65Z1YyvN6a25f6x05dWL6MWSQUPb4hhDMMkaw9w9b4a64WxEdLZil
 WoZA==
X-Gm-Message-State: AFq9FYJKyfK5W9JIEp5vULzH1Y2JSXAmPmEnh9bQY9dIvgfiB5PeYNwA
 BvTgtdHhnyO2dUcF4ysgFJscafl8OlIrLm3icjaKhVhokg1t2uLB7N5KTXjNsw==
X-Gm-Gg: AYBFou3Z1M8zT4a0qpEXk5by1VF5NU4Xckr3xB8y394W2anE/ML6ZCkqEPj/PhsD5F2
 c4N3Fa9Hv9XzR9z8aX5nKAZ2Nzx9xDL+kXBdXrnNA4tsN0gmH+cUiC187nTEyK9Q2V06WCEjGh4
 yjK4GniAAh4HvsENxOOLZKDBW2eIxmFf43OPgOlY+ZXEdBQmK2ZvhQDXz7gY6EiuBReWcYVJWm4
 u80eNKBtUt734PCz9cvM+qP1CaILnjnBMD2Pu7N8x9BvntvgtxdWNRUjLwAK++rVWyN2Z4JaBJR
 OohpJmd47VJV+H6018uBN5JmJ9WgNSI34V+vNQAQb3Ow060jgmYQiiMlhLffFevhkM2rk3vQrOh
 TDnYXchd7b4ROJxlqNdTtinKY40uLVIqkA7GM/k0ya7htJNbzlXFea1RJpyBF+xlB5FI4RRI8PJ
 coTU3ah0bNyqXRZscy1oA9/ghCK5VtdQ3c9fQpMaPffv+Pcl52DIqXF3EGqqA7kA4UbYb399DF2
 R67xBePKHt4htKiVY4yue0VfRYnkwj4W7g8r3Xgil6KLSSZUKmm9GpMrBxZeMC6BN/ClfLiWvqi
 PW1d/26PX0aYQ2HkXvE/5fLF7wyQ2eWcXQpb5cPagbXQhIyNzIPspGdUPrPLI3heZm2GsyB06oQ
 dtkBGcviDI4FbPF72NSBNxsGhfOkk4B7Dt5LnZGVag2Ml2Q2Mkko08KRFrwM6INhoT4iCtApsFZ
 EyGzUizbPR39GdXWJAw4k/J4epKuaeIA0yXOfKOu1yI5cOLEqxMdIFcDHi2qVKzRqM8QZDV1y2O
 Q==
X-Received: by 2002:a05:6870:dc4a:b0:475:a153:2dcb with SMTP id
 586e51a60fabf-4a907705990mr3530458fac.33.1793477973751; 
 Sat, 31 Oct 2026 13:19:33 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a9218e97b0sm2998133fac.4.2026.10.31.13.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 13:19:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 14:19:09 -0600
Message-ID: <20261031201918.2850153-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-socketio: bump to version 5.17.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-socketio/python-socketio.hash | 4 ++--
 package/python-socketio/python-socketio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-socketio/python-socketio.hash b/package/python-socketio/python-socketio.hash
index 4d08c01e50..d8360cbde8 100644
--- a/package/python-socketio/python-socketio.hash
+++ b/package/python-socketio/python-socketio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-socketio/json
-md5  dc6b5c68686cf88a4919e83fc0896719  python_socketio-5.17.0.tar.gz
-sha256  c3bbfc4937dcfea7c4d1b182afa94d4a30335d153987e8f2078b344beacf95a0  python_socketio-5.17.0.tar.gz
+md5  ed364a997052808b3d249630ca907817  python_socketio-5.17.1.tar.gz
+sha256  2a3183d7172e5ff772b9c24ef94f1fdf84a09b746925c997b7687ae8017f7247  python_socketio-5.17.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-socketio/python-socketio.mk b/package/python-socketio/python-socketio.mk
index a3a47e43d5..c1a2d6a249 100644
--- a/package/python-socketio/python-socketio.mk
+++ b/package/python-socketio/python-socketio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOCKETIO_VERSION = 5.17.0
+PYTHON_SOCKETIO_VERSION = 5.17.1
 PYTHON_SOCKETIO_SOURCE = python_socketio-$(PYTHON_SOCKETIO_VERSION).tar.gz
-PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/b9/04/8647675c93b5e74a3daa41a2a03930bac0cbdcfcf307900f0441ae6550ba
+PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/f6/a0/b3c6cfac960bec64ad52b83e7baed825ce256f8506b343aed10d2dc5f747
 PYTHON_SOCKETIO_SETUP_TYPE = setuptools
 PYTHON_SOCKETIO_LICENSE = MIT
 PYTHON_SOCKETIO_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
