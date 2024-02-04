Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F58C48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 15:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C0A882849;
	Sun,  4 Feb 2024 15:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C0A882849
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZlfdVJsdw1p8; Sun,  4 Feb 2024 15:23:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B31D828B5;
	Sun,  4 Feb 2024 15:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B31D828B5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 910521BF47A
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 15:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 733D2400B9
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 15:22:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 733D2400B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iE242cmY7Yy3 for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 15:22:56 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8180C400D1
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 15:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8180C400D1
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-55cca88b6a5so4272033a12.1
 for <buildroot@buildroot.org>; Sun, 04 Feb 2024 07:22:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707060174; x=1707664974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=E+AWMBhQmsI5k2RAe9JBb3Q4ipRPGgMrr4BLFFGGAII=;
 b=pRhxkcJmRkfaT//knHh28ytnbaA4LgxFOy6ahqEyQBYhP9vFy34i2KiCIVfjpjoasM
 /hc2k9ZMYEDrjJ2h7CAfHOkA/R15i68nA4k0/rh9PqdUzDg2yE83xxvRRZldNWmTNKEJ
 WFdHxa3lspH+Qh/3e1BvRdP+tqGm94NZQSUmaPZxfNauVQSZdZwu5fTddVi5S/slMysC
 T6/rg3TaQA0WcmDpFSJbC1ylWLe2ETInIAGdb4e9dl2XNyrsMRidC3/kJu0EgrdJ6PZZ
 FEui37/MOXowfmUDnZt7hm5/RjTX7gutkNcFQ/lIbi4i+TMFzSkXrMQlbeWd2qqOtA4X
 ZieA==
X-Gm-Message-State: AOJu0YzBeEp8ABoYN7bsqXnpf9/68vqQFzSLAkfxnuqzhl2XfgtCXT9l
 ki2XLlQTEwwup0xbQ8x2/WF+zY5SAUw4AT7J70cegcneuisdfor3pM0Lji2xqZg=
X-Google-Smtp-Source: AGHT+IG7wypvlw83du+gZ6Q7tEhfHfMi2ave3Vs+duwpkoAeXa7z0qJQB1JfthtrCAkisgAf+Itozw==
X-Received: by 2002:a05:6402:745:b0:55f:99:c895 with SMTP id
 p5-20020a056402074500b0055f0099c895mr3200446edy.20.1707060174289; 
 Sun, 04 Feb 2024 07:22:54 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUX8fluuLL5wDCx5szcVfsOJrV/peHv2IANRcTxxvDBvFqUHB69KHnCZDrY3uMgIwjdu+D4B8f1RnpxwZyDaPYbrZdIDCPvmYY9agyt6a9tPOzhss3Pgr1OZujTe6aEy5sJzEa9xzBgTsM=
Received: from landeda.fosdem.net ([2001:67c:1810:f051:9566:1ebe:e5dc:dd49])
 by smtp.gmail.com with ESMTPSA id
 v23-20020aa7d657000000b0056020849adfsm1557363edr.26.2024.02.04.07.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Feb 2024 07:22:54 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  4 Feb 2024 16:22:51 +0100
Message-ID: <a57c0108640f1a7f039be67482cfeacb5dc9c073.1707060159.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707060159.git.yann.morin.1998@free.fr>
References: <cover.1707060159.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707060174; x=1707664974; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E+AWMBhQmsI5k2RAe9JBb3Q4ipRPGgMrr4BLFFGGAII=;
 b=Qn3T+r2X4xqYbmiEK1ln2wmvI61EGz0cLpGIe4+3dHzBvoCq7cfKL5+obDPrYxS8H7
 vMYORk72LPIa1WBAeqBnpKkpoVTbueEtTofBL8w+Ey3SCsxy8I2/j/apIVCxFTWuqQZE
 4yT6N9ltVPFr4MByldIvQCYtbPTzTbmuO18G7OIPHRAWFEQmdYNACN7P3oiy28E4eKR4
 Va/V9KtbxMDONnm4T0ckf9t8DvIibhqxfYSUzu1cok7zP0kLcMJxu1aiAfOgkEdqfqua
 vPwOeOGP9tE4znYQg60KK6alYY7rMjqJxXQKWNTS+J8tgjdbu7GG+ya+rVtuKCLKUCO5
 B2mw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Qn3T+r2X
Subject: [Buildroot] [PATCH 4/4] utils/checkpackagelib: add check for CPE
 variables set to defautl values
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The way we handle CPE variable is unsual compared to the other
variables: we mostly compute defaults for all of them, and eventually
aggregate the various CPE variables to form the CPE ID name.

However, we do not consider that CPE ID to valid, unless there is one
(or more) CPE variables actually set by thje package. This shows that
the CPE ID has been checked to be valid against the NVD CPE database.

However, it is totally possible (and very often the case) that the
default value we set to those variables are appropriate, and do defne a
valid CPE ID. In this case, the package will define any arbitrary cPE
variable to tis default value, usually by setting either the VENDOR or
PRODUCT field, though there is no rule or requirement that be the case.

But since we only need one variable to be set, if they all are set to
their default value, or one is set to a non-default value, there is no
need to define the others to their default value.

So, the rules are really:

  * no valid CPE ID known: define no CPE variable;

  * valid CPE ID known, using all defaults fields: set a single CPE
    variable;

  * valid CPE ID known, at least one CPE field id non default: only set
    those CPE variables that are not default.

So, we add a new check to checkpakcagelib, that ensures the above rules
are met: if a CPE variable is set to its default, then it should be the
only CPE variable set at all.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 utils/checkpackagelib/lib_mk.py | 59 +++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index d340882971..1eb20fc04a 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -366,3 +366,62 @@ class VariableWithBraces(_CheckFunction):
             return ["{}:{}: use $() to delimit variables, not ${{}}"
                     .format(self.filename, lineno),
                     text]
+
+
+class CPEProduct(_CheckFunction):
+    """
+    Check that the values for the CPE variables are not the default.
+    However, if there is only one such variable set, the default
+    is acceptable, because that is used to set whether the CPE info
+    is valid or not.
+    """
+    def before(self):
+        pkg, _ = os.path.splitext(os.path.basename(self.filename))
+        self.CPE_fields = {
+            "PREFIX": "cpe:2.3:a",
+            "VENDOR": f"{pkg}_project",
+            "PRODUCT": pkg,
+            "VERSION": None,
+            "UPDATE": "*",
+        }
+        self.VAR_SPLIT_RE = re.compile(
+            r"^.+_CPE_ID_({})\s*=\s*(.+)$"
+            .format("|".join(self.CPE_fields)),
+        )
+        self.nb_CPE_fields = 0
+        self.CPE_info = dict()
+        self.VERSION_RE = re.compile(
+            r"^.*_VERSION\s*=\*(.+)$",
+        )
+
+    def check_line(self, lineno, text):
+        match = self.VERSION_RE.match(text)
+        if match:
+            self.CPE_fields["VERSION"] = match.groups()[0]
+
+        match = self.VAR_SPLIT_RE.match(text)
+        if match:
+            self.nb_CPE_fields += 1
+            CPE_f, CPE_v = match.groups()
+            self.CPE_info[CPE_f] = {
+                "lineno": lineno,
+                "text": text,
+                "val": CPE_v,
+            }
+
+    def after(self):
+        if self.nb_CPE_fields <= 1:
+            return
+        defaults = list()
+        for f in self.CPE_fields:
+            if f not in self.CPE_info:
+                continue
+            lineno = self.CPE_info[f]["lineno"]
+            text = self.CPE_info[f]["text"]
+            val = self.CPE_info[f]["val"]
+            if val == self.CPE_fields[f]:
+                defaults.append(
+                    f"{self.filename}:{lineno}: {val} is the default value: {text}"
+                )
+
+        return defaults or None
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
