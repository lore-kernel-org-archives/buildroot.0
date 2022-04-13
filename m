Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD090C433FE
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 21:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5487283300;
	Wed, 13 Apr 2022 21:27:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iEIZb2roaPT7; Wed, 13 Apr 2022 21:27:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A65883123;
	Wed, 13 Apr 2022 21:27:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 362771BF3B9
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 21:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23D3483123
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 21:27:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SiCr-YhUUEXC for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 21:27:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AC888308A
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 21:27:52 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id x4so3373101iop.7
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 14:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PZXdAY8Wf4qbBNDnkzCUXqB7wrD7Y2pZ4WrryxobwF8=;
 b=Po2ngMqtSbJuXWelE5jj3BYfMnZlY8Y6kGTMnDnQVX6fhlNbg4lkm+xrN2SvY8a1Sp
 gN0xzaoxZbyp8KgMDVT0uyTuz11ABu8FoKf/JQl+d3AKS0O+dMjM5DelzT6lZTuiGvmy
 BJzfK1h16/JUekxHdCRxYMKJuEWrt9ZyfUK4WGh+g8rSxLrWbFYtPpV9j5u6lTjduGJL
 cMnHA2BYsmszF9vwBzMLLUfEiwyX6BR3S+/HpkYK44aLGaQDcJokEmte63iqPhiC7V6f
 Kxh9bPlYaG5W6n9iqA8QMo94dWk8Rf+139xe5kzBicXpshOCwhcgdE0HK506srv7EE+B
 qjqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PZXdAY8Wf4qbBNDnkzCUXqB7wrD7Y2pZ4WrryxobwF8=;
 b=SHIpv8Dm4BJPjhgdt/t9MCJYkJKUDd1nQYikWf9Ho0Wj8pTz+zq5VnnaFQO59Gg1LI
 KKcjHOve62QhAKTvI7yKK//2YT1fJ0Xjo7e8cxeG0sY3cmVX8g1lJu6bou5po/ijzzTF
 weFcA/W2dPDvT57KTNe0XEoy7HlRw52fVnJ8INWGUUU/8bdBcnrlckjU988sZ8SQ28+h
 8jQTQ6iy8R4WGT9dTIOes+0s87dzB2nUwI2r1QTrff1fR45Cj4HQceeFj3PnR2PvVDde
 ZMRXEctQupOQt5sj4uwfzx6WhiU0ECLzMLBlRrG+31k9DPZ/jKurj7OZy9kH1V9buJWm
 ulAw==
X-Gm-Message-State: AOAM531DXMCUrElk4OFjD+n+Ndswq1TWsiROFq+MJczKFmU8zmZlOvnM
 HryOfdafogInYJv4AXxd7+e8nsnY69vyBA==
X-Google-Smtp-Source: ABdhPJyZzuJGHSQ2oDHEZ7K6wNSOlO6+4q6jy5dT0gt2c5nLtNZ4oNK9ymTAGymPBnRAN0s5Cota0A==
X-Received: by 2002:a05:6638:22a2:b0:324:2e2d:d39a with SMTP id
 z2-20020a05663822a200b003242e2dd39amr16125678jas.271.1649885270768; 
 Wed, 13 Apr 2022 14:27:50 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 w2-20020a92c882000000b002c81bffee08sm39188ilo.55.2022.04.13.14.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 14:27:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 13 Apr 2022 15:27:45 -0600
Message-Id: <20220413212745.480101-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/1] scripts/autobuild-run: add
 --no-toolchains-csv option and drop docopt
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

Since docopt is unmaintained and less flexible than argparse lets
drop it and migrate to argparse.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - suppress --no-toolchains-csv default output from help
Changes v1 -> v2:
  - fix configparser
---
 scripts/autobuild-run      | 202 ++++++-------
 scripts/docopt.LICENSE-MIT |  23 --
 scripts/docopt.py          | 581 -------------------------------------
 3 files changed, 93 insertions(+), 713 deletions(-)
 delete mode 100644 scripts/docopt.LICENSE-MIT
 delete mode 100644 scripts/docopt.py

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 9219134..efe9858 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -57,56 +57,7 @@
 
 from __future__ import print_function
 
-# Don't tell docopt about the defaults, as it would not allow the following
-# priority hierarchy for arguments: command-line > config file > defaults
-defaults = {
-    '--ninstances': '1',
-    '--njobs': '1',
-    '--submitter': 'N/A',
-    '--make-opts': '',
-    '--nice': 0,
-    '--pid-file': '/tmp/buildroot-autobuild.pid',
-    '--http-url': 'http://autobuild.buildroot.org/',
-    '--toolchains-csv': 'support/config-fragments/autobuild/toolchain-configs.csv',
-    '--repo': 'https://github.com/buildroot/buildroot.git',
-}
-
-doc = """autobuild-run - run Buildroot autobuilder
-
-Usage: autobuild-run [options]
-
-Options:
-  -h, --help                     show this help message and exit
-  -V, --version                  show version
-  -n, --ninstances NINSTANCES    number of parallel instances
-                                 Defaults to %(--ninstances)s.
-  -j, --njobs NJOBS              number of parallel jobs
-                                 Defaults to %(--njobs)s.
-  --nice N                       Niceness, positive number
-                                 Defaults to %(--nice)s.
-  -s, --submitter SUBMITTER      name/machine of submitter
-                                 Defaults to %(--submitter)s.
-  --http-url URL                 URL of resource to submit your results.
-                                 Defaults to %(--http-url)s.
-  --http-login LOGIN             username to send results with
-                                 Not set by default.
-  --http-password PASSWORD       password to send results with (for security
-                                 reasons it is recommended to define this in the
-                                 config file instead, with user-read permissions
-                                 only)
-                                 Not set by default.
-  --make-opts OPTSTRING          string of extra options to pass to Buildroot
-                                 make, such as specific command wrappers
-                                 Empty by default.
-  --pid-file PATH                path to a file where to store the PID
-                                 Defaults to %(--pid-file)s.
-  -c, --config CONFIG            path to configuration file
-                                 Not set by default.
-  -d, --debug                    Send log output to stdout instead of log file
-  --toolchains-csv CSVFILE       Toolchain configuration file
-  -r, --repo URL                 URL of Buildroot repository to clone
-                                 Defaults to %(--repo)s
-
+epilog = """
 Format of the configuration file:
 
   All arguments can also be specified in the configuration file specified with
@@ -120,20 +71,18 @@ Format of the configuration file:
    http-login = <value>
    http-password = <value>
    submitter = <value>
-
-
-""" % defaults
-
-__doc__ = doc
+   no-toolchains-csv
+"""
 
 import contextlib
 import csv
-import docopt
+import argparse
 import errno
 import hashlib
 import mmap
 import multiprocessing
 import os
+import pathlib
 from random import randint
 import re
 import shutil
@@ -423,6 +372,8 @@ class Builder:
             if not os.path.isabs(toolchains_csv):
                 toolchains_csv = os.path.join(self.srcdir, toolchains_csv)
             args.extend(["--toolchains-csv", toolchains_csv])
+        else:
+            args.extend(["--no-toolchains-csv"])
 
         ret = subprocess.call(args, stdout=devnull, stderr=self.log)
         return ret
@@ -797,35 +748,20 @@ class Builder:
             except URLError as e:
                 sleep(30)
 
-# args / config file merging inspired by:
-# https://github.com/docopt/docopt/blob/master/examples/config_file_example.py
-
-def load_ini_config(configfile):
-    """Load configuration from file, returning a docopt-like dictionary"""
-
-    if not os.path.exists(configfile):
-        print("ERROR: configuration file %s does not exist" % configfile)
-        sys.exit(1)
-
-    config = configparser.RawConfigParser()
-    if not config.read(configfile):
-        print("ERROR: cannot parse configuration file %s" % configfile)
-        sys.exit(1)
-
-    # Prepend '--' to options specified in the config file, so they can be
-    # merged with those given on the command-line
-    return dict(('--%s' % key, value) for key, value in config.items('main'))
-
-
-def merge(dict_1, dict_2):
-    """Merge two dictionaries.
-
-    Values that evaluate to true take priority over falsy values.
-    `dict_1` takes priority over `dict_2`.
-
-    """
-    return dict((str(key), dict_1.get(key) or dict_2.get(key))
-                for key in set(dict_2) | set(dict_1))
+class Formatter(argparse.ArgumentDefaultsHelpFormatter, argparse.RawDescriptionHelpFormatter):
+    pass
+
+class LoadConfigFile(argparse.Action):
+    def __call__(self, parser, namespace, values, option_string=None):
+        config = configparser.RawConfigParser(allow_no_value=True)
+        config.read_file(values)
+        for k, v in config.items('main'):
+            key = k.replace("-", "_")
+            value = v
+            if key.startswith("no_") and value is None:
+                key = key[3:]
+                value = False
+            setattr(namespace, key, value)
 
 def main():
 
@@ -835,24 +771,72 @@ def main():
 
     sysinfo = SystemInfo()
 
-    args = docopt.docopt(doc, version=VERSION)
-
-    if args['--config']:
-        ini_config = load_ini_config(args['--config'])
-        # merge config/args, priority given to args
-        args = merge(args, ini_config)
-
-    # load in defaults at lowest priority
-    args = merge(args, defaults)
+    parser = argparse.ArgumentParser(description="Buildroot autobuilder",
+                                     epilog=epilog,
+                                     formatter_class=Formatter)
+    parser.add_argument("--ninstances", "-n",
+                        help="number of parallel instances",
+                        type=int, default=1)
+    parser.add_argument("--njobs", "-j",
+                        help="number of parallel jobs",
+                        type=int, default=1)
+    parser.add_argument("--nice",
+                        help="Niceness, positive number",
+                        type=int, default=0)
+    parser.add_argument("--submitter", "-s",
+                        help="name/machine of submitter",
+                        type=str, default='N/A')
+    parser.add_argument("--http-url",
+                        help="URL of resource to submit your results.",
+                        type=str, default='http://autobuild.buildroot.org/')
+    parser.add_argument("--http-login",
+                        help="username to send results with",
+                        type=str)
+    parser.add_argument("--http-password",
+                        help="password to send results with (for security "
+                             "reasons it is recommended to define this in the "
+                             "config file instead, with user-read permissions "
+                             "only)",
+                        type=str)
+    parser.add_argument("--make-opts",
+                        help="string of extra options to pass to Buildroot "
+                             "make, such as specific command wrappers",
+                        type=str)
+    parser.add_argument("--pid-file",
+                        help="path to a file where to store the PID",
+                        type=pathlib.Path, default=pathlib.Path("/tmp/buildroot-autobuild.pid"))
+    parser.add_argument("--config", "-c",
+                        help="path to configuration file",
+                        type=open, action=LoadConfigFile)
+    parser.add_argument("--debug", "-d",
+                        help="Send log output to stdout instead of log file",
+                        type=str)
+    toolchains_csv = parser.add_mutually_exclusive_group(required=False)
+    toolchains_csv.add_argument("--toolchains-csv",
+                                dest="toolchains_csv",
+                                help="Toolchain configuration file",
+                                type=pathlib.Path,
+                                default=pathlib.Path("support/config-fragments/autobuild/toolchain-configs.csv"))
+    toolchains_csv.add_argument("--no-toolchains-csv",
+                                dest="toolchains_csv",
+                                help="Generate random toolchain configuration",
+                                action='store_false',
+                                default=argparse.SUPPRESS)
+    parser.add_argument("--repo", "-r",
+                        help="URL of Buildroot repository to clone",
+                        type=str,
+                        default="https://github.com/buildroot/buildroot.git")
+
+    args = parser.parse_args()
 
     # Save our PID very early, so we can be stopped
-    with open(args['--pid-file'], "w+") as pidf:
+    with args.pid_file.open("w+") as pidf:
         pidf.write("%d" % os.getpid())
 
     # http_login/password could theoretically be allowed as empty, so check
     # explicitly on None.
-    upload = (args['--http-login'] is not None) \
-             and (args['--http-password'] is not None)
+    upload = (args.http_login is not None) \
+             and (args.http_password is not None)
     if upload:
         sysinfo.needed_progs.append("curl")
     else:
@@ -894,24 +878,24 @@ def main():
 
         sys.exit(1)
 
-    buildpid = multiprocessing.Array('i', int(args['--ninstances']))
+    buildpid = multiprocessing.Array('i', int(args.ninstances))
     processes = []
-    for i in range(0, int(args['--ninstances'])):
+    for i in range(0, int(args.ninstances)):
         builder = Builder(
             instance = i,
-            njobs = args['--njobs'],
+            njobs = args.njobs,
             sysinfo = sysinfo,
-            http_url = args['--http-url'],
-            http_login = args['--http-login'],
-            http_password = args['--http-password'],
-            submitter = args['--submitter'],
-            make_opts = (args['--make-opts'] or ''),
-            nice = (args['--nice'] or 0),
-            toolchains_csv = args['--toolchains-csv'],
-            repo = args['--repo'],
+            http_url = args.http_url,
+            http_login = args.http_login,
+            http_password = args.http_password,
+            submitter = args.submitter,
+            make_opts = (args.make_opts or ''),
+            nice = (args.nice or 0),
+            toolchains_csv = args.toolchains_csv,
+            repo = args.repo,
             upload = upload,
             buildpid = buildpid,
-            debug = args['--debug'])
+            debug = args.debug)
         p = multiprocessing.Process(target=builder.run_instance)
         p.start()
         processes.append(p)
diff --git a/scripts/docopt.LICENSE-MIT b/scripts/docopt.LICENSE-MIT
deleted file mode 100644
index 58ff1bc..0000000
--- a/scripts/docopt.LICENSE-MIT
+++ /dev/null
@@ -1,23 +0,0 @@
-Copyright (c) 2012 Vladimir Keleshev, <vladimir@keleshev.com>
-
-Permission is hereby granted, free of charge, to any person
-obtaining a copy of this software and associated
-documentation files (the "Software"), to deal in the Software
-without restriction, including without limitation the rights
-to use, copy, modify, merge, publish, distribute, sublicense,
-and/or sell copies of the Software, and to permit persons to
-whom the Software is furnished to do so, subject to the
-following conditions:
-
-The above copyright notice and this permission notice shall
-be included in all copies or substantial portions of the
-Software.
-
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
-KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
-WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
-PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
-COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
-OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
diff --git a/scripts/docopt.py b/scripts/docopt.py
deleted file mode 100644
index 2e43f7c..0000000
--- a/scripts/docopt.py
+++ /dev/null
@@ -1,581 +0,0 @@
-"""Pythonic command-line interface parser that will make you smile.
-
- * http://docopt.org
- * Repository and issue-tracker: https://github.com/docopt/docopt
- * Licensed under terms of MIT license (see LICENSE-MIT)
- * Copyright (c) 2013 Vladimir Keleshev, vladimir@keleshev.com
-
-"""
-import sys
-import re
-
-
-__all__ = ['docopt']
-__version__ = '0.6.1'
-
-
-class DocoptLanguageError(Exception):
-
-    """Error in construction of usage-message by developer."""
-
-
-class DocoptExit(SystemExit):
-
-    """Exit in case user invoked program with incorrect arguments."""
-
-    usage = ''
-
-    def __init__(self, message=''):
-        SystemExit.__init__(self, (message + '\n' + self.usage).strip())
-
-
-class Pattern(object):
-
-    def __eq__(self, other):
-        return repr(self) == repr(other)
-
-    def __hash__(self):
-        return hash(repr(self))
-
-    def fix(self):
-        self.fix_identities()
-        self.fix_repeating_arguments()
-        return self
-
-    def fix_identities(self, uniq=None):
-        """Make pattern-tree tips point to same object if they are equal."""
-        if not hasattr(self, 'children'):
-            return self
-        uniq = list(set(self.flat())) if uniq is None else uniq
-        for i, child in enumerate(self.children):
-            if not hasattr(child, 'children'):
-                assert child in uniq
-                self.children[i] = uniq[uniq.index(child)]
-            else:
-                child.fix_identities(uniq)
-
-    def fix_repeating_arguments(self):
-        """Fix elements that should accumulate/increment values."""
-        either = [list(child.children) for child in transform(self).children]
-        for case in either:
-            for e in [child for child in case if case.count(child) > 1]:
-                if type(e) is Argument or type(e) is Option and e.argcount:
-                    if e.value is None:
-                        e.value = []
-                    elif type(e.value) is not list:
-                        e.value = e.value.split()
-                if type(e) is Command or type(e) is Option and e.argcount == 0:
-                    e.value = 0
-        return self
-
-
-def transform(pattern):
-    """Expand pattern into an (almost) equivalent one, but with single Either.
-
-    Example: ((-a | -b) (-c | -d)) => (-a -c | -a -d | -b -c | -b -d)
-    Quirks: [-a] => (-a), (-a...) => (-a -a)
-
-    """
-    result = []
-    groups = [[pattern]]
-    while groups:
-        children = groups.pop(0)
-        parents = [Required, Optional, OptionsShortcut, Either, OneOrMore]
-        if any(t in map(type, children) for t in parents):
-            child = [c for c in children if type(c) in parents][0]
-            children.remove(child)
-            if type(child) is Either:
-                for c in child.children:
-                    groups.append([c] + children)
-            elif type(child) is OneOrMore:
-                groups.append(child.children * 2 + children)
-            else:
-                groups.append(child.children + children)
-        else:
-            result.append(children)
-    return Either(*[Required(*e) for e in result])
-
-
-class LeafPattern(Pattern):
-
-    """Leaf/terminal node of a pattern tree."""
-
-    def __init__(self, name, value=None):
-        self.name, self.value = name, value
-
-    def __repr__(self):
-        return '%s(%r, %r)' % (self.__class__.__name__, self.name, self.value)
-
-    def flat(self, *types):
-        return [self] if not types or type(self) in types else []
-
-    def match(self, left, collected=None):
-        collected = [] if collected is None else collected
-        pos, match = self.single_match(left)
-        if match is None:
-            return False, left, collected
-        left_ = left[:pos] + left[pos + 1:]
-        same_name = [a for a in collected if a.name == self.name]
-        if type(self.value) in (int, list):
-            if type(self.value) is int:
-                increment = 1
-            else:
-                increment = ([match.value] if type(match.value) is str
-                             else match.value)
-            if not same_name:
-                match.value = increment
-                return True, left_, collected + [match]
-            same_name[0].value += increment
-            return True, left_, collected
-        return True, left_, collected + [match]
-
-
-class BranchPattern(Pattern):
-
-    """Branch/inner node of a pattern tree."""
-
-    def __init__(self, *children):
-        self.children = list(children)
-
-    def __repr__(self):
-        return '%s(%s)' % (self.__class__.__name__,
-                           ', '.join(repr(a) for a in self.children))
-
-    def flat(self, *types):
-        if type(self) in types:
-            return [self]
-        return sum([child.flat(*types) for child in self.children], [])
-
-
-class Argument(LeafPattern):
-
-    def single_match(self, left):
-        for n, pattern in enumerate(left):
-            if type(pattern) is Argument:
-                return n, Argument(self.name, pattern.value)
-        return None, None
-
-    @classmethod
-    def parse(class_, source):
-        name = re.findall('(<\S*?>)', source)[0]
-        value = re.findall('\[default: (.*)\]', source, flags=re.I)
-        return class_(name, value[0] if value else None)
-
-
-class Command(Argument):
-
-    def __init__(self, name, value=False):
-        self.name, self.value = name, value
-
-    def single_match(self, left):
-        for n, pattern in enumerate(left):
-            if type(pattern) is Argument:
-                if pattern.value == self.name:
-                    return n, Command(self.name, True)
-                else:
-                    break
-        return None, None
-
-
-class Option(LeafPattern):
-
-    def __init__(self, short=None, long=None, argcount=0, value=False):
-        assert argcount in (0, 1)
-        self.short, self.long, self.argcount = short, long, argcount
-        self.value = None if value is False and argcount else value
-
-    @classmethod
-    def parse(class_, option_description):
-        short, long, argcount, value = None, None, 0, False
-        options, _, description = option_description.strip().partition('  ')
-        options = options.replace(',', ' ').replace('=', ' ')
-        for s in options.split():
-            if s.startswith('--'):
-                long = s
-            elif s.startswith('-'):
-                short = s
-            else:
-                argcount = 1
-        if argcount:
-            matched = re.findall('\[default: (.*)\]', description, flags=re.I)
-            value = matched[0] if matched else None
-        return class_(short, long, argcount, value)
-
-    def single_match(self, left):
-        for n, pattern in enumerate(left):
-            if self.name == pattern.name:
-                return n, pattern
-        return None, None
-
-    @property
-    def name(self):
-        return self.long or self.short
-
-    def __repr__(self):
-        return 'Option(%r, %r, %r, %r)' % (self.short, self.long,
-                                           self.argcount, self.value)
-
-
-class Required(BranchPattern):
-
-    def match(self, left, collected=None):
-        collected = [] if collected is None else collected
-        l = left
-        c = collected
-        for pattern in self.children:
-            matched, l, c = pattern.match(l, c)
-            if not matched:
-                return False, left, collected
-        return True, l, c
-
-
-class Optional(BranchPattern):
-
-    def match(self, left, collected=None):
-        collected = [] if collected is None else collected
-        for pattern in self.children:
-            m, left, collected = pattern.match(left, collected)
-        return True, left, collected
-
-
-class OptionsShortcut(Optional):
-
-    """Marker/placeholder for [options] shortcut."""
-
-
-class OneOrMore(BranchPattern):
-
-    def match(self, left, collected=None):
-        assert len(self.children) == 1
-        collected = [] if collected is None else collected
-        l = left
-        c = collected
-        l_ = None
-        matched = True
-        times = 0
-        while matched:
-            # could it be that something didn't match but changed l or c?
-            matched, l, c = self.children[0].match(l, c)
-            times += 1 if matched else 0
-            if l_ == l:
-                break
-            l_ = l
-        if times >= 1:
-            return True, l, c
-        return False, left, collected
-
-
-class Either(BranchPattern):
-
-    def match(self, left, collected=None):
-        collected = [] if collected is None else collected
-        outcomes = []
-        for pattern in self.children:
-            matched, _, _ = outcome = pattern.match(left, collected)
-            if matched:
-                outcomes.append(outcome)
-        if outcomes:
-            return min(outcomes, key=lambda outcome: len(outcome[1]))
-        return False, left, collected
-
-
-class Tokens(list):
-
-    def __init__(self, source, error=DocoptExit):
-        self += source.split() if hasattr(source, 'split') else source
-        self.error = error
-
-    @staticmethod
-    def from_pattern(source):
-        source = re.sub(r'([\[\]\(\)\|]|\.\.\.)', r' \1 ', source)
-        source = [s for s in re.split('\s+|(\S*<.*?>)', source) if s]
-        return Tokens(source, error=DocoptLanguageError)
-
-    def move(self):
-        return self.pop(0) if len(self) else None
-
-    def current(self):
-        return self[0] if len(self) else None
-
-
-def parse_long(tokens, options):
-    """long ::= '--' chars [ ( ' ' | '=' ) chars ] ;"""
-    long, eq, value = tokens.move().partition('=')
-    assert long.startswith('--')
-    value = None if eq == value == '' else value
-    similar = [o for o in options if o.long == long]
-    if tokens.error is DocoptExit and similar == []:  # if no exact match
-        similar = [o for o in options if o.long and o.long.startswith(long)]
-    if len(similar) > 1:  # might be simply specified ambiguously 2+ times?
-        raise tokens.error('%s is not a unique prefix: %s?' %
-                           (long, ', '.join(o.long for o in similar)))
-    elif len(similar) < 1:
-        argcount = 1 if eq == '=' else 0
-        o = Option(None, long, argcount)
-        options.append(o)
-        if tokens.error is DocoptExit:
-            o = Option(None, long, argcount, value if argcount else True)
-    else:
-        o = Option(similar[0].short, similar[0].long,
-                   similar[0].argcount, similar[0].value)
-        if o.argcount == 0:
-            if value is not None:
-                raise tokens.error('%s must not have an argument' % o.long)
-        else:
-            if value is None:
-                if tokens.current() in [None, '--']:
-                    raise tokens.error('%s requires argument' % o.long)
-                value = tokens.move()
-        if tokens.error is DocoptExit:
-            o.value = value if value is not None else True
-    return [o]
-
-
-def parse_shorts(tokens, options):
-    """shorts ::= '-' ( chars )* [ [ ' ' ] chars ] ;"""
-    token = tokens.move()
-    assert token.startswith('-') and not token.startswith('--')
-    left = token.lstrip('-')
-    parsed = []
-    while left != '':
-        short, left = '-' + left[0], left[1:]
-        similar = [o for o in options if o.short == short]
-        if len(similar) > 1:
-            raise tokens.error('%s is specified ambiguously %d times' %
-                               (short, len(similar)))
-        elif len(similar) < 1:
-            o = Option(short, None, 0)
-            options.append(o)
-            if tokens.error is DocoptExit:
-                o = Option(short, None, 0, True)
-        else:  # why copying is necessary here?
-            o = Option(short, similar[0].long,
-                       similar[0].argcount, similar[0].value)
-            value = None
-            if o.argcount != 0:
-                if left == '':
-                    if tokens.current() in [None, '--']:
-                        raise tokens.error('%s requires argument' % short)
-                    value = tokens.move()
-                else:
-                    value = left
-                    left = ''
-            if tokens.error is DocoptExit:
-                o.value = value if value is not None else True
-        parsed.append(o)
-    return parsed
-
-
-def parse_pattern(source, options):
-    tokens = Tokens.from_pattern(source)
-    result = parse_expr(tokens, options)
-    if tokens.current() is not None:
-        raise tokens.error('unexpected ending: %r' % ' '.join(tokens))
-    return Required(*result)
-
-
-def parse_expr(tokens, options):
-    """expr ::= seq ( '|' seq )* ;"""
-    seq = parse_seq(tokens, options)
-    if tokens.current() != '|':
-        return seq
-    result = [Required(*seq)] if len(seq) > 1 else seq
-    while tokens.current() == '|':
-        tokens.move()
-        seq = parse_seq(tokens, options)
-        result += [Required(*seq)] if len(seq) > 1 else seq
-    return [Either(*result)] if len(result) > 1 else result
-
-
-def parse_seq(tokens, options):
-    """seq ::= ( atom [ '...' ] )* ;"""
-    result = []
-    while tokens.current() not in [None, ']', ')', '|']:
-        atom = parse_atom(tokens, options)
-        if tokens.current() == '...':
-            atom = [OneOrMore(*atom)]
-            tokens.move()
-        result += atom
-    return result
-
-
-def parse_atom(tokens, options):
-    """atom ::= '(' expr ')' | '[' expr ']' | 'options'
-             | long | shorts | argument | command ;
-    """
-    token = tokens.current()
-    result = []
-    if token in '([':
-        tokens.move()
-        matching, pattern = {'(': [')', Required], '[': [']', Optional]}[token]
-        result = pattern(*parse_expr(tokens, options))
-        if tokens.move() != matching:
-            raise tokens.error("unmatched '%s'" % token)
-        return [result]
-    elif token == 'options':
-        tokens.move()
-        return [OptionsShortcut()]
-    elif token.startswith('--') and token != '--':
-        return parse_long(tokens, options)
-    elif token.startswith('-') and token not in ('-', '--'):
-        return parse_shorts(tokens, options)
-    elif token.startswith('<') and token.endswith('>') or token.isupper():
-        return [Argument(tokens.move())]
-    else:
-        return [Command(tokens.move())]
-
-
-def parse_argv(tokens, options, options_first=False):
-    """Parse command-line argument vector.
-
-    If options_first:
-        argv ::= [ long | shorts ]* [ argument ]* [ '--' [ argument ]* ] ;
-    else:
-        argv ::= [ long | shorts | argument ]* [ '--' [ argument ]* ] ;
-
-    """
-    parsed = []
-    while tokens.current() is not None:
-        if tokens.current() == '--':
-            return parsed + [Argument(None, v) for v in tokens]
-        elif tokens.current().startswith('--'):
-            parsed += parse_long(tokens, options)
-        elif tokens.current().startswith('-') and tokens.current() != '-':
-            parsed += parse_shorts(tokens, options)
-        elif options_first:
-            return parsed + [Argument(None, v) for v in tokens]
-        else:
-            parsed.append(Argument(None, tokens.move()))
-    return parsed
-
-
-def parse_defaults(doc):
-    defaults = []
-    for s in parse_section('options:', doc):
-        # FIXME corner case "bla: options: --foo"
-        _, _, s = s.partition(':')  # get rid of "options:"
-        split = re.split('\n[ \t]*(-\S+?)', '\n' + s)[1:]
-        split = [s1 + s2 for s1, s2 in zip(split[::2], split[1::2])]
-        options = [Option.parse(s) for s in split if s.startswith('-')]
-        defaults += options
-    return defaults
-
-
-def parse_section(name, source):
-    pattern = re.compile('^([^\n]*' + name + '[^\n]*\n?(?:[ \t].*?(?:\n|$))*)',
-                         re.IGNORECASE | re.MULTILINE)
-    return [s.strip() for s in pattern.findall(source)]
-
-
-def formal_usage(section):
-    _, _, section = section.partition(':')  # drop "usage:"
-    pu = section.split()
-    return '( ' + ' '.join(') | (' if s == pu[0] else s for s in pu[1:]) + ' )'
-
-
-def extras(help, version, options, doc):
-    if help and any((o.name in ('-h', '--help')) and o.value for o in options):
-        print(doc.strip("\n"))
-        sys.exit()
-    if version and any(o.name == '--version' and o.value for o in options):
-        print(version)
-        sys.exit()
-
-
-class Dict(dict):
-    def __repr__(self):
-        return '{%s}' % ',\n '.join('%r: %r' % i for i in sorted(self.items()))
-
-
-def docopt(doc, argv=None, help=True, version=None, options_first=False):
-    """Parse `argv` based on command-line interface described in `doc`.
-
-    `docopt` creates your command-line interface based on its
-    description that you pass as `doc`. Such description can contain
-    --options, <positional-argument>, commands, which could be
-    [optional], (required), (mutually | exclusive) or repeated...
-
-    Parameters
-    ----------
-    doc : str
-        Description of your command-line interface.
-    argv : list of str, optional
-        Argument vector to be parsed. sys.argv[1:] is used if not
-        provided.
-    help : bool (default: True)
-        Set to False to disable automatic help on -h or --help
-        options.
-    version : any object
-        If passed, the object will be printed if --version is in
-        `argv`.
-    options_first : bool (default: False)
-        Set to True to require options precede positional arguments,
-        i.e. to forbid options and positional arguments intermix.
-
-    Returns
-    -------
-    args : dict
-        A dictionary, where keys are names of command-line elements
-        such as e.g. "--verbose" and "<path>", and values are the
-        parsed values of those elements.
-
-    Example
-    -------
-    >>> from docopt import docopt
-    >>> doc = '''
-    ... Usage:
-    ...     my_program tcp <host> <port> [--timeout=<seconds>]
-    ...     my_program serial <port> [--baud=<n>] [--timeout=<seconds>]
-    ...     my_program (-h | --help | --version)
-    ...
-    ... Options:
-    ...     -h, --help  Show this screen and exit.
-    ...     --baud=<n>  Baudrate [default: 9600]
-    ... '''
-    >>> argv = ['tcp', '127.0.0.1', '80', '--timeout', '30']
-    >>> docopt(doc, argv)
-    {'--baud': '9600',
-     '--help': False,
-     '--timeout': '30',
-     '--version': False,
-     '<host>': '127.0.0.1',
-     '<port>': '80',
-     'serial': False,
-     'tcp': True}
-
-    See also
-    --------
-    * For video introduction see http://docopt.org
-    * Full documentation is available in README.rst as well as online
-      at https://github.com/docopt/docopt#readme
-
-    """
-    argv = sys.argv[1:] if argv is None else argv
-
-    usage_sections = parse_section('usage:', doc)
-    if len(usage_sections) == 0:
-        raise DocoptLanguageError('"usage:" (case-insensitive) not found.')
-    if len(usage_sections) > 1:
-        raise DocoptLanguageError('More than one "usage:" (case-insensitive).')
-    DocoptExit.usage = usage_sections[0]
-
-    options = parse_defaults(doc)
-    pattern = parse_pattern(formal_usage(DocoptExit.usage), options)
-    # [default] syntax for argument is disabled
-    #for a in pattern.flat(Argument):
-    #    same_name = [d for d in arguments if d.name == a.name]
-    #    if same_name:
-    #        a.value = same_name[0].value
-    argv = parse_argv(Tokens(argv), list(options), options_first)
-    pattern_options = set(pattern.flat(Option))
-    for options_shortcut in pattern.flat(OptionsShortcut):
-        doc_options = parse_defaults(doc)
-        options_shortcut.children = list(set(doc_options) - pattern_options)
-        #if any_options:
-        #    options_shortcut.children += [Option(o.short, o.long, o.argcount)
-        #                    for o in argv if type(o) is Option]
-    extras(help, version, argv, doc)
-    matched, left, collected = pattern.fix().match(argv)
-    if matched and left == []:  # better error message if left?
-        return Dict((a.name, a.value) for a in (pattern.flat() + collected))
-    raise DocoptExit()
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
