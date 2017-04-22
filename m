From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 15:03:17 +0200
Subject: [Buildroot] [PATCH v8 07/12] e2fsprogs: refactor to fix
 conflicts with busybox and util-linux
In-Reply-To: <20170422115955.22718-8-arnout@mind.be>
References: <20170422115955.22718-1-arnout@mind.be>
 <20170422115955.22718-8-arnout@mind.be>
Message-ID: <20170422150317.576c0b54@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Apr 2017 13:59:50 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:

> +# If both e2fsprogs and busybox are selected, make certain e2fsprogs
> +# wins the fight over who gets to have their utils actually installed
> +ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> +E2FSPROGS_DEPENDENCIES += busybox
> +endif

We recently had a ncurses/busybox discussion, in which to solve a
circular dependency problem we removed such a dependency on Busybox. As
part of this discussion, we started thinking about whether we should
stop using the solution of depending on busybox to allow a package to
override Busybox applets, and instead make sure the corresponding
applets in Busybox are disabled when another package will install the
full featured version of the program.

Should we generalize this idea, and apply it to e2fsprogs as well?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
