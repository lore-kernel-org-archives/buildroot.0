From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Wed, 05 Feb 2014 19:19:40 +0100
Subject: [Buildroot] [PATCH v2 2/7] libdrm: Remove dependency towards X11
References: <1391537725-15894-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP338F1C8C0E0E7FD631BCFC0D9AA0@phx.gbl> <52F1E0A6.2060409@mind.be>
Message-ID: <subasaxs7f.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Arnout Vandecappelle <arnout@mind.be> wrote in
news:52F1E0A6.2060409 at mind.be: 

>  So only the three experimental ARM drivers work without Xorg?

taking a closer look at the required dependencies it seems Xorg is only 
needed for the Intel driver

libdrm 2.4.52 will be compiled with:

  libkms         yes
  Intel API      no
  vmwgfx API     yes
  Radeon API     yes
  Nouveau API    yes
  OMAP API       yes
  EXYNOS API     yes
  Freedreno API  yes

When enabling the Intel API at least xlib_libpciaccess is needed:

checking for PCIACCESS... no
configure: error: Package requirements (pciaccess >= 0.10) were not met:

This is inline with what the LFS team writes:
http://www.linuxfromscratch.org/blfs/view/svn/x/libdrm.html

>  Not for this patch, but does libdrm do anything useful when no driver
>  is selected?

Honestly I do not know, but technically configure does not complain:

libdrm 2.4.52 will be compiled with:

  libkms         no
  Intel API      no
  vmwgfx API     no
  Radeon API     no
  Nouveau API    no
  OMAP API       no
  EXYNOS API     no
  Freedreno API  no

I will repost the patch containing fewer dependencies.

Regards, Bernd
