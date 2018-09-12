From: quentin.aebischer at bodet-timesport.com <quentin.aebischer@bodet-timesport.com>
Date: Wed, 12 Sep 2018 13:34:42 +0000
Subject: [Buildroot] imx8m xorg-server compilation error
Message-ID: <26608e8a84344967a3b99d53407947fe@bodet-timesport.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,


At my company, we are trying to integrate a Zulu embedded JVM with graphics support on the imx8m evk board.

For graphics support, the JVM needs an X11 backend.

I hence tried to compile xorg-server package, but compilation with following error :


make[3]: Entering directory '/home/quentin/SSD_1To_Kingston/imx8_Linux/rootfs/output/build/xserver_xorg-server-1.20.1/glamor'
  CC       glamor.lo
  CC       glamor_copy.lo
  CC       glamor_core.lo
  CC       glamor_font.lo
  CC       glamor_composite_glyphs.lo
  CC       glamor_image.lo
  CC       glamor_lines.lo
  CC       glamor_glx.lo
  CC       glamor_dash.lo
In file included from /home/quentin/SSD_1To_Kingston/imx8_Linux/rootfs/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglplatform.h:179:0,
                 from /home/quentin/SSD_1To_Kingston/imx8_Linux/rootfs/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/epoxy/egl_generated.h:11,
                 from /home/quentin/SSD_1To_Kingston/imx8_Linux/rootfs/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/epoxy/egl.h:46,
                 from glamor_priv.h:43,
                 from glamor.c:37:
/home/quentin/SSD_1To_Kingston/imx8_Linux/rootfs/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglvivante.h:267:1: error: conflicting types for ?fbCreateWindow?
 fbCreateWindow(

This happens when I select imx-gpuv-viv package, which from what I understand provides hardware GPU acceleration ?

Is there something I am missing / doing horribly wrong ?


Thanks,


Quentin


Ce message et toutes les pieces jointes (ci-apres le "message") sont etablis a l'intention exclusive de ses destinataires.
Si vous recevez ce message par erreur, merci de le detruire et d'en avertir immediatement l'expediteur par e-mail.
Toute utilisation de ce message non conforme a sa destination, toute diffusion ou toute publication, totale ou partielle, est interdite, sauf autorisation expresse. Les communications sur Internet n'etant pas securisees, l'expediteur informe qu'il ne peut accepter aucune responsabilite quant au contenu de ce message.
This mail message and attachments (the "message") are solely intended for the addresses. It is confidential in nature.
If you receive this message in error, please delete it and immediately notify the sender by e-mail.
Any use other than its intended purpose, dissemination or disclosure, either whole or partial, is prohibited except if formal approval is granted. As communication on the Internet is not secure, the sender does not accept responsibility for the content of this message.
