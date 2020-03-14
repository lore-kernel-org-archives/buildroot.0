From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
Date: Sat, 14 Mar 2020 17:10:09 +0100
Subject: [Buildroot] [PATCH v5 1/2] package/netdata: new package
In-Reply-To: <CAJ4jsade7E3qgdaFaTZq2fMgpxpE26nmrjzjU6Kzm8f7os7iZA@mail.gmail.com>
References: <20200312160040.3416161-1-m.niestroj@grinn-global.com>
 <CAJ4jsade7E3qgdaFaTZq2fMgpxpE26nmrjzjU6Kzm8f7os7iZA@mail.gmail.com>
Message-ID: <8736aax6hq.fsf@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

Carlos Santos <unixmania@gmail.com> writes:

> [..snip..]
>
> We use start-stop-daemon in the init scripts. Please refer to
> package/sysklogd/S01syslogd as a template.

Thanks for pointing that out. I was using package/openssh/S50sshd as
template previously. Sounds like it could be updated as well, right?

>
> Since netdata always damonizes but does not create a pid file, you can
> use pidof, as made in package/irqbalance/S13irqbalance (which by the
> way was not converted to the current template yet).

There is a -P netdata option that I could use:

  -P filename              File to save a pid while running.
                           Default: do not save pid to a file

>
> Finally, I saw that netdata provides a systemd unit file in
> contrib/debian/netdata.service. It would be good to check if it works
> and add NETDATA_INSTALL_INIT_SYSTEMD to netdata.mk. Notice that this
> is just a suggestion, since it can be done it in a later patch.


-- 
Regards,
Marcin Niestr?j
