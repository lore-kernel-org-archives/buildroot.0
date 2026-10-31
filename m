Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C81606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=L58IA8bo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J5bYUYSJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47B3960756;
	Sat, 31 Oct 2026 17:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNrfgoE3RKGQ; Sat, 31 Oct 2026 17:21:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4BBBA60782
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467286;
	b=fiEyCgXxfhnDYTAm8LFdtRYCz+lqfrc+t4IveYrGF6DQJ3tgwzlT3i3ZtfaO5yDIJo59
	 86Mkv+43skOHkn6DAIbrLwpfYJShGiAUDQpcR48UO89iYUBnKNpJJCNI+bD43xNY2rfNj
	 OrCtETt2VXvuJk7Ig5YsW/26XlhKv33E+SkUnVFsBaC3ro4+FmHVE6+gV/cRnNPp7SZQH
	 dBzu/2eUPy+nrcLUj4UDnaRfEDscJhGW/4g65t6EWCbnr5jPqSeaW9t6REXAtoVjsFDXs
	 s/v6nqPNJNBynYtberuXunhOTjUk+q7zrGgrmrjeGJ6kIgUxQOpd0PxnPQ0cmqvx6pQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467286;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=twq/EiqsFXVcrBD3RwA/atDi85YdmWkLxgCaFA5cCd0=;
	b=qgcZ+cc3Zdfnw8aULFTqEuezaPTuCuHYbsFR2hJo4PqDj606NL6TYgXdsw0zXnxSJH0w
	 dvXU0664oElABclBBL0IBrxQHoUiFJ5gIDQkwrWPX6Uy7tRAMqzA0fVHuN3BCxDcIk5se
	 i2xv8+KvC0pak2eLxWrIs4VaIX4fxIJ97tyw+faC+2pGGVog24qnoADMIPDcbCCWZz4yw
	 sGxOA3O6Nizcdnrju15+lMPmuotkpnhtBj7df+0fnXQGg44I2/Zw/0/t0rvwiVJxWgMaS
	 cFdZMvkiUJBTLey/gagBVrKSce0KzOqNXHWWR6bAfWPpCL9dspxNMVrBwt8633XE5qA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467286;
	bh=twq/EiqsFXVcrBD3RwA/atDi85YdmWkLxgCaFA5cCd0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=L58IA8boZVGAGeNboTn9vVNKWysfFBVILyBkgRBIML54m3ElJi046klSteSbQM3Oe
	 M1Qy/7XDKF/Q+sqW90t79iN/xg5NfVcDuQTKVvKLexPLArR1fmOueJflfFHKAqHIbW
	 oFiw3ck7gRFk5GKKCrJA78vjR6pl9y+n5eKdcp34YLZhdPjR9DD+QdRN3e8OymLsHj
	 R6dbZPUm2QGdHsCoI5VeZsW5vc5pK1nfWoGAEdUnAYfRrEuNaAA54VHBPogQvJNvqa
	 7nyiA0TwLz5KjdfBIxXxG9wY4cqmxeoPvP2oHH2Io+49bKuISbzJ0AjeEK5+Qn6bSU
	 KHx9yzITxjKiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BBBA60782;
	Sat, 31 Oct 2026 17:21:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 46F744E0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4446540269
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aJNtJqJs63RW for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:21:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6CAD5401EC
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467265;
 b=lrvIRKgXf06stzXEhO4JjvnJfgr+vbq9IRGQaoq3yHxyd4YJe4BRdADjrFvwZKshYhOx
 QsbKz1g4ICph+1eqZ8/snXYhXYh0JtmcU0uDD0LhQgbC5fhrXUpEFiHnEqXBnXE6FR/5+
 lymw4nkReUBjAj0qIJg21zBA+lOXWGnP752dJOlwg5aCQx9KWDBTcnmj8BsyiDUNjR2Ry
 XGmiVUGkgNpIgNZITBG+MBVAFrrMz+NTdeqK95iVydeZ+YHgj7sPO10N/jPYOgd3pHhiB
 jGP8YLmKddwNqlTkyi930V5EXF6aCVmOpVU+tHstCK5DCf/nvhc272+UUPOkdcmfYqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467265;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=8TWq2NPFSYqrry8TzW/k7rWB5GC7yf+ZrwEBGCp8n+c=;
 b=H4/vdJ2sbIMkA25Ub+xJm8MoO01cYdI4OKNaBhkCXk2nJEbYkFYMP14kFGfkLFdz9VQp
 TOCJOjW8zEDKddLQXYDC91r5JuKLRIL0pRdRIPx/oBtsUJQnVBW+oI+vc8N9lGjJ8YAAw
 Yqea0j+SoTezEHABmiK/cizT9HdDzogatx42nw4+YT97idojQWR1S0wz6uYGCGhmyJx25
 GHJIcetV1AxAZY5gJ6KXMILG8dukJ/BmdA5qQP+UuUcEXDQGXSFu7o8yZ7hgHV7dgv89S
 M16+BkS03tVPTJe6vhq1+gejhDTpWyDaycYgGjiNttfuLFDb5q7SIuAvGh5HaI2DGmQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=J5bYUYSJ; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=J5bYUYSJ
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CAD5401EC
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:21:05 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-846566246e8so1756814a34.1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467264; x=1794072064; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8TWq2NPFSYqrry8TzW/k7rWB5GC7yf+ZrwEBGCp8n+c=;
 b=J5bYUYSJS0MHt1oqjhGIh70A/UaWOYI0ss8HPUgLcbUdD0PArRJg1bitJqQhYisoTh
 I3zglTQiStKXzo7+TLwC8Sq3RtnlOe6bHWWkT0vk71WmmvkapDtY6D+87Yovdnwwh86e
 2s4a5epVGNyL6DT+upUxXI/jqKic+FJ4a/0YoSvTTkkdSGyQcdnG6T2pt5LFhh+7oZ65
 8DmUrwmHQqP2eq2xNafvzoVFjE3Nq1dSoh80ClajKXDdgz6U1VD5PXIGUbjscY5JAZbe
 ei9KL2bsrdiyYU+N+W+TXpPAnkclu/uTOVsmVyGkHNtq1mMbuaF7AwQ9xAx1c6UDPSAb
 30kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467264; x=1794072064;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8TWq2NPFSYqrry8TzW/k7rWB5GC7yf+ZrwEBGCp8n+c=;
 b=VJ3jSyN1tXx1pktre2qSqBgLySF1u7Oq+oQiFOU5AqzEsfN2xTUKiSZiZfLkujJTfC
 XkDiRESya3zg7xRD8es7vddoQuKBv2EYTu0NfQ2CrDll7FET/BfpQVXKcoB9QOWz/Q0R
 nPctk46xJijtuEBKhq2vzh2uJFaSJ4M1rPViCYf+KlS41aKZrj507yTb34myg6A+h52e
 CN/bg/Q7XGE/kuxEqPeAHFTUoraymRMADAtSATgKil7jmxFrxgI4/OcfyoAr6z9i+fus
 Lsxbi9Vv/KfcYg+7hIS04mqAdyI6mrLZP9G1TZT3PFTuiemyCveTzGfJ3nrAftVzVDQK
 u8tg==
X-Gm-Message-State: AFq9FYKg87hZMcURRNUrX8tkHS5k5+RwrmZiCicctQT/lBlXu65/kO8q
 sl5ZBPWcpx2mTUYwgff4gqzDcCLHU3uZVfk1l5b/GYacCZKcSriAfgSpggVZxg==
X-Gm-Gg: AYBFou2+RsnIwGyB9gAAaKXs6N+ZwFj3dD+L9mJysE0kkNrAqJ/oCsTDhRZOvLrQ4VV
 wM4zQUrrK1NS+tHoNTxJAOfQDcQZ4m+MExm0gvYQLj5qr1y8bao6+rdxqZubg8sz1rwrHMz531F
 Aq1sb7bm4lbbNYMW9dXGD6PSznW4qnBYGhET0TfkV46dLSHC14/9dNkmuB0yYvblVXUdKp0tiPx
 KQ1zQLqbLbconjQnNlKmghnKVOe4nmbP9jv/EN5fQhUtiaE26JMor3HzuG35y9PaROXPA0Nep5/
 k94yvt0S/6QB1D+Nyy10pSHM6LZ5ylkD5EAmJ0TEBF7zUNphKTEmnvBEkxvBJM+WL8dZ76w3HVQ
 um8Gj3CIRK/aZwDBPHxHbxS+LZZIBiBJUuzBF/9XUyqhqRHKimruDlk8Pipv2m2o7E7XJhXBWTf
 d3LLrMoqoo5xxtvPlseTS/+Trghu7EGhuHKwL7svpHqWgX+n1Z9XOtx0jjlB9grXPSWybdxi7Gt
 dmsZX2jOWXpAGurQj3Z57OMWpstpgrQTEPTRwi2lpY+C1H87BDOeX5ExbFg3YNekVjswblerknU
 /A60VlQTwQtS+zwCK+ap07OO7c9bJExEG71c/RUh4CwM0g7xf+2GjONUW10OJo27FafMj3KneFS
 YieWosNskhewLZFT7IiLiQ1+x6v1vv63WNHniXvrYS5mux2+uqwGf8dEyWzZ76MSQb2PthNcOjC
 iPciNdiE0LP0UxFqC0zcBJUZ6VdULMbgfrAcSSIPaUAAh9/9sOVNFhDckh7gnkavqG8+CtqH2qL
 A==
X-Received: by 2002:a05:6830:3497:b0:84c:58b:417f with SMTP id
 46e09a7af769-85d3641ec8emr2860120a34.5.1793467264165; 
 Sat, 31 Oct 2026 10:21:04 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:21:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:54 -0600
Message-ID: <20261031172019.2683287-25-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-wrapt: bump to version 2.5.2
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-wrapt/python-wrapt.hash | 4 ++--
 package/python-wrapt/python-wrapt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wrapt/python-wrapt.hash b/package/python-wrapt/python-wrapt.hash
index 3092a879b2..13296f6425 100644
--- a/package/python-wrapt/python-wrapt.hash
+++ b/package/python-wrapt/python-wrapt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wrapt/json
-md5  44850a284b765d6e8aa1fe09ce5fdbd9  wrapt-2.5.1.tar.gz
-sha256  f595bb0185aab3e9dc31950c95d914f56ea8278810c3b928f3426e12ed6d27bc  wrapt-2.5.1.tar.gz
+md5  e235838e46cbca0c9ac504555ebcba70  wrapt-2.5.2.tar.gz
+sha256  551cb49e88b3722faad780303833bc4fa70685fb1773270fb98b40d39d9fddbf  wrapt-2.5.2.tar.gz
 # Locally computed sha256 checksums
 sha256  d4f66854a24dda2f2a5282912aedebe6b18186b86284510a433d78fadcd88e5d  LICENSE
diff --git a/package/python-wrapt/python-wrapt.mk b/package/python-wrapt/python-wrapt.mk
index 29f8dc12a0..d10a9cb0c2 100644
--- a/package/python-wrapt/python-wrapt.mk
+++ b/package/python-wrapt/python-wrapt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WRAPT_VERSION = 2.5.1
+PYTHON_WRAPT_VERSION = 2.5.2
 PYTHON_WRAPT_SOURCE = wrapt-$(PYTHON_WRAPT_VERSION).tar.gz
-PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/04/22/89e2f3bdae5cb34e0cab0cd86d7172dbf418de4b46c9b17b9c7a560dfa44
+PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/9c/b0/f752d19e1e83ab8bd64aeccfde32ff086aee3ef08520f7340b69a8d0a4d2
 PYTHON_WRAPT_SETUP_TYPE = setuptools
 PYTHON_WRAPT_LICENSE = BSD-2-Clause
 PYTHON_WRAPT_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
