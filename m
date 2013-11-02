From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Nov 2013 18:55:51 +0100
Subject: [Buildroot] [PATCH v3] cryptsetup: Add libintl for UCLIBC
 toolchain
In-Reply-To: <1383317305-10180-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1383317305-10180-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <20131102185551.2c3c5940@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Fri, 1 Nov 2013 07:48:25 -0700, Clayton Shotwell wrote:
> Fixes autobuild error
> http://autobuild.buildroot.net/results/cc1a65b9554bc2ece1b3ea8b51cd805b9bda7e86/
> 
> Adding libintl to the libraries list for cryptsetup when using a
> uclibc toolchain and locale support is enabled.
> 
> Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
> ---
> Changes v2 -> v3:
>   - Adding BR2_NEEDS_GETTEXT_IF_LOCALE checks per the buildroot
>     manual (suggested by Gustavo)
> Changes v1 -> v2:
>   - Adding TARGET_LDFLAGS to make sure they are not dropped
> ---
>  package/cryptsetup/Config.in     |    1 +
>  package/cryptsetup/cryptsetup.mk |    7 ++++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)

Applied to for-peter-2013.11, thanks.

Note that this patch is really a workaround for what is a deficiency of
the package itself. The configure.ac script properly detects that it's
not the C library that provides intl support, but the separate libintl
library. However, src/Makefile.am fails to add the proper @LIBINTL@
string to the _LDADD of the program that uses intl features. See the
end of
http://www.gnu.org/software/gettext/manual/html_node/src_002fMakefile.html
for details about this.

If you're interested, don't hesitate to report this problem upstream.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
