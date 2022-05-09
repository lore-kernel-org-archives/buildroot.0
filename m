Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A07C433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 01:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC8B340425;
	Mon,  9 May 2022 01:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mh9fqwNM-VJ4; Mon,  9 May 2022 01:09:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 571F9402FB;
	Mon,  9 May 2022 01:09:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 35C191BF387
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 01:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3157D402FB
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 01:09:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DQr9sdnljwpd for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 01:09:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF94A402F8
 for <buildroot@buildroot.org>; Mon,  9 May 2022 01:09:22 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id z12so8341218ilp.8
 for <buildroot@buildroot.org>; Sun, 08 May 2022 18:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dbciW8K8m60BIO4ooPIgdVWSYeblORw9YIOJEfHxssY=;
 b=DaKjqhuGQTiN4a3qrJuHDFfecRZfj66CPu5dsscam31tjcq5KkwLsIOAmz1iTzvqyK
 LecImGITgDbbGsbcxZK7Id05Qd+QB/2/ANtFeKd/MjLlemnSiPJ/mMqPqmHKRqVLSmGE
 TrPtp3h/S7eXQn+no1+6Y/PFPQkLTDmuOsW8C63e638upRqCq23ulNw3kZIa9BF0JnUk
 U2XfA87l8sdOSwhJ0UrqaUF7KbfyppenXCRr0ivbyg/smHZcGBxbKCzs5rS/GJmK0zHl
 REb6GpL3VXA/AAJj2DKAK2KHTFOp+n4KX6o1fw1JnpYQIsTgzuZoNdVKGTmF/x4VdEFq
 LySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dbciW8K8m60BIO4ooPIgdVWSYeblORw9YIOJEfHxssY=;
 b=6c4nznsPdI8CK8gzJi2jpHQy5l06Tnd3T7QvlBYWVRLfwHNAUHdfSHGKWtZ23JDKTt
 JxP5KIhk5YLZbaYgFugrWvDOiA0YJgi/I9UYL8DgVUNXE1tJ/pXSSeoRK0lVx1anGNZ6
 6fSkaBFP10tJKiwaF89xq5ILrQL5H54jG4c2X3Mvk0Q+oJ9saAslzoZ9bEQVB/7EgEU4
 NnfHoRL6R+GIP2QRJKL78fmvgcqp+6OpjeyOK2xC9V1jDzF1Yhk1szAe63sQBqTrlfyL
 0pWVuP9eY4iCOMMLZj0J87kct6F1KZyifN/QSpHb4oMrNqSqHBNP3zyLbb2uSa7Qmtdp
 0uiA==
X-Gm-Message-State: AOAM531hXd38xKzATSZmo3k84JvmAcr+BA6WCIgW8Qtb6LZYq2zbRm8Y
 mDayd3l9uBAA8qKIazzlPOvd26VU03c=
X-Google-Smtp-Source: ABdhPJx3b4TBvv9fUKTMFjU51Pz1xoAHmYj7l/gR77xVXzvxmkznWVlnoxTytQhVsfL8RfGMTg2znw==
X-Received: by 2002:a05:6e02:18c8:b0:2cf:5266:ccf2 with SMTP id
 s8-20020a056e0218c800b002cf5266ccf2mr5614308ilu.207.1652058561750; 
 Sun, 08 May 2022 18:09:21 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 bp13-20020a056638440d00b0032b3a781755sm3213847jab.25.2022.05.08.18.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 18:09:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 May 2022 19:09:16 -0600
Message-Id: <20220509010917.1485280-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/pkg-python: add setup.cfg-only
 setuptools project support
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some projects have been removing their setup.py shims under the
assumption that they are not needed due to setuptools being usable
via pep517, however this is not actually the case as it is not
possible to bootstrap setuptools without setup.py style builds as
setuptools has a dependency on wheel when being used via pep517
which is itself not installable via pep517 as that would create a
dependency cycle between wheel and setuptools(which means wheel
itself must use a legacy setup.py build/installation for itself).

In addition our pep517 toolchain itself requires setuptools for
building/installing dependencies, although it would appear these
dependencies will eventually move to flit. Until this is resolved
we must use setup.py style builds for setuptools packages.

Since it is not yet possible to convert setup.py based setuptools
builds to pep517 based setuptools builds we simply need to execute
the setuptools shim code directly if the setup.py file is missing.

See:
https://setuptools.pypa.io/en/latest/setuptools.html#setup-cfg-only-projects

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-python.mk | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 452fa0d3ea..5794e3a195 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -86,6 +86,9 @@ PKG_PYTHON_SETUPTOOLS_ENV = \
 	$(PKG_PYTHON_ENV) \
 	SETUPTOOLS_USE_DISTUTILS=stdlib
 
+PKG_PYTHON_SETUPTOOLS_CMD = \
+	$(if $(wildcard $($(PKG)_BUILDDIR)/setup.py),setup.py,-c 'from setuptools import setup;setup()')
+
 PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--prefix=/usr \
@@ -180,13 +183,13 @@ endif
 else ifeq ($$($(2)_SETUP_TYPE),setuptools)
 ifeq ($(4),target)
 $(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_ENV)
-$(2)_BASE_BUILD_CMD = setup.py build
-$(2)_BASE_INSTALL_TARGET_CMD = setup.py install --no-compile $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
-$(2)_BASE_INSTALL_STAGING_CMD = setup.py install $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
+$(2)_BASE_BUILD_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) build
+$(2)_BASE_INSTALL_TARGET_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install --no-compile $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
+$(2)_BASE_INSTALL_STAGING_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
 else
 $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
-$(2)_BASE_BUILD_CMD = setup.py build
-$(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
+$(2)_BASE_BUILD_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) build
+$(2)_BASE_INSTALL_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
 endif
 else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
 ifeq ($(4),target)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
