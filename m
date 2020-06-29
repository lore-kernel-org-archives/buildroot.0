From: Alexander Dahl <post@lespocky.de>
Date: Mon, 29 Jun 2020 11:30:45 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/haveged: Change service file
 to run early
In-Reply-To: <CADYdroNxW-em_kbTZ8iYOuc=6WOkoOWoDOvdCohVbfCU4T74oA@mail.gmail.com>
References: <20200609224116.13607-1-nolange79@gmail.com>
 <20200609224116.13607-2-nolange79@gmail.com>
 <CADYdroMM5zNtnQ8J7soZo+Vnv6eSuZFVj6Bq+GyZ4UyB4xkEgg@mail.gmail.com>
 <CAFvCimVKi8eTQHnO6t0ZhcT86X74hqyM4JzQTJ_XWyxNVSFAWA@mail.gmail.com>
 <CADYdroNxW-em_kbTZ8iYOuc=6WOkoOWoDOvdCohVbfCU4T74oA@mail.gmail.com>
Message-ID: <20200629093044.eurgl7qjx4xkd3vv@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

On Mon, Jun 29, 2020 at 10:29:38AM +0200, Norbert Lange wrote:
> Haveged is not entropy, it's a substitute. I dont know how many times I
> need to point that out.

As far as I understood the source for the entropy haveged collects is
random timing jitter from the CPU. Could you explain, why that is not
real entropy, although it passes the FIPS tests? Or point to an
explanation to learn from?

> The less dependencies, the faster the system can startup (and lesser
> chances of some stoopid deadlocks).

This might be true in general, but it is not necessarily on embedded
systems waiting for the kernel's crng to be initialized. If that
initialization is a requirement and the system has very few entropy
sources only (think of an embedded device with no network initialized,
no HID, no sensors, ?) the boot can actually hours or days, seriously.

Greets
Alex

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200629/1c8abc01/attachment.asc>
