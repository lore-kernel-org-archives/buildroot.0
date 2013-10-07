From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Oct 2013 11:52:52 +0200
Subject: [Buildroot] [PATCH 1/1] libbsd: bump to version 0.6.0
In-Reply-To: <1381128960-16844-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 (Jerzy Grzegorek's message of "Mon, 7 Oct 2013 08:56:00 +0200")
References: <1381128960-16844-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <87hactbe6j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jerzy" == Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net> writes:

 Jerzy> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
 Jerzy> ---
 Jerzy>  package/libbsd/libbsd.mk |    3 ++-
 Jerzy>  1 file changed, 2 insertions(+), 1 deletion(-)

 Jerzy> diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
 Jerzy> index be4175a..88039ca 100644
 Jerzy> --- a/package/libbsd/libbsd.mk
 Jerzy> +++ b/package/libbsd/libbsd.mk
 Jerzy> @@ -4,7 +4,8 @@
 Jerzy>  #
 Jerzy>  ################################################################################
 
 Jerzy> -LIBBSD_VERSION         = 0.4.2
 Jerzy>  +LIBBSD_VERSION         = 0.6.0
 Jerzy>  +LIBBSD_SOURCE		= libbsd-$(LIBBSD_VERSION).tar.xz

_SOURCE indentation is wrong (other lines use space, this one uses
tabs). More importantly, this version no longer works with uClibc:

checking for GNU .init_array section support... no
configure: error: missing required GNU .init_array section support

From the upstream commit, it sounds like this is a glibc only feature:

http://cgit.freedesktop.org/libbsd/commit/?id=6faea4d2a0eb7782187dd6d92749a0813e7405bd

Either we make libbsd glibc only, or we stay with the old version.

-- 
Bye, Peter Korsgaard
