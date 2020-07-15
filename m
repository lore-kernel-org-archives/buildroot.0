From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 23:38:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/gupnp: disable documentation
In-Reply-To: <20200715205327.993524-1-fontaine.fabrice@gmail.com>
References: <20200715205327.993524-1-fontaine.fabrice@gmail.com>
Message-ID: <20200715233859.7f825596@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Jul 2020 22:53:27 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> gupnp always builds man page since version 1.2.3 and
> https://gitlab.gnome.org/GNOME/gupnp/-/commit/23f54c2a1e8718e836224d68dafded091604a677
> 
> This will raise the following build failure on some of our autobuilders:
> 
> FAILED: doc/gupnp-binding-tool-1.2.1
> /usr/bin/xsltproc --nonet --xinclude --path /home/naourr/work/instance-0/output-1/build/gupnp-1.2.3/doc:/home/naourr/work/instance-0/output-1/build/gupnp-1.2.3/build/doc --stringparam man.output.quietly 1 --stringparam funcsynopsis.style ansi --stringparam man.th.extra1.suppress 1 --stringparam man.authors.section.enabled 1 --stringparam man.copyright.section.enabled 1 -o doc/gupnp-binding-tool-1.2.1 http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl ../doc/gupnp-binding-tool.xml
> I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
> warning: failed to load external entity "http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl"
> cannot parse http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
> 
> This issue has been reported upstream, until we got more feedback, just
> revert the commit
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7bf388e81dff3875e396a228b2d48d345377b0da
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ays-build-gupnp-binding-tool-manpage.patch | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 package/gupnp/0001-Revert-build-Always-build-gupnp-binding-tool-manpage.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
