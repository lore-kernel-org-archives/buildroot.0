From: Paul Jones <paul@pauljones.id.au>
Date: Sun, 6 Jun 2010 09:01:02 +1000
Subject: [Buildroot] [PATCH] xkeyboard-config: Depends on intltool
In-Reply-To: <20100605173038.1734bd81@surf>
References: <000f01caf97b$a06e5780$e14b0680$@pauljones.id.au>
	<20100605173038.1734bd81@surf>
Message-ID: <000c01cb0502$fa485930$eed90b90$@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot- 
> bounces at busybox.net] On Behalf Of Thomas Petazzoni
> Sent: Sunday, 6 June 2010 1:31 AM
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH] xkeyboard-config: Depends on intltool
> 
> Hello Paul,
> 
> I still think this is wrong. intltool is required on the host, no on
the target. So:
> 
>  * There should be no modification in the Config.in file
> 
>  * The dependency in the .mk should be on host-intltool instead

Yes, you're right. On further investigation I think what happened was I
tested the patch on a different system without realising. Depending on where
I am and what I'm doing I use either Ubuntu or Gentoo build hosts.
The problem occurred on Ubuntu so I made that patch but I tested it later on
the Gentoo system which has intltool already so it looked like I fixed the
problem.

I've modified the patch and tested it on the right system this time...


Regards,
Paul.
 
