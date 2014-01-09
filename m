From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jan 2014 07:01:11 +0800
Subject: [Buildroot] ParaGUI package?
In-Reply-To: <DC148C5AA1CEBA4E87973D432B1C2D8817E6C50F@P3PWEX4MB008.ex4.secureserver.net>
References: <DC148C5AA1CEBA4E87973D432B1C2D8817E678D7@P3PWEX4MB008.ex4.secureserver.net>
 <20140108113404.413a4685@skate> <52CED5E4.90603@mind.be>
 <DC148C5AA1CEBA4E87973D432B1C2D8817E6C50F@P3PWEX4MB008.ex4.secureserver.net>
Message-ID: <20140110070111.483dd1a9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hartley Sweeten,

On Thu, 9 Jan 2014 22:37:40 +0000, Hartley Sweeten wrote:

> I was finally able to get paragui to compile with Buildroot using a POST_PATCH_HOOKS
> like was just done for the sdl package:
> 
> define PARAGUI_RUN_AUTOGEN
> 	cd $(@D) && ./autogen.sh
> endef
> 
> PARAGUI_POST_PATCH_HOOKS += PARAGUI_RUN_AUTOGEN

Humm, ok. This is not the nicest thing in the world, but oh well.

> Doing this I only needed 2 patches.
> 1) to use the correct sdl-config
> 2) to include <ostream> in a source file (I think this is needed because of a gcc 4.3.3 bug)
> 
> I was also able to get the package to compile using AUTORECONF = YES but that
> needed a lot more patches.

Which patches?

> 
> I can post the patch to add the paragui package but there is one issue. ParaGUI requires
> libsigc++ 1.2 (>= 1.2.5) but the current libsigc package in Buildroot is for libsigc++ 2.2 (2.2.11).
> The API is quite different between the 1.2 and 2.2 versions. So to get paragui to compile I
> had to also add a libsigc1 package (leaving the current libsigc as-is).
> 
> Is this acceptable? If so I can post 2 patches:

Yes, packaging libsigc1 separately is OK, since it has a different API
than libsigc.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
