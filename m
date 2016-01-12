From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Jan 2016 23:39:34 +0100
Subject: [Buildroot] [PATCH 1/1] pocketsphinx: new package
In-Reply-To: <1452513336-5839-1-git-send-email-yba@tkos.co.il>
References: <1452513336-5839-1-git-send-email-yba@tkos.co.il>
Message-ID: <569580A6.5040606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11-01-16 12:55, Jonathan Ben-Avraham wrote:
[snip]
> diff --git a/package/pocketsphinx/pocketsphinx.mk b/package/pocketsphinx/pocketsphinx.mk
> new file mode 100644
> index 0000000..27e66d5
> --- /dev/null
> +++ b/package/pocketsphinx/pocketsphinx.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# pocketsphinx
> +#
> +################################################################################
> +
> +# At the time of this submission (20160110) the github cmusphinx/pocketsphinx
> +# commit 9ee2fc6f83ed8a1d19ffee689ee3c6c48a8c4d58 does not build successfully
> +# and the rep contains no 5prealpha or other tags, so we use the SourceForge
> +# sources.
> +POCKETSPHINX_VERSION = 5prealpha
> +POCKETSPHINX_SITE = http://downloads.sourceforge.net/project/cmusphinx/pocketsphinx/$(POCKETSPHINX_VERSION)
> +POCKETSPHINX_SOURCE = pocketsphinx-$(POCKETSPHINX_VERSION).tar.gz
> +POCKETSPHINX_AUTORECONF = YES
> +POCKETSPHINX_LICENSE = MIT
> +# The license is contained in the copyright notice at the top of each source
> +# file. There is no specific file with a general license notice.
> +POCKETSPHINX_LICENSE_FILES = 
> +POCKETSPHINX_CONF_OPTS = --without-python
> +POCKETSPHINX_INSTALL_STAGING = YES
> +POCKETSPHINX_DEPENDENCIES = sphinxbase

 Something I didn't notice before: it's refering to the build directory of
sphinxbase. Adding --with-sphinxbase=auto seems to fix it.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
