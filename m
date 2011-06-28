From: =?UTF-8?Q?Beno=C3=AEt_Mauduit?= <benoit.mauduit@gmail.com>
Date: Tue, 28 Jun 2011 17:42:50 +0200
Subject: [Buildroot] [PATCH] [package/config] Change behaviour of
	symlink .config
In-Reply-To: <20110628161807.094016bd@skate>
References: <1309262850-11224-1-git-send-email-benoit.mauduit@openwide.fr>
 <20110628161807.094016bd@skate>
Message-ID: <BANLkTimi895==H2_wovhoSsyFMewHCpdFYUVYRYaCH48-ANz1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 28, 2011 at 4:18 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> I am not sure to understand your use case. Isn't using out-of-tree
> builds with O= a better solution, if what you want is to have the
> config file outside of the Buildroot source directory ?

I will try to explain my use case :
We use buildroot as a tool inside another, but we want to have the
choice of the tool for particular target.
For example, if I want to build the kernel and rootfs with Buildroot
and the bootloader with another tool.
Actually, the "Buildroot tool" is a Buildroot wrapper. It can be
configured with buildroot .config files and keep track of them in
another directory with another config filename.

We can save config for specific board (using make savedefconfig), but
we don't want to because is much for development purpose.
Also, we don't need to export the output of buildroot in another
directory. The trivial solution is to override the CONFIG_DIR variable
but we must name the config file ".config".

I know this patch is not useful for buildroot itself, but if it can
help some users.

> Regards,
Thanks for the review :)


-- 
Beno?t Mauduit
