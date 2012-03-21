From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Mar 2012 14:44:52 +0100
Subject: [Buildroot] [PATCH v2] ushare: new package
In-Reply-To: <5f0396764c1dc201f01ae3853a534d33@zacarias.com.ar>
References: <1332335538-23508-1-git-send-email-gustavo@zacarias.com.ar>
 <20120321142102.5c5999a6@skate>
 <5f0396764c1dc201f01ae3853a534d33@zacarias.com.ar>
Message-ID: <20120321144452.68029160@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 21 Mar 2012 10:39:35 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> > With GENTARGETS, xxx_BUILD_CMDS is empty by default. Are you sure 
> > this
> > builds?
> 
> Yes, install triggers build.

But still, build should be done in the xxx_BUILD_CMDS so that it works
like all other packages, IMO.

> > Also, can you add a comment just before USHARE_CONFIGURE_CMDS saying
> > that despite the appearance, autotools are not used. However, I am 
> > sure
> > in the future many people will wonder why AUTOTARGETS was not used.
> 
> Sure, but should it be for other packages as well?

Yes, I think we should mention explicitly why GENTARGETS is used even
though the package has a ./configure script.

> Same things applies to ffmpeg and probably others (the ushare configure 
> is an old/strip version from ffmpeg).
> Though ffmpeg is using AUTOTARGETS and overriding CONFIGURE_CMDS...

And it is wrong. Not your fault, of course, but I don't think it is an
argument to make it wrong in other places as well.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
