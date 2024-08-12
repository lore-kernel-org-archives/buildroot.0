Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4921EC3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 07:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A20A81170;
	Mon, 12 Aug 2024 07:59:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ohct3kumG3ep; Mon, 12 Aug 2024 07:59:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B98208102A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B98208102A;
	Mon, 12 Aug 2024 07:59:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 623F01BF20F
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 07:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BAC78102A
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 07:59:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2zrzw8yRGYAQ for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 07:59:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=dylan.bespalko@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B4AE80EBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B4AE80EBB
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B4AE80EBB
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 07:59:22 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1fec34f94abso32523915ad.2
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 00:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723449561; x=1724054361;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SNzOczRKMCvEt+8AUKlYmA822lMCsmWds53OXZELa/k=;
 b=PZT0VYkQOsTWiCrRMeuG0MDSeu4EeZ/C2AC6OQJ4QQIQ2bIWaxdHIpXcuHjcUH/2WP
 u/3EphN6JO9lG0RzKi/QjcfFVtfAHnnHemUeEKhkDTSSL6gcn76QjdJLY+dqbmZIo9lp
 AhQL66ISEbMrjgBV8J7qdGTFY5uj9I7g/FDc/xX1+9cNYfzlstV9iSNcgvubF49uDhLj
 R4N4ymrNiOvKZm5ck/6dYnb/LAYe9AhU1c6E+fJwO1X/iMwavhQijj5NkrP/4hdFDG5s
 A9IwcLAmGfOd04h4YIwSRkGpjr4SfOFx7ef+P7Aq4Z4nzC36E/rrN6tgdYCvdmWoGoK3
 hvmw==
X-Gm-Message-State: AOJu0YwA9+LwUyJLfBmK0m465+fZ8uTxKV8Quipfz84aOwBT+q4wz0EV
 ydzBwWwea/3TWAFE/iEm88kaCUcFPFU7bYLdnLPPiudd/NboFgeC
X-Google-Smtp-Source: AGHT+IEpfypQrCQZn3YsNGLgNZsWmTzBlotTTWrOie27BtU0yF7Ip3kPXudEPRCmpmqTaH4GZU/K3A==
X-Received: by 2002:a17:902:d483:b0:1ff:49a0:46b1 with SMTP id
 d9443c01a7336-200ae4bb2a1mr78907435ad.6.1723449561035; 
 Mon, 12 Aug 2024 00:59:21 -0700 (PDT)
Received: from ?IPV6:2604:3d09:c8e:3500:220b:4cf2:4775:818c?
 ([2604:3d09:c8e:3500:220b:4cf2:4775:818c])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-200bba01d99sm32383285ad.209.2024.08.12.00.59.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 00:59:20 -0700 (PDT)
Message-ID: <f5f7d844-7931-45ca-ae24-e4ef2c741700@gmail.com>
Date: Mon, 12 Aug 2024 00:59:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240726192904.234263-1-dylan.bespalko@gmail.com>
 <20240803235523.0fbdba05@windsurf>
Content-Language: en-US
From: Dylan Bespalko <dylan.bespalko@gmail.com>
In-Reply-To: <20240803235523.0fbdba05@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723449561; x=1724054361; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SNzOczRKMCvEt+8AUKlYmA822lMCsmWds53OXZELa/k=;
 b=a+KEygiXN9/4nqHqa5gBq793VPzW/6Q00bWv9Ks4cdZufNnz7l/vvjecKef52W/v8x
 FBZuEPSm1ImSIBUwtjOTwbKpDLZQPVlZ9szX8S4ToTr9ylqhaLNY4mI+mEXSDCHYzj3d
 P/91TanWxs6Yfywl9hl9hNCpC9UGlvz43RdD4sNXeII6592kH4jiq1O64enXhe+XHyPY
 m0aLrBw6X+353UpQ/Ni6Wi4pr94asRFfvyTnJPb5MKB1nZ7iZ3OXEH3GT5xzqDGLN5Td
 Q3WsXltKppAn8TZJkSRWDHLWTJXuZLDtwzKw9VHUwUiHMrAyZFeBo2AhvWrlNsgwiVnm
 Mnfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=a+KEygiX
Subject: Re: [Buildroot] [PATCH v2 1/1] added python-pyside6 recipe
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Thanks for reviewing my code. I have applied all of your changes and
submitted the code under subject:
[PATCH v3 1/1] added package/python-{shiboken6,pyside6}: new packages

This email contains replies to your comments.

 > Hello Dylan,
 >
 > Thanks for your contribution! You are tackling some really difficult
 > packaging topic for what seems to be your very first Buildroot
 > contribution!
 >
 > See below some comments/questions.
 >
 > First very minor thing: commit message should be:
 >
 >       package/python-{shiboken6,pyside6}: new packages
 >
 > On Fri, 26 Jul 2024 12:29:03 -0700
 > Dylan Bespalko <dylan.bespalko@gmail.com> wrote:
 >
 >> The Shiboken6 C++/Python binding generator and the PySide6
 >> binding of the Qt6 C++ project is added. All PySide6 modules
 >> are supported except:
 >>    - PySide6.QtUITools is blocked by a build error in QtUITools
 >>    - PySide.QtOpenGLWidgets runs, but cannot be tested in QEMU.
 >>    - PySide6.QtQuickTest runs, but never passes any tests.
 >
 > You don't have to support everything: if there's something that you
 > don't use/haven't been able to get to work or test, just disable it,
 > and leave it up to whoever comes next and needs it.
 >

I have removed QtUITools and QtQuickTest as they would cause problems
for a downstream user.

 >> 1. Since Shiboken6 and PySide6 are in the same git repo, I needed
 >> to re-implement the *_CONFIGURE_CMDS to navigate to a sub-directory
 >> in the git repo. Two separate buildroot package recipes were needed
 >> because:
 >>    a) host-python-shiboken6 is needed, but not host-python-pyside6.
 >>    b) PyQt also separates python-sip from python-pyqt.
 >
 > I was surprised to see that actually PySide and Shiboken are available
 > as standalone Git repositories:
 >
 >    https://code.qt.io/cgit/pyside/pyside.git/
 >    https://code.qt.io/cgit/pyside/shiboken.git/
 >
 > but I guess these are the older (Qt 5) versions?
 >

Correct they were separate in Qt5. There are actually three projects 
combined in Qt6:
   - Shiboken6
   - PySide6
   - pyside-tools (Not Included): which contains pyside6-uic/pyside6-rcc

 > Regarding the re-implementation of the CMake configure command, have
 > you tried using <pkg>_SUBDIR ? Indeed if you set:
 >
 > PYTHON_PYSIDE6_SUBDIR = sources/pyside6
 >

Thanks! The SUBDIR feature was much needed.

 > then the cmake-package infra CONFIGURE_CMDS will use the CMakeLists.txt
 > in $(@D)/sources/pyside6/, which should give you want you want, and
 > would avoid duplicating the configure commands.
 >
 >> 2. Although PySide6 is a python-package, the Qt Company recommends
 >> using the cmake-package build-system for package managers.
 >
 > I was a bit confused by this
 > because 
https://code.qt.io/cgit/pyside/pyside-setup.git/tree/README.md#n196 says:
 >
 > """
 > Nevertheless the default build process is done via setup.py, in which 
case each
 > of the sub-projects are built and installed separately, as mentioned, 
the super
 > project is just for development convenience.
 > """
 >
 > But indeed, https://doc.qt.io/qtforpython-6/gettingstarted/linux.html
 > says "The setuptools approach includes internal CMake calls when
 > building and installing the project, but a CMake-only approach is only
 > recommended for packaging the project for distribution builds."
 >

While Qt provides a way to build everything using CMake, I have no idea 
how to
combine Python AND C++ builds in Buildroot. Yocto covers this scenario by
allowing you to "inherit" python build settings AND cmake build 
settings. Does buildroot
allow you to define the following? If so, does order matter?

```Makefile
$(eval $(cmake-package))
$(eval $(python-package))
```

Currently, I just create two separate buildroot packages for the C++ and 
Python builds.

 >> diff --git a/DEVELOPERS b/DEVELOPERS
 >> index 9a8c92f122..b9685b620b 100644
 >> --- a/DEVELOPERS
 >> +++ b/DEVELOPERS
 >> @@ -881,6 +881,10 @@ F:      package/unscd/
 >>   N: Dushara Jayasinghe <nidujay@gmail.com>
 >>   F: package/prosody/
 >>
 >> +N:      Dylan Bespalko <dylan.bespalko@gmail.com>
 >> +F:      package/python-shiboken6/
 >> +F:      package/python-pyside6/
 >
 > Please use one tab for indentation.
 >

Done

 >> diff --git a/package/python-pyside6/Config.in 
b/package/python-pyside6/Config.in
 >> new file mode 100644
 >> index 0000000000..b999cadbbb
 >> --- /dev/null
 >> +++ b/package/python-pyside6/Config.in
 >> @@ -0,0 +1,19 @@
 >> +config BR2_PACKAGE_PYTHON_PYSIDE6
 >> +    bool "python-pyside6"
 >> +    depends on BR2_PACKAGE_QT6
 >> +    depends on BR2_PACKAGE_QT6BASE_GUI
 >
 > So we can't use pyside6 for a headless system, for which QtGui is not
 > used/needed?
 >
 > If yes, then please select BR2_PACKAGE_QT6BASE_GUI, do not use a
 > depends on.
 >

I had this wrong. I have "selected" the packages as requested.

 >> diff --git a/package/python-pyside6/python-pyside6.mk 
b/package/python-pyside6/python-pyside6.mk
 >> new file mode 100644
 >> index 0000000000..9db8aad384
 >> --- /dev/null
 >> +++ b/package/python-pyside6/python-pyside6.mk
 >> @@ -0,0 +1,123 @@
 >> 
+################################################################################
 >> +#
 >> +# python-pyside6
 >> +#
 >> 
+################################################################################
 >> +
 >> +PYTHON_PYSIDE6_VERSION = v6.7.2
 >> +PYTHON_PYSIDE6_SITE = https://code.qt.io/pyside/pyside-setup.git
 >> +PYTHON_PYSIDE6_SITE_METHOD = git
 >> +PYTHON_PYSIDE6_CPE_ID_VENDOR = qt
 >> +PYTHON_PYSIDE6_CPE_ID_PRODUCT = pyside6
 >
 > Do you have some evidence that does CPE identifiers are correct?
 >

qt is the correct CPE_ID_VENDER, but there is no CPE_ID_PRODUCT for 
pyside6 or
shiboken6, so I have made my best guess.

 >> +PYTHON_PYSIDE6_SUPPORTS_IN_SOURCE_BUILD = NO
 >> +PYTHON_PYSIDE6_INSTALL_STAGING = YES
 >> +
 >> +PYTHON_PYSIDE6_LICENSE = \
 >> +    GPL-2.0+ or LGPL-3.0, \
 >> +    GPL-3.0 with exception (tools), \
 >> +    GFDL-1.3 (docs), \
 >> +    Apache-2.0, \
 >> +    BSD-3-Clause
 >> +
 >> +PYTHON_PYSIDE6_LICENSE_FILES = \
 >> +    LICENSES/Apache-2.0.txt \
 >> +    LICENSES/BSD-3-Clause.txt \
 >> +    LICENSES/GFDL-1.3-no-invariants-only.txt \
 >> +    LICENSES/GPL-2.0-only.txt \
 >> +    LICENSES/LGPL-3.0-only.txt \
 >> +    LICENSES/GPL-3.0-only.txt \
 >> +    LICENSES/Qt-GPL-exception-1.0.txt
 >> +
 >> +PYTHON_PYSIDE6_DEPENDENCIES = \
 >> +    host-python-shiboken6 \
 >> +    qt6base \
 >> +    python-shiboken6
 >> +
 >> +PYTHON_PYSIDE6_ALL_ESSENTIAL_MODULES = \
 >> +    Core \
 >> +    Gui \
 >> +    Widgets \
 >> +    $(if $(BR2_PACKAGE_QT6BASE_PRINTSUPPORT),PrintSupport) \
 >> +    $(if $(BR2_PACKAGE_QT6BASE_SQL),Sql) \
 >> +    $(if $(BR2_PACKAGE_QT6BASE_NETWORK),Network) \
 >> +    $(if $(BR2_PACKAGE_QT6BASE_TEST),Test) \
 >> +    $(if $(BR2_PACKAGE_QT6BASE_CONCURRENT),Concurrent)
 >> +
 >> +PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES = \
 >> +    $(if $(BR2_PACKAGE_QT6BASE_DBUS),DBus) \
 >> +    $(if $(BR2_PACKAGE_QT6BASE_XML),Xml) \
 >> +    $(if $(BR2_PACKAGE_QT6BASE_OPENGL),OpenGL) \
 >> +    $(if $(BR2_PACKAGE_QT6BASE_WIDGETS) && 
$(BR2_PACKAGE_QT6BASE_OPENGL),OpenGLWidgets)
 >> +
 >> +ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
 >> +PYTHON_PYSIDE6_DEPENDENCIES += qt6declarative
 >> +PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES += \
 >> +    Qml \
 >> +    Quick \
 >> +    QuickControls2 \
 >> +    QuickTest \
 >> +    QuickWidgets
 >> +endif
 >> +ifeq ($(BR2_PACKAGE_QT6SERIALPORT),y)
 >> +PYTHON_PYSIDE6_DEPENDENCIES += qt6serialport
 >> +PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES += SerialPort
 >> +ifeq ($(BR2_PACKAGE_QT6SERIALBUS),y)
 >> +PYTHON_PYSIDE6_DEPENDENCIES += qt6serialbus
 >> +PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES += SerialBus
 >> +endif
 >> +endif
 >> +ifeq ($(BR2_PACKAGE_QT6SVG),y)
 >> +PYTHON_PYSIDE6_DEPENDENCIES += qt6svg
 >> +PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES += Svg
 >> +PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES += SvgWidgets
 >> +endif
 >> +#ifeq ($(BR2_PACKAGE_QT6TOOLS),y)  # Failed to find the host tool 
"Qt6::lconvert".  It is part of the Qt6LinguistTools package
 >> +#PYTHON_PYSIDE6_DEPENDENCIES += qt6tools
 >> +#PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES += UiTools
 >> +#endif
 >
 > Please don't include commented code. Maybe mention which modules are
 > not enabled, and why.
 >

Commented code has been removed

 >> +PYTHON_PYSIDE6_ALL_MODULES = $(subst 
$(space),\;,$(PYTHON_PYSIDE6_ALL_ESSENTIAL_MODULES) 
$(PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES))
 >
 > A comment above this would be useful, because I don't quite understand
 > the difference between "essential modules" and "optional modules", they
 > end up being all grouped together in this variable.
 >
 >> +PYTHON_PYSIDE6_CONF_ENV = \
 >> +    LLVM_INSTALL_DIR=$(HOST_DIR)
 >> +
 >> +#Add option -DMODULES=Core\;Gui\;Widgets for minimum build
 >
 > I don't understand this comment. Could you clarify?
 >

I added detailed comments to explain these three variables. I mostly
named them in a way that allows me to grep for new modules for easier
maintenance when Qt6 modules are added.

```Makefile
+# Essential Modules: grep -A 8 -r "set(ALL_ESSENTIAL_MODULES" on repo
+PYTHON_PYSIDE6_ALL_ESSENTIAL_MODULES = \
...
+# Add-On Modules: grep -A 33 -r "set(ALL_OPTIONAL_MODULES" on repo
+PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES = \
...
+# All Modules: grep -r "set(MODULES" on repo for updated list
+# The Modules are defined here: https://doc.qt.io/qt-6/qtmodules.html
+PYTHON_PYSIDE6_MODULES = ...
```

 >> +PYTHON_PYSIDE6_CONF_CXXFLAGS = $(subst 
$(space),$(comma),$(TARGET_CXXFLAGS))
 >
 > This variable is apparently not used anywhere.
 >

Removed

 >> +PYTHON_PYSIDE6_CONF_OPTS = \
 >> +    -DMODULES=$(PYTHON_PYSIDE6_ALL_MODULES) \
 >> +    -DQFP_SHIBOKEN_HOST_PATH=$(HOST_DIR) \
 >> +    -DSTANDALONE=ON \
 >> +    -DPYSIDE_TREAT_QT_INCLUDE_DIRS_AS_NON_SYSTEM=ON \
 >> +    -DSHIBOKEN_GENERATOR_EXTRA_FLAGS='\
 >> +            --compiler-path=$(HOST_DIR)/bin/clang'
 >> +
 >> +# 1. copy $(2)_CONIFIGURE_CMDS from packages/pkg-cmake.mk
 >> +# 2. sed -i s/\$\$(PKG)/PYTHON_PYSIDE6/g
 >> +# 3. sed -i s/\$\$/\$/g
 >> +# 4. append $(PYTHON_PYSIDE6_SRCDIR) with sources/shiboken6
 >> +define PYTHON_PYSIDE6_CONFIGURE_CMDS
 >
 > As explained above this can probably be avoided by using
 > PYTHON_PYSIDE6_SUBDIR = sources/pyside6.
 >

Done

 >
 >> diff --git a/package/python-shiboken6/Config.in 
b/package/python-shiboken6/Config.in
 >> new file mode 100644
 >> index 0000000000..1e42f0edcc
 >> --- /dev/null
 >> +++ b/package/python-shiboken6/Config.in
 >> @@ -0,0 +1,24 @@
 >> +config BR2_PACKAGE_PYTHON_SHIBOKEN6
 >> +    bool "python-shiboken6"
 >> +    depends on BR2_PACKAGE_QT6
 >> +    depends on BR2_PACKAGE_QT6BASE_GUI
 >
 > Please select this option, if it's actually really needed.
 >

Selected option instead of depends on

 >> +    depends on BR2_PACKAGE_QT6_GL_SUPPORTS  # Requirement of 
PySide6.QtWidgets, but not QtWidgets
 >> +    select BR2_PACKAGE_QT6BASE_WIDGETS
 >> +    select BR2_PACKAGE_QT6BASE_OPENGL
 >> +    select BR2_PACKAGE_HOST_LIBXSLT
 >> +    select BR2_PACKAGE_HOST_CLANG
 >> +    select BR2_PACKAGE_HOST_CMAKE
 >> +    select BR2_PACKAGE_HOST_PERL
 >> +    select BR2_PACKAGE_HOST_QT6BASE
 >> +    select BR2_PACKAGE_HOST_QT6BASE_GUI
 >> +    select BR2_PACKAGE_HOST_QT6BASE_WIDGETS
 >> +    select BR2_PACKAGE_HOST_PYTHON3
 >> +    select BR2_PACKAGE_HOST_PYTHON_NUMPY
 >> +    select BR2_PACKAGE_HOST_PYTHON_SHIBOKEN6
 >> +    select BR2_PACKAGE_PYTHON3_ZLIB
 >> +    select BR2_PACKAGE_PYTHON_NUMPY
 >
 > I am still confused by what Shiboken does compared to PySide, and why
 > we need both a target variant of Shiboken and a host variant... and why
 > numpy is needed for the target.
 >

Shiboken is a general purpose C++/Python binding generator similar to 
PyBind11 and
Sip/SWIG. It also contains a Shiboken6 module that can debug the binding 
during runtime
on the target device. You can use it for ANY C++ code.

PySide is the result of running the Shiboken binding generator on the 
Qt6 C++ code.

I tested that Numpy is not needed. I have no idea how it got in there. 
Good catch.

 >
 >> 
+################################################################################
 >> +#
 >> +# python-shiboken6
 >> +#
 >> 
+################################################################################
 >> +
 >> +PYTHON_SHIBOKEN6_VERSION = v6.7.2
 >
 > Could you add a comment above this _VERSION field here, and for the
 > pyside6 package to indicate that they should be updated in sync?
 >
Good idea. I have added comments to both PySide6 and Shiboken6 reminding 
the maintainer
to sync with the version of Qt.

 >> +PYTHON_SHIBOKEN6_SITE = https://code.qt.io/pyside/pyside-setup.git
 >> +PYTHON_SHIBOKEN6_SITE_METHOD = git
 >> +PYTHON_SHIBOKEN6_CPE_ID_VENDOR = qt
 >> +PYTHON_SHIBOKEN6_CPE_ID_PRODUCT = shiboken
 >> +PYTHON_SHIBOKEN6_SUPPORTS_IN_SOURCE_BUILD = NO
 >> +PYTHON_SHIBOKEN6_INSTALL_STAGING = YES
 >> +
 >> +PYTHON_SHIBOKEN6_LICENSE = \
 >> +    GPL-2.0+ or LGPL-3.0, \
 >> +    GPL-3.0 with exception (tools), \
 >> +    GFDL-1.3 (docs), \
 >> +    Apache-2.0, \
 >> +    BSD-3-Clause
 >> +
 >> +PYTHON_SHIBOKEN6_LICENSE_FILES = \
 >> +    LICENSES/Apache-2.0.txt \
 >> +    LICENSES/BSD-3-Clause.txt \
 >> +    LICENSES/GFDL-1.3-no-invariants-only.txt \
 >> +    LICENSES/GPL-2.0-only.txt \
 >> +    LICENSES/LGPL-3.0-only.txt \
 >> +    LICENSES/GPL-3.0-only.txt \
 >> +    LICENSES/Qt-GPL-exception-1.0.txt
 >> +
 >> +PYTHON_SHIBOKEN6_DEPENDENCIES = \
 >> +    host-libxslt \
 >> +    host-clang \
 >> +    host-cmake \
 >> +    host-perl \
 >> +    host-qt6base \
 >> +    host-python3 \
 >> +    host-python-numpy \
 >> +    host-python-shiboken6 \
 >> +    qt6base \
 >> +    python3 \
 >> +    python-numpy
 >
 > It must take a *huge* time to build all those dependencies: Perl,
 > Python, LLVM, etc...
 >

I have a *huge* server :)

 >> +HOST_PYTHON_SHIBOKEN6_DEPENDENCIES = \
 >> +    host-libxslt \
 >> +    host-clang \
 >> +    host-cmake \
 >> +    host-perl \
 >> +    host-qt6base \
 >> +    host-python3 \
 >> +    host-python-numpy
 >> +
 >> +PYTHON_SHIBOKEN6_CONF_OPTS = \
 >> +    -DQFP_SHIBOKEN_HOST_PATH=$(HOST_DIR) \
 >> +    -DQFP_PYTHON_HOST_PATH=$(HOST_DIR)/bin/python3
 >> +
 >> +HOST_PYTHON_SHIBOKEN6_CONF_OPTS =
 >
 > Empty, so not needed.
 >

Done

 >> +# 1. copy $(2)_CONIFIGURE_CMDS from packages/pkg-cmake.mk
 >> +# 2. sed -i s/\$\$(PKG)/PYTHON_SHIBOKEN6/g
 >> +# 3. sed -i s/\$\$/\$/g
 >> +# 4. append $(PYTHON_SHIBOKEN6_SRCDIR) with sources/shiboken6
 >> +define PYTHON_SHIBOKEN6_CONFIGURE_CMDS
 >
 > Use SUBDIR if possible.
 >

Done

 >> +# 1. copy $(2)_CONIFIGURE_CMDS from packages/pkg-cmake.mk
 >> +# 2. sed -i s/\$\$(PKG)/HOST_PYTHON_SHIBOKEN6/g
 >> +# 3. sed -i s/\$\$/\$/g
 >> +# 4. append $(HOST_PYTHON_SHIBOKEN6_SRCDIR) with sources/shiboken6
 >> +define HOST_PYTHON_SHIBOKEN6_CONFIGURE_CMDS
 >
 > Likewise.

Done

 >> diff --git a/support/testing/tests/package/sample_python_pyside6.py 
b/support/testing/tests/package/sample_python_pyside6.py
 >> new file mode 100644
 >> index 0000000000..079cece9d5
 >> --- /dev/null
 >> +++ b/support/testing/tests/package/sample_python_pyside6.py
 >
 > Super, super great idea to have a test case! Please make sure to add
 > entry in the DEVELOPERS file also for the files added in
 > support/testing!
 >

Done

 >
 >> +def test_python_pyside6_qtquicktest():
 >> +    from PySide6 import QtQuickTest
 >> +    QtQuickTest.QUICK_TEST_MAIN('/usr/lib/qt6/qml/QtTest/TestCase.qml')
 >> +    # The directory '/root' does not contain any test files 
matching 'tst_*.qml'
 >> +    # 1
 >> +    # todo: The tests run, but don't pass. I have no experience 
with this module.
 >
 > So what happens? You don't check the results?
 >

Not a good test case, removed qtquicktest test case.

 >> +def test_python_pyside6_qtquickwidgets():
 >> +    from PySide6 import QtWidgets
 >> +    from PySide6 import QtQuickWidgets
 >> +    app = QtWidgets.QApplication()
 >> +    view = QtQuickWidgets.QQuickWidget()
 >> +    assert(str(view.status()) == 'Status.Null')
 >> + 
view.setSource('/usr/lib/qt6/qml/QtQuick/Controls/Universal/Label.qml')
 >> +    assert(str(view.status()) == 'Status.Ready')
 >> +    QtWidgets.QApplication.shutdown(app)
 >> +
 >> +
 >> +def test_python_pyside6_qtserialport():
 >> +    from PySide6 import QtSerialPort
 >> +    ser = QtSerialPort.QSerialPort()
 >> +    ser.setPortName('/dev/ttyUSB0')
 >> +    assert(ser.portName() == 'ttyUSB0')
 >
 > Will it work even if ttyUSB0 doesn't exist?

I simplified the test to use "/dev/tty" instead of "/dev/ttyUSB0". Also
added a comment stating that the filepath does not need to exist for the
test to pass. I do not connect the serial port.

Thanks,

Dylan


On 8/3/24 14:55, Thomas Petazzoni wrote:
> Hello Dylan,
> 
> Thanks for your contribution! You are tackling some really difficult
> packaging topic for what seems to be your very first Buildroot
> contribution!
> 
> See below some comments/questions.
> 
> First very minor thing: commit message should be:
> 
> 	package/python-{shiboken6,pyside6}: new packages
> 
> On Fri, 26 Jul 2024 12:29:03 -0700
> Dylan Bespalko <dylan.bespalko@gmail.com> wrote:
> 
>> The Shiboken6 C++/Python binding generator and the PySide6
>> binding of the Qt6 C++ project is added. All PySide6 modules
>> are supported except:
>>    - PySide6.QtUITools is blocked by a build error in QtUITools
>>    - PySide.QtOpenGLWidgets runs, but cannot be tested in QEMU.
>>    - PySide6.QtQuickTest runs, but never passes any tests.
> 
> You don't have to support everything: if there's something that you
> don't use/haven't been able to get to work or test, just disable it,
> and leave it up to whoever comes next and needs it.
> 
>> 1. Since Shiboken6 and PySide6 are in the same git repo, I needed
>> to re-implement the *_CONFIGURE_CMDS to navigate to a sub-directory
>> in the git repo. Two separate buildroot package recipes were needed
>> because:
>>    a) host-python-shiboken6 is needed, but not host-python-pyside6.
>>    b) PyQt also separates python-sip from python-pyqt.
> 
> I was surprised to see that actually PySide and Shiboken are available
> as standalone Git repositories:
> 
>    https://code.qt.io/cgit/pyside/pyside.git/
>    https://code.qt.io/cgit/pyside/shiboken.git/
> 
> but I guess these are the older (Qt 5) versions?
> 
> Regarding the re-implementation of the CMake configure command, have
> you tried using <pkg>_SUBDIR ? Indeed if you set:
> 
> PYTHON_PYSIDE6_SUBDIR = sources/pyside6
> 
> then the cmake-package infra CONFIGURE_CMDS will use the CMakeLists.txt
> in $(@D)/sources/pyside6/, which should give you want you want, and
> would avoid duplicating the configure commands.
> 
>> 2. Although PySide6 is a python-package, the Qt Company recommends
>> using the cmake-package build-system for package managers.
> 
> I was a bit confused by this
> because https://code.qt.io/cgit/pyside/pyside-setup.git/tree/README.md#n196 says:
> 
> """
> Nevertheless the default build process is done via setup.py, in which case each
> of the sub-projects are built and installed separately, as mentioned, the super
> project is just for development convenience.
> """
> 
> But indeed, https://doc.qt.io/qtforpython-6/gettingstarted/linux.html
> says "The setuptools approach includes internal CMake calls when
> building and installing the project, but a CMake-only approach is only
> recommended for packaging the project for distribution builds."
> 
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index 9a8c92f122..b9685b620b 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -881,6 +881,10 @@ F:	package/unscd/
>>   N:	Dushara Jayasinghe <nidujay@gmail.com>
>>   F:	package/prosody/
>>   
>> +N:      Dylan Bespalko <dylan.bespalko@gmail.com>
>> +F:      package/python-shiboken6/
>> +F:      package/python-pyside6/
> 
> Please use one tab for indentation.
> 
> 
>> diff --git a/package/python-pyside6/Config.in b/package/python-pyside6/Config.in
>> new file mode 100644
>> index 0000000000..b999cadbbb
>> --- /dev/null
>> +++ b/package/python-pyside6/Config.in
>> @@ -0,0 +1,19 @@
>> +config BR2_PACKAGE_PYTHON_PYSIDE6
>> +	bool "python-pyside6"
>> +	depends on BR2_PACKAGE_QT6
>> +	depends on BR2_PACKAGE_QT6BASE_GUI
> 
> So we can't use pyside6 for a headless system, for which QtGui is not
> used/needed?
> 
> If yes, then please select BR2_PACKAGE_QT6BASE_GUI, do not use a
> depends on.
> 
> 
>> diff --git a/package/python-pyside6/python-pyside6.mk b/package/python-pyside6/python-pyside6.mk
>> new file mode 100644
>> index 0000000000..9db8aad384
>> --- /dev/null
>> +++ b/package/python-pyside6/python-pyside6.mk
>> @@ -0,0 +1,123 @@
>> +################################################################################
>> +#
>> +# python-pyside6
>> +#
>> +################################################################################
>> +
>> +PYTHON_PYSIDE6_VERSION = v6.7.2
>> +PYTHON_PYSIDE6_SITE = https://code.qt.io/pyside/pyside-setup.git
>> +PYTHON_PYSIDE6_SITE_METHOD = git
>> +PYTHON_PYSIDE6_CPE_ID_VENDOR = qt
>> +PYTHON_PYSIDE6_CPE_ID_PRODUCT = pyside6
> 
> Do you have some evidence that does CPE identifiers are correct?
> 
>> +PYTHON_PYSIDE6_SUPPORTS_IN_SOURCE_BUILD = NO
>> +PYTHON_PYSIDE6_INSTALL_STAGING = YES
>> +
>> +PYTHON_PYSIDE6_LICENSE = \
>> +	GPL-2.0+ or LGPL-3.0, \
>> +	GPL-3.0 with exception (tools), \
>> +	GFDL-1.3 (docs), \
>> +	Apache-2.0, \
>> +	BSD-3-Clause
>> +
>> +PYTHON_PYSIDE6_LICENSE_FILES = \
>> +	LICENSES/Apache-2.0.txt \
>> +	LICENSES/BSD-3-Clause.txt \
>> +	LICENSES/GFDL-1.3-no-invariants-only.txt \
>> +	LICENSES/GPL-2.0-only.txt \
>> +	LICENSES/LGPL-3.0-only.txt \
>> +	LICENSES/GPL-3.0-only.txt \
>> +	LICENSES/Qt-GPL-exception-1.0.txt
>> +
>> +PYTHON_PYSIDE6_DEPENDENCIES = \
>> +	host-python-shiboken6 \
>> +	qt6base \
>> +	python-shiboken6
>> +
>> +PYTHON_PYSIDE6_ALL_ESSENTIAL_MODULES = \
>> +	Core \
>> +	Gui \
>> +	Widgets \
>> +	$(if $(BR2_PACKAGE_QT6BASE_PRINTSUPPORT),PrintSupport) \
>> +	$(if $(BR2_PACKAGE_QT6BASE_SQL),Sql) \
>> +	$(if $(BR2_PACKAGE_QT6BASE_NETWORK),Network) \
>> +	$(if $(BR2_PACKAGE_QT6BASE_TEST),Test) \
>> +	$(if $(BR2_PACKAGE_QT6BASE_CONCURRENT),Concurrent)
>> +
>> +PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES = \
>> +	$(if $(BR2_PACKAGE_QT6BASE_DBUS),DBus) \
>> +	$(if $(BR2_PACKAGE_QT6BASE_XML),Xml) \
>> +	$(if $(BR2_PACKAGE_QT6BASE_OPENGL),OpenGL) \
>> +	$(if $(BR2_PACKAGE_QT6BASE_WIDGETS) && $(BR2_PACKAGE_QT6BASE_OPENGL),OpenGLWidgets)
>> +
>> +ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
>> +PYTHON_PYSIDE6_DEPENDENCIES += qt6declarative
>> +PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES += \
>> +	Qml \
>> +	Quick \
>> +	QuickControls2 \
>> +	QuickTest \
>> +	QuickWidgets
>> +endif
>> +ifeq ($(BR2_PACKAGE_QT6SERIALPORT),y)
>> +PYTHON_PYSIDE6_DEPENDENCIES += qt6serialport
>> +PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES += SerialPort
>> +ifeq ($(BR2_PACKAGE_QT6SERIALBUS),y)
>> +PYTHON_PYSIDE6_DEPENDENCIES += qt6serialbus
>> +PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES += SerialBus
>> +endif
>> +endif
>> +ifeq ($(BR2_PACKAGE_QT6SVG),y)
>> +PYTHON_PYSIDE6_DEPENDENCIES += qt6svg
>> +PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES += Svg
>> +PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES += SvgWidgets
>> +endif
>> +#ifeq ($(BR2_PACKAGE_QT6TOOLS),y)  # Failed to find the host tool "Qt6::lconvert".  It is part of the Qt6LinguistTools package
>> +#PYTHON_PYSIDE6_DEPENDENCIES += qt6tools
>> +#PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES += UiTools
>> +#endif
> 
> Please don't include commented code. Maybe mention which modules are
> not enabled, and why.
> 
>> +PYTHON_PYSIDE6_ALL_MODULES = $(subst $(space),\;,$(PYTHON_PYSIDE6_ALL_ESSENTIAL_MODULES) $(PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES))
> 
> A comment above this would be useful, because I don't quite understand
> the difference between "essential modules" and "optional modules", they
> end up being all grouped together in this variable.
> 
>> +PYTHON_PYSIDE6_CONF_ENV = \
>> +	LLVM_INSTALL_DIR=$(HOST_DIR)
>> +
>> +#Add option -DMODULES=Core\;Gui\;Widgets for minimum build
> 
> I don't understand this comment. Could you clarify?
> 
>> +PYTHON_PYSIDE6_CONF_CXXFLAGS = $(subst $(space),$(comma),$(TARGET_CXXFLAGS))
> 
> This variable is apparently not used anywhere.
> 
>> +PYTHON_PYSIDE6_CONF_OPTS = \
>> +	-DMODULES=$(PYTHON_PYSIDE6_ALL_MODULES) \
>> +	-DQFP_SHIBOKEN_HOST_PATH=$(HOST_DIR) \
>> +	-DSTANDALONE=ON \
>> +	-DPYSIDE_TREAT_QT_INCLUDE_DIRS_AS_NON_SYSTEM=ON \
>> +	-DSHIBOKEN_GENERATOR_EXTRA_FLAGS='\
>> +		--compiler-path=$(HOST_DIR)/bin/clang'
>> +
>> +# 1. copy $(2)_CONIFIGURE_CMDS from packages/pkg-cmake.mk
>> +# 2. sed -i s/\$\$(PKG)/PYTHON_PYSIDE6/g
>> +# 3. sed -i s/\$\$/\$/g
>> +# 4. append $(PYTHON_PYSIDE6_SRCDIR) with sources/shiboken6
>> +define PYTHON_PYSIDE6_CONFIGURE_CMDS
> 
> As explained above this can probably be avoided by using
> PYTHON_PYSIDE6_SUBDIR = sources/pyside6.
> 
> 
>> diff --git a/package/python-shiboken6/Config.in b/package/python-shiboken6/Config.in
>> new file mode 100644
>> index 0000000000..1e42f0edcc
>> --- /dev/null
>> +++ b/package/python-shiboken6/Config.in
>> @@ -0,0 +1,24 @@
>> +config BR2_PACKAGE_PYTHON_SHIBOKEN6
>> +	bool "python-shiboken6"
>> +	depends on BR2_PACKAGE_QT6
>> +	depends on BR2_PACKAGE_QT6BASE_GUI
> 
> Please select this option, if it's actually really needed.
> 
>> +	depends on BR2_PACKAGE_QT6_GL_SUPPORTS  # Requirement of PySide6.QtWidgets, but not QtWidgets
>> +	select BR2_PACKAGE_QT6BASE_WIDGETS
>> +	select BR2_PACKAGE_QT6BASE_OPENGL
>> +	select BR2_PACKAGE_HOST_LIBXSLT
>> +	select BR2_PACKAGE_HOST_CLANG
>> +	select BR2_PACKAGE_HOST_CMAKE
>> +	select BR2_PACKAGE_HOST_PERL
>> +	select BR2_PACKAGE_HOST_QT6BASE
>> +	select BR2_PACKAGE_HOST_QT6BASE_GUI
>> +	select BR2_PACKAGE_HOST_QT6BASE_WIDGETS
>> +	select BR2_PACKAGE_HOST_PYTHON3
>> +	select BR2_PACKAGE_HOST_PYTHON_NUMPY
>> +	select BR2_PACKAGE_HOST_PYTHON_SHIBOKEN6
>> +	select BR2_PACKAGE_PYTHON3_ZLIB
>> +	select BR2_PACKAGE_PYTHON_NUMPY
> 
> I am still confused by what Shiboken does compared to PySide, and why
> we need both a target variant of Shiboken and a host variant... and why
> numpy is needed for the target.
> 
> 
>> +################################################################################
>> +#
>> +# python-shiboken6
>> +#
>> +################################################################################
>> +
>> +PYTHON_SHIBOKEN6_VERSION = v6.7.2
> 
> Could you add a comment above this _VERSION field here, and for the
> pyside6 package to indicate that they should be updated in sync?
> 
>> +PYTHON_SHIBOKEN6_SITE = https://code.qt.io/pyside/pyside-setup.git
>> +PYTHON_SHIBOKEN6_SITE_METHOD = git
>> +PYTHON_SHIBOKEN6_CPE_ID_VENDOR = qt
>> +PYTHON_SHIBOKEN6_CPE_ID_PRODUCT = shiboken
>> +PYTHON_SHIBOKEN6_SUPPORTS_IN_SOURCE_BUILD = NO
>> +PYTHON_SHIBOKEN6_INSTALL_STAGING = YES
>> +
>> +PYTHON_SHIBOKEN6_LICENSE = \
>> +	GPL-2.0+ or LGPL-3.0, \
>> +	GPL-3.0 with exception (tools), \
>> +	GFDL-1.3 (docs), \
>> +	Apache-2.0, \
>> +	BSD-3-Clause
>> +
>> +PYTHON_SHIBOKEN6_LICENSE_FILES = \
>> +	LICENSES/Apache-2.0.txt \
>> +	LICENSES/BSD-3-Clause.txt \
>> +	LICENSES/GFDL-1.3-no-invariants-only.txt \
>> +	LICENSES/GPL-2.0-only.txt \
>> +	LICENSES/LGPL-3.0-only.txt \
>> +	LICENSES/GPL-3.0-only.txt \
>> +	LICENSES/Qt-GPL-exception-1.0.txt
>> +
>> +PYTHON_SHIBOKEN6_DEPENDENCIES = \
>> +	host-libxslt \
>> +	host-clang \
>> +	host-cmake \
>> +	host-perl \
>> +	host-qt6base \
>> +	host-python3 \
>> +	host-python-numpy \
>> +	host-python-shiboken6 \
>> +	qt6base \
>> +	python3 \
>> +	python-numpy
> 
> It must take a *huge* time to build all those dependencies: Perl,
> Python, LLVM, etc...
> 
>> +HOST_PYTHON_SHIBOKEN6_DEPENDENCIES = \
>> +	host-libxslt \
>> +	host-clang \
>> +	host-cmake \
>> +	host-perl \
>> +	host-qt6base \
>> +	host-python3 \
>> +	host-python-numpy
>> +
>> +PYTHON_SHIBOKEN6_CONF_OPTS = \
>> +	-DQFP_SHIBOKEN_HOST_PATH=$(HOST_DIR) \
>> +	-DQFP_PYTHON_HOST_PATH=$(HOST_DIR)/bin/python3
>> +
>> +HOST_PYTHON_SHIBOKEN6_CONF_OPTS =
> 
> Empty, so not needed.
> 
>> +# 1. copy $(2)_CONIFIGURE_CMDS from packages/pkg-cmake.mk
>> +# 2. sed -i s/\$\$(PKG)/PYTHON_SHIBOKEN6/g
>> +# 3. sed -i s/\$\$/\$/g
>> +# 4. append $(PYTHON_SHIBOKEN6_SRCDIR) with sources/shiboken6
>> +define PYTHON_SHIBOKEN6_CONFIGURE_CMDS
> 
> Use SUBDIR if possible.
> 
>> +# 1. copy $(2)_CONIFIGURE_CMDS from packages/pkg-cmake.mk
>> +# 2. sed -i s/\$\$(PKG)/HOST_PYTHON_SHIBOKEN6/g
>> +# 3. sed -i s/\$\$/\$/g
>> +# 4. append $(HOST_PYTHON_SHIBOKEN6_SRCDIR) with sources/shiboken6
>> +define HOST_PYTHON_SHIBOKEN6_CONFIGURE_CMDS
> 
> Likewise.
> 
>> diff --git a/support/testing/tests/package/sample_python_pyside6.py b/support/testing/tests/package/sample_python_pyside6.py
>> new file mode 100644
>> index 0000000000..079cece9d5
>> --- /dev/null
>> +++ b/support/testing/tests/package/sample_python_pyside6.py
> 
> Super, super great idea to have a test case! Please make sure to add
> entry in the DEVELOPERS file also for the files added in
> support/testing!
> 
> 
>> +def test_python_pyside6_qtquicktest():
>> +    from PySide6 import QtQuickTest
>> +    QtQuickTest.QUICK_TEST_MAIN('/usr/lib/qt6/qml/QtTest/TestCase.qml')
>> +    # The directory '/root' does not contain any test files matching 'tst_*.qml'
>> +    # 1
>> +    # todo: The tests run, but don't pass. I have no experience with this module.
> 
> So what happens? You don't check the results?
> 
>> +def test_python_pyside6_qtquickwidgets():
>> +    from PySide6 import QtWidgets
>> +    from PySide6 import QtQuickWidgets
>> +    app = QtWidgets.QApplication()
>> +    view = QtQuickWidgets.QQuickWidget()
>> +    assert(str(view.status()) == 'Status.Null')
>> +    view.setSource('/usr/lib/qt6/qml/QtQuick/Controls/Universal/Label.qml')
>> +    assert(str(view.status()) == 'Status.Ready')
>> +    QtWidgets.QApplication.shutdown(app)
>> +
>> +
>> +def test_python_pyside6_qtserialport():
>> +    from PySide6 import QtSerialPort
>> +    ser = QtSerialPort.QSerialPort()
>> +    ser.setPortName('/dev/ttyUSB0')
>> +    assert(ser.portName() == 'ttyUSB0')
> 
> Will it work even if ttyUSB0 doesn't exist?
> 
> Thanks a lot for this first submission, it already looks really, really
> good! Could you reply to the questions above, and work on a v2
> addressing the comments?
> 
> Thanks again!
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
