From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 15:07:59 +0100
Subject: [Buildroot] [PATCH 2/2] netsniff-ng:new package
In-Reply-To: <1447059812-26424-2-git-send-email-joris.lijssens@gmail.com>
References: <1447059812-26424-1-git-send-email-joris.lijssens@gmail.com>
 <1447059812-26424-2-git-send-email-joris.lijssens@gmail.com>
Message-ID: <20151111150759.493329df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Joris Lijssens,

On Mon,  9 Nov 2015 10:03:32 +0100, Joris Lijssens wrote:
> Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
> ---
>  package/Config.in                  |  1 +
>  package/netsniff-ng/Config.in      | 22 ++++++++++++++++++++++
>  package/netsniff-ng/netsniff-ng.mk | 30 ++++++++++++++++++++++++++++++
>  3 files changed, 53 insertions(+)
>  create mode 100644 package/netsniff-ng/Config.in
>  create mode 100644 package/netsniff-ng/netsniff-ng.mk

I've applied your patch after doing a number of changes:

    [Thomas:
     - add comment in Config.in to explain why this package depends on
       glibc, and specifically why it doesn't build for uClibc and musl.
     - add hash file.
     - add 'COPYING' to the list of LICENSE_FILES
     - add themissing <pkg>_DEPENDENCIES variable in the .mk file, to make
       sure dependencies are built before netsniff-ng.
     - add comment in the .mk file explain why we're using the
       generic-package infrastructure even if the build procedure is
       essentially ./configure, make, make install.
     - fix indentation in NETSNIFF_NG_CONFIGURE_CMDS.]

Though I believe you should look into the comments made by Arnout,
since some of them remain valid even after my changes, and it would be
great if you could address them through follow-up patches.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
