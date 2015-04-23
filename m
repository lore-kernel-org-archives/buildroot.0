From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 23 Apr 2015 21:55:17 +0200
Subject: [Buildroot] [PATCH v1] atftp: fix musl compile
Message-ID: <trinity-43fcb93d-bdf2-4e9e-8466-3a69c84ab60a-1429818917033@3capp-gmx-bs60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, Apr 18, 2015 at 03:44:24PM +0200, Thomas Petazzoni wrote:
> Dear Peter Seiderer,
> 
> On Thu, 16 Apr 2015 23:02:05 +0200, Peter Seiderer wrote:
> > - add missing __THROW, __BEGIN_DECLS, __END_DECLS and __attribute_pure__
> >   defines in atftp own argz.h file
> > 
> > - add missing sys/types.h include in tftp.h and tftpd.h
> > 
> > Fixes [1]:
> > 
> > argz.h:61:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'extern'
> >  extern error_t __argz_create (char *__const __argv[], char **__restrict __argz,
> >  ^
> > argz.h: In function 'argz_create':
> > argz.h:64:34: error: expected declaration specifiers before '__THROW'
> >         size_t *__restrict __len) __THROW;
> > 
> > [1] http://autobuild.buildroot.net/results/b7f/b7f205ea2066788ea78a1a819f1b592e84e2455e/
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  ...gz.h-fix-musl-compile-add-missing-defines.patch | 42 ++++++++++++++++++++++
> >  ...-tftpd.h-fix-musl-compile-missing-include.patch | 40 +++++++++++++++++++++
> >  2 files changed, 82 insertions(+)
> >  create mode 100644 package/atftp/0002-argz.h-fix-musl-compile-add-missing-defines.patch
> >  create mode 100644 package/atftp/0003-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch
> 
> Applied, thanks. Can you please submit those patches to the upstream
> atftp project?

Yes, done: http://sourceforge.net/p/atftp/bugs/4/

Regards,
Peter

> 
> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
