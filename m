From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 22:25:06 +0100
Subject: [Buildroot] [Buildroot PATCH Selinux v10 01/11] dbus: selinux
 file context support
In-Reply-To: <1455603506-26138-1-git-send-email-niranjan.reddy@rockwellcollins.com>
References: <1455603506-26138-1-git-send-email-niranjan.reddy@rockwellcollins.com>
Message-ID: <20160223222506.168bbff3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Niranjan,

Thanks a lot for respining the SELinux patch series. If you have some
time to work on this in the coming weeks to send new iterations as
needed, I really hope to be able to merge this for 2016.05.

On Tue, 16 Feb 2016 11:48:16 +0530, Niranjan Reddy wrote:

> diff --git a/package/dbus/S30dbus b/package/dbus/S30dbus
> index 4427b5c..6fbf915 100644
> --- a/package/dbus/S30dbus
> +++ b/package/dbus/S30dbus
> @@ -17,6 +17,10 @@
>  [ -d /var/run/dbus ] || mkdir -p /var/run/dbus
>  [ -d /var/lock/subsys ] || mkdir -p /var/lock/subsys
>  [ -d /tmp/dbus ] || mkdir -p /tmp/dbus
> +[ -d /var/lib/dbus ] || mkdir -p /var/lib/dbus
> +if [ -e /sbin/restorecon ]; then
> +   restorecon -R /var/run/dbus /var/lock/subsys /tmp/dbus /var/lib/dbus
> +fi

This really needs a better commit message. Why are you doing this? Why
do you need to create /var/lib/dbus if it doesn't exist? Why do you
need to do a restorecon on /var/lock/subsys, which doesn't look
immediately related to dbus.

Could you give some more details, and integrate those details in a
commit log?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
