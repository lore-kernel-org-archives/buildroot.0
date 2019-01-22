From: =?UTF-8?Q?Jo=C3=A3o_Victor_Oliveira?= <jv.oliveirag@gmail.com>
Date: Tue, 22 Jan 2019 12:07:12 -0200
Subject: [Buildroot] Problem with pkg-config while running autogen.sh for
 gst-shark
Message-ID: <CA+9OK-orxCYvqauH4bTdWEwJjZkCQS35EwOW_rv=Ncz6wgHqBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I've installed buildroot very recently and I'm working with "gst-shark",
which recipe is shown below:
################################################################################
#
# gst-shark
#
################################################################################

GST_SHARK_VERSION = 0.5.5
GST_SHARK_SOURCE = v$(GST_SHARK_VERSION).tar.gz
GST_SHARK_SITE = https://github.com/RidgeRun/gst-shark.git
GST_SHARK_DEPENDENCIES = host-pkgconf libglib2
#GST-SHARK_INSTALL_STAGING = YES
#GST-SHARK_INSTALL_TARGET = YES
#GST_SHARK_AUTORECONF = YES

define GST_SHARK_CONFIGURE_CMDS
        echo "Configurando ae"
        (cd $(@D) && ./autogen.sh --prefix=/usr
--libdir=$(STAGING_DIR)/usr/lib --disable-gtk-doc)
endef

$(eval $(generic-package))

And I think i've got an issue with the pkg-config when I run "autogen.sh"
Here's the log:
[...]
checking for gcc option to accept ISO C89... (cached) none needed
checking whether gcc understands -c and -o together... (cached) yes
checking dependency style of gcc... (cached) gcc3
checking for gcc option to accept ISO C99... none needed
checking for gcc option to accept ISO Standard C... (cached) none needed
checking for valgrind... no
checking for gobject-introspection... no
checking for gtkdoc-check... no
checking for gtkdoc-rebase... no
checking for gtkdoc-mkpdf... no
configure: error: You need to have gtk-doc >= 1.12 installed to build
GstShark
  configure failed

Any ideia of what I need to do to solve this?

<https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail>
Livre
de v?rus. www.avast.com
<https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail>.
<#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190122/bdc494fe/attachment.html>
