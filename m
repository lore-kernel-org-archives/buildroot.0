From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 30 Mar 2012 06:59:20 -0300
Subject: [Buildroot] [git commit] sudo: bump to version 1.8.4p4
In-Reply-To: <87obreeh85.fsf@macbook.be.48ers.dk>
References: <20120329154644.B0407969A7@busybox.osuosl.org>
 <20120330011500.07b6e26b@skate> <87obreeh85.fsf@macbook.be.48ers.dk>
Message-ID: <ac3fe260d169dff72cbfca59002d9fc4@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-30 03:27, Peter Korsgaard wrote:

>  Thomas> I don't think I have seen sudo build failures before this
> bump through
>  Thomas> the autobuild tests.
>
> The new sudo needs the utmpx stuff I recently added to the uClibc
> defconfigs for systemd. I will rebuild my i686 toolchain on gcc110
> today.

In theory they work around it when it's not present, lines 60-68 of 
utmp.c:

/*
  * Simplify handling of utmp vs. utmpx
  */
#if !defined(HAVE_GETUTXID) && defined(HAVE_GETUTID)
# define getutxline(u)  getutline(u)
# define pututxline(u)  pututline(u)
# define setutxent      setutent(u)
# define endutxent      endutent(u)
#endif /* !HAVE_GETUTXID && HAVE_GETUTID */

However the defines for setutxent & endutxent are inconsistent it 
seems.
Regards.
