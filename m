Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC36A606A32D
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 16:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sM6oln1L;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZdfMgvgb
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0B7540718;
	Sat,  7 Nov 2026 16:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5exMILalo6u; Sat,  7 Nov 2026 16:34:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D227840748
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794069269;
	b=Kgev073fthQh7dM6Tj4+eGs82h1nP8VftSTEevm+s032O3V254lV7h8mracWaDmaGusO
	 uARgDZGe6zIIaPuMMdGxRuhPjaMyTNUux9u13BMzDxW6Hmn2LSOKZb0ymDMP60OtporrP
	 ttGUhoB8GdOpYXAhAn2V5eY1z4sDOC1iw2ULDja2mw2DHQTyG2TEMCQaBkWwvoDbiksKW
	 g8oCtK16Bsz6VPQWSTK7WdL9DtAfgcp6vzKdkKg8PiPNKiTUScNMhhDmp5YjKy8U4YcFN
	 ONAGWJxOZuuiL1dS1CrY0TR8k/jRda3Qc/KFY/XU63qM72ic5jycb/X/B81GFyp2qGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794069269;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=H9wPzJUw4qiN4aRHN/Uoxe19RvK8+wqGSXYNFLZTOkQ=;
	b=GzjzEwOc5HOQ/5c/DTV88rO6+PsthzDHlVsVv+VFrKhBgR2WxKruH2twLp+3kXQQoO5q
	 dB33wzX2DckDZBYR8Idzu7bHJeGe0YiksK8RYtRA9AtaLnaN05FynKjmZXKexBdGNlc1W
	 MbWBk1BA5MLLEkQViINcI2LC9rJ60vJhwjHJRwygEKjcLPHF6Pa8OqcGVnoCa6T5u7rfq
	 yrxW1DNqr+FY4kaF/73JQyXShePwcat0qguMRTKKAP1RoMrPRS3wFO8xFuFa2Isohq95w
	 AjvLMxSjdB9TME5mISfZbq+JvVIUa52lHjkJxlBSR49EWlKHqbjBFmwqG9W5G9ffb8w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794069268;
	bh=H9wPzJUw4qiN4aRHN/Uoxe19RvK8+wqGSXYNFLZTOkQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sM6oln1L+j/Ib1F/aHD/y+uc7cOH9NP0iAi5ZH3UbwZN45HMGIVV7NtwU6oq4feIv
	 jn2HLf4I/Jb6EO6hfQIK2SXZ74JbM/MZgB1YnxHkV9WqF5/1ucuvPIUfwg6OkEI18Z
	 fFU6lvCXNaSblr1IIHOEkTFF+oJHbXTEhzUwJF4AH9zP4mZukEzynkI5nqTRpwgcKT
	 vO91MH1jRulmpBmx8veeS7Y+caa+9AI/5SmnNUcIfxqwH5JtDbnXCBlgyix8irySSz
	 OPuDbB+Py8d0qHy2mmoHXOftpLMmPD04ZI+Y+xvGKQ04tZPFUoJMTHVPytO8Kzs8jb
	 Ic9nwxY6Nbj7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D227840748;
	Sat,  7 Nov 2026 16:34:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 890CF317
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8658F400A9
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FToCmfaWmdkj for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 16:34:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3B1544009B
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=ZdfMgvgb
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B1544009B
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:24 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a35db1f202so12641685e9.3
 for <buildroot@buildroot.org>; Sat, 07 Nov 2026 08:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794069263; x=1794674063; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zsqWLYIaZARt7mjcnJHC9ovqq9B4rrGQAUziYx9l/Fo=;
 b=ZdfMgvgbt3zaUVNNUHW7i7mSDhrobd2vnZaQ0Zy4oNzha554fajZEaxJy8MpGk/LYk
 31uN1kpYFsljSnaWGlqNDFVRViItvB7+cCO1Ooodc+vltvh7uaigqXsdsmC/6AfPo929
 Rsf4UXjfx+aYY8gSi68IBpC3kggoEMchzmHCLmnU0qD3xHUg3//7xst2VHomJJ+DTmzf
 BK9PReXun+wbeKG3hYL2U3MT9I2GuHnHMK1I6h3Nbx03y+C7clFz3hL/1B7i0m9j1htz
 PJWBPTNEHQ3vQnsKXnojgYRFFSLIY6SDpK7RaWGs+7TpPuzZApxBC9g86Y+fB9nsfBro
 fGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794069263; x=1794674063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zsqWLYIaZARt7mjcnJHC9ovqq9B4rrGQAUziYx9l/Fo=;
 b=w3geU3DRHFYFsVEKu+9psvAlqYsfnxplxTEqeaJsWR80R4wKfcfFfIVkJPjG8Kk2Cu
 yX5/AkPkCov4rWdatwhjy1+kR+xlB7ojs+Wqqf99xVdfsnyiP3EwFZspPofBrZ5nstf2
 Ah1RUA4NnLZS+uIYrCAVGitiibqLOzLVVdOYQTzJCOGMRdE6EQ9M8PYxo2abzB8mNbeh
 mOvUnFdLxjcY7W21HEvd6fUSMcl+hZy8xdZIDfTCJ9+tyUHNr8ty+u0g6zDA6LdRtB5B
 eDvgF5CcHF/37/zyVeD4sBVqawiEoKGHkEilYoIAEbAF2ATes0lUxOpRQPcxoSBfTf9/
 Ek8w==
X-Gm-Message-State: APuU4Z/T1g2tBbdaYctNZOhO0J/NdLiGMFlvGXo9svg5ldQlqSixRsZR
 ETYGd/iD/MZBx6stC/PE4HeVphNZ2/axLr3AMWU9EAYDuScJ72pje3LVOImDjk4k
X-Gm-Gg: AYBFou0iepDmwUk5hv4NyArAaX9y0NpylzVUzXd2Zuegsc9Rmaec7rckHWa4gTFpthx
 GCuaS7MOkk/1rAIUgT8h96patnIBURBJCF374/ZhC6kJBd+YLhburUqqAubSVjbYh83vut1n+ne
 g2fsJ5Tz6kmBCKVcWRK8DMCNnr81WRzSw2ljBM/h75VcZIXEKC+C4xmDOrMi4fvspgfVwxYFshK
 BTLg6KNheHZQX9Wqvi2Eh9/BnkC1vVN0rWYXWLvrqoMnTvysBqeFh2Lql1ySUbzr7gs9ZJzBRRR
 I8uobSD4s6sV8Y1BoFlRsy+I7FewT9gV9U4+pTlQPJ9R9oIWhmbnEgt+cvmMwS/GUR4XuIOGj6e
 6OBhAojkSSRQlRvYp4OB+SrO1n00KD8gsIxRzyqqJdYMYz5sUU2MRr/QYaLS6e2vVvmMDDj5Zmh
 yJnTxsnsrabGUNLli47J3ilUyy0ShdmOWr0Zi3eadKGhgvBWIVsFs6PVndOh2VKyMFSX7IsratR
 0lopVTa/pFjcBGlzno0OVHYSt9+9v/Ldxu42klIOOh7Qc83LtoMnTQJ3B07JYKizzscJHxjLxWe
 PTNRDjaIsY/FdqR83arzeNNoHuGwBT7TeWrxacV95HSctPzghkPhGA==
X-Received: by 2002:a05:600c:3e8f:b0:4a5:87b3:ddc1 with SMTP id
 5b1f17b1804b1-4b6de4a6ba1mr97685335e9.13.1794069262727; 
 Sat, 07 Nov 2026 08:34:22 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7e6eca30asm82268255e9.7.2026.11.07.08.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 08:34:22 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Nov 2026 17:34:01 +0100
Message-ID: <20261107163414.560896-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107163414.560896-1-angelo.compagnucci@gmail.com>
References: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
 <20261107163414.560896-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 02/15] utils/check-package: support inline
 flags
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Currently source files analysed by check-package can use a special
comment to hint the script to completely ignore a CheckFunction for the
next line of the source file:

    # check-package Indent

Extend that functionality to also support flags that will trigger
special behaviour.
For instance, by adding the line to a Config.in file:

    # check-package Indent_ignore-menu-indent-below

makes the CheckFunction named Indent to set a flag named
ignore-menu-indent-below and use it until the end of the source file
under test.

One example of use for this new special comment is Indent() from
lib_config.py, that currently keeps a list of 4 intree Config.in files
that have a special but legitimate indentation rule.
Instead of keeping the list inside the code, now a special comment can
be used in each of these 4 Config.in files.

A great side effect of this new type of special comment is that it can
also be used in source files from br2-external trees.

Concept reused from James Knight's work in [1] and [2].
[1] http://patchwork.ozlabs.org/project/buildroot/patch/SN4P221MB0682AE13FB1ACA5A755024F1A0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM/
[2] http://patchwork.ozlabs.org/project/buildroot/patch/SN4P221MB06823B0F7326D27ECD5E0FAEA0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM/

Cc: James Knight <james.d.knight@live.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v3 -> v4:
  - none (rebased on current master).

 utils/checkpackagelib/base.py      | 20 ++++++--
 utils/checkpackagelib/test_base.py | 82 ++++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+), 3 deletions(-)

diff --git a/utils/checkpackagelib/base.py b/utils/checkpackagelib/base.py
index 4636eca3a6..a3aff9e3d8 100644
--- a/utils/checkpackagelib/base.py
+++ b/utils/checkpackagelib/base.py
@@ -4,14 +4,28 @@ import os
 
 
 class _CheckFunction(object):
+    flags = []
+
     def __init__(self, filename, url_to_manual):
         self.filename = filename
         self.url_to_manual = url_to_manual
-        self.disable = re.compile(r"^\s*# check-package .*\b{}\b".format(self.__class__.__name__))
+        if self.flags:
+            flags_pattern = '|_' + '|_'.join(self.flags)
+        else:
+            flags_pattern = ''
+        self.disable = re.compile(r"^\s*# check-package .*\b{}({})\b".format(self.__class__.__name__, flags_pattern))
+        self.enabled_flags = {f: False for f in self.flags}
 
     def check_disabled(self, line_before):
-        if self.disable.search(line_before):
-            return True
+        found = self.disable.findall(line_before)
+        if found:
+            # catch flags to be used by CheckFunction for a source file, for all lines below
+            flags_found = [f[1:] for f in found if (f != '' and f[0] == '_')]
+            for f in flags_found:
+                self.enabled_flags[f] = True
+
+            ignore_this_line = '' in found
+            return ignore_this_line
         return False
 
     def before(self):
diff --git a/utils/checkpackagelib/test_base.py b/utils/checkpackagelib/test_base.py
index ef266d542c..bbe9285466 100644
--- a/utils/checkpackagelib/test_base.py
+++ b/utils/checkpackagelib/test_base.py
@@ -47,3 +47,85 @@ def test_IgnoreNextLine(testname, filename, string, expected):
 
     warnings = util.check_file(CheckFunctionUnderTest, filename, string)
     assert warnings == expected
+
+
+SpecialCheckForThisFile = [
+    ('without special comment',
+     'any',
+     'content to test\n'
+     '# commented content to test\n'
+     'content to test\n'
+     'content to test\n'
+     'content to test\n',
+     [1, 2, 3, 4, 5]),  # set of line numbers for all lines not ignored while testing
+    ('ignore next line (CheckFunction with flags)',
+     'any',
+     'content to test\n'
+     '# check-package CheckFunctionUnderTest\n'
+     'content to ignore\n'
+     'content to test\n'
+     'content to test\n',
+     [1, 2, 4, 5]),
+    ('comment to ignore one CheckFunction does not affect another one (CheckFunction with flags)',
+     'any',
+     'content to test\n'
+     '# check-package AnotherCheckFunction\n'
+     'content to test\n'
+     'content to test\n'
+     'content to test\n',
+     [1, 2, 3, 4, 5]),
+    ('ignore 2 CheckFunctions for next line (CheckFunction with flags)',
+     'any',
+     '# check-package CheckFunctionUnderTest, AnotherCheckFunction\n'
+     'content to ignore\n'
+     '# check-package AnotherCheckFunction, CheckFunctionUnderTest\n'
+     'content to ignore\n'
+     'content to test\n',
+     [1, 3, 5]),
+    ('one flag',
+     'any',
+     'content to test using default code\n'
+     '# check-package CheckFunctionUnderTest_flag-2\n'
+     'content to test using flag-2\n'
+     'content to test using flag-2\n',
+     [1, 2, [3, [-2]], [4, [-2]]]),
+    ('flag and ignore next line in the same file',
+     'any',
+     'content to test using default code\n'
+     '# check-package CheckFunctionUnderTest\n'
+     'content to ignore\n'
+     '# check-package CheckFunctionUnderTest_flag-2\n'
+     'content to test using flag-2\n'
+     '# check-package CheckFunctionUnderTest\n'
+     'content to ignore\n'
+     'content to test using flag-2\n',
+     [1, 2, 4, [5, [-2]], [6, [-2]], [8, [-2]]]),
+    ('2 flags',
+     'any',
+     'content to test using default code\n'
+     '# check-package CheckFunctionUnderTest_flag-2\n'
+     'content to test using flag-2\n'
+     '# check-package CheckFunctionUnderTest_flag-1\n'
+     'content to test using flag-1 and flag-2\n'
+     'content to test using flag-1 and flag-2\n',
+     [1, 2, [3, [-2]], [4, [-2]], [5, [-1, -2]], [6, [-1, -2]]]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', SpecialCheckForThisFile)
+def test_SpecialCheckForThisFile(testname, filename, string, expected):
+    class CheckFunctionUnderTest(m._CheckFunction):
+        flags = ['flag-1', 'flag-2']
+
+        def check_line(self, lineno, text):
+            flags = []
+            if self.enabled_flags['flag-1']:
+                flags.append(-1)
+            if self.enabled_flags['flag-2']:
+                flags.append(-2)
+            if flags:
+                return [lineno, flags]
+            return lineno
+
+    warnings = util.check_file(CheckFunctionUnderTest, filename, string)
+    assert warnings == expected
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
