Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F36FECAAA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 08:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEE3E40BB0;
	Tue,  6 Sep 2022 08:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEE3E40BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yUldd1dUuuFV; Tue,  6 Sep 2022 08:22:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79927404BF;
	Tue,  6 Sep 2022 08:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79927404BF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD35E1BF28F
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 08:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9845D82C1E
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 08:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9845D82C1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oTEnLKhmcLze for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 08:22:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCFEA82BFD
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCFEA82BFD
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 08:22:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5e76:18ec:e237:5279])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 899DDB00595;
 Tue,  6 Sep 2022 10:22:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Sep 2022 10:22:26 +0200
Date: Tue, 6 Sep 2022 10:22:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20220906082226.GP1490660@scaer>
References: <20220904191010.200822-1-christian@paral.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220904191010.200822-1-christian@paral.in>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662452550;
 bh=LcFrfCTlIlYqgbpHfLDkYnCS/tERMfbtCYaxxtOGmEE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qY3hOQvqVGwnpaXqfQgMy8WuwQLJ1xonTr77zh4FqCFGhPJzP08Fdx1JLjYRAHfpz
 +O5X4Z+UBtV2nPs+Pzvye/47UlhHi2PhQibeQ7BYuRf1NO/cifrrxF8kTELbU4qNaY
 +ts+8hWPNtsbUuRijDUHSk42R+Ofnif9D8+mBDPsKuNipMT/dBeIUivpNGWwJ03pw0
 aRZZ5uOsfr7cEgTxs7f2/PPq8CQEfI0w7VNLdja6qkIesRpbtzE0AyOWQwVLZjQD2M
 KzFaaVbZBF+uAyFq+9e+qd/78H6rjisCPabSXrr1YGbI4TJi4MCLFaZCoH/3Gd8hwS
 f9qLcm0pTbw0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qY3hOQvq
Subject: Re: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump to
 version 2.10.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2022-09-04 12:10 -0700, Christian Stewart spake thusly:
> Docker Compose v2 is a CLI plugin loaded by docker-cli.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

Applied to next, with the following changes, thanks:

  - don't select docker-cli, but depends-on it; explain it in commit log
  - explain why we override the install commands
  - explain change in license file hash

Please, try to be a bit more verbose in your commit logs...

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS                                    |  1 +
>  ...p-generic-versions-and-bump-requests.patch | 66 -------------------
>  ...2-Bump-texttable-from-0.9.1-to-1.6.2.patch | 41 ------------
>  ...003-support-PyYAML-up-to-5.1-version.patch | 44 -------------
>  package/docker-compose/Config.in              | 35 +++-------
>  package/docker-compose/docker-compose.hash    |  8 +--
>  package/docker-compose/docker-compose.mk      | 17 +++--
>  7 files changed, 27 insertions(+), 185 deletions(-)
>  delete mode 100644 package/docker-compose/0001-Strip-up-generic-versions-and-bump-requests.patch
>  delete mode 100644 package/docker-compose/0002-Bump-texttable-from-0.9.1-to-1.6.2.patch
>  delete mode 100644 package/docker-compose/0003-support-PyYAML-up-to-5.1-version.patch
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d2bd0d809a..38270cb059 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -532,6 +532,7 @@ F:	package/batman-adv/
>  F:	package/containerd/
>  F:	package/delve/
>  F:	package/docker-cli/
> +F:	package/docker-compose/
>  F:	package/docker-engine/
>  F:	package/docker-proxy/
>  F:	package/embiggen-disk/
> diff --git a/package/docker-compose/0001-Strip-up-generic-versions-and-bump-requests.patch b/package/docker-compose/0001-Strip-up-generic-versions-and-bump-requests.patch
> deleted file mode 100644
> index 536a9590dd..0000000000
> --- a/package/docker-compose/0001-Strip-up-generic-versions-and-bump-requests.patch
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -From 2bb1a267aba3ca5fe414d0f79192def668c18bab Mon Sep 17 00:00:00 2001
> -From: Ulysses Souza <ulysses.souza@docker.com>
> -Date: Tue, 2 Jul 2019 15:49:07 +0200
> -Subject: [PATCH] Strip up generic versions and bump requests
> -
> -Replaces generic limitations with a next major value
> -Bump the minimal `requests` to 2.20.0
> -
> -Signed-off-by: Ulysses Souza <ulysses.souza@docker.com>
> -(cherry picked from commit ce5451c5b4a3b449ce703168d2a568b0a4d25ee6)
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ----
> - setup.py | 24 ++++++++++++------------
> - 1 file changed, 12 insertions(+), 12 deletions(-)
> -
> -diff --git a/setup.py b/setup.py
> -index 8371cc75..61447801 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -31,31 +31,31 @@ def find_version(*file_paths):
> - 
> - install_requires = [
> -     'cached-property >= 1.2.0, < 2',
> --    'docopt >= 0.6.1, < 0.7',
> --    'PyYAML >= 3.10, < 4.3',
> --    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 2.21',
> --    'texttable >= 0.9.0, < 0.10',
> --    'websocket-client >= 0.32.0, < 1.0',
> --    'docker[ssh] >= 3.7.0, < 4.0',
> --    'dockerpty >= 0.4.1, < 0.5',
> -+    'docopt >= 0.6.1, < 1',
> -+    'PyYAML >= 3.10, < 5',
> -+    'requests >= 2.20.0, < 3',
> -+    'texttable >= 0.9.0, < 1',
> -+    'websocket-client >= 0.32.0, < 1',
> -+    'docker[ssh] >= 3.7.0, < 5',
> -+    'dockerpty >= 0.4.1, < 1',
> -     'six >= 1.3.0, < 2',
> -     'jsonschema >= 2.5.1, < 3',
> - ]
> - 
> - 
> - tests_require = [
> --    'pytest',
> -+    'pytest < 6',
> - ]
> - 
> - 
> - if sys.version_info[:2] < (3, 4):
> --    tests_require.append('mock >= 1.0.1')
> -+    tests_require.append('mock >= 1.0.1, < 2')
> - 
> - extras_require = {
> -     ':python_version < "3.4"': ['enum34 >= 1.0.4, < 2'],
> --    ':python_version < "3.5"': ['backports.ssl_match_hostname >= 3.5'],
> --    ':python_version < "3.3"': ['ipaddress >= 1.0.16'],
> --    ':sys_platform == "win32"': ['colorama >= 0.4, < 0.5'],
> -+    ':python_version < "3.5"': ['backports.ssl_match_hostname >= 3.5, < 4'],
> -+    ':python_version < "3.3"': ['ipaddress >= 1.0.16, < 2'],
> -+    ':sys_platform == "win32"': ['colorama >= 0.4, < 1'],
> -     'socks': ['PySocks >= 1.5.6, != 1.5.7, < 2'],
> - }
> - 
> --- 
> -2.20.1
> -
> diff --git a/package/docker-compose/0002-Bump-texttable-from-0.9.1-to-1.6.2.patch b/package/docker-compose/0002-Bump-texttable-from-0.9.1-to-1.6.2.patch
> deleted file mode 100644
> index 92c2e1f133..0000000000
> --- a/package/docker-compose/0002-Bump-texttable-from-0.9.1-to-1.6.2.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From e55dd65ba42a17ba4b017b42f14f7ee647efe64f Mon Sep 17 00:00:00 2001
> -From: Ulysses Souza <ulysses.souza@docker.com>
> -Date: Mon, 8 Jul 2019 14:52:30 +0200
> -Subject: [PATCH] Bump texttable from 0.9.1 to 1.6.2
> -
> -Signed-off-by: Ulysses Souza <ulysses.souza@docker.com>
> -(cherry picked from commit 0bfa1c34f054d86674434770d4d6340e02508e52)
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ----
> - requirements.txt | 2 +-
> - setup.py         | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/requirements.txt b/requirements.txt
> -index 6007ee3f..d868fdeb 100644
> ---- a/requirements.txt
> -+++ b/requirements.txt
> -@@ -19,6 +19,6 @@ PySocks==1.6.7
> - PyYAML==4.2b1
> - requests==2.20.0
> - six==1.10.0
> --texttable==0.9.1
> -+texttable==1.6.2
> - urllib3==1.21.1; python_version == '3.3'
> - websocket-client==0.56.0
> -diff --git a/setup.py b/setup.py
> -index 61447801..c9e4729d 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -34,7 +34,7 @@ install_requires = [
> -     'docopt >= 0.6.1, < 1',
> -     'PyYAML >= 3.10, < 5',
> -     'requests >= 2.20.0, < 3',
> --    'texttable >= 0.9.0, < 1',
> -+    'texttable >= 0.9.0, < 2',
> -     'websocket-client >= 0.32.0, < 1',
> -     'docker[ssh] >= 3.7.0, < 5',
> -     'dockerpty >= 0.4.1, < 1',
> --- 
> -2.20.1
> -
> diff --git a/package/docker-compose/0003-support-PyYAML-up-to-5.1-version.patch b/package/docker-compose/0003-support-PyYAML-up-to-5.1-version.patch
> deleted file mode 100644
> index ecbd197a51..0000000000
> --- a/package/docker-compose/0003-support-PyYAML-up-to-5.1-version.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 3be619b814c16c02a02499e7a157dabd065926dd Mon Sep 17 00:00:00 2001
> -From: Sergey Fursov <geyser85@gmail.com>
> -Date: Sun, 31 Mar 2019 12:45:50 +0700
> -Subject: [PATCH] support PyYAML up to 5.1 version
> -
> -Signed-off-by: Sergey Fursov <geyser85@gmail.com>
> -[Upstream: https://github.com/docker/compose/pull/6623]
> -(cherry picked from commit d2ca096f46a56cd4db494c593ed84e5c255dc15d)
> -[Peter: allow all 5.x]
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ----
> - requirements.txt | 2 +-
> - setup.py         | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/requirements.txt b/requirements.txt
> -index d868fdeb..e3dbc807 100644
> ---- a/requirements.txt
> -+++ b/requirements.txt
> -@@ -16,7 +16,7 @@ paramiko==2.4.2
> - pypiwin32==219; sys_platform == 'win32' and python_version < '3.6'
> - pypiwin32==223; sys_platform == 'win32' and python_version >= '3.6'
> - PySocks==1.6.7
> --PyYAML==4.2b1
> -+PyYAML==5.1
> - requests==2.20.0
> - six==1.10.0
> - texttable==1.6.2
> -diff --git a/setup.py b/setup.py
> -index c9e4729d..17ab678e 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -32,7 +32,7 @@ def find_version(*file_paths):
> - install_requires = [
> -     'cached-property >= 1.2.0, < 2',
> -     'docopt >= 0.6.1, < 1',
> --    'PyYAML >= 3.10, < 5',
> -+    'PyYAML >= 3.10, < 6',
> -     'requests >= 2.20.0, < 3',
> -     'texttable >= 0.9.0, < 2',
> -     'websocket-client >= 0.32.0, < 1',
> --- 
> -2.20.1
> -
> diff --git a/package/docker-compose/Config.in b/package/docker-compose/Config.in
> index f82a0c4bc2..bac8dff30d 100644
> --- a/package/docker-compose/Config.in
> +++ b/package/docker-compose/Config.in
> @@ -1,30 +1,15 @@
>  config BR2_PACKAGE_DOCKER_COMPOSE
>  	bool "docker-compose"
> -	depends on BR2_USE_MMU # python3
> -	depends on BR2_USE_WCHAR # python3
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
> -	depends on !BR2_STATIC_LIBS # python3
> -	# python-paramiko -> python-cryptography
> -	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> -	select BR2_PACKAGE_PYTHON3
> -	select BR2_PACKAGE_PYTHON_CACHED_PROPERTY # runtime
> -	select BR2_PACKAGE_PYTHON_DOCOPT # runtime
> -	select BR2_PACKAGE_PYTHON_PARAMIKO # runtime
> -	select BR2_PACKAGE_PYTHON_PYYAML # runtime
> -	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
> -	select BR2_PACKAGE_PYTHON_TEXTTABLE # runtime
> -	select BR2_PACKAGE_PYTHON_WEBSOCKET_CLIENT # runtime
> -	select BR2_PACKAGE_PYTHON_DOCKER # runtime
> -	select BR2_PACKAGE_PYTHON_DOCKERPTY # runtime
> -	select BR2_PACKAGE_PYTHON_SIX # runtime
> -	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_DOCKER_CLI
>  	help
> -	  Multi-container orchestration for Docker.
> +	  Multi-container applications with the Docker CLI.
>  
> -	  https://www.docker.com/
> +	  https://github.com/docker/compose
>  
> -comment "docker-compose needs a toolchain w/ wchar, threads, dynamic library"
> -	depends on BR2_USE_MMU
> -	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> -		BR2_STATIC_LIBS
> +comment "docker-compose needs a toolchain w/ threads"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
> index 42d71c8095..46a8c59d55 100644
> --- a/package/docker-compose/docker-compose.hash
> +++ b/package/docker-compose/docker-compose.hash
> @@ -1,5 +1,3 @@
> -# from https://pypi.python.org/pypi/docker-compose/json
> -sha256  a5d58e974fd717e24b0dda6669a46bc03548d9023ef38d965acdc32d4d5fa753  docker-compose-1.24.1.tar.gz
> -
> -# locally computed
> -sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
> +# Locally computed
> +sha256  7f051283dc2c047a40604c52dffa579a079bdf54eca742da54f8352dcffc3549  docker-compose-2.10.0.tar.gz
> +sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
> diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
> index ec24157c56..1d071cc423 100644
> --- a/package/docker-compose/docker-compose.mk
> +++ b/package/docker-compose/docker-compose.mk
> @@ -4,10 +4,19 @@
>  #
>  ################################################################################
>  
> -DOCKER_COMPOSE_VERSION = 1.24.1
> -DOCKER_COMPOSE_SITE = https://files.pythonhosted.org/packages/b6/a4/59c39df6a23144a6252ad33170dfbf781af5953651e4587e8ea5f995f95e
> -DOCKER_COMPOSE_SETUP_TYPE = setuptools
> +DOCKER_COMPOSE_VERSION = 2.10.0
> +DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
>  DOCKER_COMPOSE_LICENSE = Apache-2.0
>  DOCKER_COMPOSE_LICENSE_FILES = LICENSE
>  
> -$(eval $(python-package))
> +DOCKER_COMPOSE_BUILD_TARGETS = cmd
> +DOCKER_COMPOSE_GOMOD = github.com/docker/compose/v2
> +DOCKER_COMPOSE_LDFLAGS = \
> +	-X github.com/docker/compose/v2/internal.Version=$(DOCKER_COMPOSE_VERSION)
> +
> +define DOCKER_COMPOSE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 755 $(@D)/bin/cmd \
> +		$(TARGET_DIR)/usr/lib/docker/cli-plugins/docker-compose
> +endef
> +
> +$(eval $(golang-package))
> -- 
> 2.37.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
