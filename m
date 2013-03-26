From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Mar 2013 22:45:58 +0100
Subject: [Buildroot] [PATCH 02/15] Added package enscript
In-Reply-To: <36d1f763f161ef74ae1e2a936d824658b2df6e10.1364253936.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 26 Mar 2013 00:27:57 +0100")
References: <cover.1364253936.git.yann.morin.1998@free.fr>
 <cover.1364253936.git.yann.morin.1998@free.fr>
 <36d1f763f161ef74ae1e2a936d824658b2df6e10.1364253936.git.yann.morin.1998@free.fr>
Message-ID: <871ub196nd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: Olivier Schonken <olivier.schonken@gmail.com>
 Yann> GNU Enscript is a free replacement for Adobe's enscript program.
 Yann> GNU Enscript converts ASCII files to PostScript, HTML, or RTF and
 Yann> stores generated output to a file or sends it directly to the
 Yann> printer. It includes features for `pretty-printing' (language-
 Yann> sensitive code highlighting) in several programming languages.

 Yann> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
 Yann> [yann.morin.1998 at free.fr: space-damage, unneeded variables, licensing terms]
 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> ---
 Yann>  package/Config.in            |    1 +
 Yann>  package/enscript/Config.in   |   11 +++++++++++
 Yann>  package/enscript/enscript.mk |   19 +++++++++++++++++++
 Yann>  3 files changed, 31 insertions(+), 0 deletions(-)
 Yann>  create mode 100644 package/enscript/Config.in
 Yann>  create mode 100644 package/enscript/enscript.mk

 Yann> diff --git a/package/Config.in b/package/Config.in
 Yann> index be1aa99..82e6c5c 100644
 Yann> --- a/package/Config.in
 Yann> +++ b/package/Config.in
 Yann> @@ -290,6 +290,7 @@ endmenu
 
 Yann>  menu "Interpreter languages and scripting"
 Yann>  source "package/erlang/Config.in"
 Yann> +source "package/enscript/Config.in"
 Yann>  source "package/haserl/Config.in"
 Yann>  source "package/jamvm/Config.in"
 Yann>  source "package/lua/Config.in"
 Yann> diff --git a/package/enscript/Config.in b/package/enscript/Config.in
 Yann> new file mode 100644
 Yann> index 0000000..f101397
 Yann> --- /dev/null
 Yann> +++ b/package/enscript/Config.in
 Yann> @@ -0,0 +1,11 @@
 Yann> +config BR2_PACKAGE_ENSCRIPT
 Yann> +	bool "enscript"
 Yann> +	help
 Yann> +	  GNU Enscript is a free replacement for Adobe's enscript program.
 Yann> +
 Yann> +	  GNU Enscript converts ASCII files to PostScript, HTML, or RTF and
 Yann> +	  stores generated output to a file or sends it directly to the
 Yann> +	  printer. It includes features for `pretty-printing' (language-
 Yann> +	  sensitive code highlighting) in several programming languages.
 Yann> +
 Yann> +	   http://www.gnu.org/software/enscript

Indentation is wrong here. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
