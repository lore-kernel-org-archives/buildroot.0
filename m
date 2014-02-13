From: Mike Zick <minimod@morethan.org>
Date: Thu, 13 Feb 2014 07:46:17 -0600
Subject: [Buildroot] [PATCH 0/6] Add toolchain knob for NPTL
In-Reply-To: <1392297727-17627-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392297727-17627-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140213074617.283682ce@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Feb 2014 14:22:01 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> We have a growing number of packages that need pthread functions only
> available when the NPTL implementation is used. But at the same time,
> we have several architectures (AVR32, ARC, Blackfin and Xtensa) that
> don't support NPTL.
> 
> This set of commits adds a new hidden toolchain config knob named
> BR2_TOOLCHAIN_HAS_THREADS_NPTL, and uses it in four packages: three
> were already having special conditions to more-or-less detect the
> availability of NPTL, and one package (qt5) which fixes an autobuilder
> failure.

*NIT* :

With the line length limitations, shouldn't variable names be kept to
less than 1/2 the line length limits?  ;)

Rhetorical:
Can a toolchain **without threads** support NPTL ?

With the above considerations, perhaps the knob could be:
BR2_TOOLCHAIN_NPTL

- - - -

Sorry for the noise, mind is not fully in-gear this morning.
Mike
