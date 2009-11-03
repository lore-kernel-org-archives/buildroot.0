From: Dan Christensen <opello@opello.org>
Date: Tue, 3 Nov 2009 08:33:06 -0600
Subject: [Buildroot] [PATCH] Introduce support for using either
	e2fsimage of genext2fs
In-Reply-To: <87a5b0800911030220o383c9897xaa3838fad0510970@mail.gmail.com>
References: <6a52edd60910211816g12860f63xc2f70e1ee473a335@mail.gmail.com>
	<6a52edd60911021808w8d65e45t93c83682c133dfbc@mail.gmail.com>
	<87a5b0800911030220o383c9897xaa3838fad0510970@mail.gmail.com>
Message-ID: <6a52edd60911030633t49b6fa80qd96236e9e19775d0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the reply, Will.

On Tue, Nov 3, 2009 at 4:20 AM, Will Newton <will.newton@gmail.com> wrote:
> On Tue, Nov 3, 2009 at 2:08 AM, Dan Christensen <opello@opello.org> wrote:

> I don't personally use ext2 filesystems myself, so I can't really
> comment on one tool versus the other, but on the whole your patch
> looks like it makes sense.

That's good news.

>> I did end up with a few questions about how e2fsimage's dependencies
>> should be met. ?It depends on e2fslibs-dev (debian package name), and
>> I see that e2fsprogs is already a package built for the target. ?I was
>> wondering if this could be build for the host as well, similar to how
>> fakeroot has both a 'target' and a 'host' configuration. ?I wasn't
>> sure how this would work with the new Makefile.autotools.in changes in
>> e2fsprogs.mk.
>> The way I solved this for myself was adding support to build it to my
>> own e2fsprogs.mk (not included in this patch as it doesn't seem the
>> correct way to manage the dependency).
>
> I think the buildroot way is to try and minimize the dependencies
> required on the host system, so we build host dependencies where
> possible. The autotools infrastructure is not currently capable of
> building host packages, although I think Thomas's upcoming changes
> will likely fix that.

I'll keep a look out for those changes.

>> The other significant question I had was the CFLAGS that should be
>> used for e2fsimage. ?I simply copied the ones used for genext2fs
>> (-Wall -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
>> -D_FILE_OFFSET_BITS=64) and it seemed to work.
>
> Do we need to set CFLAGS at all? Won't configure take care of setting
> some appropriate flags for us?

The configure is pretty minimal (not autotools based) but it did work
fine in my tests, so probably not necessary.
I updated the patch to only pass -Wall -O2, since those still seem sensible.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ext2-reorganize-and-add-support-for-e2fsimage.patch
Type: application/octet-stream
Size: 16992 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091103/067887e8/attachment-0001.obj>
