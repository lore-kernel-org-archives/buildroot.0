From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Oct 2009 22:35:58 +0200
Subject: [Buildroot] [PATCH 6/6] remove superfluous OPTIMIZE and DEBUG
 config knobs
In-Reply-To: <20091006184939.GD10261@mx.loc>
References: <cover.1254853146.git.rep.dot.nop@gmail.com>
	<1a6b4f990a536bfd23ae1e57a2cd11527761f8ec.1254853146.git.rep.dot.nop@gmail.com>
	<4a5a0f10dbaecfd7b024c0cf1e90fd68a6730eac.1254853146.git.rep.dot.nop@gmail.com>
	<6fe0ac8fa1f42152f604ca708aff08b8f119073a.1254853146.git.rep.dot.nop@gmail.com>
	<582a63d745311a980a8700a2a0ec17c3ae0f5ca9.1254853146.git.rep.dot.nop@gmail.com>
	<5959e530273437a31071499009cecc7a7e9ab461.1254853146.git.rep.dot.nop@gmail.com>
	<cover.1254853146.git.rep.dot.nop@gmail.com>
	<4bf0f4eae22ac9a6b1afa4621ff32b3f43887a85.1254853146.git.rep.dot.nop@gmail.com>
	<871vlg2wn7.fsf@macbook.be.48ers.dk>
	<20091006184939.GD10261@mx.loc>
Message-ID: <20091006223558.73d0678f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 6 Oct 2009 20:49:39 +0200,
Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> a ?crit :

> The help-text of BR2_TARGET_OPTIMIZATION reads:
> ---8<---
> Optimizations to use when building for the target host.
> ---8<---
> 
> If you want to build with -O0 -g3 -ggdb3 , then just set it to that.
> Adding knobs for each -Ox and -gx is not userfriendly but odd, given
> that there always was BR2_TARGET_OPTIMIZATION and that this is (or
> should be anyway) used _everywhere_.

Hum, you're right. But I think I would still like to keep a "enable
debug" option that would :

 * Compile with -g and keep the unstripped binary in the staging/
   directory

 * Strip the binaries in target/

This is the normal setup needed to do remote debugging: stripped
binaries on the target, unstripped binaries with debugging symbols to
feed gdb on the host.

I don't have a very strong opinion on this, but I think having an
option for debugging/non-debugging is useful (and debugging + stripping
should probably be the default). But if we decide to get rid of the
option, some documentation would probably be enough.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
