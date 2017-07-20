From: Diankun Zhang <kundy.zhang@gmail.com>
Date: Thu, 20 Jul 2017 16:21:51 +0800
Subject: [Buildroot] [PATCH 1/1] package/python: fix building _hashlib
	of host-python
In-Reply-To: <20170720095636.72423497@windsurf>
References: <CAO6UsjCZQUKvmA-a0votPq5AFZ6ESkwpNbLvfEymU5uy_SdggA@mail.gmail.com>
 <20170720095636.72423497@windsurf>
Message-ID: <CAO6UsjBm0q9_g8_dpuA=7kPcFuzhouvM_8GV1J=+76PDfVykSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

According to HOST_PYTHON_CONF_OPTS defined in python.mk, --disable-hashlib
is not specified.
That means _hashlib should be enabled by default, right?

On Thu, Jul 20, 2017 at 3:56 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Thu, 20 Jul 2017 15:33:17 +0800, Diankun Zhang wrote:
>
> > The python buildin module _hashlib has dependency on library
> > libcrypto.so to provide the SHA-224, SHA-256, SHA-384, SHA-512
> > hash algorithms in addition to platform optimized versions
> > of MD5 and SHA1. Adding host package dependency on host-openssl
> > to support the building of _hashlib module for host-python.
> >
> > Signed-off-by: Diankun Zhang <kundy.zhang@gmail.com>
>
> Why do you need the _hashlib module in the host-python ?
>
> Indeed, we try to avoid adding too many dependencies, and adding a new
> dependency to host-python is going to increase the build time to a
> large number of people who don't necessarily need the _hashlib module
> in the host Python interpreter.
>
> So could you explain why this is needed ?
>
> Thanks!
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170720/5934de83/attachment.html>
