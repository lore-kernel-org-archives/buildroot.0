From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 May 2012 10:00:14 +0200
Subject: [Buildroot] [PATCH] Add the package read-edid which provides a
	pair of utilities to read and parse the video monitor
	information block (EDID).
In-Reply-To: <1336269918-24339-1-git-send-email-golubovsky@gmail.com>
 (Dmitry's message of "Sat, 5 May 2012 22:05:18 -0400")
References: <1336269918-24339-1-git-send-email-golubovsky@gmail.com>
Message-ID: <874nrtbuy9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Dmitry" == Dmitry  <golubovsky@gmail.com> writes:

 Dmitry> Signed-off-by: Dmitry <golubovsky@gmail.com>
 Dmitry> ---
 Dmitry>  package/Config.in              |    1 +
 Dmitry>  package/read-edid/Config.in    |   16 ++++++++++++++++
 Dmitry>  package/read-edid/read-edid.mk |   20 ++++++++++++++++++++
 Dmitry>  3 files changed, 37 insertions(+), 0 deletions(-)
 Dmitry>  create mode 100644 package/read-edid/Config.in
 Dmitry>  create mode 100644 package/read-edid/read-edid.mk

 Dmitry> diff --git a/package/Config.in b/package/Config.in
 Dmitry> index 6caca9d..94d0fb4 100644
 Dmitry> --- a/package/Config.in
 Dmitry> +++ b/package/Config.in
 Dmitry> @@ -211,6 +211,7 @@ source "package/openocd/Config.in"
 Dmitry>  source "package/parted/Config.in"
 Dmitry>  source "package/pciutils/Config.in"
 Dmitry>  source "package/picocom/Config.in"
 Dmitry> +source "package/read-edid/Config.in"
 Dmitry>  source "package/rng-tools/Config.in"
 Dmitry>  source "package/sane-backends/Config.in"
 Dmitry>  source "package/sdparm/Config.in"
 Dmitry> diff --git a/package/read-edid/Config.in b/package/read-edid/Config.in
 Dmitry> new file mode 100644
 Dmitry> index 0000000..465a062
 Dmitry> --- /dev/null
 Dmitry> +++ b/package/read-edid/Config.in
 Dmitry> @@ -0,0 +1,16 @@
 Dmitry> +config BR2_PACKAGE_READ_EDID
 Dmitry> +	bool "read-edid"
 Dmitry> +	depends on (BR2_i386)
 Dmitry> +	help
 Dmitry> +	  Read-edid is  a pair of tools  (originally by John Fremlin)  for reading
 Dmitry> +	  the EDID from  a monitor.  It should  work with most monitors made since
 Dmitry> +	  1996  (except for newer ones with  256-byte EDID's - WiP),  assuming the
 Dmitry> +	  video card  supports  the standard  read commands (most do).   Read-edid
 Dmitry> +	  is a set of two tools  -  get-edid, which gets  the raw edid information 
 Dmitry> +	  from the monitor, and parse-edid, which turns the raw binary information
 Dmitry> +	  into an XF86Config-compatible monitor section.
 Dmitry> +
 Dmitry> +	  http://polypux.org/projects/read-edid/
 Dmitry> +
 Dmitry> +
 Dmitry> +

I've fixed up these whitespace issues and committed, thanks.

-- 
Bye, Peter Korsgaard
