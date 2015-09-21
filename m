From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Sep 2015 22:45:41 +0200
Subject: [Buildroot] [PATCH 2/5] toolchain/external: rename Linaro arm
 and AArch64 options
In-Reply-To: <56003B9E.4050108@mind.be>
References: <cover.1442785491.git.yann.morin.1998@free.fr>
 <86fd4e995ad6ec4737cdd0b0c3a5c4c0f9a0123a.1442785491.git.yann.morin.1998@free.fr>
 <56003B9E.4050108@mind.be>
Message-ID: <20150921204541.GD3570@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-09-21 19:17 +0200, Arnout Vandecappelle spake thusly:
> On 20-09-15 23:45, Yann E. MORIN wrote:
> > We're going to add a new Linaro version (2015.02) for those toolchains,
> > so we want to differentiate them.
> > 
> > Even though we could simply keep the current options as-is and just
> > introduce the new ones suffixed with the version, it is better to rename
> > the existing options for consistency with the new ones and wiith other
> > multi-versions toolchains (like the CS CodeBench).
> 
>  Sorry to revisit the discussion on IRC, but in be2abf23 Thomas Petazzoni wrote:
> 
>     Linaro toolchains are released so frequently (every month) that it
>     doesn't make much sense to support 3 consecutive versions. So, like we
>     do for ARM big-endian, let's support only one version at a time.
> 
>  Are we in agreement that this has changed because it seems they now have stable
> releases? Or let me put this differently: are we sure now that the 2015.02
> version is really considered more stable than 2015.08, or is it just that
> they're too lazy to update their website?

Well, I would not put the "stableness" as the main reason, but rather
that the new toolchains are only for x86_64, hence people stuck with a
32-bit host would be left out. So, we keep the 2014.09 for those in
32-bit land, and add 2015.02 for those in 64-bit land.

Also, I had a look at the latest toolchain, and it seems they've
switched it to a gcc-4.8.:
    http://releases.linaro.org/15.06/components/toolchain/binaries/
which gives:
    $ ./gcc-linaro-4.8-2015.06-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc --version
    arm-linux-gnueabihf-gcc (Linaro GCC 4.8-2015.06) 4.8.5
    [...]

while the previous is still using a gcc-4.9:
    http://releases.linaro.org/15.05/components/toolchain/binaries/
which gives:
    $ ./gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc --version
    arm-linux-gnueabihf-gcc (Linaro GCC 4.9-2015.05) 4.9.3 20150413 (prerelease)
    [...]

So, it seems that they are not completely "stable" with their latest
toolchain releases anyway... :-/

However, I'm open to discussion. Hence adding the topic on the list for
the DevDays. If we agree on keeping the old version, the series is
ready. If not, it's easy to chop it down and just do the replacement
with the new version.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
