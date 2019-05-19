From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 19 May 2019 22:59:28 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/iputils: bump to version
 s20190515
In-Reply-To: <20190518214748.355c6489@windsurf>
References: <20190516053921.21907-1-petr.vorel@gmail.com>
 <20190518214748.355c6489@windsurf>
Message-ID: <20190519205927.GA29073@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> I'm sorry, but unfortunately, it still fails to build here:

> >>> iputils s20190515 Building
> PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/home/thomas/sys/bin/:/usr/lib64/ccache:/usr/share/Modules/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/home/thomas/.rvm/bin:/home/thomas/.local/bin"  PYTHONNOUSERSITE=y /home/thomas/projets/buildroot/output/host/bin/ninja  -j5  -C /home/thomas/projets/buildroot/output/build/iputils-s20190515//build
> ninja: Entering directory `/home/thomas/projets/buildroot/output/build/iputils-s20190515//build'
> [1/24] Generating arping.8 with a custom command.
> FAILED: doc/arping.8 
> /home/thomas/sys/bin/xsltproc -o doc/arping.8 --nonet --stringparam man.output.quietly 1 --stringparam funcsynopsis.style ansi --stringparam man.th.extra1.suppress 1 --stringparam iputils.version s20190515 ../doc/custom-man.xsl ../doc/arping.xml
> I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl
> warning: failed to load external entity "http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl"
> compilation error: file ../doc/custom-man.xsl line 8 element import
> xsl:import : unable to load http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl
> [2/24] Generating ping.8 with a custom command.
> FAILED: doc/ping.8 
> /home/thomas/sys/bin/xsltproc -o doc/ping.8 --nonet --stringparam man.output.quietly 1 --stringparam funcsynopsis.style ansi --stringparam man.th.extra1.suppress 1 --stringparam iputils.version s20190515 ../doc/custom-man.xsl ../doc/ping.xml
> I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl
> warning: failed to load external entity "http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl"
> compilation error: file ../doc/custom-man.xsl line 8 element import
> xsl:import : unable to load http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl
> [3/24] Generating clockdiff.8 with a custom command.
> FAILED: doc/clockdiff.8 
> /home/thomas/sys/bin/xsltproc -o doc/clockdiff.8 --nonet --stringparam man.output.quietly 1 --stringparam funcsynopsis.style ansi --stringparam man.th.extra1.suppress 1 --stringparam iputils.version s20190515 ../doc/custom-man.xsl ../doc/clockdiff.xml
> I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl
> warning: failed to load external entity "http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl"
> compilation error: file ../doc/custom-man.xsl line 8 element import
> xsl:import : unable to load http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl
> [4/24] Generating rdisc.8 with a custom command.
> FAILED: doc/rdisc.8 
> /home/thomas/sys/bin/xsltproc -o doc/rdisc.8 --nonet --stringparam man.output.quietly 1 --stringparam funcsynopsis.style ansi --stringparam man.th.extra1.suppress 1 --stringparam iputils.version s20190515 ../doc/custom-man.xsl ../doc/rdisc.xml
> I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl
> warning: failed to load external entity "http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl"
> compilation error: file ../doc/custom-man.xsl line 8 element import
> xsl:import : unable to load http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl
> [5/24] Generating git-version.h with a custom command.
> ninja: build stopped: subcommand failed.
> make[1]: *** [package/pkg-generic.mk:241: /home/thomas/projets/buildroot/output/build/iputils-s20190515/.stamp_built] Error 1
> make: *** [Makefile:84: _all] Error 2

I'm sorry for broken patch. I've tested it locally and with './utils/test-pkg -p iputils'
and everything worked. The problem is with XSL Stylesheets for DocBook 5 dependency, which
is installed on my system. I see Docbook XSL Stylesheets aren't packaged for
Buildroot so I'll disable it.

Kind regards,
Petr
