From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Feb 2020 12:46:26 +0100
Subject: [Buildroot] [PATCH] package/fail2ban: fix python3 2to3
 dependency
In-Reply-To: <87d0a8zfk4.fsf@tarshish>
References: <618874172809ae3de7cd82f6b27141c1ba13c806.1581943931.git.baruch@tkos.co.il>
 <20200218184311.25806bcb@windsurf> <87d0a8zfk4.fsf@tarshish>
Message-ID: <20200221124626.55f97073@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Fri, 21 Feb 2020 07:15:39 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> > So for this fail2ban thing, I guess the easier is to move the 2to3
> > execution to a PRE_CONFIGURE_HOOKS, with a good comment above.  
> 
> How would that fix the issue? Is host-python3 guaranteed to build before
> fail2ban PRE_CONFIGURE_HOOKS run unlike POST_PATCH_HOOKS?

Absolutely. The dependencies listed in <pkg>_DEPENDENCIES are
guaranteed to be built and installed before the configure step of <pkg>
starts.

See:

$$($(2)_TARGET_CONFIGURE):	| $$($(2)_FINAL_DEPENDENCIES)

in package/pkg-generic.mk.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
