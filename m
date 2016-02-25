From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 11:03:30 +0100
Subject: [Buildroot] [PATCH 2/2] gcc: remove 4.5.x
In-Reply-To: <87h9gxxgc7.fsf@dell.be.48ers.dk>
References: <1456336840-14890-1-git-send-email-gustavo@zacarias.com.ar>
 <1456336840-14890-2-git-send-email-gustavo@zacarias.com.ar>
 <87io1d3mhr.fsf@dell.be.48ers.dk>
 <20160225104848.2f5d892f@free-electrons.com>
 <87h9gxxgc7.fsf@dell.be.48ers.dk>
Message-ID: <20160225110330.27b02428@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Feb 2016 10:57:28 +0100, Peter Korsgaard wrote:

>  > Dear Peter Korsgaard,
>  > On Wed, 24 Feb 2016 21:02:40 +0100, Peter Korsgaard wrote:
> 
>  >> What do we do with our 4.5 based external toolchains and
>  >> BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 (used by directfb)?
> 
>  > I think the BR2_TOOLCHAIN_GCC_AT_LEAST_* must be kept for pretty much
>  > all versions of gcc. This symbol is not related to whether we support
>  > that gcc version in our internal toolchain backend or not. Possibly any
>  > gcc version can be used with the external toolchain backend.
> 
> True, but we might consider removing preconfigured external toolchains
> using ancient versions if there's sensible newer alternatives available.

Right. But I like to keep those crappy old preconfigured external
toolchains, because it forces us to test things with old gcc versions,
old kernel headers and all. Some users are probably forced to use old
gcc version for some reason, so I like to keep testing a bit the old
stuff.

You could object that we could continue to do this testing in the
autobuilders by supporting those toolchains as "custom external
toolchains" and not have them as preconfigured toolchains :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
