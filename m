From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Wed, 07 Nov 2012 19:56:20 +0200
Subject: [Buildroot] Udev on a live CD system does not appear to
 populate /dev
In-Reply-To: <5099A14C.5000204@mind.be>
References: <5099186E.1030409@macrium.com> <509958D9.7050108@petroprogram.com>
 <5099A14C.5000204@mind.be>
Message-ID: <509AA0C4.4060506@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

7.11.2012 1:46, Arnout Vandecappelle kirjoitti:
> On 06/11/12 19:37, Stefan Fr?berg wrote:
>> Here's what I have minimally in my own buildroot's fs/skeleton/dev
>> folder (which is copied at the end of the buildroot
>> process into output/target/dev )
>
>  Err... That can only work if you have sudo in your post-build script
> - which
> we consider bad practice.  We have the device_table to deal with
> device nodes.
> And all of that shouldn't be necessary if you use devtmpfs (or udev or
> mdev,
> which implies devtmpfs).  If you use static device nodes, then the
> default
> device_table_dev creates all of those.
>
Nope, no sudo in my live Cd.
Just few pre-made device nodes in fs/skeleton/dev and my special made
init stuff in fs/skeleton/etc/init.d

Well ok, I confess ... I *did* modify /etc/init.d/rcS a little bit for
my needs and also added unionfs mounting to S15mount
and some few other little things

So far I have been very happy with my own personal Live CD Linux distro.
It has 873 MB worth of various userspace utilities in 700 MB CD-R disc.
Feat which would have not been posible without initramfs (XZ
compressed), unionfs and squashfs.

The lowest RAM amount I managed to start it was 192 MB.
With Xorg, Fluxbox and Firefox :-)

Without buildroot and my lil tweakings I could have never made it.

Best regards
Stefan


>  If that doesn't work for you, then we should try to fix it in buildroot.
>
>  Regards,
>  Arnout
