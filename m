From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 May 2013 21:12:23 +0200
Subject: [Buildroot] [PATCH 1/1] gpsd: Add config options for USB,
 Bluetooth, Qt.
In-Reply-To: <519E67FA.8060608@mind.be>
References: <1369320181-6069-1-git-send-email-arnerro@gmail.com>
 <20130523165601.5fc0fe15@skate>
 <CAD0gWNZA=e-iQ+G98P5Hgi1Z_OBK0=P6TiHJ-+X0S_D+fih0PQ@mail.gmail.com>
 <20130523174630.0c7efe41@skate> <519E67FA.8060608@mind.be>
Message-ID: <20130523211223.59edf1b8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 23 May 2013 21:03:22 +0200, Arnout Vandecappelle wrote:

>   If enabling the option adds a significant amount of overhead (typically 
> rootfs size overhead but it could also be performance overhead), then it 
> is definitely worthwhile to make it an option. So for the qt bindings 
> it's probably not worthwhile (qt itself is much larger). But for the 
> Bluetooth or USB support, it could make a difference.

Regarding the Qt binding, if it installs additional files for example,
I wouldn't mind having a separate sub-option to disable it.

> > Maybe (2) is what makes sense here. The cost of new options in terms of
> > maintenance is not so high,
> 
>   You forgot about updating the 'depends on' statements when a suboption 
> wants to select e.g. glib...

Hum, not sure to understand what you meant here. Did you mean
"propagate the 'depends on'" from the selected package into the
selecting package, for dependencies on toolchain features and things
like that?

> > so maybe that's what we should do. I don't know.
> 
>   My dream is that the whole Config.in could be generated from the .mk 
> file... but I'm not sure if that is really realistic. OpenWRT does it but 
> it doesn't look that great either.
> 
>   So I think we'll stick to
> 
>     3) Decide on a case-by-case basis whether to go for suboptions or 
> automatic enable/disable.

I agree, as you don't see much other reasonable solutions.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
