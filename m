From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Jun 2020 22:51:21 +0200
Subject: [Buildroot] [PATCH 2/3] package/binutils: switch to use 2.33.1
 as the default version
In-Reply-To: <20200625121302.2286527-2-romain.naour@gmail.com>
References: <20200625121302.2286527-1-romain.naour@gmail.com>
 <20200625121302.2286527-2-romain.naour@gmail.com>
Message-ID: <20200629225121.468e8a73@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 25 Jun 2020 14:13:01 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Now that binutils 2.34 has been released, it is time to move to
> binutils 2.33.1 as the default binutils version, instead of 2.32.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/binutils/Config.in.host | 2 +-
>  package/binutils/binutils.mk    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

However, I wondered about this:

-BINUTILS_VERSION = 2.32
+BINUTILS_VERSION = 2.33.1

and the BR2_BINFMT_FLAT case. Indeed, if you don't build a
host-binutils and only a target binutils, the version compiled is now
going to be 2.33.1, which is "broken" on BINFMT_FLAT platforms. So I
thought we should keep using 2.32 on those platforms.

But then, in fact, we don't have support for building elf2flt for the
target anyway, so we're not building any useful binutils for the target
for BINFMT_FLAT platforms. So I just left your patch as-is.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
