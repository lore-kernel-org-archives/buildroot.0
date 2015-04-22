From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 22:53:24 +0200
Subject: [Buildroot] [PATCH 3/5] rsyslog: fix systemd service
 installation
In-Reply-To: <1429638638-28695-4-git-send-email-mike@mikebwilliams.com>
References: <1429638638-28695-1-git-send-email-mike@mikebwilliams.com>
 <1429638638-28695-4-git-send-email-mike@mikebwilliams.com>
Message-ID: <20150422225324.0612190c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike Williams,

On Tue, 21 Apr 2015 13:50:36 -0400, Mike Williams wrote:

>  define RSYSLOG_INSTALL_INIT_SYSTEMD
> -	ln -sf /lib/systemd/system/rsyslog.service \
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system
> +	ln -fs ../../../usr/lib/systemd/system/rsyslog.service \
>  		$(TARGET_DIR)/etc/systemd/system/syslog.service

Why are we doing this link? In all other systemd service installation,
we:

 1/ install to /usr/lib/systemd/system/ when the service file has not
    been installed by the package build system itself.

 2/ create a symlink
    from /etc/systemd/system/multi-user.target.wants/<foo>.service
    to /usr/lib/systemd/system/rsyslog.service

Why would we need this additional symlink here?

(Remember that when you're talking to me, you're talking to a complete
system newbie.)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
