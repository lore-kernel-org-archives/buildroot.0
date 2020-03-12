From: Carlos Santos <unixmania@gmail.com>
Date: Thu, 12 Mar 2020 13:37:13 -0300
Subject: [Buildroot] [PATCH v3 2/3] package/linuxptp: rename systemd
 service scripts
In-Reply-To: <20200310080722.12742-3-heiko.thiery@gmail.com>
References: <20200310080722.12742-1-heiko.thiery@gmail.com>
 <20200310080722.12742-3-heiko.thiery@gmail.com>
Message-ID: <CAJ4jsaeLDh7H0daVdacs128DLx1RA4m-epn+2QckJk__FYSWfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 10, 2020 at 5:08 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> Use the same name as for the SysVinit scripts. This name is also used in
> debian.
>
> linuxptp-system-clock.service -> phc2sys.service
> linuxptp.service -> ptp4l.service
>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Tested-by: Carlos Santos <unixmania@gmail.com>
---
Tested on an Intel C3000 device

    02:00.0 Ethernet controller: Intel Corporation I210 Gigabit
Network Connection (rev 03)

after adding

==> /etc/linuxptp.cfg <==
[global]
slaveOnly        1
delay_mechanism        Auto
network_transport    UDPv4
time_stamping        hardware
step_threshold        1.0

[enp2s0]
