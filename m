From: Diankun Zhang <kundy.zhang@gmail.com>
Date: Thu, 20 Jul 2017 17:09:52 +0800
Subject: [Buildroot] [PATCH 1/1] package/python: fix building _hashlib
	of host-python
In-Reply-To: <20170720102733.2d606f02@windsurf>
References: <CAO6UsjCZQUKvmA-a0votPq5AFZ6ESkwpNbLvfEymU5uy_SdggA@mail.gmail.com>
 <20170720095636.72423497@windsurf>
 <CAO6UsjBm0q9_g8_dpuA=7kPcFuzhouvM_8GV1J=+76PDfVykSw@mail.gmail.com>
 <20170720102733.2d606f02@windsurf>
Message-ID: <CAO6UsjAcBxW=sxOtPyGAY823uNk8QuZFSTjxGMqEMaVMbvg1uQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

I'm cross-compiling host-python on my x86_64 box on which ubuntu 16.04
installed.
libssl is installed whereas openssl is not installed on my box. When
cross-compiling
host-python, I found _hashlib.so is not compiled whereas _md5.so,
_sha256.so, _sha512.so
and _md5.so are compiled. I think -disable-hashlib will not decrease the
build time and
the size of the host-python artifacts.

As for the hash lib use case, i am integrating a third-party python tool
pyang
(https://github.com/mbj4668/pyang) into our project. The pyang tool will
take advantage of python
_hashlib module.

On Thu, Jul 20, 2017 at 4:27 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Thu, 20 Jul 2017 16:21:51 +0800, Diankun Zhang wrote:
>
> > According to HOST_PYTHON_CONF_OPTS defined in python.mk,
> --disable-hashlib
> > is not specified.
> > That means _hashlib should be enabled by default, right?
>
> Well, no, not necessarily. We simply forgot to add --disable-hashlib.
>
> Again: why do you need this? If you could answer this question it would
> make the discussion a lot more productive :-)
>
> It is very possible that there are legitimate use cases for having
> the hashlib module built in the host Python interpreter. If we
> understand those use cases, then we can come up with a solution. But if
> you keep being silent about the *why* you need this, we won't move very
> far.
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170720/eef0bd84/attachment.html>
