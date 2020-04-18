From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Apr 2020 18:47:18 +0200
Subject: [Buildroot] [PATCHv2] support/scripts/boot-qemu-image.py:
 handle when pexpect.spawn() exit early
In-Reply-To: <20200418161023.1221799-1-romain.naour@gmail.com>
References: <20200418161023.1221799-1-romain.naour@gmail.com>
Message-ID: <20200418184718.43631b8e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 18 Apr 2020 18:10:23 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> diff --git a/support/scripts/boot-qemu-image.py b/support/scripts/boot-qemu-image.py
> index 2c1afba398..f2abaf83ed 100755
> --- a/support/scripts/boot-qemu-image.py
> +++ b/support/scripts/boot-qemu-image.py
> @@ -34,7 +34,7 @@ def main():
>          # In this case, spawn above will succeed at starting the wrapper
>          # start-qemu.sh, but that one will fail (exit with 127) in such
>          # a situation.
> -        exit = [int(l.split(' ')[1])
> +        exit = [int(l.split(' ')[1] if l is None else int(127))

I know I'm not very good with Python, but if I read this correctly you
are doing l.split() if l is None here, so you're trying to do a
l.split() precisely when is None... Are you sure this is working ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
