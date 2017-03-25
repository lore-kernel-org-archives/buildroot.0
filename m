From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 14:54:37 +0100
Subject: [Buildroot] [PATCH] busybox: fix mdev.conf
In-Reply-To: <20170324075321.12384-1-joerg.krause@embedded.rocks>
References: <20170324075321.12384-1-joerg.krause@embedded.rocks>
Message-ID: <20170325145437.76bc4442@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Mar 2017 08:53:21 +0100, J?rg Krause wrote:
> mdev does not set "/dev/snd" and "/dev/input" group and permission
> propery, because with commit c3cf1e30a3022453311a7e9fe11d94c7a381640e
> (May 2013!) the behavior of mdev has changed.
> 
> The device name is now taken directly from the uevent file and does no
> longer match the old rule.
> 
> Fix the rules for "/dev/snd" and "/dev/input" according to the example
> given in [1].
> 
> [1] http://lists.busybox.net/pipermail/busybox/2015-February/082297.html
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/busybox/mdev.conf | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
