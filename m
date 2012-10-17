From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 17 Oct 2012 22:48:31 +0200
Subject: [Buildroot] [PATCH 0/7] Introduce the _AVAILABLE mechanism
In-Reply-To: <20121017224106.6bb0ad49@skate>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
 <201210172147.15828.yann.morin.1998@free.fr> <20121017220525.6e7e173b@skate>
 <201210172216.43837.yann.morin.1998@free.fr> <20121017224106.6bb0ad49@skate>
Message-ID: <507F199F.6040909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/10/12 22:41, Thomas Petazzoni wrote:
> Our example was the one of python-dpkt, which was doing a:
>
> 	depends on BR2_PACKAGE_PYTHON
> 	select BR2_PACKAGE_PYTHON_ZLIB
>
> or BR2_PACKAGE_PYTHON_ZLIB is not a package per-se, but a sub-option of
> the python package. And this this sub-option does a select, we should
> introduce a BR2_PACKAGE_PYTHON_ZLIB_AVAILABLE, I don't see a way around
> it.

  It is still possible to add an _AVAILABLE for sub-options that need them.
For something like a python module, it does make sense have an _AVAILABLE
for the sub-option.  Similar for GStreamer modules using an external library.
These things can be considered a separate (micro)package, in some sense.

  If the script converts the python-dpkt example above into
	depends on BR2_PACKAGE_PYTHON_ZLIB_AVAILABLE
	select BR2_PACKAGE_PYTHON_ZLIB
won't kconfig detect that PYTHON_ZLIB_AVAILABLE doesn't exist?  Then it
will be easy enough to fix those suboptions manually (if there aren't too
many of them...).

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
