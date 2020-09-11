From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 Sep 2020 10:25:21 +0200
Subject: [Buildroot] package/localedef: parallel build failing. python3
 dependency missing?
In-Reply-To: <3414aca6-8ec1-7d9f-4c18-3a617bbce005@nosthoff.rocks>
References: <3414aca6-8ec1-7d9f-4c18-3a617bbce005@nosthoff.rocks>
Message-ID: <20200911102521.426a7faa@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Sep 2020 10:05:00 +0200
Michael Nosthoff <michael@nosthoff.rocks> wrote:

> checking if /build/build/per-package/host-localedef/host/bin/ccache
> /usr/bin/gcc is sufficient to build libc... yes
> checking for x86_64-pc-linux-gnu-nm... /usr/bin/nm
> checking for python3... no
> checking for python... python
> checking version of python... 2.7.18, bad
> configure: error:
> *** These critical programs are missing or too old: python
> *** Check the INSTALL file for required versions.
> 
> 
> The system I'm building on is a Ubuntu 20.04 with only python 2
> installed. On my other dev machine where python 3 is installed the
> package is successfully built.
> 
> But from my understanding the python from package host-python3 should be
> used for building?
> This package is being built but I guess the host-localedef package is
> missing the dependency?

I guess we need to do like package/glibc/glibc.mk, i.e add
$(BR2_PYTHON3_HOST_DEPENDENCY) to the dependencies of host-localdef.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
