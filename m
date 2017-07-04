From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 09:01:52 +0200
Subject: [Buildroot] [PATCH 2/2 v2] system: use Etc/UTC as default
 timezone
In-Reply-To: <4928890759713fe0a785e193fa843dcff9805ed6.1499151384.git.yann.morin.1998@free.fr>
References: <cover.1499151384.git.yann.morin.1998@free.fr>
 <4928890759713fe0a785e193fa843dcff9805ed6.1499151384.git.yann.morin.1998@free.fr>
Message-ID: <20170704090152.388e8128@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jul 2017 08:56:39 +0200, Yann E. MORIN wrote:
> Even though no timezone implicitly means UTC, systemd is not all that
> happy when it does not have a timezone set. This is all fine on a RW
> filesystem because systemd will create a symlink on its own (to
> Etc/UTC), but not so much on a RO filesystem, causing all kind of
> issues at boot time (up to the point that the system is unusable).
> 
> We fix that by requiring that the timezone is actually set. The check is
> done by verifying that the timezone file is an actual file; if not set,
> the test would find a directory and would thus fail.
> 
> Update the help entry accordingly.
> 
> Also fix indentation in tzdata.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Richard Braun <rbraun@sceen.net>
> Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Cc: Martin Bark <martin@barkynet.com>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - don't accept an empty value as meaning the default; enforce that
>     (Arnout)
>   - comit log mentions indentation cleanups  (Arnout)

As discussed IRL, I have changed the commit title. Indeed, Etc/UTC is
already the default timezone. What this patch does is prevent the user
from selecting an empty value for the timezone.

Applied with the commit title fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
