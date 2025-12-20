Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E329D637B2
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 08:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE95482564;
	Sat, 20 Dec 2025 08:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9ZqZivspwr8; Sat, 20 Dec 2025 08:32:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 496A482312
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766219548;
	bh=yLQ4bR8EVw1NXifgF7HTeax6thhye4NKesPNDN25sBg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OTxY+Gw3GIOzBNY4to9LhWLJoJ6I5SHJmbmriM6Rh+gq/Sz2T3j8phWExHN0ZemlY
	 tVO7NkjxeUGz0QEQ8t+IirTzuq+tT8VsQNBg1Ad16k7IhtObWXwQY31vehMLDS1qUV
	 vk4DFi3/CecHRiuWp1v+oYS1cJfLwQgXhdQaGcP34Ut+c9cof2tDomkxmhafXkCXeQ
	 bqMbBBYcipyxdJGFaqZYhFBk6FJlNu9atFIyX1GJX0aVXABrhOl+s6et7BIFPNTyHK
	 IDguFPMFRU+NCfEbyAt8IxoN8E7u1kfw7WcaAnXQvPd8qGmn2zPKuZosD9x55d4eNJ
	 lkCCkMfroL/VQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 496A482312;
	Sat, 20 Dec 2025 08:32:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 18A9E23D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 08:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAD98403C2
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 08:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_fK1rEFPEqJ for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 08:32:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98E3F4035C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98E3F4035C
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 08:32:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85475874A7; Sat, 20 Dec 2025 08:32:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 09:29:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a87bfa1183c0b4073a188f13a692b133b92a339c
X-Git-Newrev: 7c18ebc0019b279da3793d5c5531bb8a76ff4c96
X-Patchwork-Hint: ignore
Message-Id: <20251220083225.85475874A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-*: mass update of hash
 comments computed by scanpypi
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c18ebc0019b279da3793d5c5531bb8a76ff4c96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No changes to hashes, only comments in hash files computed by our
utils/scanpypi script are updated by this patch.

During future mass package updates this patch will reduce the number of
changes created by scanpypi to be reviewed.

Please note that an updated version of scanpypi was used:
https://patchwork.ozlabs.org/project/buildroot/patch/20251001002004.3178942-1-james.hilliard1@gmail.com/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Peter: drop packages not downloaded from pypi or where rust vendoring is
        used]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-aiohttp-cors/python-aiohttp-cors.hash                 | 2 +-
 package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash | 2 +-
 package/python-async-generator/python-async-generator.hash           | 2 +-
 package/python-chardet/python-chardet.hash                           | 2 +-
 package/python-dicttoxml2/python-dicttoxml2.hash                     | 2 +-
 package/python-docker-pycreds/python-docker-pycreds.hash             | 3 ++-
 package/python-dockerpty/python-dockerpty.hash                       | 3 ++-
 package/python-hatch-vcs/python-hatch-vcs.hash                       | 2 +-
 package/python-jaraco-classes/python-jaraco-classes.hash             | 2 +-
 package/python-jaraco-context/python-jaraco-context.hash             | 2 +-
 package/python-jaraco-text/python-jaraco-text.hash                   | 2 +-
 .../python-json-schema-validator/python-json-schema-validator.hash   | 2 +-
 package/python-lockfile/python-lockfile.hash                         | 4 ++--
 package/python-logstash/python-logstash.hash                         | 2 +-
 package/python-mypy-extensions/python-mypy-extensions.hash           | 2 +-
 package/python-pure-eval/python-pure-eval.hash                       | 2 +-
 package/python-pyjwt/python-pyjwt.hash                               | 2 +-
 package/python-pyphen/python-pyphen.hash                             | 2 +-
 package/python-pyproject-hooks/python-pyproject-hooks.hash           | 2 +-
 package/python-pyqt5/python-pyqt5.hash                               | 5 ++---
 package/python-rpi-gpio/python-rpi-gpio.hash                         | 4 ++--
 package/python-shutilwhich/python-shutilwhich.hash                   | 2 +-
 package/python-simplegeneric/python-simplegeneric.hash               | 2 +-
 package/python-stack-data/python-stack-data.hash                     | 2 +-
 package/python-systemd/python-systemd.hash                           | 4 ++--
 package/python-urwid-readline/python-urwid-readline.hash             | 2 +-
 package/python-visitor/python-visitor.hash                           | 3 ++-
 package/python-webencodings/python-webencodings.hash                 | 2 +-
 package/python-xlutils/python-xlutils.hash                           | 5 ++---
 29 files changed, 37 insertions(+), 36 deletions(-)

diff --git a/package/python-aiohttp-cors/python-aiohttp-cors.hash b/package/python-aiohttp-cors/python-aiohttp-cors.hash
index 5428fc826e..731bcb7501 100644
--- a/package/python-aiohttp-cors/python-aiohttp-cors.hash
+++ b/package/python-aiohttp-cors/python-aiohttp-cors.hash
@@ -1,4 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/aiohttp_cors/json
+# md5, sha256 from https://pypi.org/pypi/aiohttp-cors/json
 md5  bef1294f1ab08844eb35a56c7157026d  aiohttp_cors-0.8.1.tar.gz
 sha256  ccacf9cb84b64939ea15f859a146af1f662a6b1d68175754a07315e305fb1403  aiohttp_cors-0.8.1.tar.gz
 # Locally computed sha256 checksums
diff --git a/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash b/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash
index 441574bbe2..cc684de687 100644
--- a/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash
+++ b/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash
@@ -1,4 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/aiohttp_debugtoolbar/json
+# md5, sha256 from https://pypi.org/pypi/aiohttp-debugtoolbar/json
 md5  3be0e457798dbd301f4cfe8da43166d4  aiohttp-debugtoolbar-0.6.1.tar.gz
 sha256  cd7ae54c600db7ae7d9dc3404b81f95209a6367df1d59e13ea20f9926e36e001  aiohttp-debugtoolbar-0.6.1.tar.gz
 # Locally computed sha256 checksums
diff --git a/package/python-async-generator/python-async-generator.hash b/package/python-async-generator/python-async-generator.hash
index 3a94d5eb31..babc634281 100644
--- a/package/python-async-generator/python-async-generator.hash
+++ b/package/python-async-generator/python-async-generator.hash
@@ -1,4 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/async_generator/json
+# md5, sha256 from https://pypi.org/pypi/async-generator/json
 md5  078a29b4afb3d7f38c097a530f042a55  async_generator-1.10.tar.gz
 sha256  6ebb3d106c12920aaae42ccb6f787ef5eefdcdd166ea3d628fa8476abe712144  async_generator-1.10.tar.gz
 # Locally computed sha256 checksums
diff --git a/package/python-chardet/python-chardet.hash b/package/python-chardet/python-chardet.hash
index bf0ed47df6..87a5567636 100644
--- a/package/python-chardet/python-chardet.hash
+++ b/package/python-chardet/python-chardet.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/chardet/json
 md5  cc2d8cc9a751641463b4f7cfecad2ffa  chardet-5.2.0.tar.gz
 sha256  1b3b6ff479a8c414bc3fa2c0852995695c4a026dcd6d0633b2dd092ca39c1cf7  chardet-5.2.0.tar.gz
-# Locally computed
+# Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE
diff --git a/package/python-dicttoxml2/python-dicttoxml2.hash b/package/python-dicttoxml2/python-dicttoxml2.hash
index 4cc92d1d37..f3c2766f39 100644
--- a/package/python-dicttoxml2/python-dicttoxml2.hash
+++ b/package/python-dicttoxml2/python-dicttoxml2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dicttoxml2/json
 md5  787ea4b80cd6234a41c016e8efa7ff40  dicttoxml2-2.1.0.tar.gz
 sha256  67cb729f337dd752808c021b70c8df8a34f84b9e111a5dbaa37e000eeaf4d462  dicttoxml2-2.1.0.tar.gz
-# Locally computed
+# Locally computed sha256 checksums
 sha256  4514114bd9da0b2fbf8c4fa264c0e6cc80fd41e6ac7f09d7a39a215662951c7c  LICENCE.txt
diff --git a/package/python-docker-pycreds/python-docker-pycreds.hash b/package/python-docker-pycreds/python-docker-pycreds.hash
index 06f2faf669..98f542b579 100644
--- a/package/python-docker-pycreds/python-docker-pycreds.hash
+++ b/package/python-docker-pycreds/python-docker-pycreds.hash
@@ -1,4 +1,5 @@
-# md5 and sha256 from https://pypi.python.org/pypi/docker-pycreds/json
+# md5, sha256 from https://pypi.org/pypi/docker-pycreds/json
 md5  322f570cea6b4661c6ac335683988e18  docker-pycreds-0.4.0.tar.gz
 sha256  6ce3270bcaf404cc4c3e27e4b6c70d3521deae82fb508767870fdbf772d584d4  docker-pycreds-0.4.0.tar.gz
+# Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-dockerpty/python-dockerpty.hash b/package/python-dockerpty/python-dockerpty.hash
index c934b3475f..3871cbb2d8 100644
--- a/package/python-dockerpty/python-dockerpty.hash
+++ b/package/python-dockerpty/python-dockerpty.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/dockerpty/json, sha256 locally computed
+# md5, sha256 from https://pypi.org/pypi/dockerpty/json
 md5  028bacb34536f3ee6a2ccd668c27e8e4  dockerpty-0.4.1.tar.gz
 sha256  69a9d69d573a0daa31bcd1c0774eeed5c15c295fe719c61aca550ed1393156ce  dockerpty-0.4.1.tar.gz
+# Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/python-hatch-vcs/python-hatch-vcs.hash b/package/python-hatch-vcs/python-hatch-vcs.hash
index 16f08bcc4a..1c7e4f5ff9 100644
--- a/package/python-hatch-vcs/python-hatch-vcs.hash
+++ b/package/python-hatch-vcs/python-hatch-vcs.hash
@@ -1,4 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/hatch_vcs/json
+# md5, sha256 from https://pypi.org/pypi/hatch-vcs/json
 md5  9a22a9f7203783e526959d34510a9672  hatch_vcs-0.5.0.tar.gz
 sha256  0395fa126940340215090c344a2bf4e2a77bcbe7daab16f41b37b98c95809ff9  hatch_vcs-0.5.0.tar.gz
 # Locally computed sha256 checksums
diff --git a/package/python-jaraco-classes/python-jaraco-classes.hash b/package/python-jaraco-classes/python-jaraco-classes.hash
index 370ec5e2f6..4db1408135 100644
--- a/package/python-jaraco-classes/python-jaraco-classes.hash
+++ b/package/python-jaraco-classes/python-jaraco-classes.hash
@@ -1,4 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/jaraco.classes/json
+# md5, sha256 from https://pypi.org/pypi/jaraco-classes/json
 md5  994fb3f2ce9bb538ca6e8abf6ebbdf9c  jaraco.classes-3.4.0.tar.gz
 sha256  47a024b51d0239c0dd8c8540c6c7f484be3b8fcf0b2d85c13825780d3b3f3acd  jaraco.classes-3.4.0.tar.gz
 # Locally computed sha256 checksums
diff --git a/package/python-jaraco-context/python-jaraco-context.hash b/package/python-jaraco-context/python-jaraco-context.hash
index a6b32260b2..d638965772 100644
--- a/package/python-jaraco-context/python-jaraco-context.hash
+++ b/package/python-jaraco-context/python-jaraco-context.hash
@@ -1,4 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/jaraco.context/json
+# md5, sha256 from https://pypi.org/pypi/jaraco-context/json
 md5  bb22ef027077b1fa8528ef1d9840b838  jaraco_context-6.0.1.tar.gz
 sha256  9bae4ea555cf0b14938dc0aee7c9f32ed303aa20a3b73e7dc80111628792d1b3  jaraco_context-6.0.1.tar.gz
 # Locally computed sha256 checksums
diff --git a/package/python-jaraco-text/python-jaraco-text.hash b/package/python-jaraco-text/python-jaraco-text.hash
index 1e79bf746a..8de574393e 100644
--- a/package/python-jaraco-text/python-jaraco-text.hash
+++ b/package/python-jaraco-text/python-jaraco-text.hash
@@ -1,4 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/jaraco.text/json
+# md5, sha256 from https://pypi.org/pypi/jaraco-text/json
 md5  3c519c7a49d6448e6dc2073d466afd39  jaraco_text-4.0.0.tar.gz
 sha256  5b71fecea69ab6f939d4c906c04fee1eda76500d1641117df6ec45b865f10db0  jaraco_text-4.0.0.tar.gz
 # Locally computed sha256 checksums
diff --git a/package/python-json-schema-validator/python-json-schema-validator.hash b/package/python-json-schema-validator/python-json-schema-validator.hash
index 94a0235a6d..68226e0dcb 100644
--- a/package/python-json-schema-validator/python-json-schema-validator.hash
+++ b/package/python-json-schema-validator/python-json-schema-validator.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/json-schema-validator/json, sha256 locally computed
+# md5, sha256 from https://pypi.org/pypi/json-schema-validator/json
 md5  7691b41739faaa8b0965279e72889932  json-schema-validator-2.4.1.tar.gz
 sha256  1562a21d83e56231cef09b9aa2c06e8f845974bd26f24be293de6cab9a2fac91  json-schema-validator-2.4.1.tar.gz
diff --git a/package/python-lockfile/python-lockfile.hash b/package/python-lockfile/python-lockfile.hash
index 641f4b64d3..82afc7b779 100644
--- a/package/python-lockfile/python-lockfile.hash
+++ b/package/python-lockfile/python-lockfile.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/project/lockfile/#copy-hash-modal-3c1db9ec-dd6e-4d06-8543-91094f428ac0
+# md5, sha256 from https://pypi.org/pypi/lockfile/json
 md5  a6a1a82957a23afdf44cfdd039b65ff9  lockfile-0.12.2.tar.gz
 sha256  6aed02de03cba24efabcd600b30540140634fc06cfa603822d508d5361e9f799  lockfile-0.12.2.tar.gz
-# Locally computed sha256
+# Locally computed sha256 checksums
 sha256  a26276d53dacb369641f31aa0fe37216028a0d93753f862ae206ce04f54b7b29  LICENSE
diff --git a/package/python-logstash/python-logstash.hash b/package/python-logstash/python-logstash.hash
index 297bb16bf2..51c0185c19 100644
--- a/package/python-logstash/python-logstash.hash
+++ b/package/python-logstash/python-logstash.hash
@@ -1,4 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/python-logstash/json
+# md5, sha256 from https://pypi.org/pypi/logstash/json
 md5  e2cbc75dd5417cb55acaa3a12bf3afac  python-logstash-0.4.8.tar.gz
 sha256  d04e1ce11ecc107e4a4f3b807fc57d96811e964a554081b3bbb44732f74ef5f9  python-logstash-0.4.8.tar.gz
 # Locally computed sha256 checksums
diff --git a/package/python-mypy-extensions/python-mypy-extensions.hash b/package/python-mypy-extensions/python-mypy-extensions.hash
index 6db4ca35b0..10e7b74a9e 100644
--- a/package/python-mypy-extensions/python-mypy-extensions.hash
+++ b/package/python-mypy-extensions/python-mypy-extensions.hash
@@ -1,4 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/mypy_extensions/json
+# md5, sha256 from https://pypi.org/pypi/mypy-extensions/json
 md5  f59bfd7f9dca73f36c8feed12f9e8eba  mypy_extensions-1.1.0.tar.gz
 sha256  52e68efc3284861e772bbcd66823fde5ae21fd2fdb51c62a211403730b916558  mypy_extensions-1.1.0.tar.gz
 # Locally computed sha256 checksums
diff --git a/package/python-pure-eval/python-pure-eval.hash b/package/python-pure-eval/python-pure-eval.hash
index 24c6d15ad6..1ce4d3738f 100644
--- a/package/python-pure-eval/python-pure-eval.hash
+++ b/package/python-pure-eval/python-pure-eval.hash
@@ -1,4 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/pure_eval/json
+# md5, sha256 from https://pypi.org/pypi/pure-eval/json
 md5  d545186f2c899d9dd273c03d71b7ffb7  pure_eval-0.2.3.tar.gz
 sha256  5f4e983f40564c576c7c8635ae88db5956bb2229d7e9237d03b3c0b0190eaf42  pure_eval-0.2.3.tar.gz
 # Locally computed sha256 checksums
diff --git a/package/python-pyjwt/python-pyjwt.hash b/package/python-pyjwt/python-pyjwt.hash
index 8eaf7ece50..5128285fec 100644
--- a/package/python-pyjwt/python-pyjwt.hash
+++ b/package/python-pyjwt/python-pyjwt.hash
@@ -1,4 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/PyJWT/json
+# md5, sha256 from https://pypi.org/pypi/pyjwt/json
 md5  f3273aaf736c24795e78ac48adbab111  pyjwt-2.10.1.tar.gz
 sha256  3cc5772eb20009233caf06e9d8a0577824723b44e6648ee0a2aedb6cf9381953  pyjwt-2.10.1.tar.gz
 # Locally computed sha256 checksums
diff --git a/package/python-pyphen/python-pyphen.hash b/package/python-pyphen/python-pyphen.hash
index 3c65c068e0..4385fc0c9b 100644
--- a/package/python-pyphen/python-pyphen.hash
+++ b/package/python-pyphen/python-pyphen.hash
@@ -1,4 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/Pyphen/json
+# md5, sha256 from https://pypi.org/pypi/pyphen/json
 md5  ce57c010cca3a3b67275b393d2a8b6f2  pyphen-0.17.2.tar.gz
 sha256  f60647a9c9b30ec6c59910097af82bc5dd2d36576b918e44148d8b07ef3b4aa3  pyphen-0.17.2.tar.gz
 # Locally computed sha256 checksums
diff --git a/package/python-pyproject-hooks/python-pyproject-hooks.hash b/package/python-pyproject-hooks/python-pyproject-hooks.hash
index fdbcb9816b..54e85e7173 100644
--- a/package/python-pyproject-hooks/python-pyproject-hooks.hash
+++ b/package/python-pyproject-hooks/python-pyproject-hooks.hash
@@ -1,4 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/pyproject_hooks/json
+# md5, sha256 from https://pypi.org/pypi/pyproject-hooks/json
 md5  ed3dd1b984339e83e35f676d7169c192  pyproject_hooks-1.2.0.tar.gz
 sha256  1e859bd5c40fae9448642dd871adf459e5e2084186e8d2c2a79a824c970da1f8  pyproject_hooks-1.2.0.tar.gz
 # Locally computed sha256 checksums
diff --git a/package/python-pyqt5/python-pyqt5.hash b/package/python-pyqt5/python-pyqt5.hash
index d1b7adf8c1..8daf3fcca1 100644
--- a/package/python-pyqt5/python-pyqt5.hash
+++ b/package/python-pyqt5/python-pyqt5.hash
@@ -1,6 +1,5 @@
-# From https://pypi.org/pypi/PyQt5/json
+# md5, sha256 from https://pypi.org/pypi/pyqt5/json
 md5  0c7fca60aa6ee13c235f68576d9c7bed  PyQt5-5.15.6.tar.gz
-
-# Locally calculated
 sha256  80343bcab95ffba619f2ed2467fd828ffeb0a251ad7225be5fc06dcc333af452  PyQt5-5.15.6.tar.gz
+# Locally computed sha256 checksums
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/python-rpi-gpio/python-rpi-gpio.hash b/package/python-rpi-gpio/python-rpi-gpio.hash
index 22bcaebdcb..db27797dc1 100644
--- a/package/python-rpi-gpio/python-rpi-gpio.hash
+++ b/package/python-rpi-gpio/python-rpi-gpio.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/rpi_gpio/json
+# md5, sha256 from https://pypi.org/pypi/rpi-gpio/json
 md5  22704930a4e674a3d35342bde6d69fe5  RPi.GPIO-0.7.1.tar.gz
 sha256  cd61c4b03c37b62bba4a5acfea9862749c33c618e0295e7e90aa4713fb373b70  RPi.GPIO-0.7.1.tar.gz
-# Locally computed
+# Locally computed sha256 checksums
 sha256  1ccf039a03088da42bdb218a446a564330b881ec71f7022a9fb1930f3fb65d8a  LICENCE.txt
diff --git a/package/python-shutilwhich/python-shutilwhich.hash b/package/python-shutilwhich/python-shutilwhich.hash
index ddf3cefdaa..b7d14a7763 100644
--- a/package/python-shutilwhich/python-shutilwhich.hash
+++ b/package/python-shutilwhich/python-shutilwhich.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=915947c5cdae7afd748ac715ee547adb, sha256 locally computed.
+# md5, sha256 from https://pypi.org/pypi/shutilwhich/json
 md5  915947c5cdae7afd748ac715ee547adb  shutilwhich-1.1.0.tar.gz
 sha256  db1f39c6461e42f630fa617bb8c79090f7711c9ca493e615e43d0610ecb64dc6  shutilwhich-1.1.0.tar.gz
diff --git a/package/python-simplegeneric/python-simplegeneric.hash b/package/python-simplegeneric/python-simplegeneric.hash
index 1dc42d35e2..6eacae28ad 100644
--- a/package/python-simplegeneric/python-simplegeneric.hash
+++ b/package/python-simplegeneric/python-simplegeneric.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/simplegeneric, sha256 locally computed
+# md5, sha256 from https://pypi.org/pypi/simplegeneric/json
 md5  f9c1fab00fd981be588fc32759f474e3  simplegeneric-0.8.1.zip
 sha256  dc972e06094b9af5b855b3df4a646395e43d1c9d0d39ed345b7393560d0b9173  simplegeneric-0.8.1.zip
diff --git a/package/python-stack-data/python-stack-data.hash b/package/python-stack-data/python-stack-data.hash
index b155a77c81..a8c0deb70a 100644
--- a/package/python-stack-data/python-stack-data.hash
+++ b/package/python-stack-data/python-stack-data.hash
@@ -1,4 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/stack_data/json
+# md5, sha256 from https://pypi.org/pypi/stack-data/json
 md5  d04f7cda6589138e90691aec1edbf0d5  stack_data-0.6.3.tar.gz
 sha256  836a778de4fec4dcd1dcd89ed8abff8a221f58308462e1c4aa2a3cf30148f0b9  stack_data-0.6.3.tar.gz
 # Locally computed sha256 checksums
diff --git a/package/python-systemd/python-systemd.hash b/package/python-systemd/python-systemd.hash
index 6cc6639218..9bef31509c 100644
--- a/package/python-systemd/python-systemd.hash
+++ b/package/python-systemd/python-systemd.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/systemd-python/
+# md5, sha256 from https://pypi.org/pypi/systemd/json
 md5  93f3ca09f35719ca6a4edd1d62d38dd4  systemd-python-235.tar.gz
-# Locally computed
+# Locally computed sha256 checksums
 sha256  4e57f39797fd5d9e2d22b8806a252d7c0106c936039d1e71c8c6b8008e695c0a  systemd-python-235.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.txt
diff --git a/package/python-urwid-readline/python-urwid-readline.hash b/package/python-urwid-readline/python-urwid-readline.hash
index 0afc4a9f85..63f99f1774 100644
--- a/package/python-urwid-readline/python-urwid-readline.hash
+++ b/package/python-urwid-readline/python-urwid-readline.hash
@@ -1,4 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/urwid_readline/json
+# md5, sha256 from https://pypi.org/pypi/urwid-readline/json
 md5  6bf957af6a09aa1f2bd76e0dab298562  urwid_readline-0.15.1.tar.gz
 sha256  9301444b86d58f7d26388506b704f142cefd193888488b4070d3a0fdfcfc0f84  urwid_readline-0.15.1.tar.gz
 # Locally computed sha256 checksums
diff --git a/package/python-visitor/python-visitor.hash b/package/python-visitor/python-visitor.hash
index a6f0ec710e..1cd50c1a2b 100644
--- a/package/python-visitor/python-visitor.hash
+++ b/package/python-visitor/python-visitor.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/visitor/json, sha256 locally computed
+# md5, sha256 from https://pypi.org/pypi/visitor/json
 md5  94a024ed0ec1b02b4497c15267d319ca  visitor-0.1.3.tar.gz
 sha256  2c737903b2b6864ebc6167eef7cf3b997126f1aa94bdf590f90f1436d23e480a  visitor-0.1.3.tar.gz
+# Locally computed sha256 checksums
 sha256  184d1ebb65da97ada36447f3c028f2fd4890b874f17b18c023ce200dd96639af  LICENSE
diff --git a/package/python-webencodings/python-webencodings.hash b/package/python-webencodings/python-webencodings.hash
index 47577a6d3e..87c41a9632 100644
--- a/package/python-webencodings/python-webencodings.hash
+++ b/package/python-webencodings/python-webencodings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/webencodings/json
 md5  32f6e261d52e57bf7e1c4d41546d15b8  webencodings-0.5.1.tar.gz
 sha256  b36a1c245f2d304965eb4e0a82848379241dc04b865afcc4aab16748587e1923  webencodings-0.5.1.tar.gz
-# Locally computed sha256 checksumms
+# Locally computed sha256 checksums
 sha256  c27693b0174d6d04dafd0242857ae72763f5404b675972c777fd865bc3c0abe1  PKG-INFO
diff --git a/package/python-xlutils/python-xlutils.hash b/package/python-xlutils/python-xlutils.hash
index 908aa4d680..4e78c4bc0d 100644
--- a/package/python-xlutils/python-xlutils.hash
+++ b/package/python-xlutils/python-xlutils.hash
@@ -1,6 +1,5 @@
-# md5 from https://pypi.python.org/pypi/xlutils/json
+# md5, sha256 from https://pypi.org/pypi/xlutils/json
 md5  7a6a339ddaacabce244341582ee61353  xlutils-2.0.0.tar.gz
-# sha256 calculated by scanpypi
 sha256  7e0e2c233bd185fecf5e2bd3f4e9469ca4a3bd87da64c82cfe5b2af27e7f9e54  xlutils-2.0.0.tar.gz
-# Locally computed
+# Locally computed sha256 checksums
 sha256  28907976ee86414cc720fafc966563b16eeb6a6aeb1da5f5ed40bac3a8808bcf  xlutils/license.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
