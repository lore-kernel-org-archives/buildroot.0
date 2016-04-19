From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 21:06:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/jack2: Fix build on nios2
In-Reply-To: <1461087406-25244-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461087406-25244-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160419210649.3f052d14@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Apr 2016 19:36:46 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/8f3/8f3d2139de7f85f729e0555f8513fdbd177cbadd/
> http://autobuild.buildroot.net/results/5d2/5d2f049ab9fa6a1a4e3fa9884983ab66b2fccb56/
> http://autobuild.buildroot.net/results/85a/85a4a7ee4cf5c0b65e4543a524909d9c0422eea4/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/jack2/0001-Add-support-for-nios2.patch | 34 ++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/jack2/0001-Add-support-for-nios2.patch

I've applied, but I find that this mechanism in jack2 is really done
wrongly. Instead they should use a cmake/waf/autoconf test, rather than
this never-ending list of architectures.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
