From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Jul 2012 10:27:45 +0200
Subject: [Buildroot] [PATCH] sconeserver: new package
In-Reply-To: <20120727084503.045fbb14@skate>
References: <1343051342-12829-1-git-send-email-spdawson@gmail.com>
 <50117709.8060209@mind.be> <20120727084503.045fbb14@skate>
Message-ID: <50125101.8080300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/27/12 08:45, Thomas Petazzoni wrote:
> I have the same problem with the VLC package currently being proposed
> by Ismael: it has a huge number of sub-options, for each potential
> dependency that the package might use.
>
> On one hand having all these sub-options is a bit annoying, but:
>
>   (*) It allows to have sub-options for things that depend on other
>       libraries, but also for things that don't have dependencies.
>       Otherwise, it's a bit strange: for --enable/--disable flags that
>       don't require dependencies, we have a kconfig option, but for
>       --enable/--disable flags that require dependencies, they get
>       automatically enabled when the required dependency is available.
>
>   (*) You may want to have SSL support in one component of your system,
>       but not necessarily others.

  I think it depends a bit on the situation.  For openssl support, it
makes more sense to just add it when available, because it normally
doesn't increase the size of the binary (much) to have openssl support
enabled.

  However, sconeserver (and vlc as well) are modular packages, which you
can basically view as a collection of sub-packages.  So in that case,
it does make more sense to select which modules you want to have
enabled.

  So for sconeserver, I prefer to keep all the sub-options.  Except
maybe the SSL module, that's not really a separate server but a
library wrapper, so it should probably be selected automatically if
openssl is.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
