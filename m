From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 Jan 2014 18:42:54 +0100
Subject: [Buildroot] [PATCH] libnfc-llcp: rename to libllcp and bump
 version
In-Reply-To: <1389287265-1498-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1389287265-1498-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140109174254.GA3713@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2014-01-09 17:07 +0000, Vicente Olivert Riera spake thusly:
> This package has been renamed upstream to libllcp. Also, the current
> package we have in Buildroot fails to compile due to a version bump of
> it's main dependence, libnfc. A version bump is required because this
> package has been adapted upstream to work with libnfc-1.7.0-rc6.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/Config.in                          |    2 +-
>  package/{libnfc-llcp => libllcp}/Config.in |    6 +++---
>  package/libllcp/libllcp.mk                 |   15 +++++++++++++++
>  package/libnfc-llcp/libnfc-llcp.mk         |   15 ---------------
>  4 files changed, 19 insertions(+), 19 deletions(-)
>  rename package/{libnfc-llcp => libllcp}/Config.in (56%)
>  create mode 100644 package/libllcp/libllcp.mk
>  delete mode 100644 package/libnfc-llcp/libnfc-llcp.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 8af6a1e..ce9a130 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -567,7 +567,7 @@ source "package/libhid/Config.in"
>  source "package/libiqrf/Config.in"
>  source "package/libmbim/Config.in"
>  source "package/libnfc/Config.in"
> -source "package/libnfc-llcp/Config.in"
> +source "package/libllcp/Config.in"

Keep the alphabetical order (ie. move it between libiqrf and libmbim).

> diff --git a/package/libllcp/libllcp.mk b/package/libllcp/libllcp.mk
> new file mode 100644
> index 0000000..4a3c2c4
> --- /dev/null
> +++ b/package/libllcp/libllcp.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# libllcp
> +#
> +################################################################################
> +
> +LIBLLCP_VERSION = cf0c4b3c9df98851c6092c130192130c3f5a46bd
> +LIBLLCP_SITE = https://libllcp.googlecode.com/git/
> +LIBLLCP_SITE_METHOD = git
> +LIBLLCP_DEPENDENCIES = libnfc
> +LIBLLCP_AUTORECONF = YES

It's not obvious why AUTORECONF is needed, so just add a small note,
like:
    # There's no ./configure is the repository, so we need to autoreconf
    LIBLLCP_AUTORECONF = YES

> +LIBLLCP_AUTORECONF_OPT = --install --force --verbose

Are those autoreconf opts still needed with this new version?

Also, please add the licensing terms while you are at it:
    LIBLLCP_LICENSE = GPLv3+
    LIBLLCP_LICENSE_FILES = COPYING

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
