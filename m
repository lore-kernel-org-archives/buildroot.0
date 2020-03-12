From: Carlos Santos <unixmania@gmail.com>
Date: Thu, 12 Mar 2020 10:43:37 -0300
Subject: [Buildroot] [PATCH v3 1/3] package/linuxptp: make initscript
 options configurable
In-Reply-To: <20200310080722.12742-2-heiko.thiery@gmail.com>
References: <20200310080722.12742-1-heiko.thiery@gmail.com>
 <20200310080722.12742-2-heiko.thiery@gmail.com>
Message-ID: <CAJ4jsaeVfSiMGbjsXER2t2dAa8Kgi0R8ut=jvA43Kp-ayn-9ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 10, 2020 at 5:08 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> The "package/busybox/S01sysklogd" is taken as template to change the
> init script of the linuxptp daemon. The init script is split two parts
> because there are 2 daemons (ptp4l and phc2sys).
>
> Let the user supply its own options in /etc/default/ptp4l and
> /etc/default/phc2sys.
>
> This patch also fixes an issue with the creation of the pid file that is
> needed to properly stop the daemon again.
>
> Signed-off-by: Michael Walle <michael@walle.cc>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Tested-by: Carlos Santos <unixmania@gmail.com>
---
Testes on an Intel C3000 device

    02:00.0 Ethernet controller: Intel Corporation I210 Gigabit
Network Connection (rev 03)

after adding

==> /etc/default/phc2sys <==
PHC2SYS_ARGS="-s enp2s0 -c CLOCK_REALTIME -w -S 1.0"

==> /etc/default/ptp4l <==
PTP4L_ARGS="-i enp2s0 -f /etc/linuxptp.cfg -m"
