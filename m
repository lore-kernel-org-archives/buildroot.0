Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF42606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 16:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bVqWQ3Mo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rV3YnOZH
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F57E407ED;
	Sat,  7 Nov 2026 16:35:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xn79ZhG9DueL; Sat,  7 Nov 2026 16:34:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8953840757
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794069295;
	b=fOYxjarlhORcp/nKGCe4/z4Xg/AK4PQ7OvL6zH0MNo2oiS5i4UR6O0H36h6YWGF4coQV
	 ulagklWjBLauiBnJ/HZaLjLKBcWWLO8IBZVonTm59IOZvTKTfYafl8/Mq/geSNQoBFHwB
	 1CV9CZPTYOGUBdA2bJWQShNNrIi8fUkA3q1Gk6YWJvDNr84Se+QCpOJ7xSWb4mcKAouSg
	 H9rFsxDH7BGbpXpL2ldEtCkZ4JNETjGIQold65mJ/nqYi3euhnJ4pOAdWd5r4sK/COLJf
	 TRDXl2wbQXUSQYe1Bh9ICdA+nA0agF3CZyyDw0P4YcV59CpXKgSpLuXcdXl2FMWUGYg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794069295;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=y28VMVF/cUITSdQj3gIZCW5ATfu/Kftk6qQGKP1yCCY=;
	b=smhVp3/fHTHwpi8afbvqHwbBc8HwL/ydHrYiY84PXb2sQsLShYbUyTUudYEPiUsXyi50
	 Y+syang9pZSUPG0DZv/bNpi59Ys601d9YCWF/Fs97TTsL1ctz8CBIJkn9eN/pxc1FEUuk
	 zzvtOfC9ddbu2/ugy51WVml9pliZCTrsv5jskzAViEcJ4xigX3LQukHc/9G/OobxF31Aj
	 jcFSb/o9VoRjrGTVndTXXkwalL44uNgoUN6qV4hfV4lSUg2uLSTYrG0oZ8Nsr5NzlF2uw
	 GC0tNrGqjKfBpTgShTE6OgzYlnEU3J+fUs+pZTqsMeJ/Qx3eWp+0rRzL4+JbwDDR42g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794069295;
	bh=y28VMVF/cUITSdQj3gIZCW5ATfu/Kftk6qQGKP1yCCY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bVqWQ3Mou6iYyl0z/YBZDK0iOh1YsB719+qf0zRHqgqRiAqQIVzYY5d+bRDblvM9Q
	 twDIseSFWyayaV/jaE7VoYaMLJEfd3Hl5wzLc0ltkMEep9DQp6JqcRcunQZYD7jNwT
	 DKGAhMP8UuZOpLpiSOoC251PRDHQF0WuCYgKCugGBBlKuGozZLIW0NLN5N6R4hSJMT
	 ewPjbgCMZ8PRu5jKuvhaVK1T5Glr4JKwcbXjy2zowTjgDCGHDZ2+072MQkqmQK87eF
	 ndoKkaDdEeZHeUIhG5XwvqLILdZDug+5I0rRn8k/2PxxbEbyPXROtu+Cx/LE6+EWJG
	 tIic5NCiGcF/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8953840757;
	Sat,  7 Nov 2026 16:34:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D83F317
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8345F60661
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YGK2tawsUM5y for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 16:34:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 420A3605E0
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=rV3YnOZH
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 420A3605E0
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:50 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48e1d0e5dafso340878f8f.1
 for <buildroot@buildroot.org>; Sat, 07 Nov 2026 08:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794069289; x=1794674089; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0caTCq1IGs65H57usD/a/40R4jK281fjqERC19LhhAc=;
 b=rV3YnOZHwBkGwMQi+JrEh6tilyeoiNr8yP83TQFtoNA4EXPzrhLUKYM6jlDFM5qoiE
 vR45EJydGTl6diH14wPyljPcr4ooksevUhfpUJt7MCdmPhU3e7QTxKmqR2tEtbY6ZoT3
 TiecbbCwHPDQOPvOh/sOmGucNA9U3R3RWWR+7rYb3qVPgqY/xaDGn8WK/qJCj+/I4kKn
 b9jFfuTfltezvbuWhFuax6/gwHFOSMaFRLrR16UhMIDdQXMNVIcnZpV9tljn8wVNmTFm
 /1rDPSC8flY0pYGT9vtWD0ZPCPnCzyXhGrjgnyUMVtMgt+1tvgJSWgTady8xWiu1LsoA
 uqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794069289; x=1794674089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0caTCq1IGs65H57usD/a/40R4jK281fjqERC19LhhAc=;
 b=luxKUF315Z8KtqEjAa61aVjFsXYxVGajs18s4BmIT8l9pQNjbrwlzdJlmjlAKBZ5vl
 SL+T2lt58DgPwyrEF9GBgC9g8ihM3VxG71WlZ1Q12z4AKyVpw6srK1Wi/63nrL3IMkGJ
 qKT1Q4CHGYmv3onXO3ceSVUliEMWhTWkPhYrnJwlMY/BweVogTte0dInQYk3NbsnJtX8
 ZRWVLkU9Q0DPzGTOFzTXFcgTyVKzuCpFmL0DATOy36/cANdap0kqVeQQTGDuCCdOA4ki
 1uXOoawZ9QDDedOOTdSeOxRKRQ+LG9ELQOubao1pPVNyEJdc9nA1U1ys4ybRfEthyTgw
 wUVg==
X-Gm-Message-State: APuU4Z8ZHoQDdpYKLueA7MAe0YZVHALuQxrDozwM65XLYZHdlVxQGjpM
 Z2sRdBGlvFR0k+SRiTjtwk90WJ0ggLrlg4Wqa8DZhJ4fXUUL9ApJZFJScUJOR0vm
X-Gm-Gg: AYBFou3X9IKXdERRuQFGa4mjBTZJAFD5g22xGo1I7067TCr7MdTQ14enjWlLqZMkw9p
 cTNnGaD9LJDH4ELhtIVMcrAHrWhQXi8YnSHvXKQSA81utBgOfDHpydLsgif4lCenk76p0WIouf6
 RnUE9Xb0uuPrdL9Nk+i/rPywQfHcXBRe8bkvf+RniMNbpc00MwG8XUmLzCCzdPK1ppV4smJaFwt
 kw/Pe/5pJTJAlrM/hSnv0+aA9gELtnB+oXm/46rblVZT0AhNkMQq+QsHZM1BY/rO0fRspsryYnE
 cqUA5HIjCdV0U3EOUrlo16b+TuCedjgn3CtWCtC2ZrO3z8O7KnwaKybJCtNR5I19wak0k5v9jw0
 qKXbRmyW2VW6aqafCFR62yIFts4lTReK0Tru2dKHscN2y/pzx/JClPlQ84jCvUujRHp/23VuANs
 dghXmrBMQDk6fj20tRADG/8t+2AVFCTI+GiLzG4lQn86EBm6117l8s15huki1J01zHwgcJny1iB
 mjetSO+f/A31+ywHkH00g7SgM1T5gxdTJ3CbmMSkhSIKxuUy6gzX3Yz/ceg58Oi6WQhu+d7BKsB
 u6lvRan68I7l0UC4gF6ao++7oGQHuFW4SxDNosPSw5nkipKpzcr5
X-Received: by 2002:a05:600c:8115:b0:4a2:10f9:37db with SMTP id
 5b1f17b1804b1-4b8190f468amr44768035e9.7.1794069288643; 
 Sat, 07 Nov 2026 08:34:48 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7e6eca30asm82268255e9.7.2026.11.07.08.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 08:34:48 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Nov 2026 17:34:14 +0100
Message-ID: <20261107163414.560896-16-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107163414.560896-1-angelo.compagnucci@gmail.com>
References: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
 <20261107163414.560896-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 15/15] utils/check-package: warn about
 disabled install
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ricardo Martincoski <ricardo.martincoski@gmail.com>

When a package defines one of these variables:
<pkg>_INSTALL_IMAGES_CMDS
<pkg>_PRE_INSTALL_IMAGES_HOOKS
<pkg>_POST_INSTALL_IMAGES_HOOKS
it also needs to enable <pkg>_INSTALL_IMAGES.

The same also occurs for <pkg>_INSTALL_STAGING.

And yet <pkg>_INSTALL_TARGET is a similar case, except that it defaults
to YES, while the other two default to NO.

So warn when a package defines a install command or hook that will never
be called because the equivalent flag is not set.
Take into account that some special cases have <pkg>_INSTALL_STAGING
defaulting to YES.
Also only warn when the script can determine for sure the flag to
install is disabled. So if a flag that defaults to YES is overridden to
NO inside a conditional, consider it may be enabled.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Co-authored-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v4 (v1 was patch 28/29 of the "warn about symbols not
recognized by a package infra" series):
  - rebase on current master; the only file warned about,
    libglib2-bootstrap, is fixed by a previous patch.

 utils/checkpackagelib/lib_mk.py      |  89 ++++++++++++++++++
 utils/checkpackagelib/test_lib_mk.py | 129 +++++++++++++++++++++++++++
 2 files changed, 218 insertions(+)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 9e154e3049..aeb88cb32b 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -63,6 +63,95 @@ def get_package_prefix_from_filename(filename):
     return package, package_upper
 
 
+class DisabledInstall(_CheckFunction):
+    END_CONDITIONAL = re.compile(r"^\s*({})".format("|".join(end_conditional)))
+    START_CONDITIONAL = re.compile(r"^\s*({})".format("|".join(start_conditional)))
+    PATHS_WITH_INSTALL_STAGING_YES = [
+        "package/linux-tools/",
+        "toolchain/",
+    ]
+
+    def before(self):
+        _, self.package = get_package_prefix_from_filename(self.filename)
+
+        self.install_images = False
+        self.all_images_cmds = []
+        self.IMAGES_CMDS = re.compile(r"^\s*(define\s+)?{}({})".format(self.package, "|".join([
+            r"_PRE_INSTALL_IMAGES_HOOKS",
+            r"_INSTALL_IMAGES_CMDS",
+            r"_POST_INSTALL_IMAGES_HOOKS"])))
+        self.INSTALL_IMAGES = re.compile(r"\s*{}_INSTALL_IMAGES\s*=\s*YES".format(self.package))
+
+        self.install_staging = False
+        for path in self.PATHS_WITH_INSTALL_STAGING_YES:
+            if self.filename.startswith(path):
+                self.install_staging = True
+                break
+        self.all_staging_cmds = []
+        self.STAGING_CMDS = re.compile(r"^\s*(define\s+)?{}({})".format(self.package, "|".join([
+            r"_PRE_INSTALL_STAGING_HOOKS",
+            r"_INSTALL_STAGING_CMDS",
+            r"_POST_INSTALL_STAGING_HOOKS"])))
+        self.INSTALL_STAGING = re.compile(r"\s*{}_INSTALL_STAGING\s*=\s*YES".format(self.package))
+
+        self.conditional = 0
+        self.install_target = True
+        self.all_target_cmds = []
+        self.TARGET_CMDS = re.compile(r"^\s*(define\s+)?{}({})".format(self.package, "|".join([
+            r"_PRE_INSTALL_TARGET_HOOKS",
+            r"_INSTALL_TARGET_CMDS",
+            r"_POST_INSTALL_TARGET_HOOKS"])))
+        self.INSTALL_TARGET = re.compile(r"\s*{}_INSTALL_TARGET\s*=\s*NO".format(self.package))
+
+    def check_line(self, lineno, text):
+        if self.START_CONDITIONAL.search(text):
+            self.conditional += 1
+            return
+        if self.END_CONDITIONAL.search(text):
+            self.conditional -= 1
+            return
+
+        if self.INSTALL_IMAGES.search(text):
+            self.install_images = True
+            return
+        if self.INSTALL_STAGING.search(text):
+            self.install_staging = True
+            return
+        if self.INSTALL_TARGET.search(text):
+            if self.conditional == 0:
+                self.install_target = False
+            return
+
+        if self.IMAGES_CMDS.search(text):
+            self.all_images_cmds.append([lineno, text])
+            return
+        if self.STAGING_CMDS.search(text):
+            self.all_staging_cmds.append([lineno, text])
+            return
+        if self.TARGET_CMDS.search(text):
+            self.all_target_cmds.append([lineno, text])
+            return
+
+    def after(self):
+        warnings = []
+        if not self.install_images:
+            for lineno, text in self.all_images_cmds:
+                warnings.append(["{}:{}: never called because {}_INSTALL_IMAGES is disabled"
+                                 .format(self.filename, lineno, self.package),
+                                 text])
+        if not self.install_staging:
+            for lineno, text in self.all_staging_cmds:
+                warnings.append(["{}:{}: never called because {}_INSTALL_STAGING is disabled"
+                                 .format(self.filename, lineno, self.package),
+                                 text])
+        if not self.install_target:
+            for lineno, text in self.all_target_cmds:
+                warnings.append(["{}:{}: never called because {}_INSTALL_TARGET is disabled"
+                                 .format(self.filename, lineno, self.package),
+                                 text])
+        return warnings
+
+
 class Indent(_CheckFunction):
     COMMENT = re.compile(r"^\s*#")
     CONDITIONAL = re.compile(r"^\s*({})\s".format("|".join(start_conditional + end_conditional + continue_conditional)))
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index eca0a255f8..83ebb2f7bd 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -105,6 +105,135 @@ def test_get_package_prefix_from_filename(testname, filename, expected):
     assert [prefix_lower, prefix_upper] == expected
 
 
+DisabledInstall = [
+    ('ignore comment at beginning of line',
+     'any.mk',
+     '# very useful comment\n',
+     [[]]),
+    ('install images disabled (default)',
+     'any.mk',
+     'define ANY_INSTALL_IMAGES_CMDS\n'
+     'endef\n'
+     'ANY_PRE_INSTALL_IMAGES_HOOKS += MY_HOOK  \n'
+     'ANY_POST_INSTALL_IMAGES_HOOKS += MY_HOOK\t\n',
+     [[['any.mk:1: never called because ANY_INSTALL_IMAGES is disabled',
+        'define ANY_INSTALL_IMAGES_CMDS\n'],
+       ['any.mk:3: never called because ANY_INSTALL_IMAGES is disabled',
+        'ANY_PRE_INSTALL_IMAGES_HOOKS += MY_HOOK  \n'],
+       ['any.mk:4: never called because ANY_INSTALL_IMAGES is disabled',
+        'ANY_POST_INSTALL_IMAGES_HOOKS += MY_HOOK\t\n']]]),
+    ('install images disabled (explicit)',
+     'any.mk',
+     'ANY_INSTALL_IMAGES = NO\n'
+     'define ANY_INSTALL_IMAGES_CMDS\n'
+     'endef\n'
+     ' ANY_PRE_INSTALL_IMAGES_HOOKS += MY_HOOK\n'
+     '\tANY_POST_INSTALL_IMAGES_HOOKS += MY_HOOK\n',
+     [[['any.mk:2: never called because ANY_INSTALL_IMAGES is disabled',
+        'define ANY_INSTALL_IMAGES_CMDS\n'],
+       ['any.mk:4: never called because ANY_INSTALL_IMAGES is disabled',
+        ' ANY_PRE_INSTALL_IMAGES_HOOKS += MY_HOOK\n'],
+       ['any.mk:5: never called because ANY_INSTALL_IMAGES is disabled',
+        '\tANY_POST_INSTALL_IMAGES_HOOKS += MY_HOOK\n']]]),
+    ('install images enabled',
+     'any.mk',
+     '  ANY_INSTALL_IMAGES = YES  \n'
+     'define ANY_INSTALL_IMAGES_CMDS\n'
+     'endef\n'
+     'ANY_PRE_INSTALL_IMAGES_HOOKS += MY_HOOK\n'
+     'ANY_POST_INSTALL_IMAGES_HOOKS += MY_HOOK\n',
+     [[]]),
+    ('install staging enabled (default for toolchain)',
+     'toolchain/toolchain-any.mk',
+     'define ANY_INSTALL_STAGING_CMDS\n'
+     'endef\n'
+     'ANY_POST_INSTALL_STAGING_HOOKS += MY_HOOK\t\n',
+     [[]]),
+    ('install staging enabled (default for linux tools)',
+     'package/linux-tools/linux-tool-foo.mk.in',
+     'define FOO_INSTALL_STAGING_CMDS\n'
+     'endef\n',
+     [[]]),
+    ('install staging disabled (default)',
+     'any.mk',
+     'define ANY_INSTALL_STAGING_CMDS\n'
+     'endef\n'
+     'ANY_PRE_INSTALL_STAGING_HOOKS += MY_HOOK  \n'
+     'ANY_POST_INSTALL_STAGING_HOOKS += MY_HOOK\t\n',
+     [[['any.mk:1: never called because ANY_INSTALL_STAGING is disabled',
+        'define ANY_INSTALL_STAGING_CMDS\n'],
+       ['any.mk:3: never called because ANY_INSTALL_STAGING is disabled',
+        'ANY_PRE_INSTALL_STAGING_HOOKS += MY_HOOK  \n'],
+       ['any.mk:4: never called because ANY_INSTALL_STAGING is disabled',
+        'ANY_POST_INSTALL_STAGING_HOOKS += MY_HOOK\t\n']]]),
+    ('install staging disabled (explicit)',
+     'any.mk',
+     'ANY_INSTALL_STAGING = NO\n'
+     'define ANY_INSTALL_STAGING_CMDS\n'
+     'endef\n'
+     ' ANY_PRE_INSTALL_STAGING_HOOKS += MY_HOOK\n'
+     '\tANY_POST_INSTALL_STAGING_HOOKS += MY_HOOK\n',
+     [[['any.mk:2: never called because ANY_INSTALL_STAGING is disabled',
+        'define ANY_INSTALL_STAGING_CMDS\n'],
+       ['any.mk:4: never called because ANY_INSTALL_STAGING is disabled',
+        ' ANY_PRE_INSTALL_STAGING_HOOKS += MY_HOOK\n'],
+       ['any.mk:5: never called because ANY_INSTALL_STAGING is disabled',
+        '\tANY_POST_INSTALL_STAGING_HOOKS += MY_HOOK\n']]]),
+    ('install staging enabled',
+     'any.mk',
+     '  ANY_INSTALL_STAGING = YES  \n'
+     'define ANY_INSTALL_STAGING_CMDS\n'
+     'endef\n'
+     'ANY_PRE_INSTALL_STAGING_HOOKS += MY_HOOK\n'
+     'ANY_POST_INSTALL_STAGING_HOOKS += MY_HOOK\n',
+     [[]]),
+    ('install target disabled (explicit)',
+     'any.mk',
+     'ANY_INSTALL_TARGET = NO\n'
+     'define ANY_INSTALL_TARGET_CMDS\n'
+     'endef\n'
+     ' ANY_PRE_INSTALL_TARGET_HOOKS += MY_HOOK\n'
+     '\tANY_POST_INSTALL_TARGET_HOOKS += MY_HOOK\n',
+     [[['any.mk:2: never called because ANY_INSTALL_TARGET is disabled',
+        'define ANY_INSTALL_TARGET_CMDS\n'],
+       ['any.mk:4: never called because ANY_INSTALL_TARGET is disabled',
+        ' ANY_PRE_INSTALL_TARGET_HOOKS += MY_HOOK\n'],
+       ['any.mk:5: never called because ANY_INSTALL_TARGET is disabled',
+        '\tANY_POST_INSTALL_TARGET_HOOKS += MY_HOOK\n']]]),
+    ('install target enabled (explict)',
+     'any.mk',
+     'ANY_INSTALL_TARGET = YES\n'
+     'define ANY_INSTALL_TARGET_CMDS\n'
+     'endef\n'
+     'ANY_PRE_INSTALL_TARGET_HOOKS += MY_HOOK\n'
+     'ANY_POST_INSTALL_TARGET_HOOKS += MY_HOOK\n',
+     [[]]),
+    ('install target enabled (default)',
+     'any.mk',
+     'define ANY_INSTALL_TARGET_CMDS\n'
+     'endef\n'
+     'ANY_PRE_INSTALL_TARGET_HOOKS += MY_HOOK\n'
+     'ANY_POST_INSTALL_TARGET_HOOKS += MY_HOOK\n',
+     [[]]),
+    ('install target possibly enabled (conditional)',
+     'any.mk',
+     'ifeq ($(condition))\n'
+     'ANY_INSTALL_TARGET = NO\n'
+     'endif\n'
+     'define ANY_INSTALL_TARGET_CMDS\n'
+     'endef\n'
+     'ANY_PRE_INSTALL_TARGET_HOOKS += MY_HOOK\n'
+     'ANY_POST_INSTALL_TARGET_HOOKS += MY_HOOK\n',
+     [[]]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', DisabledInstall)
+def test_DisabledInstall(testname, filename, string, expected):
+    warnings = util.check_file(m.DisabledInstall, filename, string)
+    assert warnings == expected
+
+
 Indent = [
     ('ignore comment at beginning of line',
      'any',
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
