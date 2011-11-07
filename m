From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2011 16:21:57 +0100
Subject: [Buildroot] [PATCH] sysklogd: Check for hanging link file also
 when installing the conf file.
In-Reply-To: <1320676850-20690-1-git-send-email-ryan.raasch@gmail.com>
References: <1320676850-20690-1-git-send-email-ryan.raasch@gmail.com>
Message-ID: <20111107162157.783b9a2f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 7 Nov 2011 15:40:50 +0100,
Ryan Raasch <ryan.raasch@gmail.com> a ?crit :

> -	if [ ! -f $(TARGET_DIR)/etc/syslog.conf ]; then \
> +	if [ ! -f $(TARGET_DIR)/etc/syslog.conf ] && [ ! -h $(TARGET_DIR)/etc/syslog.conf ] ; then \

Wouldn't

> -	if [ ! -e $(TARGET_DIR)/etc/syslog.conf ]; then \

Be better ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
