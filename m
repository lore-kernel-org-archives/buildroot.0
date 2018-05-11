From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 11 May 2018 18:10:10 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-05-10
In-Reply-To: <20180511165756.3fa9daa8@windsurf.home>
References: <20180511060052.6B11C208B6@mail.bootlin.com>
 <CANQCQpaXv50gaegjR954LMBd1FLj0U3jefnG_DSVAMujzv-qWQ@mail.gmail.com>
 <20180511144826.mtmjci4ppvacqorg@tarshish>
 <20180511165756.3fa9daa8@windsurf.home>
Message-ID: <20180511151010.t34zuowbpldgecrb@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, May 11, 2018 at 04:57:56PM +0200, Thomas Petazzoni wrote:
> On Fri, 11 May 2018 17:48:26 +0300, Baruch Siach wrote:
> 
> > > Fixed by: http://patchwork.ozlabs.org/patch/911114/  
> > 
> > traceroute fails[1] for a similar reason on your autobuilder, this time 
> > because of -lm. I wonder what makes your machine special?
> > 
> > [1] http://autobuild.buildroot.net/?reason=traceroute-2.1.0
> 
> Yes, I'm not a big fan of the "let's bump xfsprogs" solution, while all
> the build failures for xfsprogs happen only on Matt's machine:
> 
>   http://autobuild.buildroot.net/?reason=xfsprogs%
> 
> And so are the traceroute failures:
> 
>   http://autobuild.buildroot.net/?reason=traceroute%
> 
> We need to understand that.

make seems to not do the right thing with -lfoo in a target dependency when 
cross compiling. So the right solution is probably to remove these 
dependencies. That's what the bump does. Alternatively, we can just patch -lrt 
out of xfsprogs, and -lm out of traceroute.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
