From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 23:10:34 +0200
Subject: [Buildroot] [PATCH v7 00/23] Move toolchain configs and
 autobuild logic in-tree
In-Reply-To: <20170721010530.4747-1-arnout@mind.be>
References: <20170721010530.4747-1-arnout@mind.be>
Message-ID: <20170725231034.02a791e9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Jul 2017 03:05:07 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:

> Arnout Vandecappelle (23):
>   utils/genrandconfig: new script
>   genrandconfig: use subprocess.check_output instead of Popen
>   genrandconfig: fix (some) pep8 warnings
>   genrandconfig: replace kwargs with explicit arguments
>   genrandconfig: move instantiation of SystemInfo down
>   genrandconfig: verbose output and use stderr
>   genrandconfig: calculate outputdir in __main__
>   genrandconfig: calculate buildrootdir in __main__
>   genrandconfig: pass outputdir and buildrootdir as arguments
>   genrandconfig: calculate configfile only once
>   genrandconfig: fix the case when outputdir is 'output'
>   support/test-pkg: move minimal.config into a separate file
>   minimal.config: add BR2_COMPILER_PARANOID_UNSAFE_PATH=y
>   minimal.config: add BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
>   genrandconfig: use minimal.config
>   support: add autobuild toolchain config fragments
>   test-pkg: get configs from in-tree toolchain-configs.csv
>   support/test-pkg: add option to use an alternate toolchains CSV file
>   genrandconfig: get configs from in-tree toolchain-configs.csv
>   toolchain-configs.csv: remove unused libc column
>   Makefile: refactor *config targets
>   Makefile: add alldefconfig target
>   test-pkg: use merge_config.sh to merge the fragments

Thanks, I've applied all patches, except "support/test-pkg: add option
to use an alternate toolchains CSV file", and replied to this one with
the explanation.

I only did a quick review, because the general direction is definitely
the right one, and I trust you to be there to fix issues :-)

Thanks for doing this, it was long overdue, and will definitely ease
the maintenance of autobuilder exceptions, and opens the path to
testing multiple branches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
