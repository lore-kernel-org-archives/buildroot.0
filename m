Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29892C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 17:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCC6B40895;
	Sun, 13 Mar 2022 17:14:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id twOOlbrLWeP7; Sun, 13 Mar 2022 17:14:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E019940611;
	Sun, 13 Mar 2022 17:14:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17C2C1BF97A
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 17:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 077BA40611
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 17:14:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AqEAgJRO4boN for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 17:14:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58830405AA
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 17:14:00 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id x4so15661752iom.12
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 10:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AQywrKEZQN9hUyt3gxcksZzeDNrEVOpRiYN+KVgWVic=;
 b=Asm1m15sI9vcPyE/UdQB/Y3HDskbQAIe2KFq/N3CrNiySeBAiInYIDqRUzco1m2R5U
 AxkiyIAOIm6Hrqet91DtuP6ByQS7ko6WASdwBpY6Wao/uvqBkYBtneckeqk1PIjz2qYt
 uLy1uWAdAaN6vSl0dUy7TguFvBrjM8UDC4HFHFqpzxyrr1mnuLPmUL8OqjREM55hTK1q
 sgKjsBCs6Lxny2wWz/TzDtAW6PHbsZYiniqLp9kKttxSWWbIZww85GbKNFwh4fVtvQCH
 PLOJsmnkcHF1MR0xhfW5V1ceZcxUcLV4zYF+PaquRqpdlGEpaTgz5UR9SMZVz0rXz1p2
 2hIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AQywrKEZQN9hUyt3gxcksZzeDNrEVOpRiYN+KVgWVic=;
 b=fLaPI93qLx13NbETb769U66pcyDfrzFFRJeCUwuiTZ248XfXcQWz8l+p2eS7XFlG1+
 R32VsWIwtXZqqzi1aLAmHagJOQCKZ+9RJ66A6EXXG7L4tizPzI3wh5DfggNqzKBeC86v
 r92/dGL2RzTrBo3W4SwOUT0Aohs08SR65w/YCLaYzP6bMv9McLxhJCkoVXZ8tumAJ41m
 7rxx0l7WqZidGJ1Z/91KIYHZ6dn4pphIPJqEtTPM7zdsVlie4CKi3KL9BayNg6NhrWTe
 YaU8fELZQdJTp6SmSiJAFIbb+b6Q+9w5cIDQ2ACzUVrC2Q5z9m0dlYJ8qVvIIFFjF2vb
 V9sQ==
X-Gm-Message-State: AOAM532Toc0vTooetzYBHShjgc94p/aFB7tq7QTizgpz23nZJrQp0rYc
 hY92Fzh+REXpQz+20bzHFycZEU4mjiw=
X-Google-Smtp-Source: ABdhPJx5L1K6H/Vt5z/X+2Lg/jAD4vOUeumwxQTjXLFvNz1DoCtNpQ+RoTUA/ncbOEeYI/YstCYnIw==
X-Received: by 2002:a02:92c5:0:b0:314:22ef:6833 with SMTP id
 c5-20020a0292c5000000b0031422ef6833mr17070487jah.137.1647191639252; 
 Sun, 13 Mar 2022 10:13:59 -0700 (PDT)
Received: from james-x399.localdomain (97-118-243-247.hlrn.qwest.net.
 [97.118.243.247]) by smtp.gmail.com with ESMTPSA id
 k15-20020a92c24f000000b002c79ec214f9sm664929ilo.30.2022.03.13.10.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 10:13:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 11:13:55 -0600
Message-Id: <20220313171355.271345-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220313171355.271345-1-james.hilliard1@gmail.com>
References: <20220313171355.271345-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] utils/scanpypi: add flit package support
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
Changes v1 -> v2:
  - remove homepage format fixes(sent as separate patch)
  - remove load_setup fixes
  - move load_pyproject cleanup to finally block
---
 utils/scanpypi | 80 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 2 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 724e59f759..f501b36232 100755
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
@@ -316,6 +358,37 @@ class BuildrootPackage():
             os.chdir(current_dir)
             sys.path.remove(self.tmp_extract)
 
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
+            raise
+        finally:
+            os.chdir(current_dir)
+            sys.path.remove(self.tmp_extract)
+
     def get_requirements(self, pkg_folder):
         """
         Retrieve dependencies from the metadata found in the setup.py script of
@@ -694,9 +767,12 @@ def main():
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
