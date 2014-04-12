From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Apr 2014 13:14:21 +0200
Subject: [Buildroot] [PATCH] php: fix wrong -L and -I paths added by
	iconv tests
In-Reply-To: <1397299022-31655-1-git-send-email-jcmvbkbc@gmail.com>
References: <1397299022-31655-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20140412131421.65746140@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Sat, 12 Apr 2014 14:37:02 +0400, Max Filippov wrote:
> The commit f2a2c4cce "php: fix iconv related build failure" have removed
> logic that used to detect the correct PHP_ICONV_PREFIX with an
> assumption that "ICONV_DIR is fine". Currently the ICONV_DIR is only
> fine when BR2_PACKAGE_LIBICONV is set to 'y', otherwise php is
> configured with plain --with-iconv. This results in empty
> PHP_ICONV_PREFIX and -L/lib and -I/include added to CFLAGS and LDFLAGS
> respectively, which leads to build failures when e.g. /lib contains
> files with the same names as the toolchain sysroot needed for linking.
> 
> Fix that by always specifying --with-iconv=$(STAGING_DIR)/usr when iconv
> is configured for PHP.
> 
> Fixes: http://autobuild.buildroot.net/results/959/959b77fa2c1f13b1958b234803437e09734e882e/
> 
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/php/php.mk |    4 +---
>  1 files changed, 1 insertions(+), 3 deletions(-)

I remember trying this possible fix the other day before replying to
you, and it didn't work: the iconv detection was failing. I'll
reproduce and get back to you with more details.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
