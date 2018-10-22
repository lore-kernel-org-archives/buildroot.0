From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Oct 2018 23:19:06 +0100
Subject: [Buildroot] [PATCH 1/1] dbus-python: add host package
In-Reply-To: <20181015235048.12213-1-bgenerous@impinj.com>
References: <20181015235048.12213-1-bgenerous@impinj.com>
Message-ID: <bc24bc91-3edd-85b7-04bc-ba45d280532d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Brent,

On 10/16/18 12:51 AM, Brent Generous wrote:
> This can be useful for Python scripts running on a host machine that
> need to connect to a bus on a remote device, e.g. test scripts.
> 
> Signed-off-by: Brent Generous <bgenerous@impinj.com>
> ---
>  package/dbus-python/dbus-python.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
> index da04b7404f..cc3fd97c9d 100644
> --- a/package/dbus-python/dbus-python.mk
> +++ b/package/dbus-python/dbus-python.mk
> @@ -29,3 +29,4 @@ DBUS_PYTHON_CONF_ENV += \
>  endif
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))

 We only accept host packages that are either a dependency of some other
package, or can be selected through a Config.in.host option. Otherwise, its
build will never get tested in the autobuilders, and it's not visible.

 Regards,
 Arnout
