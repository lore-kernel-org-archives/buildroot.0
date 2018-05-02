From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 2 May 2018 23:35:37 +0200
Subject: [Buildroot] [RFC v1 1/2] libopenssl: bump version to 1.1.0h
In-Reply-To: <hkilrexprh.ln2@ID-313208.user.individual.net>
References: <20180417211921.18718-1-ps.report@gmx.net>
 <hkilrexprh.ln2@ID-313208.user.individual.net>
Message-ID: <20180502233537.7b5dd93c@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Tue, 01 May 2018 09:46:57 +0200, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Am Tue, 17 Apr 2018 23:19:20 +0200 schrieb Peter Seiderer:
> 
> > +# crypto/async/arch/../arch/async_posix.h:32:5: error: unknown type   
> name ?ucontext_t?
> > +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> > +LIBOPENSSL_CFLAGS += -DOPENSSL_NO_ASYNC
> > +endif  
> 
> Hi Peter,
> 
> this CFLAG is needed for musl as well:
> https://wiki.musl-libc.org/open-issues.html
> "Legacy functions operating on ucontext_t (getcontext, setcontext, 
> makecontext, swapcontext) are not implemented."
> 
> Otherwise the build fails:
> 
> ./libcrypto.so: undefined reference to `getcontext'
> ./libcrypto.so: undefined reference to `setcontext'
> ./libcrypto.so: undefined reference to `makecontext'

Thanks for the hint, will fix the musl compile at the next
version of the patch too...

Regards,
Peter

> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
