From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Tue, 9 Dec 2014 10:23:04 +0100 (CET)
Subject: [Buildroot] [PATCH v5 1/1] set simple network setup via the
 system configuration submenu
In-Reply-To: <20141209100258.79254fea@free-electrons.com>
Message-ID: <297168490.29020177.1418116984239.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



----- Mail original -----
> Dear J?r?my Rosen,
> 
> On Tue,  9 Dec 2014 09:48:44 +0100, J?r?my Rosen wrote:
> 
> > +check_configuration ()
> > +{
> > +	if [ -z "$BR2_SIMPLE_NETWORK_NONE" ] ; then
> 
> Can we try to avoid unnecessary indentation, and so things the other
> way around, i.e if BR2_SIMPLE_NETWORK_NONE is not empty, bail out
> from
> the function?

can do...

> 
> 	if [ -n "$BR2_SIMPLE_NETWORK_NONE" ] ; then
> 		return
> 	fi
> 
> > +		if [ -z "$BR2_SIMPLE_NETWORK_NAME" ] ; then
> > +			echo ERROR no name specified for first network interface
> > +			exit 1
> > +		fi
> > +		if [ "$BR2_SIMPLE_NETWORK_IPV4_MANUAL" ] ; then
> 
> No condition?
> 


That was discussed in a previous iteration and was considered ok at
the time, but I can add an explicit condition


> > +	if [ -z "$BR2_SIMPLE_NETWORK_NONE" ] ; then
> 
> Same comment here.
> 

ok

> > +		echo "auto $BR2_SIMPLE_NETWORK_NAME"
> > +		if [ "$BR2_SIMPLE_NETWORK_IPV4_DHCP" ] ; then
> 
> And here.
> 

ok

> That being said, generally, I find this quite complicated, and my
> preference would be to continue with what we have today, and simply
> let
> the user override things with a root filesystem overlay or a
> post-build
> script.
> 

Well, the point is to avoid having an overlay just to enable DHCP, which
I thought was the direction BR wanted to go... simple stuff can be 
configured directly from menuconfig...


I can simplify the thing by dropping neworkd support if that makes you 
feel better, that would avoid the whole mess of parsing both mask formatq

but previous reviews had me add it to have it supported.

is that a formal rejection, or should I send a v6 ?


Best regards

J?r?my


> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> 
