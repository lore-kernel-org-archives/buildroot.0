Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB360C71136
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 19:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92DFD40758;
	Tue, 17 Jun 2025 19:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UZ_npjvEpCL; Tue, 17 Jun 2025 19:35:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F849407A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F849407A8;
	Tue, 17 Jun 2025 19:35:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C540E2
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32D2283A41
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WEsJ_xPBdGgk for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 19:35:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5972383A0C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5972383A0C
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:35:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 447C483C34; Tue, 17 Jun 2025 19:35:55 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 Jun 2025 21:26:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8ddc2a32617d07495490c142ebe14e68e6fc0bd
X-Git-Newrev: 14ce0d2e6e2058e1f6b123c11b3ca45aa1ddeb7b
X-Patchwork-Hint: ignore
Message-Id: <20250617193555.447C483C34@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-remi: bump to master commit
 and fixes build failure
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=14ce0d2e6e2058e1f6b123c11b3ca45aa1ddeb7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

REMI hasn't received new release since July 2022 and is currently broken
with error:

Traceback (most recent call last):
  File "<string>", line 26, in <module>
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/__init__.py", line 116, in setup
    _install_setup_requires(attrs)
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/__init__.py", line 89, in _install_setup_requires
    _fetch_build_eggs(dist)
    ~~~~~~~~~~~~~~~~~^^^^^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/__init__.py", line 94, in _fetch_build_eggs
    dist.fetch_build_eggs(dist.setup_requires)
    ~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/build_meta.py", line 80, in fetch_build_eggs
    raise SetupRequirementsError(specifier_list)
setuptools.build_meta.SetupRequirementsError: ['setuptools_scm']

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/pyproject_hooks/_in_process/_in_process.py", line 389, in <module>
    main()
    ~~~~^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/pyproject_hooks/_in_process/_in_process.py", line 373, in main
    json_out["return_val"] = hook(**hook_input["kwargs"])
                             ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/pyproject_hooks/_in_process/_in_process.py", line 143, in get_requires_for_build_wheel
    return hook(config_settings)
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/build_meta.py", line 331, in get_requires_for_build_wheel
    return self._get_build_requires(config_settings, requirements=[])
           ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/build_meta.py", line 301, in _get_build_requires
    self.run_setup()
    ~~~~~~~~~~~~~~^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/build_meta.py", line 512, in run_setup
    super().run_setup(setup_script=setup_script)
    ~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/build_meta.py", line 317, in run_setup
    exec(code, locals())
    ~~~~^^^^^^^^^^^^^^^^
  File "<string>", line 31, in <module>
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/__init__.py", line 117, in setup
    return distutils.core.setup(**attrs)
           ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/_distutils/core.py", line 148, in setup
    _setup_distribution = dist = klass(attrs)
                                 ~~~~~^^^^^^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/dist.py", line 323, in __init__
    _Distribution.__init__(self, dist_attrs)
    ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/_distutils/dist.py", line 309, in __init__
    self.finalize_options()
    ~~~~~~~~~~~~~~~~~~~~~^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/dist.py", line 786, in finalize_options
    ep(self)
    ~~^^^^^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools/dist.py", line 806, in _finalize_setup_keywords
    ep.load()(self, ep.name, value)
    ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^
  File "/workdir/instance-0/output-1/host/lib/python3.13/site-packages/setuptools_scm/_integration/setuptools.py", line 82, in version_keyword
    assert isinstance(value, dict), "version_keyword expects a dict or True"
           ~~~~~~~~~~^^^^^^^^^^^^^
AssertionError: version_keyword expects a dict or True

ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
make: *** [package/pkg-generic.mk:273: /workdir/instance-0/output-1/build/python-remi-2022.7.27/.stamp_built] Error 1
make: Leaving directory '/workdir/instance-0/buildroot'

Since last release code has been corrected and now build end
successfully.

Another issue with remi is related to python CGI library no more available with
python 3.13. This patch also updates Config.in to add a select BR2_PACKAGE_PYTHON_LEGACY_CGI

This commit also updates the LICENSE file hash, because line ending
changed from "CR-LF" (Windows) in old release archive to "LF" (Unix)
in the github download. Apart from that, the content is the same.

Fixes:
- https://autobuild.buildroot.org/results/f0409533ebdc31e522f2ee2ea8a5acc11dbc7430/
- https://autobuild.buildroot.org/results/a16cf5105d4b726b5d4136a2d8f82abcfdc0faba/
- https://autobuild.buildroot.org/results/e7ac28e20ad92863d337e96c225463346ee6c690/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
[Julien:
 - use "git describe --abbrev=40" format in _VERSION
 - fix LICENSE hash
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-remi/Config.in        | 1 +
 package/python-remi/python-remi.hash | 5 ++---
 package/python-remi/python-remi.mk   | 5 ++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-remi/Config.in b/package/python-remi/Config.in
index da2c2f4cfb..2ecd310bf2 100644
--- a/package/python-remi/Config.in
+++ b/package/python-remi/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_REMI
 	bool "python-remi"
 	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_LEGACY_CGI # runtime
 	help
 	  Remi is a GUI library for Python applications which transpiles
 	  an application's interface into HTML to be rendered in a web
diff --git a/package/python-remi/python-remi.hash b/package/python-remi/python-remi.hash
index e7937c3914..edae17e21c 100644
--- a/package/python-remi/python-remi.hash
+++ b/package/python-remi/python-remi.hash
@@ -1,4 +1,3 @@
-# sha256 from https://pypi.org/pypi/remi/json
-sha256  542df88e174bbd58fe763c49e5c2116f2c8413c1a934731069ed8c17bb9cd64c  remi-2022.7.27.tar.gz
 # Locally computed sha256
-sha256  3df7d3ad8904d7e99fc0810366483a7cbe5a43c13f7f913f1d7e5023f2ff7657  LICENSE
+sha256  8a84941a58952657c7940db2fd3adc6d1ae10a186a02ddc0f1963c353e6108b3  python-remi-2022.7.27-37-g18505f6439849c6e01695dd90dbf680d5ffb0a14.tar.gz
+sha256  bc198f9846c1da3a1c1b1fa2b12909b021365d1e7fe9b4039245edfcec3b7f7f  LICENSE
diff --git a/package/python-remi/python-remi.mk b/package/python-remi/python-remi.mk
index 419a3441a7..532c37c6c9 100644
--- a/package/python-remi/python-remi.mk
+++ b/package/python-remi/python-remi.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-PYTHON_REMI_VERSION = 2022.7.27
-PYTHON_REMI_SOURCE = remi-$(PYTHON_REMI_VERSION).tar.gz
-PYTHON_REMI_SITE = https://files.pythonhosted.org/packages/b7/5c/fca9d9273fc9d5f4ca0bc2f387ca19f8ba9979dcb75617d094e575dc2337
+PYTHON_REMI_VERSION = 2022.7.27-37-g18505f6439849c6e01695dd90dbf680d5ffb0a14
+PYTHON_REMI_SITE = $(call github,rawpython,remi,$(PYTHON_REMI_VERSION))
 
 PYTHON_REMI_LICENSE = Apache-2.0
 PYTHON_REMI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
