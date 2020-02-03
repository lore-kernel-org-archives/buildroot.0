From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Feb 2020 21:30:42 +0100
Subject: [Buildroot] [PATCH 2/2] boot/uboot: needs make >= 4.0
In-Reply-To: <214c0588eab33158185f6199444bd0b6dbc577ba.1580761209.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 3 Feb 2020 21:20:20 +0100")
References: <cover.1580761209.git.yann.morin.1998@free.fr>
 <214c0588eab33158185f6199444bd0b6dbc577ba.1580761209.git.yann.morin.1998@free.fr>
Message-ID: <87r1zb76rx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Starting with 2020.01, uboot started using the 'undefine' make
 > directive, which was only introduced with make 4.0.

 > In the general case, we do not have a way to know if the uboot
 > selected by the user is older or later than 2020.01, so we have
 > no way to know before hand if make >= 4.0 is needed or not. As
 > such, we have no other option than to always require it.

 > So, use the existing $(BR2_MAKE_HOST_DEPENDENCY) and $(BR2_MAKE),
 > both of each will ensure that we do use a make that is at least 4.0.

 > Reported-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > ---
 >  boot/uboot/uboot.mk | 6 ++++--
 >  1 file changed, 4 insertions(+), 2 deletions(-)

 > diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
 > index a4879bb8b2..19dfb08e81 100644
 > --- a/boot/uboot/uboot.mk
 > +++ b/boot/uboot/uboot.mk
 > @@ -12,6 +12,8 @@ UBOOT_LICENSE_FILES = Licenses/gpl-2.0.txt
 
 >  UBOOT_INSTALL_IMAGES = YES
 > +UBOOT_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)

I added a comment explaining why we are doing this and committed,
thanks.

-- 
Bye, Peter Korsgaard
