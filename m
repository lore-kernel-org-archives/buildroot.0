From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 17:31:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/beecrypt: Fix build with
 BR2_ENABLE_DEBUG=yes
In-Reply-To: <1413732225-14832-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413732225-14832-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141019173111.07415809@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 19 Oct 2014 17:23:44 +0200, Bernd Kuhls wrote:
> Otherwise configure issues this error message:
> configure: error: --enable-debug cannot be used in conjunction with --enable-expert-mode
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/beecrypt/beecrypt-0003-configure.patch |   30 ++++++++++++++++++++++++
>  package/beecrypt/beecrypt.mk                   |    4 ++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 package/beecrypt/beecrypt-0003-configure.patch

I don't quite understand what's going on here. You need both a patch
*and* passing --disable-expert-mode to get --enable-debug to work? What
is the relation between the two?

In our case, I would expect to always use --enable-expert-mode, since
we do want beecrypt to use Buildroot CFLAGS, not its own CFLAGS.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
