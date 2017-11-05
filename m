From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Nov 2017 15:39:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/libressl: needs MMU
In-Reply-To: <2f141bf5-ccdb-ecff-88d8-17e59e724e90@mind.be>
References: <20170723200844.13004-1-bernd.kuhls@t-online.de>
 <20170724180723.4786fad5@windsurf.lan>
 <20170724210702.GM12791@waldemar-brodkorb.de>
 <20170725093230.17956ffc@windsurf.lan>
 <2f141bf5-ccdb-ecff-88d8-17e59e724e90@mind.be>
Message-ID: <20171105153918.58d05c6f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 4 Nov 2017 23:25:57 +0100, Arnout Vandecappelle wrote:

> >> But I think the commit log isn't correct, as pthread_atfork can be
> >> used for glibc, musl and uClibc-ng. (for glibc -lpthread must be
> >> added)
> >>
> >> One possible solution might be, to check for __register_atfork, if
> >> it does not exist, fallback to pthread_atfork, if it does not exist
> >> provide a pthread_atfork dummy (noMMU case).  
> > 
> > This should be doable without too much effort I believe.  
> 
>  But someone has to do it :-)
> 
>  Note that the autobuilders no longer complain about this since libressl is now
> a choice, so it never gets built. But the problem still persists.

We discussed it during the Developers Meeting (remember?) and I have in
my notes to mark it as not available on noMMU platforms that use uClibc
(because it's really a uClibc limitation).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
