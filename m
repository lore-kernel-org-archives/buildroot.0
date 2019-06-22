From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 22 Jun 2019 08:47:03 +0200
Subject: [Buildroot] [PATCH] support/testing/infra/emulator: increase
 memory size used by Qemu
In-Reply-To: <20190621202724.19242-1-thomas.petazzoni@bootlin.com>
References: <20190621202724.19242-1-thomas.petazzoni@bootlin.com>
Message-ID: <CAB0FRstaxLAbwM0Jp04wNQLBseYN7wKGNFnTnvZtqR9Eu1O7zg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le ven. 21 juin 2019 ? 23:15, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

> By default, Qemu emulates a system with 128 MB of RAM. This is not
> sufficient for some test cases we have, such as TestPerlDBDmysql,
> where the initramfs is quite large. Therefore, this commit extends the
> RAM size emulated by Qemu to 256 MB.
>
> Fixes:
>
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/237108668
>
> Thanks to Arnout for the analysis of the issue.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>

Acked-by: Francois Perrad <francois.perrad@gadz.org>

---
>  support/testing/infra/emulator.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/support/testing/infra/emulator.py
> b/support/testing/infra/emulator.py
> index 802e89d4b4..3d3e1750c6 100644
> --- a/support/testing/infra/emulator.py
> +++ b/support/testing/infra/emulator.py
> @@ -38,7 +38,8 @@ class Emulator(object):
>
>          qemu_cmd = ["qemu-system-{}".format(qemu_arch),
>                      "-serial", "stdio",
> -                    "-display", "none"]
> +                    "-display", "none",
> +                    "-m", "256"]
>
>          if options:
>              qemu_cmd += options
> --
> 2.21.0
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190622/158a4824/attachment.html>
