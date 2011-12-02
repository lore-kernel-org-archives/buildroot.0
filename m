From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Dec 2011 13:00:26 +0100
Subject: [Buildroot] [PATCH] Add package for Gnome NetworkManager
In-Reply-To: <1322824479-32767-1-git-send-email-zonque@gmail.com>
References: <1322824479-32767-1-git-send-email-zonque@gmail.com>
Message-ID: <20111202130026.04528496@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri,  2 Dec 2011 12:14:39 +0100,
Daniel Mack <zonque@gmail.com> a ?crit :

> +	test -z "`ls -A $(TARGET_DIR)/etc/rc.d`" && rmdir $(TARGET_DIR)/etc/rc.d || echo ""

Isn't rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/etc/rc.d a bit
simpler ?

> +$(eval $(call AUTOTARGETS,package,network-manager))

Should just be

$(eval $(call AUTOTARGETS))

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
