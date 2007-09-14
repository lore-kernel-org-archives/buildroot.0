From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 14 Sep 2007 20:06:27 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  lm-sensors
In-Reply-To: <46EA70E4.9090803@carallon.com>
References: <20070901180109.C927EA5D29@busybox.net>
	<12670634.post@talk.nabble.com> <20070914092913.GA26234@aon.at>
	<46EA589C.3060407@carallon.com> <20070914112618.GA28176@aon.at>
	<46EA70E4.9090803@carallon.com>
Message-ID: <20070914180627.GH20058@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 14, 2007 at 12:30:44PM +0100, Will Wagner wrote:
> Bernhard,
>
> The only other thing is that the sensors executable needs the 
> /etc/sensors.conf file otherwise it will fail to run. The default file is 
> enormous but it does work.

Since i never built it, can you tell me where the .conf lives?
Something like this could perhaps strip it a bit (iff there defaults, of
course..)
	cp -dpf $(LM_SENSORS_DIR)/the.conf $(TARGET_DIR)/the.conf
	$(SED) '/^#/d' -e "s/#.*//g" -e "/^$/d" $(TARGET_DIR)/the.conf
	# or something like this, perhaps. Manually customize it
	# otherwise, or provide your own, i'd say.
HTH,
Bernhard
