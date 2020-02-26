From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 22:35:54 +0100
Subject: [Buildroot] [PATCH] package/util-linux: disable systemd for
 host build
In-Reply-To: <20200219112559.1429304-1-john@metanate.com>
References: <20200219112559.1429304-1-john@metanate.com>
Message-ID: <20200226223554.4110bcf8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 19 Feb 2020 11:25:59 +0000
John Keeping <john@metanate.com> wrote:

> When building host-util-linux, the systemdsystemunitdir is set to the
> real host directory, so the install step fails with:
> 
> /usr/bin/install: cannot remove '/usr/lib/systemd/system/fstrim.service': Permission denied
> /usr/bin/install: cannot remove '/usr/lib/systemd/system/fstrim.timer': Permission denied
> 
> Since we don't need systemd support in host-util-linux, unconditionally
> disable it for the host build.
> 
> Signed-off-by: John Keeping <john@metanate.com>
> ---
>  package/util-linux/util-linux.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
