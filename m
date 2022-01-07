Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C457C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACF3E60A85;
	Fri,  7 Jan 2022 21:38:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ST_nYhKpohWG; Fri,  7 Jan 2022 21:38:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C0A860A99;
	Fri,  7 Jan 2022 21:38:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A16C1BF35A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC19E823C6
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:38:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u1Ae6lsFnVEX for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:38:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45F3881DA3
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 21:38:49 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id l25so2611749wrb.13
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 13:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=k+pis9sGcgojdgeSWAd34Kc+rV0/BU3ReHHGCJhTFGU=;
 b=b5tY8Y+EOxB0G3pRasEWjXz+tmvdGpgQ4bQhuLU6clg4jTD0qD28EfDNX4i2kTQkOT
 6w8G1R0USrTNlPyVXBSyPQHufzrv3hDCD+0p9E7dZySKZrv0QdCs3sP+wn9UcOsaZ8cQ
 50bjK7b7pAzyjLYTXMe+O9RaaCx5OSCO8fOe4+Ld75pyTzJGUoIVKORc1uhnyrK82f2j
 oxpc98hlbUVQRSJI+xbrB8hXyJD7O59qpB9Ik1C/NfIOJs73nPwt4Rv4HLQVvAndMG5d
 u7E6mqj8joN/nzq/4zjAqlr/k3h7sw0isQ0AoeK8mnU8XoaYOebri1SnqVhRwTfXFD7w
 fCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=k+pis9sGcgojdgeSWAd34Kc+rV0/BU3ReHHGCJhTFGU=;
 b=HtDxawxXK+KQP0GzqfAboG68i9Esnl8dRP9kqHiOOZYtKu1LXZA847TQ3gmENTV9hY
 kO8k2sQjiYh6MHxGXjzTZCcINPgzrJJRBeblt5QuZRoMRgrUptq7zSe68aMX9270EHkv
 c04iSRv1v4RrBfHhlGRGqAVyBLhZUJbiPOsrjdRVDYfsq8KgGz8pMwRJakyd1wfYiZRC
 l58eXVOFcODqKcghdZFPcufUM9KuF76BZxbd5nKJYCPV1vw2chwGWxP+uIgCSo3tj1wN
 tal+yS/JqdeJTw0MzDtrXdo3U4GViPs+kXnsUP2sIVd3JySF2XjTTJrLvZ9fqCBhlESZ
 ZPlA==
X-Gm-Message-State: AOAM532LpgjjQdFUvhOQZGOWno6xqx7bWFe4Pzm7rcMXXIsrM6GH7ufH
 bn/DjM5GBESUMipxvBNxGFVq7g==
X-Google-Smtp-Source: ABdhPJzqETaEtd+CcT4Ac+ud1s2ieyGhMeEeBLqPIH2rnWb5t6Q3ElkkvKTCPORWuP2k8rCD9bXbIw==
X-Received: by 2002:adf:eb4f:: with SMTP id u15mr7627009wrn.6.1641591527466;
 Fri, 07 Jan 2022 13:38:47 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id r13sm5701588wmq.28.2022.01.07.13.38.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 13:38:46 -0800 (PST)
Message-ID: <e905321d-537c-1a0b-7565-9c9d21dda5d6@mind.be>
Date: Fri, 7 Jan 2022 22:38:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org,
 Guillaume William Bres <guillaume.bressaix@gmail.com>
References: <20200407111515.21131-1-jagan@amarulasolutions.com>
 <20200407111515.21131-5-jagan@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200407111515.21131-5-jagan@amarulasolutions.com>
Subject: Re: [Buildroot] [PATCH v8 4/5] support/testing: add python-pybind11
 test
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
Cc: Esben Haabendal <esben@geanix.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Adam Duskett <Aduskett@gmail.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2020 13:15, Jagan Teki wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> This test is a simple integration test of the python-pybind11 package.
> 
> It consists of the following:
> - The python-pybind11-addition-example package compiles a simple cpp file
>    which adds two given numbers together and returns the results and installs
>    the compiled file to /root/
>    This example is from the following URL:
>      https://pybind11.readthedocs.io/en/stable/basics.html
> 
> - The python-pybind11-addition-example package installs the
>    sample_python_pybind11.py file which imports the above-compiled file and adds
>    1 and 2 together to /root/
> 
> - Execute the sample_python_pybind11.py in an emulator with the expected output
>    of 3 and an exit code of 0.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> [jagan: rebase, fix trailing whitespace, new line warninings]
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

  I applied a heavily modified version of this to master.

  Unfortunately, Guillaume had posted a new version of this patch but had taken 
authorship of it, and I hadn't noticed that Adam was in fact the author. So it 
has gone in with just Guillaume as author and without credit to Adam or Jagan. 
Sorry for that.


  Regards,
  Arnout

> ---
> Changes for v8
> - new patch
> 
>   .gitlab-ci.yml                                |  2 +
>   DEVELOPERS                                    |  2 +
>   .../br2-external/python-pybind11/Config.in    |  1 +
>   .../python-pybind11/external.desc             |  1 +
>   .../br2-external/python-pybind11/external.mk  |  1 +
>   .../Config.in                                 |  5 ++
>   .../pybind11_addition_example.cpp             |  9 +++
>   .../python-pybind11-addition-example.mk       | 39 ++++++++++
>   .../sample_python_pybind11.py                 |  4 +
>   .../tests/package/test_python_pybind11.py     | 76 +++++++++++++++++++
>   10 files changed, 140 insertions(+)
>   create mode 100644 support/testing/tests/package/br2-external/python-pybind11/Config.in
>   create mode 100644 support/testing/tests/package/br2-external/python-pybind11/external.desc
>   create mode 100644 support/testing/tests/package/br2-external/python-pybind11/external.mk
>   create mode 100644 support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/Config.in
>   create mode 100644 support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/pybind11_addition_example.cpp
>   create mode 100644 support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/python-pybind11-addition-example.mk
>   create mode 100644 support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/sample_python_pybind11.py
>   create mode 100644 support/testing/tests/package/test_python_pybind11.py
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index d9519c3812..ce524337cb 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -471,6 +471,8 @@ tests.package.test_python_passlib.TestPythonPy2Passlib: { extends: .runtime_test
>   tests.package.test_python_passlib.TestPythonPy3Passlib: { extends: .runtime_test }
>   tests.package.test_python_pexpect.TestPythonPy2Pexpect: { extends: .runtime_test }
>   tests.package.test_python_pexpect.TestPythonPy3Pexpect: { extends: .runtime_test }
> +tests.package.test_python_pybind11.TestPythonPy2Pybind11: { extends: .runtime_test }
> +tests.package.test_python_pybind11.TestPythonPy3Pybind11: { extends: .runtime_test }
>   tests.package.test_python_pynacl.TestPythonPy2Pynacl: { extends: .runtime_test }
>   tests.package.test_python_pynacl.TestPythonPy3Pynacl: { extends: .runtime_test }
>   tests.package.test_python_pyyaml.TestPythonPy2Pyyaml: { extends: .runtime_test }
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 308a59b264..f06d54a662 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -85,6 +85,8 @@ F:	package/sngrep/
>   F:	package/spidermonkey/
>   F:	package/systemd/
>   F:	support/testing/tests/package/test_python_gobject.py
> +F:	support/testing/tests/package/br2-external/python-pybind11/
> +F:	support/testing/tests/package/test_python_pybind11.py
>   
>   N:	Adam Heinrich <adam@adamh.cz>
>   F:	package/jack1/
> diff --git a/support/testing/tests/package/br2-external/python-pybind11/Config.in b/support/testing/tests/package/br2-external/python-pybind11/Config.in
> new file mode 100644
> index 0000000000..27b502313b
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/python-pybind11/Config.in
> @@ -0,0 +1 @@
> +source "$BR2_EXTERNAL_PYTHON_PYBIND11_PATH/package/python-pybind11-addition-example/Config.in"
> diff --git a/support/testing/tests/package/br2-external/python-pybind11/external.desc b/support/testing/tests/package/br2-external/python-pybind11/external.desc
> new file mode 100644
> index 0000000000..04a636053a
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/python-pybind11/external.desc
> @@ -0,0 +1 @@
> +name: PYTHON_PYBIND11
> diff --git a/support/testing/tests/package/br2-external/python-pybind11/external.mk b/support/testing/tests/package/br2-external/python-pybind11/external.mk
> new file mode 100644
> index 0000000000..db34e5f54d
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/python-pybind11/external.mk
> @@ -0,0 +1 @@
> +include $(sort $(wildcard $(BR2_EXTERNAL_PYTHON_PYBIND11_PATH)/package/*/*.mk))
> diff --git a/support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/Config.in b/support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/Config.in
> new file mode 100644
> index 0000000000..7860559a13
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_PYTHON_PYBIND11_ADDITION_EXAMPLE
> +	bool "python-pybind11 addition example"
> +	depends on BR2_PACKAGE_PYTHON_PYBIND11
> +	help
> +	  Simple class for testing python-pybind11
> diff --git a/support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/pybind11_addition_example.cpp b/support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/pybind11_addition_example.cpp
> new file mode 100644
> index 0000000000..61b3fce051
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/pybind11_addition_example.cpp
> @@ -0,0 +1,9 @@
> +#include <pybind11/pybind11.h>
> +
> +int add(int i, int j) {
> +    return i + j;
> +}
> +
> +PYBIND11_MODULE(pybind11_addition_example, m) {
> +    m.def("add", &add, "A function which adds two numbers");
> +}
> diff --git a/support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/python-pybind11-addition-example.mk b/support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/python-pybind11-addition-example.mk
> new file mode 100644
> index 0000000000..f620424fca
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/python-pybind11-addition-example.mk
> @@ -0,0 +1,39 @@
> +################################################################################
> +#
> +# python-pybind11_addition_example
> +#
> +################################################################################
> +
> +PYTHON_PYBIND11_ADDITION_EXAMPLE_DEPENDENCIES = python-pybind11
> +
> +ifeq ($(BR2_PACKAGE_PYTHON),y)
> +PYTHON_PYBIND11_ADDITION_EXAMPLE_INCLUDES=`$(STAGING_DIR)/usr/bin/python2-config --includes`
> +PYTHON_PYBIND11_ADDITION_EXAMPLE_SUFFIX=`$(STAGING_DIR)/usr/bin/python2-config --extension-suffix`
> +else
> +PYTHON_PYBIND11_ADDITION_EXAMPLE_INCLUDES=`$(STAGING_DIR)/usr/bin/python3-config --includes`
> +PYTHON_PYBIND11_ADDITION_EXAMPLE_SUFFIX=`$(STAGING_DIR)/usr/bin/python3-config --extension-suffix`
> +endif
> +PYTHON_PYBIND11_ADDITION_EXAMPLE_OUTPUT=pybind11_addition_example$(PYTHON_PYBIND11_ADDITION_EXAMPLE_SUFFIX)
> +
> +define PYTHON_PYBIND11_ADDITION_EXAMPLE_BUILD_CMDS
> +	$(INSTALL) -D $(PYTHON_PYBIND11_ADDITION_EXAMPLE_PKGDIR)/pybind11_addition_example.cpp \
> +		$(@D)/pybind11_addition_example.cpp
> +
> +	$(INSTALL) -D $(PYTHON_PYBIND11_ADDITION_EXAMPLE_PKGDIR)/sample_python_pybind11.py \
> +		$(@D)/sample_python_pybind11.py
> +
> +	cd $(@D); \
> +		$(TARGET_CXX) -std=c++11 -fPIC -shared \
> +		$(PYTHON_PYBIND11_ADDITION_EXAMPLE_INCLUDES) pybind11_addition_example.cpp \
> +		-o $(PYTHON_PYBIND11_ADDITION_EXAMPLE_OUTPUT)
> +endef
> +
> +define PYTHON_PYBIND11_ADDITION_EXAMPLE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 755 $(@D)/$(PYTHON_PYBIND11_ADDITION_EXAMPLE_OUTPUT) \
> +		$(TARGET_DIR)/root/$(PYTHON_PYBIND11_ADDITION_EXAMPLE_OUTPUT)
> +
> +	$(INSTALL) -D -m 755 $(@D)/sample_python_pybind11.py \
> +		$(TARGET_DIR)/root/sample_python_pybind11.py
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/sample_python_pybind11.py b/support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/sample_python_pybind11.py
> new file mode 100644
> index 0000000000..29196481e1
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/sample_python_pybind11.py
> @@ -0,0 +1,4 @@
> +#!/usr/bin/env python
> +import pybind11_addition_example
> +
> +print(pybind11_addition_example.add(1, 2))
> diff --git a/support/testing/tests/package/test_python_pybind11.py b/support/testing/tests/package/test_python_pybind11.py
> new file mode 100644
> index 0000000000..12bd77807e
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_pybind11.py
> @@ -0,0 +1,76 @@
> +import os
> +import infra.basetest
> +
> +class TestPythonPy2Pybind11(infra.basetest.BRTest):
> +    br2_external = [infra.filepath("tests/package/br2-external/python-pybind11")]
> +    config = \
> +        """
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.86"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_TARGET_ROOTFS_CPIO_GZIP=y
> +        BR2_PACKAGE_PYTHON=y
> +        BR2_PACKAGE_PYTHON_PYBIND11=y
> +        BR2_PACKAGE_PYTHON_PYBIND11_ADDITION_EXAMPLE=y
> +        """
> +
> +    def login(self):
> +        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
> +        kern = os.path.join(self.builddir, "images", "Image")
> +        self.emulator.boot(arch="aarch64",
> +                           kernel=kern,
> +                           kernel_cmdline=["console=ttyAMA0"],
> +                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "512M", "-initrd", img])
> +        self.emulator.login()
> +
> +    def test_run(self):
> +        self.login()
> +        cmd = "python sample_python_pybind11.py"
> +        output, exit_code = self.emulator.run(cmd, 120)
> +        print(output)
> +        self.assertEqual(exit_code, 0)
> +        self.assertEqual(output, ["3"])
> +
> +class TestPythonPy3Pybind11(infra.basetest.BRTest):
> +    br2_external = [infra.filepath("tests/package/br2-external/python-pybind11")]
> +    config = \
> +        """
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.86"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_TARGET_ROOTFS_CPIO_GZIP=y
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_PYBIND11=y
> +        BR2_PACKAGE_PYTHON_PYBIND11_ADDITION_EXAMPLE=y
> +        """
> +
> +    def login(self):
> +        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
> +        kern = os.path.join(self.builddir, "images", "Image")
> +        self.emulator.boot(arch="aarch64",
> +                           kernel=kern,
> +                           kernel_cmdline=["console=ttyAMA0"],
> +                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "512M", "-initrd", img])
> +        self.emulator.login()
> +
> +    def test_run(self):
> +        self.login()
> +        cmd = "python3 sample_python_pybind11.py"
> +        output, exit_code = self.emulator.run(cmd, 120)
> +        print(output)
> +        self.assertEqual(exit_code, 0)
> +        self.assertEqual(output, ["3"])
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
