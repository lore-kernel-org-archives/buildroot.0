From: Mike Zick <minimod@morethan.org>
Date: Tue, 7 Jan 2014 07:17:52 -0600
Subject: [Buildroot] [PATCH v10 8/8] Makefile: update comment about
 top-level parallel Makefile
In-Reply-To: <CAHkwnC-7A=vf1fQ6HNxqRtxpfLuKz3fDWh68Ea_EEpVakzXH9w@mail.gmail.com>
References: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
 <1387363007-19846-9-git-send-email-fabio.porcedda@gmail.com>
 <52B32EBD.3000202@mind.be>
 <CAHkwnC8fQE+XVB_1EixH2ZXX=bxO=+DZ68yH4e6oLTm1NTedEA@mail.gmail.com>
 <52B466C8.2000200@mind.be>
 <CAHkwnC-7A=vf1fQ6HNxqRtxpfLuKz3fDWh68Ea_EEpVakzXH9w@mail.gmail.com>
Message-ID: <20140107071752.65e91042@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 7 Jan 2014 11:05:52 +0100
Fabio Porcedda <fabio.porcedda@gmail.com> wrote:

> This is the fixed comment:
> 
> # Parallel execution of this Makefile is disabled because it changes
> # the packages building order, that can be a problem when a package
> # has an unspecified optional dependency, because if that dependency
> # is present when the package is built, it is used, otherwise it isn't
> # (but compilation happily proceeds). This means that the packages
> # building order is relevant in that case, and the end result will
> # differ if the order is swapped due to parallel building.  Also
> # changing the building order can be a problem if two packages
> # manipulate the same file in the target directory.
> # Taking into account the above warnings, if you still want to execute
> # this top-level Makefile in parallel comment the following line and
> # execute:
> #    make BR2_JLEVEL= -j$((`getconf _NPROCESSORS_ONLN`+1))
> 
> Regards
>

Been a silent reader for years here now, but I just must make a
suggestion:

# Parallel execution of this top-level Makefile is disabled.
#
# Single execution is forced here for two reasons:
#
# Maintaining reproducible builds:
# Packages with an unspecified, optional, dependency could
# otherwise change the build order among multiple builds.
#
# Prevent file modification collisions:
# This can happen if two packages manipulate the same file.
#
# After taking into account the above considerations;
# If you still want to execute this top-level Makefile in 
# parallel, comment out the following line and then execute:
#    make BR2_JLEVEL= -j$((`getconf _NPROCESSORS_ONLN`+1))

Just clarify which line is "the following line" in the context
of this comment. 

Add styling to first line of each paragraph to match the context.

- - - -

I will return now to my read-only mode.
Mike
