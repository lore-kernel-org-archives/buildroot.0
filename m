From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 23:49:28 +0200
Subject: [Buildroot] [PATCH] package/cryptsetup: fix tmpfiles.d setup
In-Reply-To: <20210614104210.2100899-1-john@metanate.com>
References: <20210614104210.2100899-1-john@metanate.com>
Message-ID: <20210720234928.514f384f@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 14 Jun 2021 11:42:10 +0100
John Keeping <john@metanate.com> wrote:

> The configure script uses pkg-config to detect the location of
> tmpfiles.d but imposes an unspecified ordering dependency with systemd.
> Instead of relying on systemd being built before cryptsetup, set the
> directory path explcitly, and ensure it is not set when systemd-tmpfiles
> is disabled.
> 
> Signed-off-by: John Keeping <john@metanate.com>
> ---
>  package/cryptsetup/cryptsetup.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
