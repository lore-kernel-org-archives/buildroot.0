From: Erico Nunes <nunes.erico@gmail.com>
Date: Fri, 2 Jun 2017 13:37:17 +0200
Subject: [Buildroot] Grub2
In-Reply-To: <4482AAE9-D293-4E36-9675-74D5BE618A63@ou.edu>
References: <4482AAE9-D293-4E36-9675-74D5BE618A63@ou.edu>
Message-ID: <CAK4VdL2waxJhw78-i06nceeATFb4C0H8ZEYOMaereaWrMMaqfw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steve,

On Fri, Jun 2, 2017 at 5:11 AM,  <skenton@ou.edu> wrote:
> A while back I tripped over a bug in Grub2 2.00 that sometimes made my
> embedded system unbootable so I've been running with the code fragment
> below in my build script. It still works with 2017.05 release FYI.
>
> It builds just fine for me on x86_64 glibc but is not a general drop in
> because gfxterm_background and probably other commands which were built
> into the grub2 core in 2.00 are modules in 2.02 and required adjustments
> to my embedded modules list. What is the best way to upgrade versions in
> this sort of situation?
>
> Steve Kenton
>
> # To work around package bugs slip stream grub2
> sed --in-place 's/2.00/2.02/' $buildrootdir/boot/grub2/grub2.mk
> # Remove the hash file(s) to fool buildroot
> rm --force $buildrootdir/boot/grub2/grub2.hash
> $buildrootdir/boot/grub2/*.patch

I have a patchset sitting in patchwork to bump grub2 and then do more
things like ARM support:
https://patchwork.ozlabs.org/project/buildroot/list/?submitter=46481&state=&q=grub2&archive=&delegate=

Hopefully now that 2017.05 is finished it can get some attention.
If you can test that patch set and provide some review/tested-by to
the patches, maybe we can get it merged (or respinned, if needed)
faster.

Thanks

Erico
