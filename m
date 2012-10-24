From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Oct 2012 14:29:39 +0200
Subject: [Buildroot] Odp: Re:  XZ extracting issue
In-Reply-To: <5087caa237ade3.77250733@wp.pl>
References: <5087caa237ade3.77250733@wp.pl>
Message-ID: <20121024142939.72b188b5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

Please fix your e-mail client, it is horribly broken.

On Wed, 24 Oct 2012 13:01:54 +0200, Jerzy Grzegorek wrote:

> Really
> 
> BR2_XZCAT="xzcat -xzOf"
> I set it to
> 
> BR2_XZCAT="xzcat -df"
> 
> For what reason default setting of BR2_XZCAT="xzcat -xzOf" ?

The default value is just "xzcat" :

config BR2_XZCAT
        string "xzcat command"
        default "xzcat"
        help
          Command to be used to extract a xz'ed file to stdout.
          Default is "xzcat"

and it has always been like this. So I really don't see how you could
have end up with having options here, except if you customized this
option yourself.

Unless you have special needs, the value should remain just "xzcat".

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
