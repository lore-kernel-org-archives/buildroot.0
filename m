From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Mar 2013 22:29:02 +0100
Subject: [Buildroot] adding dhcpcd
In-Reply-To: <1362604828.20183.172.camel@genx>
References: <1362163072.19802.25.camel@genx.eng.msli.com>
 <5130F7CA.6090203@zacarias.com.ar> <1362500477.20183.74.camel@genx>
 <20130305194707.474ded42@skate> <1362592916.20183.152.camel@genx>
 <20130306195844.2f8c14b6@skate> <1362599417.20183.159.camel@genx>
 <069B5A25F9844945B625ADE7258AC94C061FF823@4rf-nz-orion.local.4rf.com>
 <20130306210831.4fbe8150@skate> <1362602480.20183.169.camel@genx>
 <20130306215414.23271383@skate> <1362603756.20183.170.camel@genx>
 <20130306221441.03439842@skate> <1362604828.20183.172.camel@genx>
Message-ID: <20130306222902.2d736c06@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear John Stile,

On Wed, 06 Mar 2013 13:20:28 -0800, John Stile wrote:

> The version that was downloaded was from the make file that you said
> wasn't very good, so I tried to make a new makefile but it just doesn't
> work.  
> 
> Could it be a problem that I am using buildroot-2011.11?
> My project can't really upgrade right now, but I wonder if that could be
> the cause.  

Aaaah, you're using 2011.11!

So, yes indeed that explains it all.

Change the last line from:

$(eval $(generic-package))

to:

$(eval $(call GENTARGETS))

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
