From: Chris Wilkinson <kinsham@verizon.net>
Date: Fri, 12 Oct 2012 11:19:12 -0400
Subject: [Buildroot] Creating initrd
In-Reply-To: <20121012161251.3401e6c0@skate>
References: <1349964303.8392.39.camel@Homeserver>
 <20121011164826.753f8312@skate>	<1349968569.14474.10.camel@Homeserver>
 <20121011172356.6af76f39@skate>	<1349976484.14474.20.camel@Homeserver>
 <20121011205348.4a861421@skate>	<1349988968.14474.34.camel@Homeserver>
 <20121012091408.6184bb9f@skate>	<1350049738.14474.52.camel@Homeserver>
 <20121012161251.3401e6c0@skate>
Message-ID: <010301cda88c$f0006d20$d0014760$@net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes, sorry.

CT-NG was used to build an ARM x-compiler which in turn was used to build
the kernel. Sorry I didn't explain that too well.

Chris

-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Sent: Friday, October 12, 2012 10:13 AM
To: Chris Wilkinson; buildroot at uclibc.org
Subject: Re: [Buildroot] Creating initrd

Dear Chris Wilkinson,

Please don't reply to me directly: keep the Buildroot list Cc'ed.

On Fri, 12 Oct 2012 09:48:58 -0400, Chris Wilkinson wrote:
> I had been using crosstool to build the kernel but now I see that BR
> can do that and using crosstool is unnecessary. I cleaned the kernel
> tree and the tar.bz2 is now 89MB. It is here
> 
> https://skydrive.live.com/redir?resid=834D8577B5544D4E!169&authkey=!
> AGZIOn-ye6O3anc

By crosstool, do you mean crosstool-ng? Or something else?

Both the old crosstool (that no-one should be using) and crosstool-ng
do *NOT* build the kernel, so what you're saying doesn't make sense
here. They use kernel /headers/ to build a toolchain, but that's all
they do with the kernel.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
