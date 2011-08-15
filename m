From: Daniel Mack <zonque@gmail.com>
Date: Mon, 15 Aug 2011 16:18:40 +0200
Subject: [Buildroot] /run/udev missing ?
In-Reply-To: <1313416862.29966.2.camel@sven>
References: <1313137798.1017.5.camel@sven> <87ty9kh4sh.fsf@macbook.be.48ers.dk>
 <1313396462.31752.3.camel@sven>
 <878vqvgi3g.fsf@macbook.be.48ers.dk>
 <1313400852.26653.4.camel@sven>
 <874o1iho3k.fsf@macbook.be.48ers.dk>
 <1313416862.29966.2.camel@sven>
Message-ID: <CACTFLAP++2iZOJHkzpqrOuU6RtxAAEWiZ_tC7EbKeOotywwXUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 15, 2011 at 4:01 PM, Sven Neumann <s.neumann@raumfeld.com> wrote:
> Still I wonder why udevd is looking for "/run/udev". Shouldn't this
> be /var/run/udev ? Looks to me like udevd is configured with a wrong
> prefix for the run directory.

/run was introduced recently by systemd and udev, considering the fact
that /var might be mounted on partitions that are not yet available
when systemd starts. So this sounds like the new standard, and It's
likely that buildroot needs to be amended in this case.


Daniel
