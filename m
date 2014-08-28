From: buildrootcharles <charles.s@mercury-security.com>
Date: Thu, 28 Aug 2014 11:00:55 -0700 (PDT)
Subject: [Buildroot] Custom kernal patch not being run
Message-ID: <1409248855849-78152.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to figure out how to create and have buildroot deploy a custom
kernel patch (on my system only). I currently have my buildroot configured
to  build a custom kernel from a tarball I have saved locally on my machine
(filename Linux-3.10.4-July302014.tar.gz), I have created a patch file
(named Linux-patch.patch) with the following content:

*** /home/MSC/SVN_BuildRoot/output/build/linux-custom/net/ipv4/ipconfig.c
2014-07-22 14:45:55.000000000 -0700
--- /home/MSC/SVN_BuildRoot/board/ep4502/linux-patches/ipconfig.c	2014-08-28
10:00:33.824586558 -0700
***************
*** 89,96 ****
  
  /* Define the friendly delay before and after opening net devices */
  #define CONF_POST_OPEN		10	/* After opening: 10 msecs */
! #ifdef CONFIG_MACH_AT91SAM9G45_EP4502VBB
! #define CONF_CARRIER_TIMEOUT	12000	/* Wait for carrier timeout */
  #else
  #define CONF_CARRIER_TIMEOUT	120000	/* Wait for carrier timeout */
  #endif
--- 89,96 ----
  
  /* Define the friendly delay before and after opening net devices */
  #define CONF_POST_OPEN		10	/* After opening: 10 msecs */
! #ifdef CONFIG_MACH_AT91SAM9G45_EP4502MSC
! #define CONF_CARRIER_TIMEOUT	30000	/* Wait for carrier timeout */
  #else
  #define CONF_CARRIER_TIMEOUT	120000	/* Wait for carrier timeout */
  #endif

I have specified the directory where the patch resides in the
BR2_LINUX_KERNEL_PATCH="/home/patchdirectory/"
whenever I run make Linux-rebuild it never seems to find my patch, do I have
it named wrong?  can anyone help, I've been stuck on this for nearly 2 days?
thanks.



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Custom-kernal-patch-not-being-run-tp78152.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
