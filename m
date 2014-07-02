From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Jul 2014 16:18:26 +0200
Subject: [Buildroot] [PATCH] gcc 4.8.3: add patch for PR60155
In-Reply-To: <1404308617-5370-1-git-send-email-gustavo@zacarias.com.ar>
References: <1404308617-5370-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140702161826.76ea2d0c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed,  2 Jul 2014 10:43:37 -0300, Gustavo Zacarias wrote:
> Fixes:
> http://autobuild.buildroot.net/results/6c8/6c8c3cb19a6f98f6f27986b671d48ee092fdf7cc/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gcc/4.8.3/842-PR60155.patch | 111 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
>  create mode 100644 package/gcc/4.8.3/842-PR60155.patch
> 
> diff --git a/package/gcc/4.8.3/842-PR60155.patch b/package/gcc/4.8.3/842-PR60155.patch
> new file mode 100644
> index 0000000..7bc2122
> --- /dev/null
> +++ b/package/gcc/4.8.3/842-PR60155.patch
> @@ -0,0 +1,111 @@
> +From gcc bugzilla https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60155
> +Upstream status: in trunk.

Just to confirm: is it 4.9.0 already?

Also, it doesn't immediately fix the autobuild issue, because the
autobuild issue occurs with a pre-built Crosstool-NG toolchain. I'll
temporarily add an exception in the autobuilders, and then hopefully
Yann will pick up the patch in Crosstool-NG and at some point we'll be
able to update the pre-built Crosstool-NG toolchain.

Thanks a lot for the investigation!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
