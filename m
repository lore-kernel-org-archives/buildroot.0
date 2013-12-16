From: mlweber1 at rockwellcollins.com <mlweber1@rockwellcollins.com>
Date: Mon, 16 Dec 2013 08:03:13 -0600
Subject: [Buildroot] [PATCH 1/1] smcroute: new package
In-Reply-To: <8738ltvpk7.fsf@dell.be.48ers.dk>
References: <1386872059-28046-1-git-send-email-mlweber1@rockwellcollins.com>
 <8738ltvpk7.fsf@dell.be.48ers.dk>
Message-ID: <OFFAEA9903.0AA9704A-ON86257C43.004D0D0F-86257C43.004D3312@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, 

Peter Korsgaard <jacmet@gmail.com> wrote on 12/15/2013 02:15:20 PM:

> From: Peter Korsgaard <jacmet@uclibc.org>
> To: Matt Weber <mlweber1@rockwellcollins.com>
> Cc: buildroot at busybox.net, Sean Gerhardt <sagerhar@rockwellcollins.com>
> Date: 12/15/2013 02:15 PM
> Subject: Re: [PATCH 1/1] smcroute: new package
> Sent by: Peter Korsgaard <jacmet@gmail.com>
> 
<snip>

>  > +     SMCRoute is a command line tool to manipulate the multicast
>  > +     routes of a UNI kernel. It supports both IPv4 and IPv6 
multicast
> 
> I guess that 'UNI' should be 'UNIX'?
Yep.

> 
>  > +     routing.  SMCRoute can be  used as an alternative to dynamic
>  > +     multicast routers like mrouted or pimd in setups where static
>  > +     multicast routes should be maintained and/or no proper IGMP or
>  > +     MLD signaling exists.
>  > +
>  > +     https://github.com/troglobit/smcroute
> 
> It looks like it needs to depend on BR2_INET_IPV6:
> 
>   CC      mcgroup.o
> mcgroup.c: In function 'mcgroup_join_leave_ipv6':
> mcgroup.c:119:31: error: 'IPV6_JOIN_GROUP' undeclared (first use in 
> this function)
> mcgroup.c:119:31: note: each undeclared identifier is reported only 
> once for each function it appears in
> mcgroup.c:119:49: error: 'IPV6_LEAVE_GROUP' undeclared (first use in
> this function)
> make[2]: *** [mcgroup.o] Error 1
> make[2]: Leaving directory `/home/peko/source/buildroot/output/
> build/smcroute-1.99.2/src'
> 
> Also don't forget to add a comment if IPV6 isn't available.
Will do, Thanks!

Matt Weber
mlweber1 at rockwellcollins.com

> 
> -- 
> Bye, Peter Korsgaard
