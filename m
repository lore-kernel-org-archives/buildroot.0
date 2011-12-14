From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Dec 2011 15:29:44 +0100
Subject: [Buildroot] [PATCH 3 of 4 v3] dependencies: add function
 suitable-host-package
In-Reply-To: <9473297e898d506d6bc2.1323862799@devws108>
References: <patchbomb.1323862796@devws108>
 <9473297e898d506d6bc2.1323862799@devws108>
Message-ID: <20111214152944.3e1a7e73@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 14 Dec 2011 15:22:12 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> Sometimes, buildroot needs a certain host tool to do its job, e.g. tar. In
> many cases, we expect this tool to be present on the host system, but this is
> not always the case. Or maybe, the version on the host system is not
> suitable, and we need a more recent one.
> 
> In some of these cases, instead of bailing out, buildroot could build the
> package first (but only if the existing system package is not suitable).
> 
> To aid in detecting if a host package is suitable or not, this patch adds a
> function suitable-host-package. When called with parameter foo, it will
> execute check-host-foo.sh. This script should return either the path to the
> suitable host package, or the empty string if no suitable package can be found.
> The rules to determine whether something is suitable or not is left to
> check-host-foo.sh and depends on foo.
> 
> An example usage of suitable-host-package is:
> DEPENDENCIES_HOST_PREREQ += $(if $(call suitable-host-package,foo),,host-foo)
> 
> To avoid cluttering the existing dependencies.mk file, it includes any
> check-host-foo.mk file. These files can be used to hold appropriate
> dependency-related actions for foo.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> v1 Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
