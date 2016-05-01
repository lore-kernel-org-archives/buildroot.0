From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 22:35:52 +0200
Subject: [Buildroot] [PATCH] crda: fix build with GCC 6
In-Reply-To: <1462094883-8397-1-git-send-email-joerg.krause@embedded.rocks>
References: <1462094883-8397-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160501223552.62788b98@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 May 2016 11:28:03 +0200, J?rg Krause wrote:
> Building crda with GCC 6 fails because of all compiler warnings are treated as
> errors. Disable the compiler option '-Werror':
> 
> keys-gcrypt.c:94:32: error: ?keys? defined but not used [-Werror=unused-const-variable=]
>  static const struct key_params keys[] = {
>                                 ^~~~
> cc1: all warnings being treated as errors
> 
> Add a patch to drop '-Werror' from CFLAGS.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/crda/0003-drop-werror.patch | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/crda/0003-drop-werror.patch

Applied to master, but please report the bug upstream. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
