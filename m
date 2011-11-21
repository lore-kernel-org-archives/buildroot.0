From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 21 Nov 2011 10:34:32 +0100
Subject: [Buildroot] systemd
In-Reply-To: <CAAfyv34FVf5V-ZH4-xapeG8F+2VSgXOWMsf+5O03m9wimRx1Ug@mail.gmail.com>
References: <CAAfyv34FVf5V-ZH4-xapeG8F+2VSgXOWMsf+5O03m9wimRx1Ug@mail.gmail.com>
Message-ID: <4ECA1B28.50907@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 18/11/2011 21:02, Belisko Marek wrote:
> Hi,
> 
> when looking for ELCE 2011 videos one video was very
> interesting:http://events.linuxfoundation.org/events/embedded-linux-conference-europe/kooi
> There is a lot of discussion about decreasing boot time for embedded
> systems and systemd seems not yet included in buildroot (OE have it
> also angstrom).
> 
> Is there anybody who working on this or can I start integration to buildroot?

After attending this exact talk, I've begun to work on some integration
of systemd in Buildroot.

This has been stalled lately because I didn't have time to improve my
initial implementation, but basically, I have for now :
  - Made the systemd package
  - Added new package variables to define both Sys-V and systemd-format
init scripts
  - Added the needed logic so that you can only select one of the init
systems available in Buildroot (sysvinit, Busybox, systemd)
  - Migrated the existing packages to use the mentionned variables.

I still have some issues that I need to address, that explains why I
haven't yet posted the patches :
  - I have a bug that adds the sysv init scripts to the target even if
it shouldn't
  - I have not tested it "live" yet

I'll try to work on it this week

Maxime

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
