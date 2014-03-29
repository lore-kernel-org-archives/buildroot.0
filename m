From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Mar 2014 12:50:03 +0100
Subject: [Buildroot] [PATCH 4/6] scons: force host-python dependency to
 be python2
In-Reply-To: <1394057085-10399-5-git-send-email-s.martin49@gmail.com>
References: <1394057085-10399-1-git-send-email-s.martin49@gmail.com>
 <1394057085-10399-5-git-send-email-s.martin49@gmail.com>
Message-ID: <20140329115003.GG3227@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-03-05 23:04 +0100, Samuel Martin spake thusly:
> Scons build-system needs python2 as interpreter (it does not support
> python3 yet).
> 
> So, we need to force the host dependency to get the python2 interperter
> built and available in the host tree to be able to build host-scons
> itself and to build scons-based packages, whatever is the python
> interpreter for the target.
> 
> This patch also makes sure scons will in be called using the right
> python interpreter when invoked via $(SCONS).
> 
> Fixes:
>   http://autobuild.buildroot.net/results/11e6c8c8d79d56ed43daf52e6d6dc80847709926/
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

If the variable is renamed, my reviewed-by will still be valid.

Regards,
Yann E. MORIN.

> ---
>  package/scons/scons.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/scons/scons.mk b/package/scons/scons.mk
> index e3fad1b..88396d4 100644
> --- a/package/scons/scons.mk
> +++ b/package/scons/scons.mk
> @@ -10,10 +10,12 @@ SCONS_LICENSE = MIT
>  SCONS_LICENSE_FILES = LICENSE.txt
>  SCONS_SETUP_TYPE = distutils
>  
> +HOST_SCONS_FORCE_HOST_PYTHON = python2
> +
>  HOST_SCONS_INSTALL_OPT = \
>  	--install-lib=$(HOST_DIR)/usr/lib/scons-$(SCONS_VERSION)
>  
>  $(eval $(host-python-package))
>  
>  # variables used by other packages
> -SCONS = $(HOST_DIR)/usr/bin/scons
> +SCONS = $(HOST_DIR)/usr/bin/python2 $(HOST_DIR)/usr/bin/scons
> -- 
> 1.9.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
