From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Fri, 01 Jul 2011 12:02:42 +0100
Subject: [Buildroot] Library search paths and ld.so.conf
In-Reply-To: <BANLkTi=Pi5sktNUeT-+3-CfvyvyLrRbAAw@mail.gmail.com>
References: <1309449926.14232.10.camel@dublxciaranr1.verifone.com>
 <BANLkTi=Pi5sktNUeT-+3-CfvyvyLrRbAAw@mail.gmail.com>
Message-ID: <1309518164.14232.17.camel@dublxciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ar D?ar, 2011-06-30 ag 13:27 -0400, scr?obh Mike Frysinger:
> On Thu, Jun 30, 2011 at 12:05, Quotient Remainder wrote:
> > Is it possible to dynamically add a library search path on the target?
> > I'm aware that it's possible to add to the ld.so library search path by
> > adding an entry into "/etc/ld.so.conf" and running ldconfig as well as
> > using LD_LIBRARY_PATH as is done in target-finalize but I don't want to
> > run ldconfig and take the time penalty it entails to generate the cache.
> > Can't I just tell ld.so to look in an extra directory or two if the
> > normal ones fail?
> 
> off the top of my head, LD_LIBRARY_PATH is the only way to inject a
> non-standard path at runtime without touching ld.so.conf / ldconfig.

I feared this would be the case.

> `man ld.so` explains the runtime lookup process.

:-) Yeah I had a look at that before posting alright.  Just wondering if
there were any "sly" ways around it.  It seems like a normal enough
thing to want to add a directory to the search path system-wide, as
opposed to a specific shell instance that LD_LIBRARY_PATH provides.
