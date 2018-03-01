From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Mar 2018 17:08:07 +0100
Subject: [Buildroot] [PATCH v2 2/9] dumb-init: new package
In-Reply-To: <87lgfbiyk8.fsf@dell.be.48ers.dk>
References: <20180301072012.25884-1-christian@paral.in>
 <20180301072012.25884-3-christian@paral.in>
 <20180301100227.3fb09c06@windsurf.lan>
 <87lgfbiyk8.fsf@dell.be.48ers.dk>
Message-ID: <20180301170807.2cd21163@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 01 Mar 2018 16:51:35 +0100, Peter Korsgaard wrote:

>  > On Thu,  1 Mar 2018 02:20:05 -0500, Christian Stewart wrote:  
> 
>  > However, using -static has a problem: what happens when you're doing a
>  > BR2_SHARED_LIBS=y configuration, i.e when there is only support for
>  > shared libraries, and not static libraries ? And BR2_SHARED_LIBS=y is
>  > our default.  
> 
> dumb-init doesn't depend on any libraries, so the only issue is static
> linking with glibc, right?

No, you can also have musl or uclibc configured shared-only, which is
the case by default since BR2_SHARED_LIBS=y.

Basically, I believe that Christian's patch simply doesn't work with
the default Buildroot configuration of BR2_SHARED_LIBS=y.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
