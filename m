From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jul 2016 16:57:22 +0200
Subject: [Buildroot] [PATCH 6/7] new package: ti-sgx top level package
 for SGX graphics accelerator
In-Reply-To: <1468311988-22059-7-git-send-email-lothar.felten@gmail.com>
References: <1468311988-22059-1-git-send-email-lothar.felten@gmail.com>
 <1468311988-22059-7-git-send-email-lothar.felten@gmail.com>
Message-ID: <20160712165722.6d3751fd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Jul 2016 10:26:27 +0200, Lothar Felten wrote:
> This is a virtual package that selects the packages required for SGX support:
> ti-sgx-km, ti-sgx-um, ti-sgx-libgbm and optionally ti-sgx-demos.

This is an improper use of a virtual package. A virtual package is
*not* a meta package that is meant to depend on a bunch of other
packages to simplify their selection.

A virtual package is a package that *provides* some kind of generic
API, which is implemented by various providers. This is not the case
here: the package that actually provides the OpenGL ES and EGL APIs is
ti-sgx-um.

So I believe this whole package should be removed, and instead the four
other packages be made independent packages.

You can have a look at package/freescale-imx/Config.in for an example.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
