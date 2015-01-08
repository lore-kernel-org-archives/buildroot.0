From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jan 2015 12:26:48 +0100
Subject: [Buildroot] host-python build issue
In-Reply-To: <54AE5AF0.1040008@gmail.com>
References: <54AD3069.8090309@gmail.com>
 <20150107174313.3d9ea5ff@free-electrons.com>
 <CALo-6+jKLNFqOG08oQbWZOd2RSjoeF8aFkS-zBY5Y77JNtd5Qg@mail.gmail.com>
 <20150107175105.74634f8c@free-electrons.com>
 <54AE5090.5040802@gmail.com>
 <20150108105629.2d8308bc@free-electrons.com>
 <54AE5AF0.1040008@gmail.com>
Message-ID: <20150108122648.26a06caf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Zoltan Gyarmati,

On Thu, 08 Jan 2015 11:24:48 +0100, Zoltan Gyarmati wrote:

> Yes, and the files of the package:
> $dpkg -L oss4-dev
> /.
> /usr
> /usr/include
> /usr/include/linux
> /usr/include/linux/soundcard.h
> package diverts others to: /usr/include/linux/soundcard.h.oss3
> /usr/share
> /usr/share/doc
> /usr/share/doc/oss4-dev
> /usr/share/doc/oss4-dev/copyright
> /usr/share/doc/oss4-dev/changelog.gz
> /usr/share/doc/oss4-dev/changelog.Debian.gz
> /usr/share/doc/oss4-dev/README.Debian
> 
> I didn't notice before that the header file in question was diverted, so
> after removing the package, host-python builds properly, thanks for the
> hint!

I have no idea why this package moves a kernel headers to a different
name. Obviously it can break quite a lot of userspace
applications/libraries. I don't really understand why they are doing
this.

That being said, I don't think the ossaudio Python module is very
useful, so disabling its build is probably the right thing to do for
host-python, and for target python, make it optional.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
