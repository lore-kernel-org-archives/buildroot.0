From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 21 Aug 2009 15:12:18 -0300
Subject: [Buildroot] rebuild problem, fakeroot complaining.
In-Reply-To: <35d32c5c0908210201p60633a21k4762f67e0d98762e@mail.gmail.com>
References: <35d32c5c0908210201p60633a21k4762f67e0d98762e@mail.gmail.com>
Message-ID: <d6cda7730908211112v7b6aa889wc84577d912cb976c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Aug 21, 2009 at 6:01 AM, Richard Rondu<rondu.richard@gmail.com> wrote:
> -- /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/_fakeroot."rootfs".arm.cramfs
> fakeroot, while creating message channels: Invalid argument
> This may be due to a lack of SYSV IPC support.
> fakeroot: error while starting the `faked' daemon.
> kill: usage: kill [-s sigspec | -n signum | -sigspec] pid | jobspec
> ... or kill -l [sigspec]
> make: *** [cramfsroot] Error 1
>
> If i reboot then i can build again one time but the next fails.
> Rebooting every build is kind of annoying.
>
> Can someone help me please or point me in the right direction?
>

I've never seen this, but from the error message, looks like the linux
kernel on your host computer lacks SYSV IPC support. Try enabling it,
should fix the problem. You would have to recompile your kernel, or do
some distro wizardry to get the right precompiled kernel package.

Kind Regards,
   Thiago A. Correa
