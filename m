From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 12 Feb 2019 20:19:11 +0100
Subject: [Buildroot] Buildroot-2.18.11 fails?
In-Reply-To: <0fbddf2c-9da7-80a9-a890-ec1001ac6d3f@lamiaworks.com.au>
References: <e5695acd-7280-74a5-dd40-429e4baf7fc3@lamiaworks.com.au>
 <0fbddf2c-9da7-80a9-a890-ec1001ac6d3f@lamiaworks.com.au>
Message-ID: <20190212201911.363881e2@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello scsijon,

On Mon, 11 Feb 2019 12:56:32 +1100, scsijon <scsijon@lamiaworks.com.au> wrote:

> no, same result and point of failure, i'm going to move it across to one 
> of my test machines with a later Puppy called Easy and see what happens, 
> I can containerize it on that.

Thanks for feedback (and please keep the buildroot mailing list in CC)...

> 
> I'll let you know what happens, however the errors do make me thing 
> something is wrong with the source package.

...but builds on many different machined, see e.g. the
autobuilder results...., at least resort try to downgrade the
selected compiler...

Regards,
Peter

> 
> 
> -------- Forwarded Message --------
> Subject: Re: [Buildroot] Buildroot-2.18.11 fails?
> Date: Mon, 11 Feb 2019 09:20:51 +1100
> From: scsijon <scsijon@lamiaworks.com.au>
> To: Peter Seiderer <ps.report@gmx.net>
> 
> Hi, mine is a Puppy Linux variety called Quirky Xerus64, a cross of 
> Puppy linux built with ubuntu-xenial(, the normal way we build things in 
> the puppy world), and yes it uses gcc 5.4.0, libc-2.23 and libc6-2.23.
> 
> But what's this about "make savedefconfig", it's not in the listed build 
> steps in the docs or quickbuild steps in the readme? Maybe that's my 
> problem.
> 
> On 11/02/19 02:09, Peter Seiderer wrote:
> > Hello scsijon,
> > 
> > On Sun, 10 Feb 2019 19:37:07 +1100, scsijon <scsijon@lamiaworks.com.au> wrote:
> >   
> >> On 10/02/19 18:14, Peter Seiderer wrote:  
> >>> Hello scsijon,
> >>>
> >>> On Sun, 10 Feb 2019 15:20:45 +1100, scsijon <scsijon@lamiaworks.com.au> wrote:
> >>>      
> >>>> I thought i'd try it after so many years.
> >>>> I thought i'd try the last complete version before trying a snapshot.
> >>>>
> >>>> So, what I did was to download and unpacked the 2018.11 package from
> >>>> your site.  
> >>>
> >>> 2018.11.2, 2018.11.1 or 2018.11?
> >>>      
> >> buildroot-2018.11.tar.gz, didn't see the others on the site I was
> >> directed too from your main page at the time. However found 2018.11.2 on
> >> the git site so will have a go with that tonight.  
> >>>>
> >>>> Went into make menuconfig and changed (to match what I am use to working  
> >>>> with)>  
> >>>> target Architecture to x86_64;
> >>>> toolchain to glibc;
> >>>> gcc version to 8.x;
> >>>> linux kernel to 4.18 and added a defcon name;
> >>>> exited.
> >>>>
> >>>> make source (to download the packages required so I could build offline);
> >>>>
> >>>> make.
> >>>>
> >>>> All went well until host-gcc-final-8.2.0 where it errored, failed and
> >>>> exited.  
> >>>
> >>> Should not happen ;-), mind to share your .config/defconfig file?
> >>>      
> >> Hope this is what you want, attached, couldn't send a . file so renamed
> >> it, ignore the undotted.  
> > 
> > Thanks for the .config file, after 'make savedefconfig' resulted in the follwing (short)
> > defconfig file:
> > 
> > BR2_x86_64=y
> > BR2_JLEVEL=1
> > BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> > BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
> > BR2_GCC_VERSION_8_X=y
> > BR2_LINUX_KERNEL=y
> > BR2_LINUX_KERNEL_DEFCONFIG="dfgh"
> > 
> > Could not reproduce your problem here locally, on which host system do you
> > run your build (mine is openSUSE Tumbleweed with gcc-8.2.1 and libc-2.27,
> > yours seem to be a gcc-5.x)?
> > 
> > Regards,
> > Peter
> >   
> >>  
> >>> Regards,
> >>> Peter
> >>>      
> >>>>
> >>>> Before I consider proceeding further, could I have some help and advice
> >>>> with this please. I would have thought this should have been ok.
> >>>>
> >>>> I have attached the relevant section of the log file.
> >>>>
> >>>> thanks
> >>>> scsijon
> >>>>
> >>>>     
> >>>
> >>>      
> >   
