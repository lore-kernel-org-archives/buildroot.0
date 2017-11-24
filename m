From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 09:38:26 +0100
Subject: [Buildroot] [PATCH/next 1/1] motion: fix build on musl
In-Reply-To: <20171124063014.21029-1-fontaine.fabrice@gmail.com>
References: <20171124063014.21029-1-fontaine.fabrice@gmail.com>
Message-ID: <20171124093826.021019e3@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Nov 2017 07:30:14 +0100, Fabrice Fontaine wrote:
> Some toolchains (musl) have pthread_setname_np but not pthread_getname_np.
> The first patch fixes check on pthread_setname_np and the second one add
> a check for pthread_getname_np
> 
> Fixes:
>  -
> http://autobuild.buildroot.net/results/65534775c5977e2424c5f5c63c46f9d0f39d7e1b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Fix-pthread_setname_np-detection.patch    | 50 ++++++++++++++++
>  .../motion/0002-Check-for-pthread_getname_np.patch | 66 ++++++++++++++++++++++
>  2 files changed, 116 insertions(+)
>  create mode 100644 package/motion/0001-Fix-pthread_setname_np-detection.patch
>  create mode 100644 package/motion/0002-Check-for-pthread_getname_np.patch

Applied to next, thanks. Don't forget to send the patches upstream if
not already done. Thanks a lot for taking care of this build issue!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
