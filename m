From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 6 Nov 2018 18:32:47 -0600
Subject: [Buildroot] [PATCH v4 3/4] sysklogd: rewrite init script
In-Reply-To: <2fb11fa7-b523-f4d0-1955-648c8d9f9ba7@mind.be>
References: <20181103182427.11738-1-casantos@datacom.com.br>
 <20181103182427.11738-4-casantos@datacom.com.br>
 <CANQCQpYA3zOuH7K_SJzL3xkTVbZt8WPp1FG0K-3ODdU3AT-Y8g@mail.gmail.com>
 <2fb11fa7-b523-f4d0-1955-648c8d9f9ba7@mind.be>
Message-ID: <CANQCQpZbioW-ydZ9704LyQBw_dgqHpKDsBMiuQzsp7E6j9JZww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Tue, Nov 6, 2018 at 6:08 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 05/11/18 15:07, Matthew Weber wrote:
> > So by default the user may take a busybox based target and get the
> > logging daemons from busybox's default config.  Then they choose to go
> > enable one of the other logging options but don't understand they need
> > to make a custom busybox config.  For sysklogd, the install would just
> > copy over the init scripts busybox installed, however do we need to
> > handle this case with rsyslog(S02klogd would be left in the target
> > from busybox) and syslog-ng(both S01/S02 would be left) ?  Maybe a
> > check for existance and exit with warning that the busybox
> > configuration needs to have logging disabled....
>
>  That is handled in busybox.mk:
>
> +# Only install our logging scripts if no other package does it.
> +ifeq ($(BR2_PACKAGE_SYSKLOGD)$(BR2_PACKAGE_RSYSLOG)$(BR2_PACKAGE_SYSLOG_NG),)
>  define BUSYBOX_INSTALL_LOGGING_SCRIPT
>
>

Agree, just more of a "if you don't do a clean build" what questions
will hit the mailing list and how could we prevent that.....

Matt
