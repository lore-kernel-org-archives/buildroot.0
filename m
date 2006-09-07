From: Bernhard Fischer <rep.nop@aon.at>
Date: Thu, 7 Sep 2006 09:34:12 +0200
Subject: [Buildroot] "CONFIG_SYSLOGD" redefined
In-Reply-To: <44FF2092.10509@shaunburdick.com>
References: <44FF2092.10509@shaunburdick.com>
Message-ID: <20060907073412.GB29140@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 06, 2006 at 03:25:06PM -0400, Shaun Burdick wrote:
>Hello everyone,
>I wanted to say hello and great idea on the buildroot project.
>I am having a little trouble finishing the compile however, and I was
>wondering if I could get some help.
>I searched in the malling list archives (recent google search) and could
>not find any reference to the make error I receive.
>
>It errors out complaining:
>
>/home/shaun/svn/buildroot/build_i686/busybox/init/init.c:13:1:
>"CONFIG_SYSLOGD" redefined
>In file included from
>/home/shaun/svn/buildroot/build_i686/busybox/include/busybox.h:10,
>                 from
>/home/shaun/svn/buildroot/build_i686/busybox/init/init.c:12:
>/home/shaun/svn/buildroot/build_i686/busybox/include/bb_config.h:2669:1:
>this is the location of the previous definition

Looks like you have configured busybox to include the syslog applet but
also have selected to build the big syslog package. I'd unselect the
syslog in the "packages" submenu and only use the syslog provided by
busybox.
