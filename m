From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 23:35:13 +0100
Subject: [Buildroot] [PATCH 5/5] qt5: add GPLv3 and GFDLv1.3 licensing
 informations
In-Reply-To: <1458207749-19507-6-git-send-email-corjon.j@ecagroup.com>
References: <1458207749-19507-1-git-send-email-corjon.j@ecagroup.com>
 <1458207749-19507-6-git-send-email-corjon.j@ecagroup.com>
Message-ID: <20160320233513.3afdcf59@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Mar 2016 10:42:29 +0100, Julien Corjon wrote:
> All Qt5 packages have gain the GPLv3 license option and all the

gain -> gained

> documentation is now under GFDLv1.3 license (except qt5websocket)

Are the libraries still available under LGPLv2.1 ? According to
http://www.qt.io/faq/#faqupcoming:

"""
Qt will be licensed under a commercial license, GPLv2, GPLv3 and
LGPLv3, but no longer under LGPLv2.1
"""

But maybe this is only starting with Qt 5.7.


>  ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> -QT53D_LICENSE = GPLv2+ or LGPLv3
> -QT53D_LICENSE_FILES = LICENSE.GPL LICENSE.LGPLv3
> +QT53D_LICENSE = GPLv2+ or GPLv3 or LGPLv3, docs: GFDLv1.3

This is not the proper format to specify which part is covered by which
license. You should use:

	GPLv2+ or GPLv3 or LGPLv3, GFDLv1.3 (docs)

This should be fixed globally, of course.

It's a bit weird though to mention GPLv3 *and* GPLv2+. Are sure it was
GPLv2+ ?

> +QT53D_LICENSE_FILES = LICENSE.GPL LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL

There is no LICENSE.FDL file in this package, so make legal-info fails.

Please enable all Qt5 packages, and make sure that "make legal-info"
works properly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
