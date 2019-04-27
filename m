From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 27 Apr 2019 08:40:06 +0200
Subject: [Buildroot] TestPerlDBDmysql continues to fail
In-Reply-To: <591fb130-985f-8d8f-b99e-7c7b76e4469d@mind.be>
References: <20190422221208.3b4349c8@windsurf>
 <CAB0FRsvE=G_FOFMsj8awHrCBK3fDJLqD1AZdCLaafsMJ90cQeg@mail.gmail.com>
 <20190423095813.767fe22c@windsurf>
 <591fb130-985f-8d8f-b99e-7c7b76e4469d@mind.be>
Message-ID: <CAB0FRsvYpHb+-ayDE0fkkQ2tVVT+jRaqAaset0o5jaZXTibxfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le sam. 27 avr. 2019 ? 01:26, Arnout Vandecappelle <arnout@mind.be> a
?crit :

>
>
> On 23/04/2019 09:58, Thomas Petazzoni wrote:
> > On Tue, 23 Apr 2019 09:44:33 +0200
> > Fran?ois Perrad <francois.perrad@gadz.org> wrote:
> >
> >> I could reproduce the issue.
> >> It is weird:
> >> - the build step seems good, the image  rootfs.cpio is created
> >> - but the system does not boot, there is a kernel panic, see
> >>
> https://gitlab.com/buildroot.org/buildroot/-/jobs/199339668/artifacts/file/test-output/TestPerlDBDmysql-run.log
> >
> > I can reproduce the issue locally. If I take the same rootfs.cpio, and
> > boot it with -M versatilepb and the kernel-versatile kernel image, it
> > boots fine.
> >
> > However that is strange because:
> >
> >  - The ARMv5 user-space that is being built should work fine under an
> >    ARMv7 machine
> >
> >  - All other Perl test cases are using the same base configuration
> >    (ARMv5) and booting under an ARMv7 Qemu machine + kernel, and they
> >    work fine.
>
>  The actual error is:
>
> Unpacking initramfs...
>
> Initramfs unpacking failed: write error
>
> (it's quite a bit before the end of the file).
>
>  This rootfs is about 40MB, while the others are around 32MB. So I guess
> it just
> doesn't fit in the 128MB given to the system.
>
>
This test was initially written with Perl 5.26 which gives a rootfs a
little smaller and allow to run successfully.

Fran?ois


>  Regards,
>  Arnout
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190427/474f5fee/attachment.html>
