From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Thu, 3 Apr 2014 18:16:19 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results
	for	2014-04-02
In-Reply-To: <nki01bxvlk.ln2@ID-313208.user.individual.net>
References: <20140403063009.526E4101924@stock.ovh.net>
 <nki01bxvlk.ln2@ID-313208.user.individual.net>
Message-ID: <F9C551623D2CBB4C9488801D14F864C68AA9F8CF@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of Bernd Kuhls
> Sent: Thursday, April 03, 2014 12:34 PM
> To: buildroot at uclibc.org
> Subject: Re: [Buildroot] [autobuild.buildroot.net] Build results for 2014-04-02
> 
> [posted and mailed to Andy]
> 
> Hi,
> 
> Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote
> in news:20140403063009.526E4101924 at stock.ovh.net:
> 
> > i686 |     xserver_xorg-server-1.15.0 | NOK |
> >       http://autobuild.buildroot.net/results/b19eb6f08b4841a3a74c53a61394
> >       78f4b7a6922d/
> > i686 |     xserver_xorg-server-1.15.0 | NOK |
> >       http://autobuild.buildroot.net/results/34db6b6072c7c94c32ffab1e8a0c
> >       8b2f6ed56ad3/
> 
>   CCLD     Xfbdev
> /home/peko/scratch/host/usr/i686-buildroot-linux-
> uclibc/sysroot/usr/lib/libunwind.so: undefined reference to `setcontext'
> /home/peko/scratch/host/usr/i686-buildroot-linux-
> uclibc/sysroot/usr/lib/libunwind.so: undefined reference to `sigreturn'
> collect2: error: ld returned 1 exit status
> make[4]: *** [Xfbdev] Error 1
> 
> During testing I did not see such an error here, but in the past this error
> was already discussed:
> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/61929
> 
> But it seems that the discussion did not continue, libunwind landed one day
> later in buildroot, quoting Andy: "Pending the outcome of that question, I'll
> put in the config a dependency of !BR2_TOOLCHAIN_*_<uclibc>."
> 
> Maybe this is still necessary?
> 
> Regards, Bernd

Hmmm, looking back through my e-mail, it does appear that I dropped the
ball.

I did get correspondence (months later) from a Sven Neumann about using
libunwind with uclibc.  He sent the patches to me personally but
apparently never to the list.  Looking at the patches, it may be that
these would resolve the issues with using libunwind with uclibc.  I have
never tested these patches nor would I want to sign off on these.

Alternately, I guess I could include the depends on !BR2*<uclibc>*.  Am
I this package owner?  Looking through the repo, I only find one commit
by me: htop.

Either way, if you want me to look at it, I guess I can dust off my
libunwind knowledge and fix 'er up.

Just let me know what ya'll want me to do.  If you would like to see
Sven's patches, I'll shoot those along but will not sign off on those as
I haven't done ANYTHING with those.

Andy
