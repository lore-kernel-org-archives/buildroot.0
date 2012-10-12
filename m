From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Oct 2012 18:37:00 +0200
Subject: [Buildroot] [PATCH v10 07/10] perl: relax microperl dependencies
In-Reply-To: <1349881591-7062-7-git-send-email-francois.perrad@gadz.org>
References: <1349881591-7062-1-git-send-email-francois.perrad@gadz.org>
 <1349881591-7062-7-git-send-email-francois.perrad@gadz.org>
Message-ID: <20121012183700.76a19f91@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Wed, 10 Oct 2012 17:06:28 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/autoconf/Config.in   |    2 +-
>  package/autoconf/autoconf.mk |    7 ++++++-
>  package/automake/Config.in   |    2 +-
>  package/automake/automake.mk |    7 ++++++-
>  package/ntp/Config.in        |    4 ++--
>  package/samba/Config.in      |    4 ++--
>  6 files changed, 18 insertions(+), 8 deletions(-)

Instead of trying to support both microperl and perl in parallel, this
patch should just switch everybody to use BR2_PACKAGE_PERL instead,
since further patches in your series are removing microperl. So don't
bother introduce complexity here to remove it in a later patch. Just
move everybody to the full blown perl instead.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
