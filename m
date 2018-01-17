From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 17 Jan 2018 16:40:11 -0600
Subject: [Buildroot] [PATCH] xen: bump to version 4.9.1
In-Reply-To: <87po69yf9e.fsf@dell.be.48ers.dk>
References: <20180114224711.25133-1-peter@korsgaard.com>
 <CANQCQpayJkVAxWQS_42y+o3b-TJ5P5EVFzoz5cOcwmcsLTZJYA@mail.gmail.com>
 <87po69yf9e.fsf@dell.be.48ers.dk>
Message-ID: <CANQCQpaWOWy86JmBYgaooiOmwhh_+nHVU=roOV6-jfOmu8qhKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, all,

On Tue, Jan 16, 2018 at 9:50 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:
>
>  > Peter,
>  > On Sun, Jan 14, 2018 at 4:47 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>  >> Drop 0003-tools-libxc-xc_dom_arm-add-missing-variable-initiali.patch as that
>  >> is now upstream:
>  >>
>  >> https://xenbits.xenproject.org/gitweb/?p=xen.git;a=commit;h=88bfbf90e35f1213f9967a97dee0b2039f9998a4
>  >>
>  >> Drop security patches as 4.9.1 includes up to xsa-245.
>  >>
>
>  > I ran it through test-pkg and that looked good.
>
> Thanks!
>
>  > I also did a build against the autobuilder failure below.  Looks like
>  > that failure is still present.
>  > http://autobuild.buildroot.net/results/8bcb80dc93d38bb38ca32ad93d52c22d1176d57e/
>
> Hmm, it looks like the embedded qemu copy picks up sdl2, which it
> probably shouldn't (or we should atleast handle the dependencies
> correctly).
>

Should we by default force SDL to be turned on for xen tools,
explicitly disable or make it optional?  I can see some additional
patches to make their --disable-sdl work vs fixing the include paths
to formally --enable-sdl.

A second item, I realized with sdl2 is that its another package which
pollutes the sysroot pkg-config with host build paths.  I'll be
preparing a target-finalize patch which checks for these bad paths

Matt
