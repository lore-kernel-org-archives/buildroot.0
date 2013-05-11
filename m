From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 May 2013 21:22:14 +0200
Subject: [Buildroot] [PATCH v2 1/1] Disable building of cups driver in
	host-gutenprint
In-Reply-To: <1368267696-5839-1-git-send-email-olivier.schonken@gmail.com>
 (Olivier Schonken's message of "Sat, 11 May 2013 12:21:35 +0200")
References: <1368265366-24526-1-git-send-email-olivier.schonken@gmail.com>
 <1368267696-5839-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <87y5bl1fvd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Olivier" == Olivier Schonken <olivier.schonken@gmail.com> writes:

 Olivier> This should fix http://autobuild.buildroot.org/results/d2e386b50744aeda7257a0b78aafe90ba4da697c/
 Olivier> Because there is no host-cups package, host-gutenprint cant build the
 Olivier> host-cups drivers - missing includes and libs.  Host gutenprint only
 Olivier> built to get the xml. Thus not a loss.

 Olivier> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>

 Olivier> ---

 Olivier> Corrected absent minded mistake. Thanks Thomas

 Olivier>  package/gutenprint/gutenprint.mk |    3 ++-
 Olivier>  1 file changed, 2 insertions(+), 1 deletion(-)

 Olivier> diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
 Olivier> index 0463771..072fada 100644
 Olivier> --- a/package/gutenprint/gutenprint.mk
 Olivier> +++ b/package/gutenprint/gutenprint.mk
 Olivier> @@ -51,7 +51,8 @@ HOST_GUTENPRINT_CONF_OPT = --disable-libgutenprintui2 \
 Olivier>                             --without-foomatic3 \
 Olivier>                             --disable-escputil \
 Olivier>                             --disable-test \
 Olivier> -                           --disable-testpattern
 Olivier> +                           --disable-testpattern \
 Olivier> +			   --without-cups

Indentation is off compared to the other lines, but I've fixed that.

After some more testing I've found out that I also have to set an
explicit ac_cv_path_CUPS_CONFIG, otherwise the output of the (host)
cups-config is still added to CFLAGS/LDFLAGS.

Committed, thanks.

-- 
Bye, Peter Korsgaard
