From: Matthew Weber <mlweber1@rockwellcollins.com>
Date: Tue, 12 Nov 2013 16:09:41 -0600
Subject: [Buildroot] [PATCH 1/1] omniorb: add COS Naming Service
In-Reply-To: <9e8746c1-8e33-4c55-b4e2-b2b1e6181f86@email.android.com>
References: <1384288305-4945-1-git-send-email-mlweber1@rockwellcollins.com>
 <9e8746c1-8e33-4c55-b4e2-b2b1e6181f86@email.android.com>
Message-ID: <OFFA3AE1C4.AF078621-ON86257C21.00736F2A-86257C21.0079BC88@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on 11/12/2013 
02:54:50 PM:

> From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> To: Matt Weber <mlweber1@rockwellcollins.com>, buildroot at busybox.net
> Date: 11/12/2013 02:55 PM
> Subject: Re: [Buildroot] [PATCH 1/1] omniorb: add COS Naming Service
> 
> Hi Matt,
> 
> Matt Weber <mlweber1@rockwellcollins.com> wrote:
> >
> >Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
> >---
> > package/omniorb/Config.in  |    9 +++++++++
> > package/omniorb/omniorb.mk |    8 ++++++++
> > 2 files changed, 17 insertions(+), 0 deletions(-)
> >
> >diff --git a/package/omniorb/Config.in b/package/omniorb/Config.in
> >index 6326688..22527fc 100644
> >--- a/package/omniorb/Config.in
> >+++ b/package/omniorb/Config.in
> >@@ -10,5 +10,14 @@ config BR2_PACKAGE_OMNIORB
> > 
> >      http://omniorb.sourceforge.net/
> > 
> >+if BR2_PACKAGE_OMNIORB
> >+
> >+config BR2_PACKAGE_OMNIORB_WITH_SERVICES
> >+        bool "COS Naming Service"
> >+        default y
> >+        help
> >+          omniORB COS Naming Service
> >+endif
> >+
> > comment "omniORB needs a toolchain w/ C++"
> >    depends on !BR2_INSTALL_LIBSTDCPP
> 
> I think it makes more sense to keep this comment close to the config
> option it applies to, thus moving the new cos option below it.
> I know that many packages do not follow this, but I'm planning on 
> fixing that...
> 
> Best regards,
> Thomas
> 
Sure that works.  I noticed the indenting of the new cfg option doesn't 
seem 
to happen in the menuconfig if I move that comment below the original 
package.
I'll have to dig into why that happens.

Thanks,
Matt 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131112/c1fd93e8/attachment.html>
