From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Feb 2020 21:30:52 +0100
Subject: [Buildroot] [PATCH 1/2] package/uboot-tools: needs make >= 4.0
In-Reply-To: <db7a911e37b838e8b96707502259828e011cbb36.1580761209.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 3 Feb 2020 21:20:19 +0100")
References: <cover.1580761209.git.yann.morin.1998@free.fr>
 <db7a911e37b838e8b96707502259828e011cbb36.1580761209.git.yann.morin.1998@free.fr>
Message-ID: <87mu9z76rn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Starting with 2020.01, uboot started using the 'undefine' make
 > directive, which was only introduced with make 4.0.

 > So, use the existing $(BR2_MAKE_HOST_DEPENDENCY) and $(BR2_MAKE),
 > both of each will ensure that we do use a make that is at least 4.0.

 > Fixes:
 >     http://autobuild.buildroot.org/results/c97/c976ed5eb7760cba192d22b3f1e7460596fd82dd/

 > Reported-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > ---
 >  package/uboot-tools/uboot-tools.mk | 9 ++++++---
 >  1 file changed, 6 insertions(+), 3 deletions(-)

 > diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
 > index 1f0bac5bf7..98ac71911b 100644
 > --- a/package/uboot-tools/uboot-tools.mk
 > +++ b/package/uboot-tools/uboot-tools.mk
 > @@ -11,6 +11,9 @@ UBOOT_TOOLS_LICENSE = GPL-2.0+
 >  UBOOT_TOOLS_LICENSE_FILES = Licenses/gpl-2.0.txt
 >  UBOOT_TOOLS_INSTALL_STAGING = YES
 
 > +UBOOT_TOOLS_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
 > +HOST_UBOOT_TOOLS_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)

I added a comment explaining why we are doing this and committed,
thanks.

-- 
Bye, Peter Korsgaard
