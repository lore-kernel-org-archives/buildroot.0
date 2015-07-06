From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 14:59:44 +0200
Subject: [Buildroot] Error when opencv is included in compilation,
 'i586-buildroot-linux-g++' file is missed
In-Reply-To: <CACiBgcej-aEteA67kBPy9HXm20QQQHOnCVbrQqWKfhN2Ne0xiQ@mail.gmail.com>
References: <CACiBgcej-aEteA67kBPy9HXm20QQQHOnCVbrQqWKfhN2Ne0xiQ@mail.gmail.com>
Message-ID: <20150706145944.34253727@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 Jul 2015 14:46:21 +0200, Goe wrote:

> I am trying to compile a buildroot instance with opencv included using a
> machine with Ubuntu 14.04. The first compilation (before include opencv) is
> correct, but it fails when I try to compile again including opencv in the
> configuration.
> 
> The strangest thing is that the same steps work correctly in other machines
> with Ubuntu 12.04 and Debian 8 (I do not have another Ubuntu 14.04 machine).
> 
> The followed steps are:
> * make clean
> * make (compilation finished without errors)
> * make nconfig (Include WCHAR, C++ support and OpenCV)
> * make

That's your problem. Since you enabled WCHAR and C++, you need to do a
full rebuild, i.e "make clean all".

See http://buildroot.org/downloads/manual/manual.html#full-rebuild:

"""
When the toolchain configuration is changed, a complete rebuild
generally is needed. Changing the toolchain configuration often
involves changing the compiler version, the type of C library or its
configuration, or some other fundamental configuration item, and these
changes have an impact on the entire system.
"""

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
