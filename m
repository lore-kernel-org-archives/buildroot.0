From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 15:44:24 +0200
Subject: [Buildroot] [PATCH v1] atftp: fix musl compile
In-Reply-To: <1429218125-12061-1-git-send-email-ps.report@gmx.net>
References: <1429218125-12061-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150418154424.48aa7d61@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Thu, 16 Apr 2015 23:02:05 +0200, Peter Seiderer wrote:
> - add missing __THROW, __BEGIN_DECLS, __END_DECLS and __attribute_pure__
>   defines in atftp own argz.h file
> 
> - add missing sys/types.h include in tftp.h and tftpd.h
> 
> Fixes [1]:
> 
> argz.h:61:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'extern'
>  extern error_t __argz_create (char *__const __argv[], char **__restrict __argz,
>  ^
> argz.h: In function 'argz_create':
> argz.h:64:34: error: expected declaration specifiers before '__THROW'
>         size_t *__restrict __len) __THROW;
> 
> [1] http://autobuild.buildroot.net/results/b7f/b7f205ea2066788ea78a1a819f1b592e84e2455e/
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...gz.h-fix-musl-compile-add-missing-defines.patch | 42 ++++++++++++++++++++++
>  ...-tftpd.h-fix-musl-compile-missing-include.patch | 40 +++++++++++++++++++++
>  2 files changed, 82 insertions(+)
>  create mode 100644 package/atftp/0002-argz.h-fix-musl-compile-add-missing-defines.patch
>  create mode 100644 package/atftp/0003-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch

Applied, thanks. Can you please submit those patches to the upstream
atftp project?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
