Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C84A606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 16:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kHIt5X5R;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bOSQz5bk
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 686B84072B;
	Sat,  7 Nov 2026 16:34:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2hgXxf0V4JJL; Sat,  7 Nov 2026 16:34:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6FB4A4070F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794069266;
	b=jyW0+cnHgaRsHD8fEZCMTLFaZAxZPuZ/qaarO0S+suvLk72BXXC6FqOcUplo7QIuTK1D
	 XdXJgQDFwYKVni3kra3r8NPOCQ4OG5OyvUQ6agI7MIxlJpo3odC8p8ZJbP2A5RGmWTZoT
	 5xYJGZBbnN+c3VZVc1MgHWMMofvNMcwcFBlUQb269mWfYQyIUcKXI0ksEcwXeijHRVXpL
	 lEhY0pAmjY071ot0dpUgcqzDvQEjmKcJNoBcRtp+S/lUMaD89Ob6dxLIU05BpE3+lFayu
	 e+Sx3/allpNfOa7Kh/UJpiLyTD8X0d9RLg857wF3fmwOXLo6dqBT7VBYOKuu7e7MJvQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794069266;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=MYa6G8epPONrBC5rn8q//nUcnN8EBz2Hh0MInrzRqjM=;
	b=JYVzJujGRzLrYSAGQvHMDkZXnUHxrhpqv0aDvRcAxdQqjVyHiPTHV8SoTwnqi/Uo6vxp
	 yzRrp+2eAWpH9nQgOxRvItxIZktYzvDUz8p8a6NPBEs1yOcTJ9H5DzQJsjA4DoocI66z2
	 8AqlGoypc4ss2egBauR91woA7Q3yZBNzmMTzTIbXK9ohmaTKjwkrSKuHNltUXSObq35yB
	 8/QV70sBuxZYuhGbiJY5LDGuU1s1UmLip4vTW15OEAUrxBPTQNrS18sJUnaX/VtQdrlzM
	 qTSdzaqIOSPaDIk88LQWDB+uhEmiOx/zFH2wn/UPftgvjydj05mWNAUJbOwqxEl77kg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bOSQz5bk;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794069266;
	bh=MYa6G8epPONrBC5rn8q//nUcnN8EBz2Hh0MInrzRqjM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kHIt5X5Rpg3Dx3bUEhAhvOf9bJAXBQ0ZZCIqUeaFkadqLQEsNigSJh1k6xrCvcbud
	 NqJlyuFuBcbUAjUA54ncIUHP7d0xpoLuSPCrKbQqmDxc4ov2dotYYwC/csUSRMCFum
	 l4EgwupNglwvMy1qFbbPV2JXblCeg+B8tIv5uXJuAO+rLHK1aI/yVfTJewD4fjnH7l
	 wqql8AqSMSyhMWOLk/3iXGJob9IiTOzo90Qi3tRMVdv/00ZO1Pad6bJRJCPd9M6/fk
	 S/XY8nUCdoDNlAr3RTmRRi/aebEv8UOisdnjNm0JUtAjPIXMBEtqhseqK1hNsQZQKE
	 R45OQbfnyRBLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FB4A4070F;
	Sat,  7 Nov 2026 16:34:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C62634D
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49D2D4070F
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id so-nOMHXMXcY for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 16:34:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3105B4069A
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=bOSQz5bk
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3105B4069A
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:22 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a2153c8525so12013095e9.3
 for <buildroot@buildroot.org>; Sat, 07 Nov 2026 08:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794069261; x=1794674061; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BeK5WKzPCRvc+bOq9Sdhu9nQx4X0G+VIMtdyEvWJPes=;
 b=bOSQz5bkZbwIlQ+4xzYG0I6ccFIJ+iXOFWCYXhaCBfmHCR3q0g3DXZ0lqI6iDel+HB
 kz/QOaXVyXPttfjTB/HrZIejIhINNPYcrbsP7BKeRbEwf7j+g60DO25u4++hy+ysvcHI
 DWZLN9MikzjWwMbnAWYhWvXE7mv8ObBTs4SjVvmkTyAq37h3cjbmcl1Amdl/fuEJ4IrW
 BHCqD4mpkz8HLWiE+Zs8A9bKSZOPOhTDAn9+1um56jRFYkKLEZU1ql81JjgPcVymWZ83
 LgH0rDI4xbtBuWDJta0Qi+cQ0ZTaV+en5x6ZAerbUAd6lHGgLQ5c70gFYZQ8AVdwPlRG
 K9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794069261; x=1794674061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BeK5WKzPCRvc+bOq9Sdhu9nQx4X0G+VIMtdyEvWJPes=;
 b=kvMc0Xqkj7X8JhIoYUvNzH1m9RHzc/GUXyB3C7gpzMiJW7AzfXP3h0UYq24LU5BJ0M
 Bz0NSVpH/6ecPhlKvXMmv40Q+Vwgg7TNjOP8zYWehWWe+Gzc3B1uOkZitf+EiPTg2PT5
 B82JJ9Z3Ac6Kpk4a6k+62yxR7eYQhIVVWvwvTlDSW1qd9rM4OvQSCB2n3XUnNVTs2LTI
 srjU8wXEgKOogwti9mSoxhjy+ZuxVq2GeJDfe+yu0G6Jiuuyl5S7XIFGWTkxRsGHPh6l
 njqtoiimlIvuNuya9srJgYglld4nZJZqu2+jg3yxEktymknPXHzlCK6axF9h4CVWG5fy
 6Zlw==
X-Gm-Message-State: APuU4Z8ffkmSN98BchFgK0LM1Sr2zmcqBjKQJrpXDCS16r3NxWyk2kV5
 f8gIFUue8tctq+65JrA2jJuDto7G63n+rCG85TTdpJF01IbKXrSZ+k8K9fTSrEhh
X-Gm-Gg: AYBFou3om9c4HtvbCly+ocD3pqmdxWlTdJys1mCVT4qZXoeWO35DrPibTpiMUm0aR2R
 C8Zn+Ut4QX6u/995Fizur5dSA/GkjEqJfTC2IYV0WM71m7yTiD++HLy2JkwjafJq+UXJhVMOGn6
 IlF7Lyy7/VNvvMzrZUoklhJgWKLJRDGDM+uTcIi0GyvcZCTd9vt/AMVXUnMzNsqY4HMDge2XkDc
 K0RksDi257hqzQvo8+2ZmkFGawYtcQxHbjHsjv0xjHIeFfAw0hLMIbEgukALBAFm+eYpSqcFgnU
 Ae9Rg/U610KxixfbwVqatw+yMP9gIOIAIarKjtV5MHnWJTNK2ihd4glAFlmgwICoeQbzgXrg9sK
 RSvSF4hDmThrFABfc/8abF0u+uEZKk1myVN2ykygaSpV0WT/DGDfUiyJd4Yr5VDxSNWZUQ7odzH
 AhesY1sAy4gP6VD4/9BFf9fzTvIxzI/xbB8ba71veWltx2nd4l+ssf6WKewjzWSVin3V8vwxAhl
 pEKYl3KlIt5nRkT7oeDE8lz03IOYjp6CXDYQgJSv64fovKlaQnsAHQ9LJ/y9WC9YImcc8R2SZZ2
 9KsYFzYCz5uf07AOy/etXPCSHGnZx2EUpkFaKN1fVgjs72zdNWHr
X-Received: by 2002:a05:600c:8b84:b0:4a2:1a:a120 with SMTP id
 5b1f17b1804b1-4b6de7891a4mr95203615e9.6.1794069260890; 
 Sat, 07 Nov 2026 08:34:20 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7e6eca30asm82268255e9.7.2026.11.07.08.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 08:34:19 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Nov 2026 17:34:00 +0100
Message-ID: <20261107163414.560896-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107163414.560896-1-angelo.compagnucci@gmail.com>
References: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
 <20261107163414.560896-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 01/15] utils/check-package: factor-out
 check_disabled()
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Romain Naour <romain.naour@gmail.com>, Antoine Tenart <atenart@kernel.org>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Knight <james.d.knight@live.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Currently source files analysed by check-package can use a special
comment to hint the script to completely ignore a CheckFunction for the
next line of the source file:

    # check-package Indent

Currently the logic that implements this is at the main check-package
script. But the main package script is not covered by unit tests.

In preparation to support not only
'ignore this CheckFunction for the next source line'
but also
'use special rules for this CheckFunction when testing this file'
move the logic that parses such special comments into the base class
_CheckFunction.

At same time, create unit tests that exercise such code.

Cc: James Knight <james.d.knight@live.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Co-authored-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v3 -> v4:
  - rebase on current master: check_file_using_lib() now reads the file
    in a try/except and also skips the after() check of a disabled
    function; use check_disabled() there too;
  - send together with the package infra checks of the "warn about
    symbols not recognized by a package infra" series and the fixes
    they need.

 utils/check-package                |  4 +--
 utils/checkpackagelib/base.py      |  5 +++
 utils/checkpackagelib/test_base.py | 49 ++++++++++++++++++++++++++++++
 utils/checkpackagelib/test_util.py |  5 ++-
 4 files changed, 60 insertions(+), 3 deletions(-)
 create mode 100644 utils/checkpackagelib/test_base.py

diff --git a/utils/check-package b/utils/check-package
index aa10280f4d..f9978adef4 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -262,7 +262,7 @@ def check_file_using_lib(fname):
             for lineno, text in enumerate(f):
                 nlines += 1
                 for name, cf in objects:
-                    if cf.disable.search(lastline):
+                    if cf.check_disabled(lastline):
                         continue
                     line_sts = cf.check_line(lineno + 1, text)
                     warn, fail = print_warnings(line_sts, name in xfail)
@@ -276,7 +276,7 @@ def check_file_using_lib(fname):
         return nwarnings, nlines
 
     for name, cf in objects:
-        if cf.disable.search(lastline):
+        if cf.check_disabled(lastline):
             continue
         warn, fail = print_warnings(cf.after(), name in xfail)
         if fail > 0:
diff --git a/utils/checkpackagelib/base.py b/utils/checkpackagelib/base.py
index 0ab6eba9f6..4636eca3a6 100644
--- a/utils/checkpackagelib/base.py
+++ b/utils/checkpackagelib/base.py
@@ -9,6 +9,11 @@ class _CheckFunction(object):
         self.url_to_manual = url_to_manual
         self.disable = re.compile(r"^\s*# check-package .*\b{}\b".format(self.__class__.__name__))
 
+    def check_disabled(self, line_before):
+        if self.disable.search(line_before):
+            return True
+        return False
+
     def before(self):
         pass
 
diff --git a/utils/checkpackagelib/test_base.py b/utils/checkpackagelib/test_base.py
new file mode 100644
index 0000000000..ef266d542c
--- /dev/null
+++ b/utils/checkpackagelib/test_base.py
@@ -0,0 +1,49 @@
+import pytest
+import checkpackagelib.test_util as util
+import checkpackagelib.base as m
+
+
+IgnoreNextLine = [
+    ('without comment to ignore a given CheckFunction',
+     'any',
+     'content to test\n'
+     '# commented content to test\n'
+     'content to test\n'
+     'content to test\n'
+     'content to test\n',
+     [1, 2, 3, 4, 5]),  # set of line numbers for all lines not ignored while testing
+    ('ignore next line',
+     'any',
+     'content to test\n'
+     '# check-package CheckFunctionUnderTest\n'
+     'content to ignore\n'
+     'content to test\n'
+     'content to test\n',
+     [1, 2, 4, 5]),
+    ('comment to ignore one CheckFunction does not affect another one',
+     'any',
+     'content to test\n'
+     '# check-package AnotherCheckFunction\n'
+     'content to test\n'
+     'content to test\n'
+     'content to test\n',
+     [1, 2, 3, 4, 5]),
+    ('ignore 2 CheckFunctions for next line',
+     'any',
+     '# check-package CheckFunctionUnderTest, AnotherCheckFunction\n'
+     'content to ignore\n'
+     '# check-package AnotherCheckFunction, CheckFunctionUnderTest\n'
+     'content to ignore\n'
+     'content to test\n',
+     [1, 3, 5]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', IgnoreNextLine)
+def test_IgnoreNextLine(testname, filename, string, expected):
+    class CheckFunctionUnderTest(m._CheckFunction):
+        def check_line(self, lineno, text):
+            return lineno
+
+    warnings = util.check_file(CheckFunctionUnderTest, filename, string)
+    assert warnings == expected
diff --git a/utils/checkpackagelib/test_util.py b/utils/checkpackagelib/test_util.py
index 23f2995e27..b06e218498 100644
--- a/utils/checkpackagelib/test_util.py
+++ b/utils/checkpackagelib/test_util.py
@@ -2,7 +2,10 @@ def check_file(check_function, filename, string):
     obj = check_function(filename, 'url')
     result = []
     result.append(obj.before())
+    lastline = ""
     for i, line in enumerate(string.splitlines(True)):
-        result.append(obj.check_line(i + 1, line))
+        if not obj.check_disabled(lastline):
+            result.append(obj.check_line(i + 1, line))
+        lastline = line
     result.append(obj.after())
     return [r for r in result if r is not None]
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
