From: Arun Reddy <reddyac@gmail.com>
Date: Wed, 7 May 2008 22:38:46 -0700
Subject: [Buildroot] Bash patches not working? (bash32-025 and up)
In-Reply-To: <1210223891.4822.142.camel@nigel-x60>
References: <326f33790805071819n32858557o187314db62ce5b26@mail.gmail.com>
	<1210223891.4822.142.camel@nigel-x60>
Message-ID: <326f33790805072238s6eff6e3em9d789b1f57e598a0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nigel,

Are you suggesting that I remove the ~/buildroot/build_arm/bash-3.2
directory?

On Wed, May 7, 2008 at 10:18 PM, Nigel Kukard <nkukard@lbsd.net> wrote:

>
> > Continuing on with my ARM926T variant build, I run into a bit of a
> > problem with the BASH patches being applied.
> >
> > bash32-001 through bash32-024 are successful. But starting with
> > bash32-025 I am getting problems as shown here:
> >
> > http://img329.imageshack.us/img329/4510/bashpatchnn1.jpg
> >
> > It seems that the patch files under ~/buildroot/package/bash/ have
> > lines that show the location of specific files. For example,
> > bash32-025 shows: lib/readline/input.c, while bash32-024 and before
> > show locations such as bash-3.2/lib/readline/display.c
> >
> > The difference is that "bash-3.2" location in the directory name. It
> > is possible that the correct patch can't be found for 25 and up
> > because of this. The thing is I can't edit these patch files because
> > they are overwrriten during the build, which means they are copied or
> > downloaded from somwhere. I looked at the bash patch fixes and the
> > latest ones seem to fix 25 and up, and this was done 6 days ago. So I
> > simply upgraded my snapshot to the latest one available- May 7th 2008.
> > But I build again and still run into the same problem.
> >
> >
> http://buildroot.uclibc.org/cgi-bin/viewcvs.cgi/trunk/buildroot/package/bash/
> >
> > Anyone know what I can do to fix this? Any help is of course
> > appreciated.
>
> Did you remove the bash directory before rebuilding?
>
> I've just tested with latest svn and the patches apply fine and bash
> builds.
>
> -N
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080507/03324173/attachment.htm 
