Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56673C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 14:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACBA7400C4;
	Sun, 13 Mar 2022 14:37:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V3xC1obAIGu9; Sun, 13 Mar 2022 14:37:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60F6540121;
	Sun, 13 Mar 2022 14:37:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E96061BF42D
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 14:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D80C2408A2
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 14:37:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TPP0rldQLSbk for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 14:37:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11486405AE
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 14:37:30 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id b5so9270344ilj.9
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 07:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XmkJL7f74t1EXkAvT9VxvD5dxrMVP025+eEpsE2USc0=;
 b=Ro1aOtfC0Zwp4UOAY0rYMrBQE2MaVqqe8aZT8a/Hiq44JBG+H0JCyq7hKi6jZJIQSA
 E5tgwpFtGmCN/CbhvXw084Fiprsz5KqhSqGl+qwP3IBDOCsQkQ3oxl15CHBI58nKNw4p
 dN97VMjcr44M4Y46HXTqv4qjxWd6P3mgXyDLTxerBk/8lln73LByq1znw+SP4Y7vgHgO
 ehGNgkFDPONw5cB4GBbpjgzL3OYq3C6EF02pMUXLU/GcN9UI7v5PQ2oloNtDUx48RGVU
 XOvBWDzNpaWvBWvvGAH5oODx7qPSh3Pi1s6+fqbrgvJlHj8xzELuMDjLSGeoZYkTYHhO
 oAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XmkJL7f74t1EXkAvT9VxvD5dxrMVP025+eEpsE2USc0=;
 b=Dge5+BAo7XG3swh4ChKXwZx6+5zZD06tGv8JjanmgixnBO28zgaWYFpq7/NX7FeoCx
 NVR+axlxKB8+JFvrgj3FnI0hI5o4FjqkdWYpz09QUB1wEydB+10jMipNhhasWVOnCXTD
 PMEQstwudXFebQziQ3uGzdZsizD/Y+GYSJmy6vMX68iArilJ23+5Llfv0/N7vvOLBWcA
 oALJqsHa4OLxMlMd5Fi28TDtt2O+RTftDW12X7vgmgJ+HAGOt/0X+kA+cRvuexk1xFr2
 fDB4Q2yksoH9UKnKm95MZ0Ou2rz4m3i/VuwiK/5pe9aaMQaSgyxX5STD/5IkdSuUXFt7
 8Sig==
X-Gm-Message-State: AOAM5324Wq34qPgcGyu6VuQmFHqq/BNrTMfFpRlv9Y3GqlAWRIK9zws0
 wDkveb4L7+6ab9YnXvFSpvAglq5YsD4=
X-Google-Smtp-Source: ABdhPJxj7gJTl6Bpf51ScJMMJf55yl6CsRlYldJh2NY5POWqQFxHcMocqtEOtApIWjOGcMAtVfhaFQ==
X-Received: by 2002:a05:6e02:1807:b0:2be:a3c7:6053 with SMTP id
 a7-20020a056e02180700b002bea3c76053mr15287596ilv.268.1647182249810; 
 Sun, 13 Mar 2022 07:37:29 -0700 (PDT)
Received: from james-x399.localdomain (97-118-243-247.hlrn.qwest.net.
 [97.118.243.247]) by smtp.gmail.com with ESMTPSA id
 b2-20020a923402000000b002c25b16552fsm7473058ila.14.2022.03.13.07.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 07:37:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 08:37:26 -0600
Message-Id: <20220313143726.267306-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] utils/scanpypi: add flit package support
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

These packages don't have a setup.py so we instead need to parse their
pyproject.toml file.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 utils/scanpypi | 126 ++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 105 insertions(+), 21 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 17d8a0017a..98426820c6 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -42,6 +42,48 @@ except ImportError:
           'pip install spdx_lookup')
     liclookup = None
 
+def toml_load(f):
+    with open(f, 'rb') as fh:
+        ex = None
+
+        # Try regular tomli first
+        try:
+            from tomli import load
+            return load(fh)
+        except ImportError as e:
+            ex = e
+
+        # Try pip's vendored tomli
+        try:
+            from pip._vendor.tomli import load
+            try:
+                return load(fh)
+            except TypeError:
+                # Fallback to handle older version
+                try:
+                    fh.seek(0)
+                    w = io.TextIOWrapper(fh, encoding="utf8", newline="")
+                    return load(w)
+                finally:
+                    w.detach()
+        except ImportError as e:
+            pass
+
+        # Try regular toml last
+        try:
+            from toml import load
+            fh.seek(0)
+            w = io.TextIOWrapper(fh, encoding="utf8", newline="")
+            try:
+                return load(w)
+            finally:
+                w.detach()
+        except ImportError:
+            pass
+
+        print('This package needs tomli')
+        raise ex
+
 
 def setup_decorator(func, method):
     """
@@ -296,20 +338,52 @@ class BuildrootPackage():
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
+        current_dir = os.getcwd()
+        os.chdir(self.tmp_extract)
+        sys.path.insert(0, self.tmp_extract)
+        try:
+            pyproject_data = toml_load('pyproject.toml')
+            try:
+                self.setup_metadata = pyproject_data.get('project', {})
+                self.metadata_name = self.setup_metadata.get('name', self.real_name)
+                build_system = pyproject_data.get('build-system', {})
+                build_backend = build_system.get('build-backend', None)
+                if build_backend is not None and build_backend == 'flit_core.buildapi':
+                    self.setup_metadata['method'] = 'flit'
+                elif build_system.get('backend-path', None) is not None:
+                    self.setup_metadata['method'] = 'pep517'
+                else:
+                    self.setup_metadata['method'] = 'unknown'
+            except KeyError:
+                # This means setup was not called
+                print('ERROR: Could not determine package metadata for {pkg}.\n'
+                      .format(pkg=self.real_name))
+                raise
+        except FileNotFoundError:
             raise
         os.chdir(current_dir)
         sys.path.remove(self.tmp_extract)
@@ -609,7 +683,8 @@ class BuildrootPackage():
 
         lines.append('\thelp\n')
 
-        help_lines = textwrap.wrap(self.metadata['info']['summary'], 62,
+        md_info = self.metadata['info']
+        help_lines = textwrap.wrap(md_info['summary'], 62,
                                    initial_indent='\t  ',
                                    subsequent_indent='\t  ')
 
@@ -617,11 +692,17 @@ class BuildrootPackage():
         if help_lines[-1][-1] != '.':
             help_lines[-1] += '.'
 
-        # \t + two spaces is 3 char long
-        help_lines.append('')
-        help_lines.append('\t  ' + self.metadata['info']['home_page'])
-        help_lines = [x + '\n' for x in help_lines]
-        lines += help_lines
+        home_page = md_info.get('home_page', None)
+        if home_page is None or len(home_page) == 0:
+            project_urls = md_info.get('project_urls', {})
+            home_page = project_urls.get('Homepage', None)
+
+        if home_page is not None and len(home_page) != 0:
+            # \t + two spaces is 3 char long
+            help_lines.append('')
+            help_lines.append('\t  ' + home_page)
+            help_lines = [x + '\n' for x in help_lines]
+            lines += help_lines
 
         with open(path_to_config, 'w') as config_file:
             config_file.writelines(lines)
@@ -692,9 +773,12 @@ def main():
             except ImportError as err:
                 if 'buildutils' in str(err):
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
