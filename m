Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811BCC76196
	for <buildroot@archiver.kernel.org>; Mon,  3 Apr 2023 01:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 204844155B;
	Mon,  3 Apr 2023 01:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 204844155B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lFoqd0NehNK9; Mon,  3 Apr 2023 01:38:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 123984159D;
	Mon,  3 Apr 2023 01:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 123984159D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 434ED1BF36C
 for <buildroot@lists.busybox.net>; Mon,  3 Apr 2023 01:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CE5381E5C
 for <buildroot@lists.busybox.net>; Mon,  3 Apr 2023 01:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CE5381E5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OfLigdfXHi7B for <buildroot@lists.busybox.net>;
 Mon,  3 Apr 2023 01:37:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BD8081E3A
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BD8081E3A
 for <buildroot@buildroot.org>; Mon,  3 Apr 2023 01:37:37 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 l7-20020a4abe07000000b0053e1205c84bso4015261oop.9
 for <buildroot@buildroot.org>; Sun, 02 Apr 2023 18:37:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680485856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5HZbIWTC/A9nX4KWKWcFATQWowUQ9jvLgXr8fauSFhQ=;
 b=kIJP6xC7IEvH4gqm0VZ2c6Yaol7shX+V0oC2rulsMpsY34Lb438Mv0qaBlY3Xdhltq
 9tM+iEFwXAgdlomE5+edHRQnEdixVCZG5CYZ65G/PKe5zLJvGWlEJaqJQ6UReQYANu6t
 uF//iHUp+pLZ1cknbeB34XIhBKSWuAlVabw70Ge5O0mMEUCBULw2qc0lzpvYqPtxlE1W
 rOMY/DrpG2rpxpoWQ4zwOiDcmkrzvp99EFfzeSIux1DIKUteoLoxjYTq++n6ny7HElol
 ptO1qCvPoK7pionddtdW9FoWsz+7l8dL/JikVD5t+1yMbyhKHTEWwUspbAVj/1FTVvOx
 VSew==
X-Gm-Message-State: AO0yUKXa/FZRgHyh2OuqUEWzW9IY4xXm1TmiZ+onYoeuyET+rjq6JwVr
 /LeKPAaCGzyCTnOI6eAeIvTsgc1p1Ek=
X-Google-Smtp-Source: AK7set/pfoKm6GLgavl6R03wRygNGPHtO7ZvpGj4dRZCdycvORemY8LS1QuM/guIyLCQmFnuI3+Tjw==
X-Received: by 2002:a4a:4110:0:b0:53b:4d59:405a with SMTP id
 x16-20020a4a4110000000b0053b4d59405amr15903953ooa.3.1680485855970; 
 Sun, 02 Apr 2023 18:37:35 -0700 (PDT)
Received: from localhost.localdomain
 (76-250-43-185.lightspeed.mdsnwi.sbcglobal.net. [76.250.43.185])
 by smtp.gmail.com with ESMTPSA id
 f204-20020a4a58d5000000b0053b547ebee7sm3471680oob.1.2023.04.02.18.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Apr 2023 18:37:35 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Apr 2023 20:37:20 -0500
Message-Id: <20230403013721.3915-2-vfazio@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230403013721.3915-1-vfazio@gmail.com>
References: <20230403013721.3915-1-vfazio@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680485856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5HZbIWTC/A9nX4KWKWcFATQWowUQ9jvLgXr8fauSFhQ=;
 b=aKwzGwh8fNp2xQoNRtOHGMj1uMgp5Bdp8+490wwbMFF5l09Wpjdkb9/DpL/sYWtxjn
 W5ldXHYush16b6OkoO2ULmHRAQOG12YcwsQklKuPcKuihZ7esbJdNzbGiyZX1P/eQ1NC
 x9PN+zQOoBNx4lejENEbQqCs3Ms0B78TiE4gY0i0Au2W5NyjG1bcCTApow2uCaNBF2Si
 hul7DIYQX+tjFQTa2lKe0lNG8oqrQAaFmR/l4EfH3suXGJ2Pg0zGygTBnW0HlupdHHBf
 RFdJ7FPDZW7527qgWx+2UO6J/umWX5QhROI2RTgw7AvIV+ciDRJ02wwoNb1/9eRLaK3F
 pFww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aKwzGwh8
Subject: [Buildroot] [PATCH 2/3] utils/checkpackagelib: check for Upstream
 trailers on patches
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Implement a check-package check for an Upstream: trailer in patches
being applied to packages per a mailing list discussion[0].

No strict formatting checks are implemented for the contents within the
trailer as the needed level of detail will vary patch-to-patch.

[0] https://lists.buildroot.org/pipermail/buildroot/2023-March/665973.html

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 utils/checkpackagelib/lib_patch.py      | 18 ++++++++++++++++++
 utils/checkpackagelib/test_lib_patch.py | 22 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/utils/checkpackagelib/lib_patch.py b/utils/checkpackagelib/lib_patch.py
index caee36158f..1909d3acd0 100644
--- a/utils/checkpackagelib/lib_patch.py
+++ b/utils/checkpackagelib/lib_patch.py
@@ -61,3 +61,21 @@ class Sob(_CheckFunction):
             return ["{}:0: missing Signed-off-by in the header "
                     "({}#_format_and_licensing_of_the_package_patches)"
                     .format(self.filename, self.url_to_manual)]
+
+class Upstream(_CheckFunction):
+    UPSTREAM_ENTRY = re.compile(r"^Upstream: .*$")
+
+    def before(self):
+        self.found = False
+
+    def check_line(self, lineno, text):
+        if self.found:
+            return
+        if self.UPSTREAM_ENTRY.search(text):
+            self.found = True
+
+    def after(self):
+        if not self.found:
+            return ["{}:0: missing Upstream in the header "
+                    "({}#_additional_patch_documentation)"
+                    .format(self.filename, self.url_to_manual)]
diff --git a/utils/checkpackagelib/test_lib_patch.py b/utils/checkpackagelib/test_lib_patch.py
index 3b6fadf38c..67e7a67b76 100644
--- a/utils/checkpackagelib/test_lib_patch.py
+++ b/utils/checkpackagelib/test_lib_patch.py
@@ -94,3 +94,25 @@ Sob = [
 def test_Sob(testname, filename, string, expected):
     warnings = util.check_file(m.Sob, filename, string)
     assert warnings == expected
+
+
+Upstream = [
+    ('good',
+     'patch',
+     'Upstream: https://some/amazing/patch/submission\n',
+     []),
+    ('empty',
+     'patch',
+     '',
+     [['patch:0: missing Upstream in the header (url#_integrating_patches_found_on_the_web)']]),
+    ('bad',
+     'patch',
+     'Subject: [PATCH 24/105] text\n',
+     [['patch:0: missing Upstream in the header (url#_integrating_patches_found_on_the_web)']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', Upstream)
+def test_Upstream(testname, filename, string, expected):
+    warnings = util.check_file(m.Upstream, filename, string)
+    assert warnings == expected
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
