From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Nov 2009 15:26:53 +0100
Subject: [Buildroot] [PATCH 4/8] flex: add flex-host package (required
 by webkit)
In-Reply-To: <1258279977-1482-5-git-send-email-llandwerlin@gmail.com>
References: <1258279977-1482-1-git-send-email-llandwerlin@gmail.com>
	<1258279977-1482-5-git-send-email-llandwerlin@gmail.com>
Message-ID: <20091115152653.29810036@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 15 Nov 2009 11:12:53 +0100,
llandwerlin at gmail.com a ?crit :

>  $(eval $(call AUTOTARGETS,package,flex))
> +$(eval $(call AUTOTARGETS,package,flex,host))

BTW, why do we need to build flex for the host ? flex is part of the
few tools that we consider to be a dependency of Buildroot.

In toolchain/dependencies/dependencies.sh, we check that a host flex is
available. This tool (along with bison) is anyway mandatory to build
the toolchain.

So :

 * Either we consider flex to be part of Buildroot dependencies and
   Webkit should not depend on host-flex ;

 * Or we don't consider flex to be part of the Buildroot dependencies
   and we should fix all packages and toolchain that use flex without
   depending on it.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
