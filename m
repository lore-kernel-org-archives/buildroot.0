From: Diankun Zhang <kundy.zhang@gmail.com>
Date: Thu, 20 Jul 2017 19:20:16 +0800
Subject: [Buildroot] [PATCH 1/1] package/python: fix building _hashlib
	of host-python
In-Reply-To: <20170720130939.1b22a471@windsurf>
References: <CAO6UsjCZQUKvmA-a0votPq5AFZ6ESkwpNbLvfEymU5uy_SdggA@mail.gmail.com>
 <20170720095636.72423497@windsurf>
 <CAO6UsjBm0q9_g8_dpuA=7kPcFuzhouvM_8GV1J=+76PDfVykSw@mail.gmail.com>
 <20170720102733.2d606f02@windsurf>
 <CAO6UsjAcBxW=sxOtPyGAY823uNk8QuZFSTjxGMqEMaVMbvg1uQ@mail.gmail.com>
 <20170720111913.0d9c9c77@windsurf>
 <CAO6UsjD3rv0Vg2GJM0JwELO_TnT2gt-DEt0hsTxRxvu5faTVNw@mail.gmail.com>
 <20170720130939.1b22a471@windsurf>
Message-ID: <CAO6UsjAtLVapEx8L-o6+17kCGt+TzgM5m7+DrtEa8gVFfxYmug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks, Thomas, I would send out a new patch as you suggested.

On Thu, Jul 20, 2017 at 7:09 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Thu, 20 Jul 2017 18:59:31 +0800, Diankun Zhang wrote:
>
> > From https://packages.ubuntu.com/xenial/amd64/openssl/filelist, we can
> see
> > the openssl package  on ubuntu 16.04 does not cotain the libssl or
> > licrypto.so,
> > instead they are in package libssl1.0.0,
> > https://packages.ubuntu.com/xenial/amd64/libssl1.0.0/filelist.
>
> libssl is a *binary* package that is produced from the source package
> openssl.
>
> > In most of systems nowadays, openssl (and libssl ) is installed since the
> > hash algorithms are needed to meet kinds of requirements.
>
> Yes, the libraries, but not necessarily the development files.
>
> > Yes, I'm using the pyang tool on my host to compile some YANG files. The
> > compiled YANG files are platform independent ideally.
>
> OK.
>
> So, again what is needed is a hidden BR2_PACKAGE_HOST_PYTHON_OPENSSL
> that enables OpenSSL support in host-python, which the pyang package
> could select.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>



-- 
-Diankun
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170720/34cb0ecf/attachment.html>
