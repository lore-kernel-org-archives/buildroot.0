From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 21:47:48 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/iputils: bump to version
 s20190515
In-Reply-To: <20190516053921.21907-1-petr.vorel@gmail.com>
References: <20190516053921.21907-1-petr.vorel@gmail.com>
Message-ID: <20190518214748.355c6489@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Petr,

On Thu, 16 May 2019 07:39:21 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> This commit also include changes from s20190324.
> 
> Upstream changed build system to Meson, these extra changes
> were required:
> * remove custom commands of previous build system:
> (IPUTILS_INSTALL_TARGET_CMDS, IPUTILS_PERMISSIONS)
> * remove USE_SYSFS=no (support removed from upstream
> * transform options from USE_FOO={yes,no} to -DUSE_FOO={true,false}
> 
> Removed patch included in this release
> 
> Build ninfod if possible (when use any crypto)
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

I'm sorry, but unfortunately, it still fails to build here:

>>> iputils s20190515 Building
PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/home/thomas/sys/bin/:/usr/lib64/ccache:/usr/share/Modules/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/home/thomas/.rvm/bin:/home/thomas/.local/bin"  PYTHONNOUSERSITE=y /home/thomas/projets/buildroot/output/host/bin/ninja  -j5  -C /home/thomas/projets/buildroot/output/build/iputils-s20190515//build
ninja: Entering directory `/home/thomas/projets/buildroot/output/build/iputils-s20190515//build'
[1/24] Generating arping.8 with a custom command.
FAILED: doc/arping.8 
/home/thomas/sys/bin/xsltproc -o doc/arping.8 --nonet --stringparam man.output.quietly 1 --stringparam funcsynopsis.style ansi --stringparam man.th.extra1.suppress 1 --stringparam iputils.version s20190515 ../doc/custom-man.xsl ../doc/arping.xml
I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl
warning: failed to load external entity "http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl"
compilation error: file ../doc/custom-man.xsl line 8 element import
xsl:import : unable to load http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl
[2/24] Generating ping.8 with a custom command.
FAILED: doc/ping.8 
/home/thomas/sys/bin/xsltproc -o doc/ping.8 --nonet --stringparam man.output.quietly 1 --stringparam funcsynopsis.style ansi --stringparam man.th.extra1.suppress 1 --stringparam iputils.version s20190515 ../doc/custom-man.xsl ../doc/ping.xml
I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl
warning: failed to load external entity "http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl"
compilation error: file ../doc/custom-man.xsl line 8 element import
xsl:import : unable to load http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl
[3/24] Generating clockdiff.8 with a custom command.
FAILED: doc/clockdiff.8 
/home/thomas/sys/bin/xsltproc -o doc/clockdiff.8 --nonet --stringparam man.output.quietly 1 --stringparam funcsynopsis.style ansi --stringparam man.th.extra1.suppress 1 --stringparam iputils.version s20190515 ../doc/custom-man.xsl ../doc/clockdiff.xml
I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl
warning: failed to load external entity "http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl"
compilation error: file ../doc/custom-man.xsl line 8 element import
xsl:import : unable to load http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl
[4/24] Generating rdisc.8 with a custom command.
FAILED: doc/rdisc.8 
/home/thomas/sys/bin/xsltproc -o doc/rdisc.8 --nonet --stringparam man.output.quietly 1 --stringparam funcsynopsis.style ansi --stringparam man.th.extra1.suppress 1 --stringparam iputils.version s20190515 ../doc/custom-man.xsl ../doc/rdisc.xml
I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl
warning: failed to load external entity "http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl"
compilation error: file ../doc/custom-man.xsl line 8 element import
xsl:import : unable to load http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl
[5/24] Generating git-version.h with a custom command.
ninja: build stopped: subcommand failed.
make[1]: *** [package/pkg-generic.mk:241: /home/thomas/projets/buildroot/output/build/iputils-s20190515/.stamp_built] Error 1
make: *** [Makefile:84: _all] Error 2

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
