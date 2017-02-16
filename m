From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Feb 2017 09:34:05 +0100
Subject: [Buildroot] [PATCH v3 2/5] package: add generic support for lz
 archives
In-Reply-To: <19a785a4-beaf-92dd-c53b-6e81dde24c7d@mind.be>
References: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
 <1e78e6f82883e4ba95766459a39cbd2d49934152.1486930542.git.baruch@tkos.co.il>
 <20170215221520.41e4c66e@free-electrons.com>
 <83572997-616f-8bec-fadb-0a59bbf847ed@mind.be>
 <20170216083206.2064b783@free-electrons.com>
 <19a785a4-beaf-92dd-c53b-6e81dde24c7d@mind.be>
Message-ID: <20170216093405.24f25e54@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Feb 2017 09:25:55 +0100, Arnout Vandecappelle wrote:

> > BR2_LZCAT does not specify only the path to the lzcat program, but also
> > its options. And we completely ignore those custom options if the
> > lzcat built by Buildroot is used.  
> 
>  It is possible to provide extra options, but these are completely useless.
> Well, actually, lzcat is the first one with an option that could be useful:
> --threads, to decompress over several cores. Except that --threads isn't
> implemented yet for decompression. So, although it is possible to add extra
> options in BR2_LZCAT, it just makes no sense.

My point is not whether it makes sense or not to be able to pass
options to lzip. My point is that we provide a Config.in option to
allow the user to pass additional options, but we don't actually take
into account the value of this option when we build our own host-lzip or
host-xz.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
