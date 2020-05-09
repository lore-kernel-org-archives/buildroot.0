From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 16:23:41 +0200
Subject: [Buildroot] [PATCH 2/2] support/config-fragments: add RISC-V
 64-bit uclibc autobuild config
In-Reply-To: <1928858.SY0nFSyD1A@laptop>
References: <20200508103338.16391-1-mark@dibsco.co.uk>
 <20200508103338.16391-2-mark@dibsco.co.uk>
 <20200509120758.62ede751@windsurf.home> <1928858.SY0nFSyD1A@laptop>
Message-ID: <20200509162341.74f5dd94@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 09 May 2020 13:37:24 +0100
Mark Corbin <mark@dibsco.co.uk> wrote:

> Sorry, that was my misinterpretation of 'full' when looking at config fragments 
> for other architectures.

"full" in fact is used for uClibc toolchains, where it means "all
features enabled", i.e threads, wchar, locales, etc.

> What would be preferred here? Should I leave the musl config as it is
> and add an additional fragment for uclibc?

I'm not a big fan of having too many internal toolchain configurations
as it takes quite a lot of build time on the autobuilder machines.
Instead, we should build external toolchains if we want to test more
configurations.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
