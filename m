From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 12 Nov 2013 21:54:50 +0100
Subject: [Buildroot] [PATCH 1/1] omniorb: add COS Naming Service
In-Reply-To: <1384288305-4945-1-git-send-email-mlweber1@rockwellcollins.com>
References: <1384288305-4945-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <9e8746c1-8e33-4c55-b4e2-b2b1e6181f86@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

Matt Weber <mlweber1@rockwellcollins.com> wrote:
>
>Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
>---
> package/omniorb/Config.in  |    9 +++++++++
> package/omniorb/omniorb.mk |    8 ++++++++
> 2 files changed, 17 insertions(+), 0 deletions(-)
>
>diff --git a/package/omniorb/Config.in b/package/omniorb/Config.in
>index 6326688..22527fc 100644
>--- a/package/omniorb/Config.in
>+++ b/package/omniorb/Config.in
>@@ -10,5 +10,14 @@ config BR2_PACKAGE_OMNIORB
> 
> 	  http://omniorb.sourceforge.net/
> 
>+if BR2_PACKAGE_OMNIORB
>+
>+config BR2_PACKAGE_OMNIORB_WITH_SERVICES
>+        bool "COS Naming Service"
>+        default y
>+        help
>+          omniORB COS Naming Service
>+endif
>+
> comment "omniORB needs a toolchain w/ C++"
> 	depends on !BR2_INSTALL_LIBSTDCPP

I think it makes more sense to keep this comment close to the config option it applies to, thus moving the new cos option below it.
I know that many packages do not follow this, but I'm planning on fixing that...

Best regards,
Thomas
