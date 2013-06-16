From: Simon Dawson <spdawson@gmail.com>
Date: Sun, 16 Jun 2013 16:59:06 +0100
Subject: [Buildroot] [PATCH] gpsd: make init script optional
In-Reply-To: <20130616130904.GD3495@free.fr>
References: <1371382468-5838-1-git-send-email-spdawson@gmail.com>
 <20130616130904.GD3495@free.fr>
Message-ID: <CAHt8ZCPnR+9SG=rDfyzeLQcbT=UWAwhun4PJ31Ohk=60=0+a7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Maxime.

On 16 June 2013 14:09, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Why would one not want the init script? Is this because of systemd? If so,
> then you should use GPSD_INSTALL_INIT_SYSV and GPSD_INSTALL_INIT_SYSTEMD
> as pointed out by Maxime.
>
> This ensures the init script will only be installed if a SysV init
> scheme is used (and conversely for the systemd unit).
>
> Otherwise, please expand on why not wanting the init script should be
> configurable at all.

There are other possibilities, beyond SysV and systemd: I've
previously run gpsd and other managed services using daemontools and
runit. My present use case has udev kicking off gpsd in response to
hotplug events for a USB GPS device.

I seem to always end up having to remove the gpsd SysV init script in
my post-build script; hence the desire for a configuration option.

Simon.
