From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 20:38:52 +0100
Subject: [Buildroot] [PATCH v2 09/25] rsyslog: fix systemd service
 installation
In-Reply-To: <1426878856-15747-10-git-send-email-mike@mikebwilliams.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
 <1426878856-15747-10-git-send-email-mike@mikebwilliams.com>
Message-ID: <20150320203852.5f23a9ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike Williams,

On Fri, 20 Mar 2015 15:14:00 -0400, Mike Williams wrote:

>  define RSYSLOG_INSTALL_INIT_SYSTEMD
> -	ln -sf /lib/systemd/system/rsyslog.service \
> +	ln -fs ../../../usr/lib/systemd/system/rsyslog.service \
>  		$(TARGET_DIR)/etc/systemd/system/syslog.service

Are you sure?

Isn't the syslog.service -> rsyslog.service symbolic link meant to have
kind of a "compatibility" service name? If so, shouldn't this symlink
be in /usr/lib/systemd/system/ instead ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
