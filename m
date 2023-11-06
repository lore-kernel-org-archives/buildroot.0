Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79521C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35E1840971;
	Mon,  6 Nov 2023 22:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35E1840971
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z5y1EMAStygy; Mon,  6 Nov 2023 22:27:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB86742132;
	Mon,  6 Nov 2023 22:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB86742132
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D72F41BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D215141667
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D215141667
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J1gRDpd1m0dd for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:20:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBB9341633
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBB9341633
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB9C686B7A; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 23:15:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc7d6021d1474dad8d7e1d1bb643fd41ce865f01
X-Git-Newrev: 38d8739a8495d6adf3f5d231bb4e8f37ed797f5f
X-Patchwork-Hint: ignore
Message-Id: <20231106222017.BB9C686B7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gpiozero: bump to version
 2.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=38d8739a8495d6adf3f5d231bb4e8f37ed797f5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is now upstream.

Migrate to pypi based sources.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Migrate-to-setup.cfg.patch                | 855 ---------------------
 package/python-gpiozero/python-gpiozero.hash       |   7 +-
 package/python-gpiozero/python-gpiozero.mk         |   5 +-
 3 files changed, 7 insertions(+), 860 deletions(-)

diff --git a/package/python-gpiozero/0001-Migrate-to-setup.cfg.patch b/package/python-gpiozero/0001-Migrate-to-setup.cfg.patch
deleted file mode 100644
index 090bcbc4a3..0000000000
--- a/package/python-gpiozero/0001-Migrate-to-setup.cfg.patch
+++ /dev/null
@@ -1,855 +0,0 @@
-From d56ca0ee4fde7fa4ad82a532f9ea387f9f33d389 Mon Sep 17 00:00:00 2001
-From: Dave Jones <dave@waveform.org.uk>
-Date: Tue, 16 Mar 2021 17:52:49 +0000
-Subject: [PATCH] Migrate to setup.cfg
-
-(cherry picked from commit b167bef82c3bf2739707f062b35fcabbb9cc11ad)
-
-setup.cfg seems to be mandatory since (at least) setuptools 67.8.0
-otherwise gpiozero dependencies are not properly detected
-
-File "/builds/buildroot.org/buildroot/test-output/TestPythonPy3Gpiozero/host/lib/python3.11/site-packages/pkg_resources/__init__.py",
-line 868, in _resolve_dist
-    raise DistributionNotFound(req, requirers)
-pkg_resources.DistributionNotFound: The 'colorzero' distribution was not found
-and is required by the application
-
-Upstream: https://github.com/gpiozero/gpiozero/commit/b167bef82c3bf2739707f062b35fcabbb9cc11ad
-
-See:
-http://lists.busybox.net/pipermail/buildroot/2023-June/669207.html
-
-[Romain: rebase on 1.6.2]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- MANIFEST.in    |   4 --
- Makefile       |  88 +++++---------------------------
- copyrights     |  56 +++++++++++---------
- copyrights.cfg |  11 ----
- coverage.cfg   |  18 -------
- docs/conf.py   |  99 +++++++++++++++--------------------
- setup.cfg      |  98 +++++++++++++++++++++++++++++++++++
- setup.py       | 136 +++++--------------------------------------------
- 8 files changed, 196 insertions(+), 314 deletions(-)
- delete mode 100644 MANIFEST.in
- delete mode 100644 copyrights.cfg
- delete mode 100644 coverage.cfg
- create mode 100644 setup.cfg
-
-diff --git a/MANIFEST.in b/MANIFEST.in
-deleted file mode 100644
-index bb562ea..0000000
---- a/MANIFEST.in
-+++ /dev/null
-@@ -1,4 +0,0 @@
--include README.rst
--recursive-include gpiozero/fonts *.txt
--recursive-include tests *.py
--include LICENSE.rst
-diff --git a/Makefile b/Makefile
-index c9ddd90..264a73c 100644
---- a/Makefile
-+++ b/Makefile
-@@ -4,44 +4,18 @@
- PYTHON=python
- PIP=pip
- PYTEST=py.test
--COVERAGE=coverage
- TWINE=twine
- PYFLAGS=
- DEST_DIR=/
- 
--# Horrid hack to ensure setuptools is installed in our python environment. This
--# is necessary with Python 3.3's venvs which don't install it by default.
--ifeq ($(shell python -c "import setuptools" 2>&1),)
--SETUPTOOLS:=
--else
--SETUPTOOLS:=$(shell wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py -O - | $(PYTHON))
--endif
--
- # Calculate the base names of the distribution, the location of all source,
- # documentation, packaging, icon, and executable script files
- NAME:=$(shell $(PYTHON) $(PYFLAGS) setup.py --name)
- VER:=$(shell $(PYTHON) $(PYFLAGS) setup.py --version)
--ifeq ($(shell lsb_release -si),Ubuntu)
--DEB_SUFFIX:=ubuntu1
--else
--DEB_SUFFIX:=
--endif
--DEB_ARCH:=$(shell dpkg --print-architecture)
- PYVER:=$(shell $(PYTHON) $(PYFLAGS) -c "import sys; print('py%d.%d' % sys.version_info[:2])")
- PY_SOURCES:=$(shell \
- 	$(PYTHON) $(PYFLAGS) setup.py egg_info >/dev/null 2>&1 && \
- 	grep -v "\.egg-info" $(NAME).egg-info/SOURCES.txt)
--DEB_SOURCES:=debian/changelog \
--	debian/control \
--	debian/copyright \
--	debian/rules \
--	debian/docs \
--	$(wildcard debian/*.init) \
--	$(wildcard debian/*.default) \
--	$(wildcard debian/*.manpages) \
--	$(wildcard debian/*.docs) \
--	$(wildcard debian/*.doc-base) \
--	$(wildcard debian/*.desktop)
- DOC_SOURCES:=docs/conf.py \
- 	$(wildcard docs/*.png) \
- 	$(wildcard docs/*.svg) \
-@@ -56,17 +30,6 @@ SUBDIRS:=
- DIST_WHEEL=dist/$(NAME)-$(VER)-py2.py3-none-any.whl
- DIST_TAR=dist/$(NAME)-$(VER).tar.gz
- DIST_ZIP=dist/$(NAME)-$(VER).zip
--DIST_DEB=dist/python-$(NAME)_$(VER)$(DEB_SUFFIX)_all.deb \
--	dist/python3-$(NAME)_$(VER)$(DEB_SUFFIX)_all.deb \
--	dist/python-$(NAME)-doc_$(VER)$(DEB_SUFFIX)_all.deb \
--	dist/$(NAME)_$(VER)$(DEB_SUFFIX)_$(DEB_ARCH).build \
--	dist/$(NAME)_$(VER)$(DEB_SUFFIX)_$(DEB_ARCH).buildinfo \
--	dist/$(NAME)_$(VER)$(DEB_SUFFIX)_$(DEB_ARCH).changes
--DIST_DSC=dist/$(NAME)_$(VER)$(DEB_SUFFIX).tar.xz \
--	dist/$(NAME)_$(VER)$(DEB_SUFFIX).dsc \
--	dist/$(NAME)_$(VER)$(DEB_SUFFIX)_source.build \
--	dist/$(NAME)_$(VER)$(DEB_SUFFIX)_source.buildinfo \
--	dist/$(NAME)_$(VER)$(DEB_SUFFIX)_source.changes
- 
- 
- # Default target
-@@ -76,10 +39,9 @@ all:
- 	@echo "make test - Run tests"
- 	@echo "make doc - Generate HTML and PDF documentation"
- 	@echo "make source - Create source package"
--	@echo "make egg - Generate a PyPI egg package"
-+	@echo "make wheel - Generate a PyPI wheel package"
- 	@echo "make zip - Generate a source zip package"
- 	@echo "make tar - Generate a source tar package"
--	@echo "make deb - Generate Debian packages"
- 	@echo "make dist - Generate all packages"
- 	@echo "make clean - Get rid of all generated files"
- 	@echo "make release - Create and tag a new release"
-@@ -102,9 +64,7 @@ zip: $(DIST_ZIP)
- 
- tar: $(DIST_TAR)
- 
--deb: $(DIST_DEB) $(DIST_DSC)
--
--dist: $(DIST_WHEEL) $(DIST_DEB) $(DIST_DSC) $(DIST_TAR) $(DIST_ZIP)
-+dist: $(DIST_WHEEL) $(DIST_TAR) $(DIST_ZIP)
- 
- develop: 
- 	@# These have to be done separately to avoid a cockup...
-@@ -113,18 +73,17 @@ develop:
- 	$(PIP) install -e .[doc,test]
- 
- test:
--	$(COVERAGE) run --rcfile coverage.cfg -m $(PYTEST) tests -v -r sx
--	$(COVERAGE) report --rcfile coverage.cfg
-+	$(PYTEST) tests
- 
- clean:
--	dh_clean
--	rm -fr dist/ $(NAME).egg-info/ tags
-+	rm -fr dist/ build/ .pytest_cache/ .mypy_cache/ $(NAME).egg-info/ tags .coverage
- 	for dir in $(SUBDIRS); do \
- 		$(MAKE) -C $$dir clean; \
- 	done
-+	find $(CURDIR) -name "*.pyc" -delete
- 
- tags: $(PY_SOURCES)
--	ctags -R --exclude="build/*" --exclude="debian/*" --exclude="docs/*" --languages="Python"
-+	ctags -R --exclude="build/*" --exclude="docs/*" --languages="Python"
- 
- $(SUBDIRS):
- 	$(MAKE) -C $@
-@@ -138,37 +97,14 @@ $(DIST_ZIP): $(PY_SOURCES) $(SUBDIRS)
- $(DIST_WHEEL): $(PY_SOURCES) $(SUBDIRS)
- 	$(PYTHON) $(PYFLAGS) setup.py bdist_wheel --universal
- 
--$(DIST_DEB): $(PY_SOURCES) $(SUBDIRS) $(DEB_SOURCES) $(DIST_TAR)
--	cp $(DIST_TAR) ../$(NAME)_$(VER).orig.tar.gz
--	debuild -b
--	mkdir -p dist/
--	for f in $(DIST_DEB); do cp ../$${f##*/} dist/; done
--
--$(DIST_DSC): $(PY_SOURCES) $(SUBDIRS) $(DEB_SOURCES) $(DIST_TAR)
--	cp $(DIST_TAR) ../$(NAME)_$(VER).orig.tar.gz
--	debuild -S
--	mkdir -p dist/
--	for f in $(DIST_DSC); do cp ../$${f##*/} dist/; done
--
--copyrights: $(PY_SOURCES) $(DOC_SOURCES)
--	./copyrights
--
--changelog: $(PY_SOURCES) $(DOC_SOURCES) $(DEB_SOURCES)
-+release:
- 	$(MAKE) clean
--	# ensure there are no current uncommitted changes
- 	test -z "$(shell git status --porcelain)"
--	# update the debian changelog with new release information
--	dch --newversion $(VER)$(DEB_SUFFIX)
--	# commit the changes and add a new tag
--	git commit debian/changelog -m "Updated changelog for release $(VER)"
--
--release: $(DIST_DEB) $(DIST_DSC) $(DIST_TAR) $(DIST_WHEEL)
- 	git tag -s v$(VER) -m "Release v$(VER)"
--	git push --tags
--	# build a source archive and upload to PyPI
-+	git push origin v$(VER)
-+
-+upload: $(DIST_TAR) $(DIST_WHEEL)
-+	$(TWINE) check $(DIST_TAR) $(DIST_WHEEL)
- 	$(TWINE) upload $(DIST_TAR) $(DIST_WHEEL)
--	# build the deb source archive and upload to Raspbian
--	dput raspberrypi dist/$(NAME)_$(VER)$(DEB_SUFFIX)_source.changes
--	dput raspberrypi dist/$(NAME)_$(VER)$(DEB_SUFFIX)_$(DEB_ARCH).changes
- 
--.PHONY: all install develop test doc source egg wheel zip tar deb dist clean tags release upload $(SUBDIRS)
-+.PHONY: all install develop test doc source wheel zip tar dist clean tags release upload $(SUBDIRS)
-diff --git a/copyrights b/copyrights
-index b709fc8..2f14e78 100755
---- a/copyrights
-+++ b/copyrights
-@@ -6,10 +6,13 @@ derives the authorship and copyright years information from the git history
- of the project; hence, this script must be run within a git repository.
- """
- 
-+from __future__ import annotations
-+
- import os
- import sys
- assert sys.version_info >= (3, 6), 'Script requires Python 3.6+'
- import tempfile
-+import typing as t
- from argparse import ArgumentParser, Namespace
- from configparser import ConfigParser
- from operator import attrgetter
-@@ -18,14 +21,13 @@ from datetime import datetime
- from subprocess import Popen, PIPE, DEVNULL
- from pathlib import Path
- from fnmatch import fnmatch
--from typing import NamedTuple, Iterator, List, Tuple, Set, Union, Optional
- 
- 
- SPDX_PREFIX = 'SPDX-License-Identifier:'
- COPYRIGHT_PREFIX = 'Copyright (c)'
- 
- 
--def main(args: List[str] = None):
-+def main(args: t.List[str] = None):
-     if args is None:
-         args = sys.argv[1:]
-     config = get_config(args)
-@@ -41,7 +43,7 @@ def main(args: List[str] = None):
-                     target.write(chunk)
- 
- 
--def get_config(args: List[str]) -> Namespace:
-+def get_config(args: t.List[str]) -> Namespace:
-     config = ConfigParser(
-         defaults={
-             'include': '**/*',
-@@ -52,10 +54,10 @@ def get_config(args: List[str]) -> Namespace:
-             'spdx_prefix': SPDX_PREFIX,
-             'copy_prefix': COPYRIGHT_PREFIX,
-         },
--        delimiters=('=',), default_section='settings',
-+        delimiters=('=',), default_section='copyrights:settings',
-         empty_lines_in_values=False, interpolation=None,
-         converters={'list': lambda s: s.strip().splitlines() })
--    config.read('copyrights.cfg')
-+    config.read('setup.cfg')
-     sect = config[config.default_section]
- 
-     parser = ArgumentParser(description=__doc__)
-@@ -113,10 +115,10 @@ def get_config(args: List[str]) -> Namespace:
-     return ns
- 
- 
--class Copyright(NamedTuple):
-+class Copyright(t.NamedTuple):
-     author: str
-     email:  str
--    years:  Set[int]
-+    years:  t.Set[int]
- 
-     def __str__(self):
-         if len(self.years) > 1:
-@@ -126,8 +128,8 @@ class Copyright(NamedTuple):
-         return f'{years} {self.author} <{self.email}>'
- 
- 
--def get_copyrights(include: Set[str], exclude: Set[str])\
--        -> Iterator[Tuple[Path, List[Copyright]]]:
-+def get_copyrights(include: t.Set[str], exclude: t.Set[str])\
-+        -> t.Iterator[t.Tuple[Path, t.Container[Copyright]]]:
-     sorted_blame = sorted(
-         get_contributions(include, exclude),
-         key=lambda c: (c.path, c.author, c.email)
-@@ -147,15 +149,15 @@ def get_copyrights(include: Set[str], exclude: Set[str])\
-         yield path, copyrights
- 
- 
--class Contribution(NamedTuple):
-+class Contribution(t.NamedTuple):
-     author: str
-     email:  str
-     year:   int
-     path:   Path
- 
- 
--def get_contributions(include: Set[str], exclude: Set[str])\
--        -> Iterator[Contribution]:
-+def get_contributions(include: t.Set[str], exclude: t.Set[str])\
-+        -> t.Iterator[Contribution]:
-     for path in get_source_paths(include, exclude):
-         blame = Popen(
-             ['git', 'blame', '--line-porcelain', 'HEAD', '--', str(path)],
-@@ -186,7 +188,8 @@ def get_contributions(include: Set[str], exclude: Set[str])\
-         assert blame.returncode == 0
- 
- 
--def get_source_paths(include: Set[str], exclude: Set[str]) -> Iterator[Path]:
-+def get_source_paths(include: t.Set[str], exclude: t.Set[str])\
-+        -> t.Iterator[Path]:
-     ls_tree = Popen(
-         ['git', 'ls-tree', '-r', '--name-only', 'HEAD'],
-         stdout=PIPE, stderr=DEVNULL, universal_newlines=True)
-@@ -203,9 +206,9 @@ def get_source_paths(include: Set[str], exclude: Set[str]) -> Iterator[Path]:
-     assert ls_tree.returncode == 0
- 
- 
--class License(NamedTuple):
--    ident: Optional[str]
--    text:  List[str]
-+class License(t.NamedTuple):
-+    ident: t.Optional[str]
-+    text:  t.List[str]
- 
- 
- def get_license(path: Path, *, spdx_prefix: str = SPDX_PREFIX) -> License:
-@@ -253,20 +256,26 @@ class CopyWriter:
-         '.sql': '--',
-     }
- 
--    def __init__(self, license='LICENSE.txt', preamble=(),
--                 spdx_prefix=SPDX_PREFIX, copy_prefix=COPYRIGHT_PREFIX):
-+    def __init__(self, license: Path=Path('LICENSE.txt'),
-+                 preamble: t.List[str]=None,
-+                 spdx_prefix: str=SPDX_PREFIX,
-+                 copy_prefix: str=COPYRIGHT_PREFIX):
-+        if preamble is None:
-+            preamble = []
-         self.license = get_license(license, spdx_prefix=spdx_prefix)
-         self.preamble = preamble
-         self.spdx_prefix = spdx_prefix
-         self.copy_prefix = copy_prefix
- 
-     @classmethod
--    def from_config(cls, config):
-+    def from_config(cls, config: Namespace) -> CopyWriter:
-         return cls(
-             config.license, config.preamble,
-             config.spdx_prefix, config.copy_prefix)
- 
--    def transform(self, source, copyrights, *, comment_prefix=None):
-+    def transform(self, source: t.TextIO,
-+                  copyrights: t.List[Copyright], *,
-+                  comment_prefix: str=None) -> t.Iterator[str]:
-         if comment_prefix is None:
-             comment_prefix = self.COMMENTS[Path(source.name).suffix]
-         license_start = self.license.text[0]
-@@ -279,7 +288,7 @@ class CopyWriter:
-                     yield line
-                     empty = False
-                 elif linenum < 3 and (
--                        'set fileencoding=' in line or '-*- coding:' in line):
-+                        'fileencoding=' in line or '-*- coding:' in line):
-                     yield line
-                     empty = False
-                 elif line.rstrip() == comment_prefix:
-@@ -313,7 +322,8 @@ class CopyWriter:
-             elif state == 'body':
-                 yield line
- 
--    def _generate_header(self, copyrights, comment_prefix, empty):
-+    def _generate_header(self, copyrights: t.Iterable[Copyright],
-+                         comment_prefix: str, empty: bool) -> t.Iterator[str]:
-         if not empty:
-             yield comment_prefix + '\n'
-         for line in self.preamble:
-@@ -356,7 +366,7 @@ class AtomicReplaceFile:
-         If ``None`` (the default), the temporary file will be opened in binary
-         mode. Otherwise, this specifies the encoding to use with text mode.
-     """
--    def __init__(self, path: Union[str, Path], encoding: str = None):
-+    def __init__(self, path: t.Union[str, Path], encoding: str = None):
-         if isinstance(path, str):
-             path = Path(path)
-         self._path = path
-diff --git a/copyrights.cfg b/copyrights.cfg
-deleted file mode 100644
-index de68dbe..0000000
---- a/copyrights.cfg
-+++ /dev/null
-@@ -1,11 +0,0 @@
--[settings]
--include=
--  **/*.py
--  **/*.rst
--exclude=
--  docs/examples/*.py
--  docs/license.rst
--license=LICENSE.rst
--preamble=
--  GPIO Zero: a library for controlling the Raspberry Pi's GPIO pins
--strip-preamble=no
-diff --git a/coverage.cfg b/coverage.cfg
-deleted file mode 100644
-index e3f3349..0000000
---- a/coverage.cfg
-+++ /dev/null
-@@ -1,18 +0,0 @@
--[run]
--branch = True
--include = gpiozero/*
--;omit = */bar.py,*/baz.py
--
--[report]
--ignore_errors = True
--show_missing = True
--exclude_lines =
--    pragma: no cover
--    assert False
--    raise AssertionError
--    raise NotImplementedError
--    pass
--    if __name__ == .__main__.:
--
--[html]
--directory = coverage
-diff --git a/docs/conf.py b/docs/conf.py
-index 998ae91..626ae29 100644
---- a/docs/conf.py
-+++ b/docs/conf.py
-@@ -11,62 +11,34 @@
- 
- import sys
- import os
-+from pathlib import Path
- from datetime import datetime
--sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))
--on_rtd = os.environ.get('READTHEDOCS', None) == 'True'
--import setup as _setup
--
--# Mock out certain modules while building documentation
--class Mock(object):
--    __all__ = []
--
--    def __init__(self, *args, **kw):
--        pass
--
--    def __call__(self, *args, **kw):
--        return Mock()
--
--    def __mul__(self, other):
--        return Mock()
--
--    def __and__(self, other):
--        return Mock()
-+from setuptools.config import read_configuration
- 
--    def __bool__(self):
--        return False
--
--    def __nonzero__(self):
--        return False
--
--    @classmethod
--    def __getattr__(cls, name):
--        if name in ('__file__', '__path__'):
--            return '/dev/null'
--        else:
--            return Mock()
--
--sys.modules['RPi'] = Mock()
--sys.modules['RPi.GPIO'] = sys.modules['RPi'].GPIO
--sys.modules['lgpio'] = Mock()
--sys.modules['RPIO'] = Mock()
--sys.modules['RPIO.PWM'] = sys.modules['RPIO'].PWM
--sys.modules['RPIO.Exceptions'] = sys.modules['RPIO'].Exceptions
--sys.modules['pigpio'] = Mock()
--sys.modules['w1thermsensor'] = Mock()
--sys.modules['spidev'] = Mock()
--sys.modules['colorzero'] = Mock()
-+on_rtd = os.environ.get('READTHEDOCS', None) == 'True'
-+config = read_configuration(str(Path(__file__).parent / '..' / 'setup.cfg'))
-+info = config['metadata']
- 
- # -- General configuration ------------------------------------------------
- 
- extensions = ['sphinx.ext.autodoc', 'sphinx.ext.viewcode', 'sphinx.ext.intersphinx']
-+if on_rtd:
-+    needs_sphinx = '1.4.0'
-+    extensions.append('sphinx.ext.imgmath')
-+    imgmath_image_format = 'svg'
-+    tags.add('rtd')
-+else:
-+    extensions.append('sphinx.ext.mathjax')
-+    mathjax_path = '/usr/share/javascript/mathjax/MathJax.js?config=TeX-AMS_HTML'
-+
- templates_path = ['_templates']
- source_suffix = '.rst'
- #source_encoding = 'utf-8-sig'
- master_doc = 'index'
--project = 'GPIO Zero'
--copyright = '2015-%s %s' % (datetime.now().year, _setup.__author__)
--version = _setup.__version__
--release = _setup.__version__
-+project = info['name']
-+copyright = '2015-{now:%Y} {info[author]}'.format(now=datetime.now(), info=info)
-+version = info['version']
-+#release = None
- #language = None
- #today_fmt = '%B %d, %Y'
- exclude_patterns = ['_build']
-@@ -82,6 +54,15 @@ pygments_style = 'sphinx'
- # -- Autodoc configuration ------------------------------------------------
- 
- autodoc_member_order = 'groupwise'
-+autodoc_mock_imports = [
-+    'RPi',
-+    'lgpio',
-+    'RPIO',
-+    'pigpio',
-+    'w1thermsensor',
-+    'spidev',
-+    'colorzero',
-+]
- 
- # -- Intersphinx configuration --------------------------------------------
- 
-@@ -94,7 +75,7 @@ intersphinx_mapping = {
- # -- Options for HTML output ----------------------------------------------
- 
- html_theme = 'sphinx_rtd_theme'
--html_title = '%s %s Documentation' % (project, version)
-+html_title = '{info[name]} {info[version]} Documentation'.format(info=info)
- #html_theme_path = []
- #html_short_title = None
- #html_logo = None
-@@ -112,7 +93,7 @@ html_static_path = ['_static']
- #html_show_copyright = True
- #html_use_opensearch = ''
- #html_file_suffix = None
--htmlhelp_basename = '%sdoc' % _setup.__project__
-+htmlhelp_basename = '{info[name]}doc'.format(info=info)
- 
- # Hack to make wide tables work properly in RTD
- # See https://github.com/snide/sphinx_rtd_theme/issues/117 for details
-@@ -131,12 +112,12 @@ latex_elements = {
- 
- latex_documents = [
-     (
--        'index',                       # source start file
--        '%s.tex' % _setup.__project__, # target filename
--        '%s Documentation' % project,  # title
--        _setup.__author__,             # author
--        'manual',                      # documentclass
--        True,                          # documents ref'd from toctree only
-+        'index',            # source start file
-+        project + '.tex',   # target filename
-+        html_title,         # title
-+        info['author'],     # author
-+        'manual',           # documentclass
-+        True,               # documents ref'd from toctree only
-         ),
- ]
- 
-@@ -149,11 +130,11 @@ latex_show_urls = 'footnote'
- 
- # -- Options for epub output ----------------------------------------------
- 
--epub_basename = _setup.__project__
-+epub_basename = project
- #epub_theme = 'epub'
- #epub_title = html_title
--epub_author = _setup.__author__
--epub_identifier = 'https://gpiozero.readthedocs.io/'
-+epub_author = info['author']
-+epub_identifier = 'https://{info[name]}.readthedocs.io/'.format(info=info)
- #epub_tocdepth = 3
- epub_show_urls = 'no'
- #epub_use_index = True
-@@ -161,8 +142,8 @@ epub_show_urls = 'no'
- # -- Options for manual page output ---------------------------------------
- 
- man_pages = [
--    ('cli_pinout',  'pinout',      'GPIO Zero pinout tool',       [_setup.__author__], 1),
--    ('remote_gpio', 'remote-gpio', 'GPIO Zero remote GPIO guide', [_setup.__author__], 7),
-+    ('cli_pinout',  'pinout',      'GPIO Zero pinout tool',       [info['author']], 1),
-+    ('remote_gpio', 'remote-gpio', 'GPIO Zero remote GPIO guide', [info['author']], 7),
- ]
- 
- man_show_urls = True
-diff --git a/setup.cfg b/setup.cfg
-new file mode 100644
-index 0000000..db0cfa4
---- /dev/null
-+++ b/setup.cfg
-@@ -0,0 +1,98 @@
-+[metadata]
-+name = gpiozero
-+version = 1.6.2
-+description = A simple interface to GPIO devices with Raspberry Pi
-+long_description = file:README.rst
-+author = Ben Nuttall
-+author_email = ben@bennuttall.com
-+url = https://gpiozero.readthedocs.io/
-+project_urls =
-+    Documentation = https://gpiozero.readthedocs.io/
-+    Source Code = https://github.com/gpiozero/gpiozero
-+    Issue Tracker = https://github.com/gpiozero/gpiozero/issues
-+keywords = raspberrypi gpio
-+license = BSD-3-Clause
-+classifiers =
-+    Development Status :: 5 - Production/Stable
-+    Intended Audience :: Education
-+    Intended Audience :: Developers
-+    Topic :: Education
-+    Topic :: System :: Hardware
-+    License :: OSI Approved :: BSD License
-+    Programming Language :: Python :: 2
-+    Programming Language :: Python :: 2.7
-+    Programming Language :: Python :: 3
-+    Programming Language :: Python :: 3.5
-+    Programming Language :: Python :: 3.6
-+    Programming Language :: Python :: 3.7
-+    Programming Language :: Python :: 3.8
-+    Programming Language :: Python :: 3.9
-+    Programming Language :: Python :: Implementation :: PyPy
-+
-+[options]
-+packages = find:
-+install_requires =
-+    colorzero
-+
-+[options.package_data]
-+gpiozero =
-+    fonts/*.txt
-+
-+[options.extras_require]
-+test =
-+    pytest
-+    pytest-cov
-+doc =
-+    sphinx
-+    sphinx-rtd-theme
-+
-+[options.entry_points]
-+console_scripts =
-+    pinout = gpiozerocli.pinout:main
-+gpiozero_pin_factories =
-+    pigpio  = gpiozero.pins.pigpio:PiGPIOFactory
-+    lgpio   = gpiozero.pins.lgpio:LGPIOFactory
-+    rpigpio = gpiozero.pins.rpigpio:RPiGPIOFactory
-+    rpio    = gpiozero.pins.rpio:RPIOFactory
-+    native  = gpiozero.pins.native:NativeFactory
-+    mock    = gpiozero.pins.mock:MockFactory
-+    PiGPIOPin  = gpiozero.pins.pigpio:PiGPIOFactory
-+    RPiGPIOPin = gpiozero.pins.rpigpio:RPiGPIOFactory
-+    RPIOPin    = gpiozero.pins.rpio:RPIOFactory
-+    NativePin  = gpiozero.pins.native:NativeFactory
-+gpiozero_mock_pin_classes =
-+    mockpin          = gpiozero.pins.mock:MockPin
-+    mockpwmpin       = gpiozero.pins.mock:MockPWMPin
-+    mockchargingpin  = gpiozero.pins.mock:MockChargingPin
-+    mocktriggerpin   = gpiozero.pins.mock:MockTriggerPin
-+
-+[tools:pytest]
-+addopts = -rsx --cov --tb=short
-+testpaths = tests
-+
-+[coverage:run]
-+source = gpiozero
-+branch = true
-+
-+[coverage:report]
-+ignore_errors = true
-+show_missing = true
-+exclude_lines =
-+    pragma: no cover
-+    assert False
-+    raise AssertionError
-+    raise NotImplementedError
-+    pass
-+    if __name__ == .__main__.:
-+
-+[copyrights:settings]
-+include =
-+  **/*.py
-+  **/*.rst
-+exclude =
-+  docs/examples/*.py
-+  docs/license.rst
-+license = LICENSE.rst
-+preamble =
-+  GPIO Zero: a library for controlling the Raspberry Pi's GPIO pins
-+strip-preamble = false
-diff --git a/setup.py b/setup.py
-index 621398a..fc644b6 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1,139 +1,29 @@
--"A simple interface to GPIO devices with Raspberry Pi."
-+from __future__ import (
-+    unicode_literals,
-+    absolute_import,
-+)
-+str = type('')
- 
- import io
- import os
--import sys
- import errno
--from setuptools import setup, find_packages
-+from setuptools import setup, config
- 
--if sys.version_info[0] == 2:
--    if not sys.version_info >= (2, 7):
--        raise ValueError('This package requires Python 2.7 or above')
--elif sys.version_info[0] == 3:
--    if not sys.version_info >= (3, 2):
--        raise ValueError('This package requires Python 3.2 or above')
--else:
--    raise ValueError('Unrecognized major version of Python')
--
--HERE = os.path.abspath(os.path.dirname(__file__))
--
--# Workaround <http://www.eby-sarna.com/pipermail/peak/2010-May/003357.html>
--try:
--    import multiprocessing
--except ImportError:
--    pass
--
--__project__      = 'gpiozero'
--__version__      = '1.6.2'
--__author__       = 'Ben Nuttall'
--__author_email__ = 'ben@bennuttall.com'
--__url__          = 'https://github.com/gpiozero/gpiozero'
--__platforms__    = 'ALL'
--
--__classifiers__ = [
--    "Development Status :: 5 - Production/Stable",
--    "Intended Audience :: Education",
--    "Intended Audience :: Developers",
--    "Topic :: Education",
--    "Topic :: System :: Hardware",
--    "License :: OSI Approved :: BSD License",
--    "Programming Language :: Python :: 2",
--    "Programming Language :: Python :: 2.7",
--    "Programming Language :: Python :: 3",
--    "Programming Language :: Python :: 3.5",
--    "Programming Language :: Python :: 3.6",
--    "Programming Language :: Python :: 3.7",
--    "Programming Language :: Python :: 3.8",
--    "Programming Language :: Python :: 3.9",
--    "Programming Language :: Python :: Implementation :: PyPy",
--]
--
--__keywords__ = [
--    'raspberrypi',
--    'gpio',
--]
--
--__requires__ = [
--    'colorzero',
--]
--
--__extra_requires__ = {
--    'doc':   ['sphinx', 'sphinx_rtd_theme'],
--    'test':  ['pytest', 'coverage', 'mock'],
--}
--
--if sys.version_info[:2] == (3, 2):
--    # Particular versions are required for Python 3.2 compatibility
--    __extra_requires__['doc'].extend([
--        'Jinja2<2.7',
--        'MarkupSafe<0.16',
--        ])
--    __extra_requires__['test'][0] = 'pytest<3.0dev'
--    __extra_requires__['test'][1] = 'coverage<4.0dev'
--elif sys.version_info[:2] == (3, 3):
--    __extra_requires__['test'][0] = 'pytest<3.3dev'
--elif sys.version_info[:2] == (3, 4):
--    __extra_requires__['test'][0] = 'pytest<5.0dev'
-+cfg = config.read_configuration(
-+    os.path.join(os.path.dirname(__file__), 'setup.cfg'))
- 
- try:
-     # If we're executing on a Raspberry Pi, install all GPIO libraries for
-     # testing (except RPIO which doesn't work on the multi-core models yet)
-     with io.open('/proc/device-tree/model', 'r') as f:
-         if f.read().startswith('Raspberry Pi'):
--            __extra_requires__['test'].append('RPi.GPIO')
--            __extra_requires__['test'].append('pigpio')
-+            cfg['options']['extras_require']['test'].append('RPI.GPIO')
-+            cfg['options']['extras_require']['test'].append('pigpio')
- except IOError as e:
-     if e.errno != errno.ENOENT:
-         raise
- 
--__entry_points__ = {
--    'gpiozero_pin_factories': [
--        'pigpio  = gpiozero.pins.pigpio:PiGPIOFactory',
--        'lgpio   = gpiozero.pins.lgpio:LGPIOFactory',
--        'rpigpio = gpiozero.pins.rpigpio:RPiGPIOFactory',
--        'rpio    = gpiozero.pins.rpio:RPIOFactory',
--        'native  = gpiozero.pins.native:NativeFactory',
--        'mock    = gpiozero.pins.mock:MockFactory',
--        # Backwards compatible names
--        'PiGPIOPin  = gpiozero.pins.pigpio:PiGPIOFactory',
--        'RPiGPIOPin = gpiozero.pins.rpigpio:RPiGPIOFactory',
--        'RPIOPin    = gpiozero.pins.rpio:RPIOFactory',
--        'NativePin  = gpiozero.pins.native:NativeFactory',
--    ],
--    'gpiozero_mock_pin_classes': [
--        'mockpin          = gpiozero.pins.mock:MockPin',
--        'mockpwmpin       = gpiozero.pins.mock:MockPWMPin',
--        'mockchargingpin  = gpiozero.pins.mock:MockChargingPin',
--        'mocktriggerpin   = gpiozero.pins.mock:MockTriggerPin',
--    ],
--    'console_scripts': [
--        'pinout = gpiozerocli.pinout:main',
--    ]
--}
--
--
--def main():
--    import io
--    with io.open(os.path.join(HERE, 'README.rst'), 'r') as readme:
--        setup(
--            name                 = __project__,
--            version              = __version__,
--            description          = __doc__,
--            long_description     = readme.read(),
--            classifiers          = __classifiers__,
--            author               = __author__,
--            author_email         = __author_email__,
--            url                  = __url__,
--            license              = 'BSD-3-Clause',
--            keywords             = __keywords__,
--            packages             = find_packages(),
--            include_package_data = True,
--            platforms            = __platforms__,
--            install_requires     = __requires__,
--            extras_require       = __extra_requires__,
--            entry_points         = __entry_points__,
--        )
--
-+opts = cfg['metadata']
-+opts.update(cfg['options'])
- 
--if __name__ == '__main__':
--    main()
-+setup(**opts)
--- 
-2.41.0
-
diff --git a/package/python-gpiozero/python-gpiozero.hash b/package/python-gpiozero/python-gpiozero.hash
index 7359f6405e..d019b54346 100644
--- a/package/python-gpiozero/python-gpiozero.hash
+++ b/package/python-gpiozero/python-gpiozero.hash
@@ -1,4 +1,5 @@
-# Locally computed
-sha256  7e6da923774437e24edc0c056e486415bace8c4ba4123c22ac4214147854ea6d  python-gpiozero-1.6.2.tar.gz
-# Locally computed
+# md5, sha256 from https://pypi.org/pypi/gpiozero/json
+md5  b8b63443961de2710d88b82671ec6d8a  gpiozero-2.0.tar.gz
+sha256  403bcc9e7f24f0877653e7fced91ba51508d5197c9d1f80e383fe6693b9c3c27  gpiozero-2.0.tar.gz
+# Locally computed sha256 checksums
 sha256  b6fdd587f3dc3a9b8cc5adae00918e3ffa909b1092bd4decf7e8b1b08fa5d0fb  LICENSE.rst
diff --git a/package/python-gpiozero/python-gpiozero.mk b/package/python-gpiozero/python-gpiozero.mk
index a68c39db1f..bce7644a34 100644
--- a/package/python-gpiozero/python-gpiozero.mk
+++ b/package/python-gpiozero/python-gpiozero.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GPIOZERO_VERSION = 1.6.2
-PYTHON_GPIOZERO_SITE = $(call github,gpiozero,gpiozero,v$(PYTHON_GPIOZERO_VERSION))
+PYTHON_GPIOZERO_VERSION = 2.0
+PYTHON_GPIOZERO_SOURCE = gpiozero-$(PYTHON_GPIOZERO_VERSION).tar.gz
+PYTHON_GPIOZERO_SITE = https://files.pythonhosted.org/packages/b3/a7/85676e0689114ea08ea3c88b7813efd988a9ead64dc9e1b24545b17af4fd
 PYTHON_GPIOZERO_LICENSE = BSD-3-Clause
 PYTHON_GPIOZERO_LICENSE_FILES = LICENSE.rst
 PYTHON_GPIOZERO_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
