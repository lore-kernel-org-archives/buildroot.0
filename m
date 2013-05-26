From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 May 2013 23:30:28 +0200
Subject: [Buildroot] [PATCH 1/1] git: new package
In-Reply-To: <1369597112-17592-1-git-send-email-spenser@gillilanding.com>
 (Spenser Gilliland's message of "Sun, 26 May 2013 14:38:32 -0500")
References: <1367352047-8940-1-git-send-email-sagaert.johan@skynet.be>
 <1369597112-17592-1-git-send-email-spenser@gillilanding.com>
Message-ID: <87ehcte8ej.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Spenser" == Spenser Gilliland <spenser@gillilanding.com> writes:

 Spenser> From: Sagaert Johan <sagaert.johan@skynet.be>
 Spenser> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
 Spenser> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
 Spenser> ---
 Spenser>  package/Config.in     |    1 +
 Spenser>  package/git/Config.in |    7 ++++++
 Spenser>  package/git/git.mk    |   62 +++++++++++++++++++++++++++++++++++++++++++++++++
 Spenser>  3 files changed, 70 insertions(+)
 Spenser>  create mode 100644 package/git/Config.in
 Spenser>  create mode 100644 package/git/git.mk

 Spenser> diff --git a/package/Config.in b/package/Config.in
 Spenser> index d980871..2aeaeff 100644
 Spenser> --- a/package/Config.in
 Spenser> +++ b/package/Config.in
 Spenser> @@ -74,6 +74,7 @@ source "package/gawk/Config.in"
 Spenser>  endif
 Spenser>  source "toolchain/gcc/Config.in.2"
 Spenser>  source "package/gettext/Config.in"
 Spenser> +source "package/git/Config.in"
 Spenser>  source "package/gperf/Config.in"
 Spenser>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 Spenser>  source "package/grep/Config.in"
 Spenser> diff --git a/package/git/Config.in b/package/git/Config.in
 Spenser> new file mode 100644
 Spenser> index 0000000..c3c060e
 Spenser> --- /dev/null
 Spenser> +++ b/package/git/Config.in
 Spenser> @@ -0,0 +1,7 @@
 Spenser> +config BR2_PACKAGE_GIT
 Spenser> +	bool "git"

It needs largefile support, so should depend on BR2_LARGEFILE / show a
comment if not available.

 Spenser> +	help
 Spenser> +	  Git is a free and open source distributed version control system
 Spenser> +	  designed to handle everything from small to very large projects.
 Spenser> +	  

We normally don't indent the empty line.

 Spenser> +	  http://git-scm.com
 Spenser> diff --git a/package/git/git.mk b/package/git/git.mk
 Spenser> new file mode 100644
 Spenser> index 0000000..1d097f5
 Spenser> --- /dev/null
 Spenser> +++ b/package/git/git.mk
 Spenser> @@ -0,0 +1,62 @@
 Spenser> +#############################################################
 Spenser> +#
 Spenser> +# git
 Spenser> +#
 Spenser> +#############################################################

We normally have an empty line after the header.

 Spenser> +GIT_VERSION         = 1.8.3
 Spenser> +GIT_SITE            = http://git-core.googlecode.com/files/
 Spenser> +GIT_LICENSE         = LGPLv2.1+
 Spenser> +GIT_LICENSE_FILES   = COPYING

That's not right. The main git files are GPLv2 (as described in
COPYING), and a few of the extras like xdiff are LGPLv2.1+ as described
in LGPL-2.1.

Committed to next with those issues fixed, thanks.

-- 
Bye, Peter Korsgaard
