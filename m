From: Sven Neumann <neumann@teufel.de>
Date: Mon, 25 Nov 2013 10:54:42 +0100
Subject: [Buildroot] [PATCH v2 2/2] libglib2: the system PCRE needs to
 have UTF and UCP enabled
In-Reply-To: <87y54clu1y.fsf@dell.be.48ers.dk>
References: <1385157507.14731.31.camel@bender>
 <87eh68nk15.fsf@dell.be.48ers.dk> <1385365774.2810.1.camel@sven>
 <87y54clu1y.fsf@dell.be.48ers.dk>
Message-ID: <1385373282.2810.8.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mo, 2013-11-25 at 10:17 +0100, Peter Korsgaard wrote:
> >>>>> "Sven" == Sven Neumann <neumann@teufel.de> writes:
> 
>  > Hello,
>  > On Fr, 2013-11-22 at 23:33 +0100, Peter Korsgaard wrote:
>  >> >>>>> "Sven" == Sven Neumann <neumann@teufel.de> writes:
>  >> 
>  >> > If glib2 is compiled with the system PCRE instead of the included
>  >> > copy, then that system PCRE needs to have support for UTF-8 and
>  >> > Unicode properties enabled. Otherwise you will get such warnings
>  >> > at run-time:
>  >> 
>  >> > GLib-CRITICAL **: PCRE library is compiled without UTF8 support
>  >> > GLib-CRITICAL **: PCRE library is compiled without UTF8 properties support
>  >> 
>  >> > Signed-off-by: Sven Neumann <neumann@teufel.de>
>  >> 
>  >> Committed to next, thanks.
> 
>  > May I suggest that you also merge this to the stable tree. Otherwise
>  > glib2 will be unusable on any system that also has pcre selected (which
>  > is for example pulled in by gnutls).
> 
> Hmm, ok - That wasn't completely clear to me. So even though it's just a
> warning, this is something critical?

Any functionality that use GRegex won't work if the system PCRE is not
compiled with UTF-8 and UCP support. There might be glib-based
applications that won't be affected by this, but there is a good chance
that people will run into unexpected problems because of this.

> When was this introduced? By the 2.36.1 -> 2.36.3 bump or is 2013.08
> also affected?

As far as I can see this was introduced with commit fe192908a4e:

 commit fe192908a4e3195b6f724310fe83fadaf18b66e7
 Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date:   Sat Mar 9 08:21:30 2013 +0000

    libglib2: use system pcre when available


Regards,
Sven

-- 
Sven Neumann
Senior System Architect

Lautsprecher Teufel GmbH
Gewerbehof B?lowbogen - Aufgang D1
B?lowstr. 66 - 10783 Berlin - Germany

Registernummer HRB 20271 beim Amtsgericht Berlin-Charlottenburg
Gesch?ftsf?hrer: Edgar van Velzen

Tel. +49 (0)30 - 300 930 - 0, Direkt -153
neumann at teufel.de  

www.teufel.de  www.teufelaudio.com  http://blog.teufel.de
