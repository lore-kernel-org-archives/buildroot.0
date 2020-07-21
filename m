From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jul 2020 22:10:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/gupnp: disable documentation
In-Reply-To: <20200715205327.993524-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 15 Jul 2020 22:53:27 +0200")
References: <20200715205327.993524-1-fontaine.fabrice@gmail.com>
Message-ID: <87pn8omxx3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > gupnp always builds man page since version 1.2.3 and
 > https://gitlab.gnome.org/GNOME/gupnp/-/commit/23f54c2a1e8718e836224d68dafded091604a677

 > This will raise the following build failure on some of our autobuilders:

 > FAILED: doc/gupnp-binding-tool-1.2.1
 > /usr/bin/xsltproc --nonet --xinclude --path
 > /home/naourr/work/instance-0/output-1/build/gupnp-1.2.3/doc:/home/naourr/work/instance-0/output-1/build/gupnp-1.2.3/build/doc
 > --stringparam man.output.quietly 1 --stringparam funcsynopsis.style
 > ansi --stringparam man.th.extra1.suppress 1 --stringparam
 > man.authors.section.enabled 1 --stringparam
 > man.copyright.section.enabled 1 -o doc/gupnp-binding-tool-1.2.1
 > http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
 > ../doc/gupnp-binding-tool.xml
 > I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
 > warning: failed to load external entity "http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl"
 > cannot parse http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl

 > This issue has been reported upstream, until we got more feedback, just
 > revert the commit

 > Fixes:
 >  - http://autobuild.buildroot.org/results/7bf388e81dff3875e396a228b2d48d345377b0da

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
