From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Nov 2018 01:08:05 +0100
Subject: [Buildroot] [PATCH v4 3/4] sysklogd: rewrite init script
In-Reply-To: <CANQCQpYA3zOuH7K_SJzL3xkTVbZt8WPp1FG0K-3ODdU3AT-Y8g@mail.gmail.com>
References: <20181103182427.11738-1-casantos@datacom.com.br>
 <20181103182427.11738-4-casantos@datacom.com.br>
 <CANQCQpYA3zOuH7K_SJzL3xkTVbZt8WPp1FG0K-3ODdU3AT-Y8g@mail.gmail.com>
Message-ID: <2fb11fa7-b523-f4d0-1955-648c8d9f9ba7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/11/18 15:07, Matthew Weber wrote:
> So by default the user may take a busybox based target and get the
> logging daemons from busybox's default config.  Then they choose to go
> enable one of the other logging options but don't understand they need
> to make a custom busybox config.  For sysklogd, the install would just
> copy over the init scripts busybox installed, however do we need to
> handle this case with rsyslog(S02klogd would be left in the target
> from busybox) and syslog-ng(both S01/S02 would be left) ?  Maybe a
> check for existance and exit with warning that the busybox
> configuration needs to have logging disabled....

 That is handled in busybox.mk:

+# Only install our logging scripts if no other package does it.
+ifeq ($(BR2_PACKAGE_SYSKLOGD)$(BR2_PACKAGE_RSYSLOG)$(BR2_PACKAGE_SYSLOG_NG),)
 define BUSYBOX_INSTALL_LOGGING_SCRIPT


 Regards,
 Arnout
