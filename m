From: Linux Edwin K <linux.edwin.k@gmail.com>
Date: Thu, 27 Jul 2017 11:54:12 +0530
Subject: [Buildroot] Makefile for iotivity-1.1.1 build under buildroot
In-Reply-To: <20170724181626.GA4226@itchy>
References: <CAL6UhvSj4kKS4E0VhFSfD+E2_K_ese8r_ubktdBPTotgOQsCRA@mail.gmail.com>
 <20170724181626.GA4226@itchy>
Message-ID: <CAL6UhvRQObS-YiJo5MAYeqRb8rmZcP2c8CKYMiC2f7RHUhKUwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

Thanks for the response. Since buildroot subscription mails hits my inbox
with 40+mails daily, I am unable to notice your mail. Sorry for my delayed
response.

By the way, considering your hints, I will try with *mongodb.mk
<http://mongodb.mk>*  as an example to modify/create my iotivity.mk file
 and  proceed to build.

*My Target's partial information* :  ARCH = aarch64,  CPU =
ARM-Cortex-A53  Cores
= Quad-Core

ToolChain used in my customised buildroot = toolchain / gcc / linux-x86 /
aarch64 / *gcc-linaro-aarch64-linux-gnu-4.9*

I will keep posted if stuck or gets a positive result.

----------------------------------------------------------------------------------------------------------------------------------------------------------

Also I did try this link >
https://wiki.iotivity.org/iotivity_porting_to_arm_based_platforms

build/iotivity-1.1.1/out/linux/x86_64/debug/resource/csdk/connectivity/src/bt_le_adapter/linux/bluez-glue.c']

TypeError: argument of type 'NoneType' is not iterable:

File "build/iotivity-1.1.1/SConstruct", *line 57*:
SConscript(build_dir + 'resource/SConscript')
File "/usr/local/lib/scons-2.5.0/SCons/Script/SConscript.py", line
604: return method(*args, **kw)
File "/usr/local/lib/scons-2.5.0/SCons/Script/SConscript.py", line
541: return _SConscript(self.fs, *files, **subst_kw)
File "/usr/local/lib/scons-2.5.0/SCons/Script/SConscript.py", line
250: exec _file_ in call_stack[-1].globals
File "build/iotivity-1.1.1/resource/SConscript", line 40:
SConscript('csdk/SConscript')

File "/usr/local/lib/scons-2.5.0/SCons/Script/SConscript.py", line
604: return method(*args, **kw)
File "/usr/local/lib/scons-2.5.0/SCons/Script/SConscript.py", line
541: return _SConscript(self.fs, *files, **subst_kw)
File "/usr/local/lib/scons-2.5.0/SCons/Script/SConscript.py", line
250: exec _file_ in call_stack[-1].globals
File "build/iotivity-1.1.1/resource/csdk/SConscript", *line 39*:
if 'CLIENT' in rd_mode or 'SERVER' in rd_mode:

*********** Unit test Stop *************

and
Got a response from a person worked in ioTivity project for OCF  by  saying
 :  cross-building experiments on current (1.3/master) fail pretty quickly
- dependency checks like boost, googletest aren't set up for
cross-building, *except* in the very specific case of building for Android,
which uses the Android toolchains (sdk, ndk) which are set up for that. The
Yocto build has been debugged as well.

Let me try both of your suggestions (Cross-Compile  &  direct buildroot as
tool-base)  and see what happens.

I will keep posted. Thanks for your response and precious time shared.

-
Regards

Edwin  |  Chennai  |  India


On 24 July 2017 at 23:46, Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:

> Hi!
>
> On 17-07-24 13:48:16, Linux Edwin K wrote:
> > Hi buildroot,
> >
> > I have done a specific project on buildroot environment and I wanted to
> add
> > *ioTivity-1.1.1* as a /buildroot/package/iotivity/
> >
> > Either OCF or buildroot were not given official support for iotivity
> build
> > under buildroot.
> >
> > Since my project completion time is shorter, am finding difficulty to
> write
> > my own *iotivity.mk <http://iotivity.mk>* file.
> >
> > Will I get help ?
>
> Out of curiosity, I briefly looked at iotivity [1]. It uses Scons as its
> build system. So if you want to add a new Buildroot package for
> iotivity, you can take package/mongodb/mongodb.mk as an example, as this
> package also uses Scons.
>
> Scons is not used directly, as a wrapper script named `auto_build.py` is
> provided. It may have to be invoked from IOTIVITY_BUILD_CMDS in the
> package Makefile.
>
> I also noticed it relies on some external libraries, like Boost,
> tinycbor or gtest. Some are available in Buildroot, others are not. So
> you may have to add additional packages for the missing ones and list
> them in the package dependencies (surprisingly, depending on the missing
> library, it either asks the user to perform the clone manually or does
> it on its own when building).
>
> Hope this helps.
>
> [1] https://wiki.iotivity.org/build_for_your_system
>
> Regards,
>
> --
> ELB
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170727/2a930c1c/attachment.html>
