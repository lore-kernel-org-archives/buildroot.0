Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54453C27C6E
	for <buildroot@archiver.kernel.org>; Fri, 14 Jun 2024 16:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C1C5415F3;
	Fri, 14 Jun 2024 16:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GnD_w9-qnnVX; Fri, 14 Jun 2024 16:22:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30A89415F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30A89415F8;
	Fri, 14 Jun 2024 16:22:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F14A71BF326
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 16:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E723541674
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 16:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PzQyI5WUdgAZ for <buildroot@lists.busybox.net>;
 Fri, 14 Jun 2024 16:22:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4E4BC41638
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E4BC41638
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E4BC41638
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 16:22:03 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4217d808034so22589285e9.3
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 09:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718382121; x=1718986921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=y9DZNCDP2pDtJudpSJqwd6xqJd7hYlOB3eR6Lv0CjaE=;
 b=BsOBU5nX6wJpE8UceFAuTtUbFjYBPqGkRnromgNUgLiv7EhOA5Uj+bSS4OCES2oPIx
 FI4xg2zdWn4c/iMi5cO+IRUZJZ3xATQiTkd/tAz00Nw9lrKcKDZeL2YjpB7hwvJ58EeL
 8Pjrpi9UNeDCWVdaL3L8YWgWOA4rwjJNmZSSRNHX7aZcJpoXbG50k9zVoOj+S4DDBKnA
 3LIdufkkig7Z6nr2XYmPhp6aQI2DcUhdrz0INiYhDgFRbSCrqoN6sjIyAc6Noz9Vx9aX
 Mk91Su55Fol5vDdmr6DqWEuMB6jCNDhIFyDVjQDEZNpy7punQxUGxWMpoTVGCy4QDOKq
 R3Jw==
X-Gm-Message-State: AOJu0Yw3pxdl0h6tw48FHEJy1hD2qNdVTGzkGtoDWR4aVOq6qj5w7A0W
 savk1pwiiwiaaQUQX754hHBJwBMeva8roV8jjce+81SW5hBgCD0a9d4I3A==
X-Google-Smtp-Source: AGHT+IG5VvqAysVahQY8Ki712Z77yG8e81gg4xuJLVnhXBzRf7hdIAIpsTuFGLAv1h/92VGuITTzWg==
X-Received: by 2002:a05:600c:350b:b0:41a:a521:9699 with SMTP id
 5b1f17b1804b1-42304822701mr32539655e9.4.1718382121165; 
 Fri, 14 Jun 2024 09:22:01 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f612800csm67133175e9.28.2024.06.14.09.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 09:22:00 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 14 Jun 2024 18:21:56 +0200
Message-ID: <c7f755e5dfa9d622e9e0ac4d8198a8f6f71afe28.1718382114.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1718382114.git.yann.morin.1998@free.fr>
References: <cover.1718382114.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718382121; x=1718986921; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y9DZNCDP2pDtJudpSJqwd6xqJd7hYlOB3eR6Lv0CjaE=;
 b=WR5SLK7uaeOqo/Lrf1ocnndHneJ1dLyDoL0BtHfJ6SXJp6nLWqYlWaYoWgIIm9q0Wa
 Q7mMLNk9lgbL4GdI0fJ9zR+PaWcfIO70/Rz9ydUsHjxJ+Oe8G3Q3hLeTi7jXeBUgOt2F
 mi3MtOppuVi2j3k3Q3rVeJjabdg6CKsex4/TRZAPAGsgqk5fZ0FFD2j4jQ6A0Sl7GbPW
 hTOE8YBE5d802hNbLYZy0Y8P4jPwdM3uCUE6/v+lP/bt9TJ0Oyj8a1owUZoXhy2FbeNy
 YAgwHmYfMsUOYYO5Nz0Op+fsJW3A5ENXzMXisKvbKEzsVYeCxWWedVuSVNPWOeFCi8Cw
 2jAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WR5SLK7u
Subject: [Buildroot] [PATCH 4/6] package/python-web2py: fix build with
 python 3.12
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport an upstream patch to fix a build error with python 3.12 (imp
module not longer available).

Enable SSL in host-python when the admin panel is enabled: web2py will
wnt to generate a password, and uses pydal for that, which in turns uses
hashlib.pbkdf2_hmac(). Until python 3.11, there was a pure-python
fallback for when python was built without openssl; with 3.12, that
fallback was removed, so opensll is now required.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-fix-regexen-and-classname.patch      | 294 ++++++++++++++++++
 package/python-web2py/Config.in               |   8 +-
 2 files changed, 301 insertions(+), 1 deletion(-)
 create mode 100644 package/python-web2py/0001-fix-regexen-and-classname.patch

diff --git a/package/python-web2py/0001-fix-regexen-and-classname.patch b/package/python-web2py/0001-fix-regexen-and-classname.patch
new file mode 100644
index 0000000000..f134c3d31b
--- /dev/null
+++ b/package/python-web2py/0001-fix-regexen-and-classname.patch
@@ -0,0 +1,294 @@
+From ad5cbbfdfacdcd3b4663e91a638de022d6e20477 Mon Sep 17 00:00:00 2001
+From: eevelweezel <eevel.weezel@gmail.com>
+Date: Mon, 6 Nov 2023 00:17:20 -0600
+Subject: [PATCH] fix regexen and classname
+
+Upstream: https://github.com/web2py/web2py/commit/ad5cbbfdfacdcd3b4663e91a638de022d6e20477
+[yann.morin.1998@free.fr: backport from upstream]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+
+---
+ applications/admin/controllers/default.py | 64 +++++++++++------------
+ gluon/compileapp.py                       |  4 +-
+ gluon/contrib/appconfig.py                |  2 +-
+ 3 files changed, 35 insertions(+), 35 deletions(-)
+
+diff --git a/applications/admin/controllers/default.py b/applications/admin/controllers/default.py
+index 88697267..c53a3a76 100644
+--- a/applications/admin/controllers/default.py
++++ b/applications/admin/controllers/default.py
+@@ -85,7 +85,7 @@ def safe_open(a, b):
+         return tmp()
+
+     a_for_check = os.path.abspath(os.path.normpath(a))
+-    
++
+     web2py_apps_root = os.path.abspath(up(request.folder))
+     web2py_deposit_root = os.path.join(up(web2py_apps_root), 'deposit')
+
+@@ -230,7 +230,7 @@ def site():
+     class IS_VALID_APPNAME(object):
+
+         def __call__(self, value):
+-            if not re.compile('^\w+$').match(value):
++            if not re.compile(r'^\w+$').match(value):
+                 return (value, T('Invalid application name'))
+             if not request.vars.overwrite and \
+                     os.path.exists(os.path.join(apath(r=request), value)):
+@@ -321,7 +321,7 @@ def site():
+             session.flash = T(msg, dict(appname=form_update.vars.name))
+         redirect(URL(r=request))
+
+-    regex = re.compile('^\w+$')
++    regex = re.compile(r'^\w+$')
+
+     if is_manager():
+         apps = [a for a in os.listdir(apath(r=request)) if regex.match(a) and
+@@ -341,7 +341,7 @@ def site():
+ def report_progress(app):
+     import datetime
+     progress_file = os.path.join(apath(app, r=request), 'progress.log')
+-    regex = re.compile('\[(.*?)\][^\:]+\:\s+(\-?\d+)')
++    regex = re.compile(r'\[(.*?)\][^\:]+\:\s+(\-?\d+)')
+     if not os.path.exists(progress_file):
+         return []
+     matches = regex.findall(open(progress_file, 'r').read())
+@@ -609,7 +609,7 @@ def test():
+     if len(request.args) > 1:
+         file = request.args[1]
+     else:
+-        file = '.*\.py'
++        file = r'.*\.py'
+
+     controllers = listdir(
+         apath('%s/controllers/' % app, r=request), file + '$')
+@@ -869,12 +869,12 @@ def todolist():
+     app_path = apath('%(app)s' % {'app': app}, r=request)
+     dirs = ['models', 'controllers', 'modules', 'private']
+
+-    def listfiles(app, dir, regexp='.*\.py$'):
++    def listfiles(app, dir, regexp=r'.*\.py$'):
+         files = sorted(listdir(apath('%(app)s/%(dir)s/' % {'app': app, 'dir': dir}, r=request), regexp))
+         files = [x.replace(os.path.sep, '/') for x in files if not x.endswith('.bak')]
+         return files
+
+-    pattern = '#\s*(todo)+\s+(.*)'
++    pattern = r'#\s*(todo)+\s+(.*)'
+     regex = re.compile(pattern, re.IGNORECASE)
+
+     output = []
+@@ -1126,7 +1126,7 @@ def design():
+         redirect(URL('site'))
+
+     # Get all models
+-    models = listdir(apath('%s/models/' % app, r=request), '.*\.py$')
++    models = listdir(apath('%s/models/' % app, r=request), r'.*\.py$')
+     models = [x.replace('\\', '/') for x in models]
+     defines = {}
+     for m in models:
+@@ -1136,7 +1136,7 @@ def design():
+
+     # Get all controllers
+     controllers = sorted(
+-        listdir(apath('%s/controllers/' % app, r=request), '.*\.py$'))
++        listdir(apath('%s/controllers/' % app, r=request), r'.*\.py$'))
+     controllers = [x.replace('\\', '/') for x in controllers]
+     functions = {}
+     for c in controllers:
+@@ -1149,7 +1149,7 @@ def design():
+
+     # Get all views
+     views = sorted(
+-        listdir(apath('%s/views/' % app, r=request), '[\w/\-]+(\.\w+)+$'))
++        listdir(apath('%s/views/' % app, r=request), r'[\w/\-]+(\.\w+)+$'))
+     views = [x.replace('\\', '/') for x in views if not x.endswith('.bak')]
+     extend = {}
+     include = {}
+@@ -1164,17 +1164,17 @@ def design():
+         include[c] = [i[1] for i in items]
+
+     # Get all modules
+-    modules = listdir(apath('%s/modules/' % app, r=request), '.*\.py$')
++    modules = listdir(apath('%s/modules/' % app, r=request), r'.*\.py$')
+     modules = modules = [x.replace('\\', '/') for x in modules]
+     modules.sort()
+
+     # Get all private files
+-    privates = listdir(apath('%s/private/' % app, r=request), '[^\.#].*')
++    privates = listdir(apath('%s/private/' % app, r=request), r'[^\.#].*')
+     privates = [x.replace('\\', '/') for x in privates]
+     privates.sort()
+
+     # Get all static files
+-    statics = listdir(apath('%s/static/' % app, r=request), '[^\.#].*',
++    statics = listdir(apath('%s/static/' % app, r=request), r'[^\.#].*',
+                       maxnum=MAXNFILES)
+     statics = [x.replace(os.path.sep, '/') for x in statics]
+     statics.sort()
+@@ -1267,7 +1267,7 @@ def plugin():
+         redirect(URL('site'))
+
+     # Get all models
+-    models = listdir(apath('%s/models/' % app, r=request), '.*\.py$')
++    models = listdir(apath('%s/models/' % app, r=request), r'.*\.py$')
+     models = [x.replace('\\', '/') for x in models]
+     defines = {}
+     for m in models:
+@@ -1277,7 +1277,7 @@ def plugin():
+
+     # Get all controllers
+     controllers = sorted(
+-        listdir(apath('%s/controllers/' % app, r=request), '.*\.py$'))
++        listdir(apath('%s/controllers/' % app, r=request), r'.*\.py$'))
+     controllers = [x.replace('\\', '/') for x in controllers]
+     functions = {}
+     for c in controllers:
+@@ -1290,7 +1290,7 @@ def plugin():
+
+     # Get all views
+     views = sorted(
+-        listdir(apath('%s/views/' % app, r=request), '[\w/\-]+\.\w+$'))
++        listdir(apath('%s/views/' % app, r=request), r'[\w/\-]+\.\w+$'))
+     views = [x.replace('\\', '/') for x in views]
+     extend = {}
+     include = {}
+@@ -1304,17 +1304,17 @@ def plugin():
+         include[c] = [i[1] for i in items]
+
+     # Get all modules
+-    modules = listdir(apath('%s/modules/' % app, r=request), '.*\.py$')
++    modules = listdir(apath('%s/modules/' % app, r=request), r'.*\.py$')
+     modules = modules = [x.replace('\\', '/') for x in modules]
+     modules.sort()
+
+     # Get all private files
+-    privates = listdir(apath('%s/private/' % app, r=request), '[^\.#].*')
++    privates = listdir(apath('%s/private/' % app, r=request), r'[^\.#].*')
+     privates = [x.replace('\\', '/') for x in privates]
+     privates.sort()
+
+     # Get all static files
+-    statics = listdir(apath('%s/static/' % app, r=request), '[^\.#].*',
++    statics = listdir(apath('%s/static/' % app, r=request), r'[^\.#].*',
+                       maxnum=MAXNFILES)
+     statics = [x.replace(os.path.sep, '/') for x in statics]
+     statics.sort()
+@@ -1331,7 +1331,7 @@ def plugin():
+         safe_write(crontab, '#crontab')
+
+     def filter_plugins(items):
+-        regex = re.compile('^plugin_' + plugin + '(/.*|\..*)?$')
++        regex = re.compile(r'^plugin_' + plugin + r'(/.*|\..*)?$')
+         return [item for item in items if item and regex.match(item)]
+
+     return dict(app=app,
+@@ -1363,14 +1363,14 @@ def create_file():
+                 request.vars.location += request.vars.dir + '/'
+             app = get_app(name=request.vars.location.split('/')[0])
+             path = apath(request.vars.location, r=request)
+-        filename = re.sub('[^\w./-]+', '_', request.vars.filename)
++        filename = re.sub(r'[^\w./-]+', '_', request.vars.filename)
+         if path[-7:] == '/rules/':
+             # Handle plural rules files
+             if len(filename) == 0:
+                 raise SyntaxError
+             if not filename[-3:] == '.py':
+                 filename += '.py'
+-            lang = re.match('^plural_rules-(.*)\.py$', filename).group(1)
++            lang = re.match(r'^plural_rules-(.*)\.py$', filename).group(1)
+             langinfo = read_possible_languages(apath(app, r=request))[lang]
+             text = dedent("""
+                    #!/usr/bin/env python
+@@ -1518,7 +1518,7 @@ def create_file():
+         redirect(request.vars.sender + anchor)
+
+
+-def listfiles(app, dir, regexp='.*\.py$'):
++def listfiles(app, dir, regexp=r'.*\.py$'):
+     files = sorted(
+         listdir(apath('%(app)s/%(dir)s/' % {'app': app, 'dir': dir}, r=request), regexp))
+     files = [x.replace('\\', '/') for x in files if not x.endswith('.bak')]
+@@ -1533,12 +1533,12 @@ def editfile(path, file, vars={}, app=None):
+
+ def files_menu():
+     app = request.vars.app or 'welcome'
+-    dirs = [{'name': 'models', 'reg': '.*\.py$'},
+-            {'name': 'controllers', 'reg': '.*\.py$'},
+-            {'name': 'views', 'reg': '[\w/\-]+(\.\w+)+$'},
+-            {'name': 'modules', 'reg': '.*\.py$'},
+-            {'name': 'static', 'reg': '[^\.#].*'},
+-            {'name': 'private', 'reg': '.*\.py$'}]
++    dirs = [{'name': 'models', 'reg': r'.*\.py$'},
++            {'name': 'controllers', 'reg': r'.*\.py$'},
++            {'name': 'views', 'reg': r'[\w/\-]+(\.\w+)+$'},
++            {'name': 'modules', 'reg': r'.*\.py$'},
++            {'name': 'static', 'reg': r'[^\.#].*'},
++            {'name': 'private', 'reg': r'.*\.py$'}]
+     result_files = []
+     for dir in dirs:
+         result_files.append(TAG[''](LI(dir['name'], _class="nav-header component", _onclick="collapse('" + dir['name'] + "_files');"),
+@@ -1559,7 +1559,7 @@ def upload_file():
+         path = apath(request.vars.location, r=request)
+
+         if request.vars.filename:
+-            filename = re.sub('[^\w\./]+', '_', request.vars.filename)
++            filename = re.sub(r'[^\w\./]+', '_', request.vars.filename)
+         else:
+             filename = os.path.split(request.vars.file.filename)[-1]
+
+@@ -1628,7 +1628,7 @@ def errors():
+
+         hash2error = dict()
+
+-        for fn in listdir(errors_path, '^[a-fA-F0-9.\-]+$'):
++        for fn in listdir(errors_path, r'^[a-fA-F0-9.\-]+$'):
+             fullpath = os.path.join(errors_path, fn)
+             if not os.path.isfile(fullpath):
+                 continue
+@@ -1727,7 +1727,7 @@ def errors():
+         func = lambda p: os.stat(apath('%s/errors/%s' %
+                                        (app, p), r=request)).st_mtime
+         tickets = sorted(
+-            listdir(apath('%s/errors/' % app, r=request), '^\w.*'),
++            listdir(apath('%s/errors/' % app, r=request), r'^\w.*'),
+             key=func,
+             reverse=True)
+
+diff --git a/gluon/compileapp.py b/gluon/compileapp.py
+index 45fa8a0e..be0446e1 100644
+--- a/gluon/compileapp.py
++++ b/gluon/compileapp.py
+@@ -14,7 +14,7 @@ Note:
+
+ import copy
+ import fnmatch
+-import imp
++from importlib import import_module
+ import marshal
+ import os
+ import py_compile
+@@ -345,7 +345,7 @@ def local_import_aux(name, reload_force=False, app="welcome"):
+     """
+     items = name.replace("/", ".")
+     name = "applications.%s.modules.%s" % (app, items)
+-    module = __import__(name)
++    module = import_module(name)
+     for item in name.split(".")[1:]:
+         module = getattr(module, item)
+     if reload_force:
+diff --git a/gluon/contrib/appconfig.py b/gluon/contrib/appconfig.py
+index 1160e08a..2bf81841 100644
+--- a/gluon/contrib/appconfig.py
++++ b/gluon/contrib/appconfig.py
+@@ -120,7 +120,7 @@ class AppConfigLoader(object):
+         self.read_config()
+
+     def read_config_ini(self):
+-        config = configparser.SafeConfigParser()
++        config = configparser.RawConfigParser()
+         config.read(self.file)
+         settings = {}
+         for section in config.sections():
+--
+2.45.1
+
diff --git a/package/python-web2py/Config.in b/package/python-web2py/Config.in
index bb455dfa7a..e4308634a0 100644
--- a/package/python-web2py/Config.in
+++ b/package/python-web2py/Config.in
@@ -17,6 +17,12 @@ if BR2_PACKAGE_PYTHON_WEB2PY
 config BR2_PACKAGE_PYTHON_WEB2PY_INSTALL_ADMIN
 	bool "install admin panel application"
 	default y
+	select BR2_PACKAGE_HOST_PYTHON3
+	# web2py will use pydal to generate the password (below), and that
+	# uses hashlib.pbkdf2_hmac(), which is only available when python
+	# is built with openssl since 3.12 (previously, there was a slow
+	# pure-python fallback, dropped in 3.12).
+	select BR2_PACKAGE_HOST_PYTHON3_SSL
 	help
 	  This option install web2py admin panel application.
 	  It can be removed to save space on embedded systems.
@@ -25,7 +31,7 @@ if BR2_PACKAGE_PYTHON_WEB2PY_INSTALL_ADMIN
 
 config BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD
 	string "admin panel password"
-	default web2py
+	default "web2py"
 	help
 	  Set the admin panel password.
 
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
