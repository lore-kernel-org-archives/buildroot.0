From: Will Wagner <will_wagner@carallon.com>
Date: Sun, 28 Jul 2013 19:19:19 +0100
Subject: [Buildroot] [git commit] busybox: register mdev as hotplug
 helper when selected
In-Reply-To: <20130728143214.749C19AD30@busybox.osuosl.org>
References: <20130728143214.749C19AD30@busybox.osuosl.org>
Message-ID: <51F560A7.8020609@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 28/07/2013 15:32, Thomas Petazzoni wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=caae7fa1d737c550b4a2f557d6e1761b93934340
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> It's also done in the kernel configuration, however users may be using
> some other pre-built kernel and miss functionality like firmware
> loading.
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   package/busybox/S10mdev |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/package/busybox/S10mdev b/package/busybox/S10mdev
> index c06aa20..d386d42 100644
> --- a/package/busybox/S10mdev
> +++ b/package/busybox/S10mdev
> @@ -6,6 +6,7 @@
>   case "$1" in
>     start)
>   	echo "Starting mdev..."
> +	echo /sbin/mdev >/proc/sys/kernel/hotplug
>   	/sbin/mdev -s
>   	;;
>     stop)

If you make that change surely you should change linux.mk to no longer 
set the option? Very confusing to have both at the same time.

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
