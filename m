From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 23:27:30 +0200
Subject: [Buildroot] [PATCH] package/yajl: fix build when explicit link
 with libm is needed
In-Reply-To: <1461522578-25792-1-git-send-email-s.martin49@gmail.com>
References: <1461522578-25792-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20160424232730.70a495af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Apr 2016 20:29:38 +0200, Samuel Martin wrote:
> This change adds another fix to the yajl build-system code.
> This patch checks for isnan function in libc, and if not, it makes sure
> libm is passed to the linker flags.
> 
> This change fixes build failure looking like:
> 
>   make[3]: Entering directory `/home/peko/autobuild/instance-2/output/build/yajl-2.1.0'
>   [ 81%] Building C object example/CMakeFiles/parse_config.dir/parse_config.c.o
>   ../yajl-2.1.0/lib/libyajl.so.2.1.0: undefined reference to `__isnan'
>   ../yajl-2.1.0/lib/libyajl.so.2.1.0: undefined reference to `__isinf'
>   collect2: error: ld returned 1 exit status
>   make[3]: *** [verify/json_verify] Error 1
> 
> Fixes:
>   http://autobuild.buildroot.org/results/312/31268e4d20aa34bb90c09aa771b1923f979578ab/
>   and many others
> 
> Cc: Beno?t Mauduit <bmauduit@beneth.fr>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Cc: J?rg Krause <joerg.krause@embedded.rocks>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  ...l-_s-with-libm-when-isnan-is-not-brought-.patch | 64 ++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 package/yajl/0004-Link-libyajl-_s-with-libm-when-isnan-is-not-brought-.patch

Applied to master, thanks. Please submit upstream! Generally speaking,
if some effort could be made to submit our 4 yajl patches upstream, it
would be good.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
