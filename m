From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Feb 2018 20:16:01 +0100
Subject: [Buildroot] [PATCH 2/2] package/wf111: do a direct download
In-Reply-To: <ef05e42aa7a51d33c666507728602993d04344bb.1517677545.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 3 Feb 2018 18:05:59 +0100")
References: <cover.1517677545.git.yann.morin.1998@free.fr>
 <ef05e42aa7a51d33c666507728602993d04344bb.1517677545.git.yann.morin.1998@free.fr>
Message-ID: <87lgg93mvi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > We can now do a download without prior registration, so we can drop the
 > requirement for a local, pre-downloaded tarball, now.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Julien CORJON <corjon.j@ecagroup.com>
 > Cc: Antoine T?nart <antoine.tenart@free-electrons.com>
 > ---
 >  package/wf111/Config.in | 11 -----------
 >  package/wf111/wf111.mk  |  7 +------
 >  2 files changed, 1 insertion(+), 17 deletions(-)

 > diff --git a/package/wf111/Config.in b/package/wf111/Config.in
 > index 081bd960cb..7b61ea195f 100644
 > --- a/package/wf111/Config.in
 > +++ b/package/wf111/Config.in
 > @@ -19,17 +19,6 @@ config BR2_PACKAGE_WF111
 
 >  	  https://www.silabs.com/products/wireless/wi-fi/wf111-bluegiga-module

When you click on the links on that page you are still served a login
page, but direct download does indeed work.

The question is if we are allowed to redistribute the tarballs?
Otherwise we should set WF111_REDISTRIBUTE = NO

Do you use this package? Looking at the .mk file we have this comment:

# Due to the stupidity of the package Makefile, we can't invoke
# separately the build step and the install step and get a correct
# behavior. So we do everything in the install step.

But as far as I can see, you CAN build the Linux driver outside the
install step (E.G. make all).

Committed, thanks.

-- 
Bye, Peter Korsgaard
