From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Oct 2011 22:01:30 +0200
Subject: [Buildroot] [PATCH 1/9] Allow timezone to be set in
 configuration
In-Reply-To: <201110151151.43592.arnout@mind.be>
References: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
 <1318603921-22899-2-git-send-email-will_wagner@carallon.com>
 <201110151151.43592.arnout@mind.be>
Message-ID: <20111017220130.30ce6f38@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 15 Oct 2011 11:51:42 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  Why not just create the file here?  I.e.
> 
> 	echo $(TARGET_GENERIC_TIMEZONE) > $(TARGET_DIR)/etc/TZ
> 
>  Perhaps even move it out of the SKELETON_DEFAULT condition.

Agreed.

However, it would be good to mention in the config option help text
that this only works with uClibc. I don't ask to do it in this patch
(because it's a lot more work), but it would be great to make this
works for glibc as well (where it's not /etc/TZ, but /etc/timezone,
with a different syntax).

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
