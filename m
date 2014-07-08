From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Jul 2014 16:28:40 +0200
Subject: [Buildroot] [PATCH 1/1] Build Python with tzset support
In-Reply-To: <1404825833-1075-1-git-send-email-henry.margies@gmail.com>
References: <1404825833-1075-1-git-send-email-henry.margies@gmail.com>
Message-ID: <20140708162840.5983803f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Henry Margies,

On Tue,  8 Jul 2014 14:23:53 +0100, Henry Margies wrote:
> This patch adds support for time.tzset() in Python 2.7.
> 
> The Python configure script sets ac_cv_working_tzset to 'no' when
> cross compiling, although it should be available and work with all 
> toolchains supported by Buildroot (?).
> The patch below pre-sets the variable so that time.tzset() works.
> 
> Signed-off-by: Henry Margies <henry.margies@gmail.com>
> ---
>  package/python/python.mk |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)

Looks good to me:

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

However, it would be nice to also submit a similar patch for the
python3 package. Also, we should really audit all the AC_RUN_IFELSE()
invocation from Python configure.ac script to see which cache variables
should be prefilled from the pyhon{3,}.mk.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
