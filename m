From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Jan 2019 17:07:13 +0100
Subject: [Buildroot] [PATCH 1/2] pkg-cmake: add CMAKE_SYSTEM_VERSION to
 toolchainfile.cmake
In-Reply-To: <20190112152343.GG2428@scaer>
References: <20190110230529.29852-1-arnout@mind.be>
 <20190111211626.GD2428@scaer>
 <20190112160629.5a85748b@windsurf.home>
 <20190112152343.GG2428@scaer>
Message-ID: <20190112170713.69ed8138@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Jan 2019 16:23:43 +0100, Yann E. MORIN wrote:

> Well, random lookups on the internet for CMAKE_SYSTEM_VERSION mostly
> tuen up windows- or mac-related questions, so irrelevant to us. The
> only seemingly-relevant ones are dealing with android.
> 
> There are various pieces of crap here and there that just set the thing
> to 1., or some variants of 1, like 1.0 or 1.0.0.
> 
> Even the official cmake wiki [0] states:
> 
>     CMAKE_SYSTEM_VERSION : optional, version of your target system, not
>     used very much.
> 
>     [...]
> 
>     * CMAKE_TOOLCHAIN_FILE : absolute or relative path to a cmake script
>     which sets up all the toolchain related variables mentioned above
> 
>     For instance for crosscompiling from Linux to Embedded Linux on
>     PowerPC this file could look like this:
> 
>         # this one is important
>         SET(CMAKE_SYSTEM_NAME Linux)
>         #this one not so much
>         SET(CMAKE_SYSTEM_VERSION 1)
>         [...]
> 
> So my opinion would be that we do exactly what is done in the wiki: set
> it to 1 (and add a pointer to the wiki) and be done with it.

That would be fine for me as well. If Arnout agrees, I'll happily take
a patch changing to just "1".

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
