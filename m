From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Wed, 27 Apr 2011 09:49:29 -0500
Subject: [Buildroot] proftpd Startup issue
In-Reply-To: <87sjtaa07g.fsf@macbook.be.48ers.dk>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1FB11131@EXV1.corp.adtran.com>
	<87sjtaa07g.fsf@macbook.be.48ers.dk>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1FB11B9A@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> >>>>> "ANDY" == ANDY KENNEDY <ANDY.KENNEDY@adtran.com> writes:
> 
>  ANDY> The error:
>  ANDY> 192.168.1.10 - error: getrlimit(RLIMIT_CORE): Operation not
> permitted
> 
>  >> From /var/log/messages:
> 
>  ANDY> Apr 15 18:52:57 newrfs daemon.notice proftpd[83]:
> 192.168.1.10 - ProFTPD
>  ANDY> 1.3.3b (maint) (built Fri Mar 25 2011 17:49:38 CDT)
> standalone mode
>  ANDY> STARTUP
> 
>  ANDY> BuildRoot version:  (size:)33650639 2011-02-22 16:24
> buildroot.tar.bz2
>  ANDY> I believe this to be the correct snapshot date.
>  ANDY> Sys type: MIPS32r2
> 
>  ANDY> I know that this _was_ working before this pull.  I got this
> snapshot
>  ANDY> due to about 5 things being updated, of which (IIRC) one was
> proftpd.
> 
> Hmm, odd - Proftpd hasn't been updated since Oct 2010, so that's
> probably not it. What user are you running proftpd as?
> 
> I've just checked proftpd here (arm9), and it seems to work fine.
> I've
> committed a few minor tweaks to the default config/skeleton, but
> you are
> presumably using a custom config?

Turns out that eglibc doesn't have support for getrlimit in MIPS,
though as of last month MIPS did join the development team of eglibc
so perhaps a new build of the toolchain will result in a fixed
proftpd.  If not, I guess I'll do some hacking.

Andy
