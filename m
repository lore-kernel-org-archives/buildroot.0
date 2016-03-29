From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 14:47:37 +0200
Subject: [Buildroot] [PATCH v4 09/19] package/freerdp: bump version
In-Reply-To: <1459194585-12593-10-git-send-email-bernd.kuhls@t-online.de>
References: <1459194585-12593-1-git-send-email-bernd.kuhls@t-online.de>
 <1459194585-12593-10-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160329144737.7d34894b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Mar 2016 21:49:35 +0200, Bernd Kuhls wrote:
> This version bump is needed to provide support for ffmpeg 3.0, added
> Sep, 17th, 2015: https://github.com/FreeRDP/FreeRDP/pull/2895
> 
> Please note the we can not bump to a newer version of freerdp atm
> because the next commit in the master branch
> 
> https://github.com/FreeRDP/FreeRDP/commit/8206ae440f905b123cb92c7abf8c861070ea8cd8
> 
> bumped the version number to 2.x which will provide freerdp2.pc instead
> of freerdp.pc, this is incompatible with vlc atm:
> 
> http://git.videolan.org/?p=vlc/vlc-2.2.git;a=blob;f=configure.ac;h=bb5d1dde2ef9828b0ba92c62dbd1143f984f45f2;hb=HEAD#l1890
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/freerdp/freerdp.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This commit is apparently causing some build issues:

  http://autobuild.buildroot.org/results/1ab/1abc713a58d21c71678aab9b21ac1cfac23684f5/build-end.log

(Though I haven't checked if freerdp had those build issues before this
commit or not). Could you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
