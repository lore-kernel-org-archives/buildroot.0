Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34288C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D268560A99;
	Fri,  7 Jan 2022 21:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rROIt72rRAjo; Fri,  7 Jan 2022 21:57:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B192E60ADD;
	Fri,  7 Jan 2022 21:57:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 071601BF35A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E98EC81458
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:57:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jBssdlyhh9Y1 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:57:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1B9A81425
 for <buildroot@busybox.net>; Fri,  7 Jan 2022 21:57:44 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id a5so9571807wrh.5
 for <buildroot@busybox.net>; Fri, 07 Jan 2022 13:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=l8Ev+8wjLp5fi9Qgf4Rn8/ouh80ObeeYwawlBPkQCZg=;
 b=WpJqR/I1+Mi+Cw0Xz1sZQZL+6MGRcM00CRYQD3YML5nn596V4vBGNzYm9zOXPhCSh5
 gA+KEtAGxpXlJY5khe9UMi/iTfa3yjor9HNZnDvDbODHS8kxT2sISo9k6OjVJ/aKMU1O
 YdkNAHyEmz5uejCqfW0akvUv+iL+rbMg8DeLaHh1npRenTKHpofcb+cSo6m/RDVFZnId
 YuswZGm1oIfSNNLmLYIlGt79o2x55w163KdP3wgjV7IIpHebhf/O8OYWq9zIf4PON2kx
 yaGv4t0QByxbQ8DD+OMHD0dK2D5VePyfx5GxYWxyatPYAcHGB88FkAZ8XCFoz/svktNy
 tP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=l8Ev+8wjLp5fi9Qgf4Rn8/ouh80ObeeYwawlBPkQCZg=;
 b=d7nwwnkfCdMi27KKu5u8TVfb289RjTTqHKamK83tpheWIUFxcq3OnmVE+RSVZL2hFP
 6hcf/hG65A2WC5K2lIt5kRA/xOvjMBCc5pKM7vb0nhcsyIYnEfbZl2Dbhrk/09c4w8RR
 f2UdF8XaMprZngO56qIf7oAyWgVT/XDaw7FvDi3nTHonfdoQmvtAofza2acaDVEtix4n
 FXhRCLQKV8lkBBLMnXiY0yNYVr0XFXhpTYDrNnc9Q0Y70pcHqsx1R6usEImKpqjx63Ke
 EZ/LmfqYV4YOfMDfSKUkd5OZ8SsgXBZGEN6b0ya2Wsla9+nkAdHjjSx1a+AG59NblvHU
 NwRA==
X-Gm-Message-State: AOAM532e5AMOzKZzPV3es7J82lb32MsJ1439b5DzKVdOlawDkUPRuBDF
 vkAQR4b1ytTDDtAbePxuZHRHrUlBQos7jH3M
X-Google-Smtp-Source: ABdhPJysCKFlXmYAjkpYwSzxD4TZstZJS2Rgv1ElBWuHcVfKGBZX3q3siAg9qGIvpDao1xT9j/64hA==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr59326353wrd.339.1641592662758; 
 Fri, 07 Jan 2022 13:57:42 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id u14sm5615230wrf.39.2022.01.07.13.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 13:57:42 -0800 (PST)
Message-ID: <267a64ba-8407-bcea-0e3b-994986433b0c@mind.be>
Date: Fri, 7 Jan 2022 22:57:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: guillaume.bressaix@gmail.com, buildroot@busybox.net
References: <cae0c1b2-34bb-b1a9-f02a-9e98ddd9fbe5@ideasonboard.com>
 <20220104123901.23929-1-guillaume.bressaix@gmail.com>
 <20220104123901.23929-3-guillaume.bressaix@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220104123901.23929-3-guillaume.bressaix@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 3/3] support/testing: add test for
 python-pybind
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
Cc: tomi.valkeinen@ideasonboard.com, yann.morin.1998@free.fr
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/01/2022 13:39, guillaume.bressaix@gmail.com wrote:
> From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
> 
> python-pybind is a header only library, most of the time used as a host-package,
> to customize the host/usr/python interpreter capacity (at build time) with C++ based features.
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

  I applied to master with many changes:

      - Retain python3 only.
      - python-pybind is a target package, not host.
      - Select python-pybind instead of depend.
      - Simplify python-pybind-example package.
      - Check in python-pybind-example build if pybind11.get_include()
        produces output.
      - Don't use python3 -m pybind11 --includes: it includes the main python
        includes, which are for the host, not for the target.
      - Use TestPythonPackageBase instead of open-coding something imported
        with host python.

  However, I hadn't noticed that the original author of this test was Adam. In 
the future, please make sure that you don't claim authorship on a patch that is 
actually from someone else!

  Regards,
  Arnout

> ---
> This test case enhances the /host/usr/python interpreter with a C++ macro.
> 
> The test delivers a C++ macro contained in its br-external/example.cpp.
> We compile it against the host context.
> We install it to $(HOST_DIR)/usr/lib/python3.9 as it is natively contained
> in the host-python system path (import is easy).
> The macro is an integer adder, written in C++ that we can now call in host-python.
> 
> The test infrastructure should actually be declared "host-generic-package"
> instead of "generic-package", to be consistent with Buildroot infrastructure.
> But I am not able to get this to actually do anything, if I declare this package
> as a host-generic and "Config.in.host" instead of "Config.in". To me, this is
> not too important
> 
> * TestPythonPybind allows testing for both Py2 and Py3 like it is done
> in many other packages
> 
> * TestPythonPybind does not inherit from TestPythonPackageBase as usually done
>    (1) because I need the br2-external feature to ship the example.cpp containing the custom macro
>    (2) because TestPythonPackageBase always involves the emulator, which we do not want in our context
> 
> * Although TestPythonPybind does have a TestPythonBase.config base at the same time,
> as it is most convenient to have a valid python context
> 
> * TestPythonPybind uses subprocess, as similarly done in 'core' on 'infra' test cases,
> because we do not involve the emulator
> 
> * TestPythonPybind tests (1+2)=3 written in C++, used in Python 2/3
> * TestPythonPybind tests a custom module attribute, written in C++, used in Python 2/3
> 
> ---
>   DEVELOPERS                                    |  3 ++
>   .../br2-external/python-pybind/Config.in      |  1 +
>   .../br2-external/python-pybind/external.desc  |  1 +
>   .../br2-external/python-pybind/external.mk    |  1 +
>   .../package/python-pybind-example/Config.in   |  5 ++
>   .../package/python-pybind-example/example.cpp | 16 +++++++
>   .../python-pybind-example.mk                  | 47 ++++++++++++++++++
>   .../tests/package/sample_python_pybind.py     |  4 ++
>   .../tests/package/test_python_pybind.py       | 48 +++++++++++++++++++
>   9 files changed, 126 insertions(+)
>   create mode 100644 support/testing/tests/package/br2-external/python-pybind/Config.in
>   create mode 100644 support/testing/tests/package/br2-external/python-pybind/external.desc
>   create mode 100644 support/testing/tests/package/br2-external/python-pybind/external.mk
>   create mode 100644 support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/Config.in
>   create mode 100644 support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/example.cpp
>   create mode 100644 support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/python-pybind-example.mk
>   create mode 100644 support/testing/tests/package/sample_python_pybind.py
>   create mode 100644 support/testing/tests/package/test_python_pybind.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 21e4f2a84c..130ac3db73 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1120,6 +1120,9 @@ F:	package/liquid-dsp/
>   F:	package/pixiewps/
>   F:	package/python-pybind/
>   F:	package/reaver/
> +F:	support/testing/tests/package/br2-external/python-pybind
> +F:	support/testing/tests/package/sample_python_pybind.py
> +F:	support/testing/tests/package/test_python_pybind.py
>   
>   N:	Guo Ren <ren_guo@c-sky.com>
>   F:	arch/Config.in.csky
> diff --git a/support/testing/tests/package/br2-external/python-pybind/Config.in b/support/testing/tests/package/br2-external/python-pybind/Config.in
> new file mode 100644
> index 0000000000..70c77157b3
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/python-pybind/Config.in
> @@ -0,0 +1 @@
> +source "$BR2_EXTERNAL_PYTHON_PYBIND_PATH/package/python-pybind-example/Config.in"
> diff --git a/support/testing/tests/package/br2-external/python-pybind/external.desc b/support/testing/tests/package/br2-external/python-pybind/external.desc
> new file mode 100644
> index 0000000000..eef5e0f5a0
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/python-pybind/external.desc
> @@ -0,0 +1 @@
> +name: PYTHON_PYBIND
> diff --git a/support/testing/tests/package/br2-external/python-pybind/external.mk b/support/testing/tests/package/br2-external/python-pybind/external.mk
> new file mode 100644
> index 0000000000..3501f3135e
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/python-pybind/external.mk
> @@ -0,0 +1 @@
> +include $(sort $(wildcard $(BR2_EXTERNAL_PYTHON_PYBIND_PATH)/package/*/*.mk))
> diff --git a/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/Config.in b/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/Config.in
> new file mode 100644
> index 0000000000..773d021a53
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_PYTHON_PYBIND_EXAMPLE
> +	bool "python-pybind-example"
> +	depends on BR2_PACKAGE_PYTHON_PYBIND
> +	help
> +	  This test creates a cpp macro later used on target in python
> diff --git a/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/example.cpp b/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/example.cpp
> new file mode 100644
> index 0000000000..f2eea8e48d
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/example.cpp
> @@ -0,0 +1,16 @@
> +#include <pybind11/pybind11.h>
> +namespace py = pybind11;
> +
> +int add (int i, int j) {
> +    return i + j;
> +}
> +
> +PYBIND11_MODULE (example, m) {
> +    // optional module description
> +    m.doc() = "pybind11 example plugin";
> +    // test a module method
> +    m.def("add", &add, "example::add adds two integer numbers");
> +    // test a module attribute
> +    py::object hello = py::cast("Hello World");
> +    m.attr("says") = hello;
> +}
> diff --git a/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/python-pybind-example.mk b/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/python-pybind-example.mk
> new file mode 100644
> index 0000000000..85dd09d93f
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/python-pybind-example.mk
> @@ -0,0 +1,47 @@
> +################################################################################
> +#
> +# python-pybind-example
> +#
> +################################################################################
> +
> +# this builds a C++ macro "add(a,b)"
> +# that we expose to host-python with a custom install
> +# and that the python test script will later use
> +PYTHON_PYBIND_EXAMPLE_DEPENDENCIES = host-python-pybind
> +
> +PYTHON_PYBIND_EXAMPLE_CXX_FLAGS = $(HOST_CXXFLAGS)
> +PYTHON_PYBIND_EXAMPLE_CXX_FLAGS += -Wall -shared
> +PYTHON_PYBIND_EXAMPLE_CXX_FLAGS += -std=c++11 -fPIC
> +
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +PYTHON_PYBIND_PYVER = python$(PYTHON3_VERSION_MAJOR)
> +PYTHON_PYBIND_PYTHON = $(HOST_DIR)/usr/bin/python3
> +else
> +PYTHON_PYBIND_PYVER = python$(PYTHON_VERSION_MAJOR)
> +PYTHON_PYBIND_PYTHON = $(HOST_DIR)/usr/bin/python2
> +endif
> +
> +# retrieve pybind11 include paths
> +PYTHON_PYBIND_EXAMPLE_CXX_FLAGS += \
> +	$(shell $(PYTHON_PYBIND_PYTHON) -m pybind11 --includes)
> +
> +# .so to be installed must have exact suffix
> +# otherwise import() in python will not work
> +HOST_LIB_BINARY_SUFFIX = \
> +	$(shell $(PYTHON_PYBIND_PYTHON)-config --extension-suffix)
> +
> +define PYTHON_PYBIND_EXAMPLE_BUILD_CMDS
> +	$(INSTALL) $(PYTHON_PYBIND_EXAMPLE_PKGDIR)/example.cpp $(@D)
> +	cd $(@D); \
> +			$(HOSTCXX) $(PYTHON_PYBIND_EXAMPLE_CXX_FLAGS) \
> +				example.cpp -o example$(HOST_LIB_BINARY_SUFFIX)
> +endef
> +
> +# installs into host/python sys.path
> +# so the new macro is naturally known
> +define PYTHON_PYBIND_EXAMPLE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 755 $(@D)/example$(HOST_LIB_BINARY_SUFFIX) \
> +		$(HOST_DIR)/usr/lib/$(PYTHON_PYBIND_PYVER)/example$(HOST_LIB_BINARY_SUFFIX)
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/support/testing/tests/package/sample_python_pybind.py b/support/testing/tests/package/sample_python_pybind.py
> new file mode 100644
> index 0000000000..605c0bab15
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_pybind.py
> @@ -0,0 +1,4 @@
> +#!/usr/bin/env python
> +import example
> +print(example.add(1, 2))
> +print(example.says)
> diff --git a/support/testing/tests/package/test_python_pybind.py b/support/testing/tests/package/test_python_pybind.py
> new file mode 100644
> index 0000000000..7a68d6512a
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_pybind.py
> @@ -0,0 +1,48 @@
> +import os
> +import infra
> +import subprocess
> +from tests.package.test_python import TestPythonPackageBase
> +
> +class TestPythonPybind (infra.basetest.BRTest):
> +	config = TestPythonPackageBase.config # python minimal requirements
> +	sample_script = "tests/package/sample_python_pybind.py"
> +	# ship examples macro & installs it to host
> +	br2_external = [infra.filepath("tests/package/br2-external/python-pybind")]
> +
> +class TestPythonPy2Pybind (TestPythonPybind):
> +	__test__ = True
> +	config = TestPythonPybind.config + \
> +		"""
> +		BR2_PACKAGE_PYTHON=y
> +		BR2_PACKAGE_PYTHON_PYBIND=y
> +		BR2_PACKAGE_PYTHON_PYBIND_EXAMPLE=y
> +		"""
> +
> +	def test_run(self):
> +		host_interpreter = os.path.join(self.builddir,"host","usr","bin","python")
> +		# test new c++->py macro exposed to host interpreter
> +		cmd = [host_interpreter, infra.filepath(self.sample_script)]
> +		output = subprocess.check_output(cmd)
> +		result = int(output.splitlines()[0])
> +		attribute = output.splitlines()[1].decode("utf-8")
> +		self.assertEqual(result,3) # 2+1 using '+' macro from cpp
> +		self.assertEqual(attribute,"Hello World") # macro special attribute
> +
> +class TestPythonPy3Pybind (TestPythonPybind):
> +	__test__ = True
> +	config = TestPythonPybind.config + \
> +		"""
> +		BR2_PACKAGE_PYTHON3=y
> +		BR2_PACKAGE_PYTHON_PYBIND=y
> +		BR2_PACKAGE_PYTHON_PYBIND_EXAMPLE=y
> +		"""
> +
> +	def test_run(self):
> +		host_interpreter = os.path.join(self.builddir,"host","usr","bin","python")
> +		# test new c++->py macro exposed to host interpreter
> +		cmd = [host_interpreter, infra.filepath(self.sample_script)]
> +		output = subprocess.check_output(cmd)
> +		result = int(output.splitlines()[0])
> +		attribute = output.splitlines()[1].decode("utf-8")
> +		self.assertEqual(result,3) # 2+1 using '+' macro from cpp
> +		self.assertEqual(attribute,"Hello World") # macro special attribute
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
