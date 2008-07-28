From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 28 Jul 2008 10:42:37 +0200
Subject: [Buildroot] Makefile.autotools.in does not
	work	wellwith	projects
In-Reply-To: <20080727013317.GA1706@cloud.net.au>
References: <1216910589.29392.18.camel@localhost>
	<20080725001242.GB25141@cloud.net.au>
	<80DE307AE1CF4656A7072295EA2408F8@aeglos>
	<20080727013317.GA1706@cloud.net.au>
Message-ID: <1217234557.7955.8.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2008-07-27 at 11:33 +1000, Hamish Moffatt wrote:
> On Sat, Jul 26, 2008 at 08:53:43AM +0200, Ulf Samuelsson wrote:
> > Subject: Re: [Buildroot] Makefile.autotools.in does not work wellwith  
> > projects
> >
> >> On Thu, Jul 24, 2008 at 04:43:09PM +0200, Hans-Christian Egtvedt wrote:
> >>> The Makefile.autotools.in uses a rule which touches a
> >>> stamp_target_installed file, this does not work well with projects.
> >>>
> >>> The Makefile should depend on a file on the target root file system,
> >>> file not there => install to target again.
> >>
> >> Indeed - install stamps are pure evil. They don't work with multiple
> >> projects and they mean you can't "rm -rf
> >> project_build_$(ARCH)/$(PROJECT)/root".
> >
> > I do not think that you want to have install stamps in the root file system
> > because they will end up in the target (unless they are ignored when
> > the rootfs is created).
> 
> I don't think you should use stamps at all - test for a target file
> instead.
> 

And two minutes later I have a RFC for this solution, see attached
patch.

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
-------------- next part --------------
A non-text attachment was scrubbed...
Name: makefile-autotools-in.patch
Type: text/x-patch
Size: 1493 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080728/5703bd59/attachment.bin 
