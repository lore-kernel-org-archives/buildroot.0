From: rdkehn at yahoo.com <rdkehn@yahoo.com>
Date: Thu, 17 Dec 2015 08:07:59 -0600
Subject: [Buildroot] [Bug 8536] New: Building sudo with PAM results in
 unusable sudo
In-Reply-To: <20151217115246.2e154af8@free-electrons.com>
References: <bug-8536-163@https.bugs.busybox.net/>
 <20151217115246.2e154af8@free-electrons.com>
Message-ID: <20151217140758.GA12651@dkarchlinux64.currentcomm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Everyone,

On Thu, Dec 17, 2015 at 11:52:46AM +0100, Thomas Petazzoni wrote:
> Hello James,
> 
> You have been the one enabling PAM support in sudo, in commit
> https://git.busybox.net/buildroot/commit/package/sudo?id=eeacb333a33d50034c1ace1bb293a9a04d76e617.
> 
> Can you have a look at the below bug report?
> 

If it helps, I build sudo with PAM and have not observed any
oddities.

Buildroot: 2015.11.1 and 6a69e28d15253fe75a8a1051e60750842e126196
Toolchain: arm-buildroot-linux-gnueabihf 
   Kernel: 4.1.6
			git://git.ti.com/processor-sdk/processor-sdk-linux.git
			52c4aa7cdb93d61f8008f380135beaf7b8fa6593
Processor: TI AM3352
     sudo: 1.8.15
linux-pam: 1.1.8

Regards,
...doug

> Thanks!
> 
> Thomas
> 
> On Thu, 17 Dec 2015 10:00:50 +0000, bugzilla at busybox.net wrote:
> > https://bugs.busybox.net/show_bug.cgi?id=8536
> > 
> >             Bug ID: 8536
> >            Summary: Building sudo with PAM results in unusable sudo
> >            Product: buildroot
> >            Version: unspecified
> >           Hardware: PC
> >                 OS: Linux
> >             Status: NEW
> >           Severity: normal
> >           Priority: P5
> >          Component: Other
> >           Assignee: unassigned at buildroot.uclibc.org
> >           Reporter: nroach44 at gmail.com
> >                 CC: buildroot at uclibc.org
> > 
> > As the title, when building an image with both sudo and PAM results in sudo
> > denying all requests.
> > 
> > If you comment out the PAM section in sudo.mk everything works as intended
> > (minus any PAM integration).
> > 
> > I only have one file in sudoers.d that contains:
> > 
> > %sudo    ALL=(ALL) ALL
> > 
> > otherwise I don't have any PAM or sudo configuration
> > 
> > I'm building for a SAMA5D3_XPLD (cortex-a5) board with linux 4.0.9 on latest
> > git, with a custom ct-ng toolchain (that otherwise works)
> > 
> 
> 
> 
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
