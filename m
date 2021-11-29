Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23956C433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 08:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C765782E9D;
	Mon, 29 Nov 2021 08:56:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ST8Nbe_FVrbF; Mon, 29 Nov 2021 08:56:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 279F082FDE;
	Mon, 29 Nov 2021 08:56:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CFAAC1BF97E
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 08:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDA5682E9D
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 08:56:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ULOGt145QMSk for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 08:56:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 834ED82A87
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 08:56:20 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id w22so20497138ioa.1
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 00:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LgoVMrRSX/w9HFOIH0PslMuSWFkXe8CnXYFGjdJRaxQ=;
 b=Z3hneGhHgGNPidc6dr43bsnog1dKfrwTEDzwkUvRd2WTbSpamu6GleL+pyvrMCtsgv
 1TUJeuNdI4JQYxNATq1yMz0uDYQKLXyMLYn8epA2bnPviCssZ3BCiKVQtqhJnDt4cffB
 jclBBiN93elzALKJcpfcNkHA9+5m+gibbeEaIDqh3cicDs+tqLLla1qSwTYyAGrjqEMG
 iPAco8NTtFAcOeJOCAAEE6tomsDtxXxHryTLgUg82qCcHJ7gV8qrInTMXIYVvdL0acqS
 i98gZRwBuAtoNzEzQEbz+vgvWWNvfzkenPh2oHGOr+/CPnInWO3lgMZXxNvjqNqSqVsw
 IJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LgoVMrRSX/w9HFOIH0PslMuSWFkXe8CnXYFGjdJRaxQ=;
 b=GhtaFEFtHuZeBtY/FCaBTGYAJgbEcd21efdHyGzH+jHhXXo1CrCUeJCtSAXdUKPUcd
 gtKQgYhmfmPiLqtAwUYmPs2Nwi9YtonMmUUXIAnIhkIqwhKHE3QDPRlhY/lHTG3BvwZ+
 R5MXyCifQTT62sEBVlEQwAtm49H8fI6EPJrnPbBRCHvpWvzqqHCUYNvobSQgttz9XDW+
 B6zVIifrOzQd3ZZF3Jx0rn2Xeuj6G5JJT3y+sIQrIgfPbBaLhjXr7sJPrcd/0h/29bfB
 2Q6GTLRDZ8XT7rovR20CIpsRkenJOF1f5fKBabqRWi5HVEGP3j133OAu+aJJfkS90rcn
 tKOw==
X-Gm-Message-State: AOAM530j0YyPAGAJ5jDVruKBztrE+aiD0rpHGrWGz/aIf2YYmX0q3YQ+
 IfgLqp7iK2yrJdeXkSsaXtAOAalB7OM=
X-Google-Smtp-Source: ABdhPJzoOnLsSnvgH0d01VEeSFLlmuLTAz/btm+roDpxTmKO7VOKrkkhf6SsgrcbrpvVzvOgfENCNQ==
X-Received: by 2002:a6b:7307:: with SMTP id e7mr58672938ioh.211.1638176179394; 
 Mon, 29 Nov 2021 00:56:19 -0800 (PST)
Received: from james-x399.localdomain (71-33-128-47.hlrn.qwest.net.
 [71.33.128.47])
 by smtp.gmail.com with ESMTPSA id l3sm7127145ilv.37.2021.11.29.00.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 00:56:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 01:56:09 -0700
Message-Id: <20211129085610.3701585-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129085610.3701585-1-james.hilliard1@gmail.com>
References: <20211129085610.3701585-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] utils/scanpypi: add flit package support
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

These packages don't have a setup.py so we instead need to parse their
pyproject.toml file.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 utils/scanpypi | 81 ++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 65 insertions(+), 16 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 1f3326cf4d..4164a52db3 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -296,21 +296,67 @@ class BuildrootPackage():
         current_dir = os.getcwd()
         os.chdir(self.tmp_extract)
         sys.path.insert(0, self.tmp_extract)
-        s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
-        imp.load_module('__main__', s_file, s_path, s_desc)
-        if self.metadata_name in self.setup_args:
-            pass
-        elif self.metadata_name.replace('_', '-') in self.setup_args:
-            self.metadata_name = self.metadata_name.replace('_', '-')
-        elif self.metadata_name.replace('-', '_') in self.setup_args:
-            self.metadata_name = self.metadata_name.replace('-', '_')
         try:
-            self.setup_metadata = self.setup_args[self.metadata_name]
-        except KeyError:
-            # This means setup was not called
-            print('ERROR: Could not determine package metadata for {pkg}.\n'
-                  .format(pkg=self.real_name))
+            s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
+            imp.load_module('__main__', s_file, s_path, s_desc)
+            if self.metadata_name in self.setup_args:
+                pass
+            elif self.metadata_name.replace('_', '-') in self.setup_args:
+                self.metadata_name = self.metadata_name.replace('_', '-')
+            elif self.metadata_name.replace('-', '_') in self.setup_args:
+                self.metadata_name = self.metadata_name.replace('-', '_')
+            try:
+                self.setup_metadata = self.setup_args[self.metadata_name]
+            except KeyError:
+                # This means setup was not called
+                print('ERROR: Could not determine package metadata for {pkg}.\n'
+                      .format(pkg=self.real_name))
+                raise
+        finally:
+            os.chdir(current_dir)
+            sys.path.remove(self.tmp_extract)
+
+    def load_pyproject(self):
+        """
+        Loads the corresponding pyproject.toml and store its metadata
+        """
+        from pprint import pprint
+        current_dir = os.getcwd()
+        os.chdir(self.tmp_extract)
+        sys.path.insert(0, self.tmp_extract)
+        try:
+            pyproject = open('pyproject.toml')
+        except FileNotFoundError:
             raise
+        else:
+            try:
+                from pip._vendor.tomli import load as toml_load
+            except ImportError:
+                try:
+                    from toml import load as _toml_load  # noqa: F401
+                    def toml_load(f):
+                        w = io.TextIOWrapper(f, encoding="utf8", newline="")
+                        try:
+                            return _toml_load(w)
+                        finally:
+                            w.detach()
+                except ImportError:
+                    print('This package needs toml')
+                    raise
+            with pyproject:
+                pyproject_data = toml_load(pyproject)
+                try:
+                    self.setup_metadata = pyproject_data.get('project', {})
+                    self.metadata_name = self.setup_metadata.get('name', self.real_name)
+                    build_backend = pyproject_data.get('build-system', {}).get('build-backend', None)
+                    if build_backend is not None:
+                        if build_backend == 'flit_core.buildapi':
+                            self.setup_metadata['method'] = 'flit'
+                except KeyError:
+                    # This means setup was not called
+                    print('ERROR: Could not determine package metadata for {pkg}.\n'
+                          .format(pkg=self.real_name))
+                    raise
         os.chdir(current_dir)
         sys.path.remove(self.tmp_extract)
 
@@ -690,11 +736,14 @@ def main():
             try:
                 package.load_setup()
             except ImportError as err:
-                if 'buildutils' in err.message:
+                if 'buildutils' in str(err):
                     print('This package needs buildutils')
+                    continue
                 else:
-                    raise
-                continue
+                    try:
+                        package.load_pyproject()
+                    except Exception as e:
+                        raise
             except (AttributeError, KeyError) as error:
                 print('Error: Could not install package {pkg}: {error}'.format(
                     pkg=package.real_name, error=error))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
