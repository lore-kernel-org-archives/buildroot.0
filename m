From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 3 Sep 2008 10:59:13 +1000
Subject: [Buildroot] Login exited
In-Reply-To: <ed4892840809020809r69eb6383wda4db62d49058959@mail.gmail.com>
References: <ed4892840809011747w183e8e8bma1451d38c40e65c0@mail.gmail.com>
	<MJEBLBOLLBKOACLOGNPBGEIHCBAA.e.krueper@solcon-systemtechnik.de>
	<ed4892840809020426s36489484t7ca0a5dd2863733e@mail.gmail.com>
	<20080902130749.GA12634@cloud.net.au>
	<ed4892840809020809r69eb6383wda4db62d49058959@mail.gmail.com>
Message-ID: <20080903005913.GC7857@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 02, 2008 at 11:09:25PM +0800, Steven Woody wrote:
> On Tue, Sep 2, 2008 at 9:07 PM, Hamish Moffatt <hamish@cloud.net.au> wrote:
> > On Tue, Sep 02, 2008 at 07:26:44PM +0800, Steven Woody wrote:
> >> I think the origin of the "can't open /dev/ttySxxx" problem is differ
> >> with the origin of the "getty exited" problem.  And, for the former, I
> >> think it has nothing to do with my device_table.txt,  since if I
> >> comment out the following line in etc/inittab:
> >>    ::sysinit:/bin/mount -t tmpfs -o size=64k,mode=0755 none /dev
> >> and replace it with
> >>    ::sysinit:/bin/mount -t tmpfs -o size=64k,mode=0755 none /dev
> >> then, the "can't open /dev/ttySxxx" problem gone away.  so I think,
> >
> > What is the difference between these two lines? I don't see one.
> 
> Sorry for the careless.  The correct one should be:
>    ::sysinit:/bin/mount -t tmpfs none /dev
> That is, without any option.

That's strange, because those options for tmpfs are valid. The only
problem I can see is that 64k might not be large enough. I don't know
how much space device nodes take - they don't have data but they do have
meta-data of course.

> I will put an eye to the decompressing error, but by far I have not
> figure out why the root files system is possibly incomplete.

Incomplete because of the decompression error, I mean.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
