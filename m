From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Mar 2018 14:37:55 +0200
Subject: [Buildroot] [PATCH v4 08/11] package/clang: enable target
 variant
In-Reply-To: <1a63ff29-d9ac-316d-f91f-cd9eec06dae5@smile.fr>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
 <20180329113346.10367-9-valentin.korenblit@smile.fr>
 <20180330110753.2c1d1415@windsurf>
 <1a63ff29-d9ac-316d-f91f-cd9eec06dae5@smile.fr>
Message-ID: <20180330143755.5d6ff8ce@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Mar 2018 14:16:00 +0200, Valentin Korenblit wrote:

> What we need is libclang, we don't need the binaries. But as libclang is a tool,
> I need to set CLANG_BUILD_TOOLS to ON, what will build everything.
> 
> Clover is the OpenCL implementation provided with Mesa. It uses libclang as a frontend
> for OpenCL C and libLLVM for code generation.

OK.

> > In addition, we don't support gcc on the target, so having clang on the
> > target raises a red flag for me.
> >
> > Could you explain a bit more why this is needed/useful ?  
> 
> As explained above, we don't need it. I could add a hook to erase all unnecessary
> binaries from the target if that is ok.

That's indeed a possibility.

I was a bit confused, because I missed which patch was actually using
the target clang package, but I didn't read PATCH 10/11 carefully
enough, and it does use the target clang, so it makes perfect sense.

Adjusting the target clang package to remove stuff that is not used is
indeed a good idea.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
