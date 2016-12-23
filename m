From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Dec 2016 14:27:25 +0100
Subject: [Buildroot] [RFC PATCH] util-linux: fix build with ncurses
In-Reply-To: <1482424027-9369-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1482424027-9369-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20161223142725.3f8ddf09@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Dec 2016 21:57:07 +0530, Rahul Bedarkar wrote:

> diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> index 9b70f9f..e957f84 100644
> --- a/package/util-linux/Config.in
> +++ b/package/util-linux/Config.in
> @@ -1,6 +1,5 @@
>  menuconfig BR2_PACKAGE_UTIL_LINUX
>  	bool "util-linux"
> -	depends on BR2_USE_WCHAR

This part of the patch is very incomplete: if you remove the dependency
of util-linux on BR2_USE_WCHAR, then you need to check all the reverse
dependencies of util-linux, and see if they still need their
BR2_USE_WCHAR dependency.?And of course do that recursively for the
reverse dependencies of the reverse dependencies.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
