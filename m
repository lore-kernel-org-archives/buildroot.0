From: Mark Leo Sumadero <fryu771@gmail.com>
Date: Sat, 14 Mar 2020 22:43:04 +0800
Subject: [Buildroot] Help: error LONG_BIT definition appears wrong for
 platform
In-Reply-To: <CAA0OSwhHKHs+cNh4=0r7-U79wY-SrEL75=bXYjKX5nuvjSsY7g@mail.gmail.com>
References: <CAA0OSwgGcbzMe9o35FRqmLBZ5PFMx=1+fDYyiqq0yLk5YJyNpQ@mail.gmail.com>
 <20200313150443.682fdc5a@windsurf> <20200314112110.2d8ce39a@gmx.net>
 <CAA0OSwgZGQOKOv-11BxahH+Ht9Koxx=MEpfiuM-B-ZVVgQyLaw@mail.gmail.com>
 <20200314145457.19aae81f@gmx.net>
 <CAA0OSwgc+DexzwMCbmPJE0BOW2P=-O6OEVKAZSvBxYgoobYm3Q@mail.gmail.com>
 <CAA0OSwhHKHs+cNh4=0r7-U79wY-SrEL75=bXYjKX5nuvjSsY7g@mail.gmail.com>
Message-ID: <CAA0OSwg1eNngBU0ti4WKVW7aGgYL9xVp3hQ2GaP-m-n5vWrVWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

or i am really missing something here. Sorry i'am just confuse with the
process.

On Sat, Mar 14, 2020 at 10:38 PM Mark Leo Sumadero <fryu771@gmail.com>
wrote:

> Or i really don't know why i my python was compiled with pymalloc i'm just
> yung using the compiled python of buildroot.
>
> On Sat, Mar 14, 2020 at 10:33 PM Mark Leo Sumadero <fryu771@gmail.com>
> wrote:
>
>> Hi Peter,
>>
>> You are correct no need to patch but if  i remove the 'm' on my
>> configuration i got the same error. How can i force it to use python3.7
>> only without 'm'?
>>
>> On Sat, Mar 14, 2020 at 9:54 PM Peter Seiderer <ps.report@gmx.net> wrote:
>>
>>> Hello Mark,
>>>
>>> On Sat, 14 Mar 2020 20:30:01 +0800, Mark Leo Sumadero <fryu771@gmail.com>
>>> wrote:
>>>
>>> > Hi Peter,
>>> >
>>> > Thanks for the reply. I just used your configuration but i got the same
>>> > error
>>> >
>>> >
>>> /home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/../../usr/build-1/libtool
>>> > --silent --mode=compile
>>> >
>>> /home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
>>> > -prefer-pic -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
>>> > -D_FILE_OFFSET_BITS=64 -Os  -DLINUX -D_REENTRANT -D_GNU_SOURCE
>>> >
>>> -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include
>>> >
>>> -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/../../usr/include/apr-1
>>> >
>>> >
>>> -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/../../usr/include/apr-1
>>> >
>>> -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/../../../../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include
>>> > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
>>> >
>>> -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/python3.7
>>> >
>>> -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/include/python3.7m
>>> > -DNDEBUG  -c -o src/server/mod_wsgi.lo src/server/mod_wsgi.c && touch
>>> > src/server/mod_wsgi.slo
>>> > In file included from
>>> >
>>> /home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/include/python3.7m/Python.h:53:0,
>>> >                  from src/server/wsgi_python.h:24,
>>> >                  from src/server/mod_wsgi.c:22:
>>> >
>>> /home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/include/python3.7m/pyport.h:699:2:
>>> > error: #error "LONG_BIT definition appears wrong for platform (bad
>>> > gcc/glibc config?)."
>>> >  #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc
>>> > config?)."
>>> >
>>> > Did i miss something? I am currently using Buildroot-2019.02.01 and
>>> > python3.7, what version did you use?
>>> > Are we the same of header path?
>>>
>>> Tested against buildroot master, but should not make any difference,
>>> the important part is a full rebuild (configure/compile) of the
>>> package (best achieved by rm -rf
>>> build/mod_wsgi-61359e67448bdfc5fefb1692fd2a97f76394b20c)...
>>>
>>> No need to patch configure or configure.ac (there is already enough
>>> logic/magic that the
>>> given custom CPPFLAGS/LDFLAGS are used first)...
>>>
>>> According to [1] the 'm' in 'python3.7m' comes from a python
>>> configuration with --with-pymalloc,
>>> does not happen with stock buildroot configuration...
>>>
>>> Regards,
>>> Peter
>>>
>>> [1]
>>> https://stackoverflow.com/questions/41589655/whats-the-difference-between-python3-x-and-python3-xm
>>>
>>>
>>> >
>>> > Thanks,
>>> >
>>> > Mark Leo
>>> >
>>> > On Sat, Mar 14, 2020 at 6:21 PM Peter Seiderer <ps.report@gmx.net>
>>> wrote:
>>> >
>>> > > Hello Mark,
>>> > >
>>> > > On Fri, 13 Mar 2020 15:04:43 +0100, Thomas Petazzoni <
>>> > > thomas.petazzoni at bootlin.com> wrote:
>>> > >
>>> > > > Hello,
>>> > > >
>>> > > > On Fri, 13 Mar 2020 18:26:38 +0800
>>> > > > Mark Leo Sumadero <fryu771@gmail.com> wrote:
>>> > > >
>>> > > > >
>>> > >
>>> /home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
>>> > > >
>>> > > > This is the cross-compiler: good!
>>> > > >
>>> > > > > -prefer-pic -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
>>> > > > > -D_FILE_OFFSET_BITS=64 -Os  -DLINUX -D_REENTRANT -D_GNU_SOURCE
>>> > > > >
>>> > >
>>> -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include
>>> > > > >
>>> > >
>>> -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/../../usr/include/apr-1
>>> > > > >
>>> > > > >
>>> > >
>>> -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/../../usr/include/apr-1
>>> > > > >
>>> > >
>>> -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/../../../../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include
>>> > > > > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
>>> -Os
>>> > > > >
>>> > >
>>> -I/home/falcon/Documents/pisokonek-project/pisokonek/installer/buildroot-2019.02.1/output/host/include/python3.7m
>>> > > >
>>> > > > This is a path to header of host components: BAD!
>>> > > >
>>> > > > And this is where your problem is, this header path should *NOT* be
>>> > > > there when you cross-compile.
>>> > >
>>> > > The following worked for me (python3 case only):
>>> > >
>>> > > MOD_WSGI_VERSION = 61359e67448bdfc5fefb1692fd2a97f76394b20c
>>> > > MOD_WSGI_SITE = $(call
>>> github,GrahamDumpleton,mod_wsgi,$(MOD_WSGI_VERSION))
>>> > > MOD_WSGI_LICENSE = Apache-2.0
>>> > > MOD_WSGI_LICENSE_FILES = LICENSE
>>> > > MOD_WSGI_DEPENDENCIES = apache
>>> > >
>>> > > MOD_WSGI_CONF_OPTS = \
>>> > > --with-apxs=$(STAGING_DIR)/usr/bin/apxs
>>> > >
>>> > > ifeq ($(BR2_PACKAGE_PYTHON3),y)
>>> > > MOD_WSGI_DEPENDENCIES += python3
>>> > > MOD_WSGI_CONF_ENV += \
>>> > >
>>> > >
>>> CPPFLAGS="-I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)" \
>>> > >         LDFLAGS="-L$(STAGING_DIR)/usr/lib"
>>> > > endif
>>> > >
>>> > > $(eval $(autotools-package))
>>> > >
>>> > > Regards,
>>> > > Peter
>>> > >
>>> > > >
>>> > > > Best regards,
>>> > > >
>>> > > > Thomas Petazzoni
>>> > >
>>> > >
>>>
>>>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200314/6a229f15/attachment.html>
