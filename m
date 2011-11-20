From: Robert Schwebel <r.schwebel@pengutronix.de>
Date: Sun, 20 Nov 2011 20:15:21 +0100
Subject: [Buildroot] systemd
In-Reply-To: <87obw9rvc7.fsf@macbook.be.48ers.dk>
References: <CAAfyv34FVf5V-ZH4-xapeG8F+2VSgXOWMsf+5O03m9wimRx1Ug@mail.gmail.com>
 <87obw9rvc7.fsf@macbook.be.48ers.dk>
Message-ID: <20111120191521.GG12903@pengutronix.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Nov 18, 2011 at 10:09:44PM +0100, Peter Korsgaard wrote:
>  Belisko> when looking for ELCE 2011 videos one video was very
>  Belisko> interesting:http://events.linuxfoundation.org/events/embedded-linux-conference-europe/kooi
>  Belisko> There is a lot of discussion about decreasing boot time for embedded
>  Belisko> systems and systemd seems not yet included in buildroot (OE have it
>  Belisko> also angstrom).

ptxdist has systemd support as well. We are in fact migrating all our
newer BSPs to systemd.

> Notice that systemd pulls in quite some dependencies, so it might not
> really be a net gain in the end depending on your setup - In Koens
> presentation he mentioned that his OE setup spends more than a minute
> from init to finished booting, which is quite far from a typical
> buildroot boot.

Our impression after half a year of experience with systemd in embedded
scenarios is that it is worth the effort. The whole beast is a really,
really great idea, because it solves so many standard problems in a very
clean and clever way. However, don't expect magic when it comes to boot
times. The old strategy that a system boots the quicker the less it does
is still vaild. If you do a lot of things, it will take it's time.

Where we find it helpful is:

- have a clean abstraction of "services"
- be able to deal with services via an API (not just scripts)
- integration of application scenarios ontop of a base operating system
- watchdog handling (we are trying to integrate watchdog into systemd
  mainline)
- security aware environments (it may be possible to run systems without
  a shell)
- and of course all the other selling points which have been outlined by
  the systemd people.

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
