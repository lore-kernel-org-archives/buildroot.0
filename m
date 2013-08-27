From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Aug 2013 22:09:54 +0200
Subject: [Buildroot] [PATCH v3] harfbuzz: New package
In-Reply-To: <1377207164-10433-1-git-send-email-markos.chandras@imgtec.com>
 (Markos Chandras's message of "Thu, 22 Aug 2013 22:32:44 +0100")
References: <1377207164-10433-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <87ioyqki99.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@imgtec.com> writes:

 Markos> HarfBuzz is an OpenType text shaping engine
 Markos> http://www.freedesktop.org/wiki/Software/HarfBuzz/

 Markos> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
 Markos> ---
 Markos> Changes since v2:
 Markos> - Drop BR2_PACKAGE_HARFBUZZ_* symbols. We enable/disable
 Markos> these options if the respective packages are selected.
 Markos> - Fix license name for each component.
 Markos> Suggested by Arnout Vandecappelle
 Markos> http://lists.busybox.net/pipermail/buildroot/2013-August/076728.html

 Markos> Changes since v1:
 Markos> - Fix alphabetical order in package/Config.in
 Markos> - Rename 'LIBSTDCPP support' to 'C++ support'
 Markos> ---
 Markos>  package/Config.in            |  1 +
 Markos>  package/harfbuzz/Config.in   |  9 +++++++++
 Markos>  package/harfbuzz/harfbuzz.mk | 44 ++++++++++++++++++++++++++++++++++++++++++++
 Markos>  3 files changed, 54 insertions(+)
 Markos>  create mode 100644 package/harfbuzz/Config.in
 Markos>  create mode 100644 package/harfbuzz/harfbuzz.mk

 Markos> diff --git a/package/Config.in b/package/Config.in
 Markos> index 7069d77..1b06755 100644
 Markos> --- a/package/Config.in
 Markos> +++ b/package/Config.in
 Markos> @@ -130,6 +130,7 @@ endif
 Markos>  source "package/fbterm/Config.in"
 Markos>  source "package/fbv/Config.in"
 Markos>  source "package/fb-test-app/Config.in"
 Markos> +source "package/harfbuzz/Config.in"

I think it makes more sense to put it under Libraries->Graphics like
E.G. freetype.

 Markos>  source "package/imagemagick/Config.in"
 Markos>  source "package/linux-fusion/Config.in"
 Markos>  source "package/lite/Config.in"
 Markos> diff --git a/package/harfbuzz/Config.in b/package/harfbuzz/Config.in
 Markos> new file mode 100644
 Markos> index 0000000..fb5fc8f
 Markos> --- /dev/null
 Markos> +++ b/package/harfbuzz/Config.in
 Markos> @@ -0,0 +1,9 @@
 Markos> +config BR2_PACKAGE_HARFBUZZ
 Markos> +	bool "harfbuzz"
 Markos> +	help
 Markos> +	  HarfBuzz is an OpenType text shaping engine
 Markos> +
 Markos> +	  http://www.freedesktop.org/wiki/Software/HarfBuzz/
 Markos> +
 Markos> +	  Harfbuzz can make optional use of cairo, freetype,
 Markos> +	  glib2 and icu packages if they are selected.

It is written in C++, so it need to depend on BR2_INSTALL_LIBSTDCPP

Committed to next with these changes, thanks.

-- 
Bye, Peter Korsgaard
