From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 29 Dec 2012 21:09:33 +0100
Subject: [Buildroot] [PATCH 14/20] efl/libeio: new package
In-Reply-To: <def1e95b3470173f129cd36c95f40260e9893594.1356723702.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 28 Dec 2012 20:42:07 +0100")
References: <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
 <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
 <def1e95b3470173f129cd36c95f40260e9893594.1356723702.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87k3s0wrgi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/efl/Config.in        |    1 +
 Thomas>  package/efl/libeio/Config.in |   15 +++++++++++++++
 Thomas>  package/efl/libeio/libeio.mk |   15 +++++++++++++++
 Thomas>  3 files changed, 31 insertions(+)
 Thomas>  create mode 100644 package/efl/libeio/Config.in
 Thomas>  create mode 100644 package/efl/libeio/libeio.mk

 Thomas> diff --git a/package/efl/Config.in b/package/efl/Config.in
 Thomas> index c783d7f..a526d87 100644
 Thomas> --- a/package/efl/Config.in
 Thomas> +++ b/package/efl/Config.in
 Thomas> @@ -13,6 +13,7 @@ source "package/efl/libeina/Config.in"
 Thomas>  source "package/efl/libecore/Config.in"
 Thomas>  source "package/efl/libeet/Config.in"
 Thomas>  source "package/efl/libefreet/Config.in"
 Thomas> +source "package/efl/libeio/Config.in"
 Thomas>  source "package/efl/libevas/Config.in"
 Thomas>  source "package/efl/libembryo/Config.in"
 Thomas>  source "package/efl/libedje/Config.in"
 Thomas> diff --git a/package/efl/libeio/Config.in b/package/efl/libeio/Config.in
 Thomas> new file mode 100644
 Thomas> index 0000000..889d079
 Thomas> --- /dev/null
 Thomas> +++ b/package/efl/libeio/Config.in
 Thomas> @@ -0,0 +1,15 @@
 Thomas> +config BR2_PACKAGE_LIBEIO
 Thomas> +	bool "libeio"
 Thomas> +	help
 Thomas> +	  Eio integrates with EFL (Ecore, Eina) to provide efficient
 Thomas> +	  filesystem Input/Output? (I/O). It use the best techniques

The question mark after Input/Output shouldn't be here.

No dependencies on ecore or eina?

-- 
Bye, Peter Korsgaard
