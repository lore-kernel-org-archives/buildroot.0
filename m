From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 23:25:30 +0200
Subject: [Buildroot] [PATCH 2/2] fcgiwrap: Add a patch to link with
 libsystemd, not libsystemd-daemon.
In-Reply-To: <1468852130-1525-3-git-send-email-thomas.claveirole@green-communications.fr>
References: <1468852130-1525-1-git-send-email-thomas.claveirole@green-communications.fr>
 <1468852130-1525-3-git-send-email-thomas.claveirole@green-communications.fr>
Message-ID: <20160718232530.6d98be5e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Jul 2016 16:28:50 +0200, Thomas Claveirole wrote:
> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>

I've added a reference to the autobuilder fixed by this commit, and
applied. However, see below...

> ---
>  ...ith-libsystemd-instead-of-libsystemd-daemon.patch | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 package/fcgiwrap/0002-link-with-libsystemd-instead-of-libsystemd-daemon.patch
> 
> diff --git a/package/fcgiwrap/0002-link-with-libsystemd-instead-of-libsystemd-daemon.patch b/package/fcgiwrap/0002-link-with-libsystemd-instead-of-libsystemd-daemon.patch
> new file mode 100644
> index 0000000..e88706f
> --- /dev/null
> +++ b/package/fcgiwrap/0002-link-with-libsystemd-instead-of-libsystemd-daemon.patch
> @@ -0,0 +1,20 @@
> +configure.ac: Check for libsystemd, not libsystemd-daemon.
> +
> +Newer versions of systemd do not provide libsystemd-daemon anymore.
> +Therefore, use libsystemd instead.
> +
> +Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>

it would have been good for this patch to be formatted with "git
format-patch", just like the existing 0001 patch on this package.

Also, both patches should be submitted upstream, especially since
upstream is hosted on Github, which makes it really easy to submit pull
requests.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
