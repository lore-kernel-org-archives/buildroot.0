From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Jul 2017 23:06:41 +0200
Subject: [Buildroot] [PATCH 1/2] uclibc-ng: enable fts in default config
 file.
In-Reply-To: <246b2393-ffd3-99e5-5de9-db52d73488bb@mind.be>
References: <20170713142549.28078-1-aduskett@gmail.com>
 <20170715114432.0b01a373@windsurf>
 <87d191afyw.fsf@dell.be.48ers.dk>
 <20170715214809.2158c3e2@windsurf>
 <87inis8jjj.fsf@dell.be.48ers.dk>
 <20170716164353.GI1482@waldemar-brodkorb.de>
 <246b2393-ffd3-99e5-5de9-db52d73488bb@mind.be>
Message-ID: <20170718230641.479308e9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Jul 2017 21:24:05 +0200, Arnout Vandecappelle wrote:

>  I'm with you on this one. If a package can work with uClibc, we really should
> allow it.
> 
>  However, I don't think the solution is to bloat our default uClibc config with
> features that are not useful for 99.82% of our packages. fts.h is not something
> like IPv6 that is useful for a large number of packages.
> 
>  I also don't think we should add more options like BR2_ENABLE_LOCALE that copy
> the uClibc config options.
> 
>  Perhaps the way to go is to have a BR2_TOOLCHAIN_UCLIBC_BLOAT_CONFIG option
> that a user can set to indicate he wants to see packages that will not work with
> our default uClibc config. That option could give a nice warning that this
> configuration is not tested and YMMV.

I have to say I don't like this. If we have an option, it should work,
and therefore be tested. It's the worst thing for users to simply tick
an option, and discover build failures here and there. If you have an
option that explicitly allows to do something, then that something
should work.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
