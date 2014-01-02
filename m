From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jan 2014 13:23:18 +0100
Subject: [Buildroot] [PATCH] uclibc: snapshot: add BSD obsolete signal
 functions
In-Reply-To: <1797e4d78b86649e8a9d5aa44cef8fd83b81825f.1388663583.git.baruch@tkos.co.il>
References: <1797e4d78b86649e8a9d5aa44cef8fd83b81825f.1388663583.git.baruch@tkos.co.il>
Message-ID: <20140102132318.7315ddde@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu,  2 Jan 2014 13:53:03 +0200, Baruch Siach wrote:
> Fixes
> http://autobuild.buildroot.net/results/70b/70b79ca0aa97ed451a5679029955ed3709c84b67/.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/uclibc/uClibc-snapshot.config | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/uclibc/uClibc-snapshot.config b/package/uclibc/uClibc-snapshot.config
> index 9ca3f9ea983d..890aefd8ec59 100644
> --- a/package/uclibc/uClibc-snapshot.config
> +++ b/package/uclibc/uClibc-snapshot.config
> @@ -152,7 +152,7 @@ UCLIBC_LINUX_SPECIFIC=y
>  UCLIBC_HAS_GNU_ERROR=y
>  UCLIBC_BSD_SPECIFIC=y
>  UCLIBC_HAS_BSD_ERR=y
> -# UCLIBC_HAS_OBSOLETE_BSD_SIGNAL is not set
> +UCLIBC_HAS_OBSOLETE_BSD_SIGNAL=y

We don't have this option enabled in the uClibc-0.9.33.config. Is there
a reason why it should be enabled for the uClibc-snapshot.config and
not for uClibc-0.9.33.config ? Does netsnmp builds with uClibc 0.9.33
on some other architecture?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
