From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Apr 2015 23:24:50 +0200
Subject: [Buildroot] [PATCH 0/30] matchbox: huge cleanups (branch
 yem/matchbox)
In-Reply-To: <cover.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <55396322.3040604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/15 20:09, Yann E. MORIN wrote:
> Hello All!
> 
> This series is an attempt at cleaning up the matchbox packages.

 Hi Yann,

 Kudos for this!

> 
> Currently, the matchbox pckages are in a dire situation, where some
> package do not even have a corresponding BR2_PACKAGE_FOO option, but are
> nonetheless build dependencies ones of others.
> 
> Also, some support code has been bit-rotting and is not even buildable
> today, ike support for compositing, which simply FTBFS.
> 
> Finally, some dependencies are incorrect. For example, there are build
> dependencies not expressed in the Kconfig (not even counting the missing
> Kconfig entries for packages), or are entirely wrong.
> 
> So, this series aims at fixing all of this. And add a little bit of
> extra features we're currently missing. Not everything that is possible
> with matchbox has been handled, though, like support for NLS.
> 
> The series is split into multiple parts;
> 
>   - patches 1-9 make all packages real packages, i.e. with proper
>     Kconfig options. No functionality change.

 One overall remark to this part of the series: I'd move them directly under
package/ which is supposed to be the standard way of doing things now, so get
rid of the matchbox subdirectory. That's also the way it works with Kodi BTW.

 Regards,
 Arnout

> 
>   - patches 10-13 do a little eye-candy cleanups. No functionality
>     change.
> 
>   - patches 14-17 fixes dependencies. No functionality change done on
>     purpose, except because of added proper dependency tracking.
> 
>   - patch 18 stands out alone, a bit of eye-candy to add prompts for
>     previously prompt-less packages. No functionality change.
> 
>   - patches 19-30 are not really sorted. They ar ea mix of fixes,
>     eye-candy and the few new features.
> 
> This has been build-tested only, with about every combinations possible
> excercised, for ARM. No run-time testing has been done, though.
> 
> Enjoy! ;-)
> 
> Regards,
> Yann E. MORIN.

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
