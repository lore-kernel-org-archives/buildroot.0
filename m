From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 23:55:22 +0200
Subject: [Buildroot] [PATCH 4/5] gtest: Upgrade to GitHub HEAD
In-Reply-To: <1444859483-2268-5-git-send-email-alan@softiron.co.uk>
References: <1444859483-2268-1-git-send-email-alan@softiron.co.uk>
 <1444859483-2268-5-git-send-email-alan@softiron.co.uk>
Message-ID: <20151014235522.774491e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alan,

On Wed, 14 Oct 2015 17:51:22 -0400, Alan Ott wrote:

> +# The above revision must remain the same as the gmock package
> +GTEST_SITE = $(call github,google,googletest,$(GTEST_VERSION))
>  GTEST_INSTALL_STAGING = YES
>  GTEST_INSTALL_TARGET = NO
>  GTEST_LICENSE = BSD-3c
>  GTEST_LICENSE_FILES = LICENSE
> +GTEST_SUBDIR = googletest

So gtest and gmock are in fact now part of the same repository/upstream
project ? If that's the case, then I think we should simply get rid of
the gtest and gmock packages, and have a single package named
"googletest".

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
