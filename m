From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 11 Jun 2018 22:07:49 +0200
Subject: [Buildroot] [RFC v3 1/3] libopenssl: bump version to 1.1.0h
In-Reply-To: <0470f9f2-f90d-c19d-ee47-c97d393ced05@gmail.com>
References: <20180508195431.19944-1-ps.report@gmx.net>
 <0470f9f2-f90d-c19d-ee47-c97d393ced05@gmail.com>
Message-ID: <20180611220749.24b8d3c9@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ryan,

On Sat, 9 Jun 2018 07:22:00 -0700, Ryan Coe <bluemrp9@gmail.com> wrote:

> Peter, All,
> 
> On 05/08/2018 12:54 PM, Peter Seiderer wrote:
> > - remove all parallel build patches (openssl build-system changed)
> >
> > - rebased 0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
> >    to apply to Configurations/unix-Makefile.tmpl (Makefile template)
> >
> > - replaced 0002-cryptodev-Fix-issue-with-signature-generation.patch with
> >    upstream version
> >
> > - rebased 0003-Reproducible-build-do-not-leak-compiler-path.patch to
> >    apply to crypto/build.info (Makefile template)
> >
> > - fix musl/uclibc build failure, use '-DOPENSSL_NO_ASYNC'
> >
> > - remove legacy enable-tlsext configure option
> >
> > - change legacy INSTALL_PREFIX to DESTDIR
> >
> > - remove 'libraries gets installed read only, so strip fails'
> >    workaround (not needed anymore)
> >
> > - change engine directory from /usr/lib/engines to
> >    /usr/lib/engines-1.1
> >
> > - change license file hash, no license change, only the following
> >    hint was removed:
> >
> >      Actually both licenses are BSD-style Open Source licenses.
> >      In case of any license issues related to OpenSSL please
> >      contact openssl-core at openssl.org.
> >
> > - fix host-libopenssl compile setting rpath as decribed in
> >    libopenssl-1.1.0h/NOTES.UNIX
> >
> > - add 0004-Revert-util-dofile.pl-only-quote-stuff-that-actually.patch
> >    to fix build of ca-certificates (see [1])
> >
> > [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=894282
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>  
> Tested-by: Ryan Coe <bluemrp9@gmail.com>
> 
> I have tested this on my x86_64 and arm builds.? I did find that MariaDB 
> 10.1.x is not compatible with this version.? I think it would be 
> appropriate to bump it to 10.2.x as it resolves the build issue.

Many thanks for testing and the mariadb version bump suggestion, will
add it to the next patch set iteration...

Regards,
Peter
