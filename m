From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Aug 2015 11:22:21 +0200
Subject: [Buildroot] [PATCH] package/elfutils: fix dependency on C
 library
In-Reply-To: <1439060314-23045-1-git-send-email-yann.morin.1998@free.fr>
References: <1439060314-23045-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150809112221.61d06dcc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat,  8 Aug 2015 20:58:34 +0200, Yann E. MORIN wrote:
> As Thomas puts it:
> 
>     The comment can only be visible when a toolchain that is *not*
>     uclibc and *not* glibc is used. I.e, the comment is now only visible
>     when musl is used. Which is not what we want.
> 
> Indeed, I completely borked the conditions. When a glibc or uClibc
> toolchain is selected, the comment is entirely hidden, and we don;t get
> the extra requirements (wchar, !static).
> 
> Fix that with the solution proposed by Thomas.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/avrdude/Config.in    | 4 ++--
>  package/elfutils/Config.in   | 4 ++--
>  package/kexec-lite/Config.in | 4 ++--
>  package/ltrace/Config.in     | 4 ++--
>  package/racehound/Config.in  | 4 ++--
>  5 files changed, 10 insertions(+), 10 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
