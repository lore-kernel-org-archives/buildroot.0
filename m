From: Ming-Ching Tiew <mingching.tiew@redtone.com>
Date: Fri, 25 Jan 2008 09:02:35 +0800
Subject: [Buildroot] can't develope any programs using ssl in the root
References: <479802C7.9090108@redtone.com><00c401c85e2a$9de7f140$8119fea9@MingChing>
	<20080124223846.GD3397@cloud.net.au>
Message-ID: <051301c85eed$f9167dc0$8119fea9@MingChing>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


From: "Hamish Moffatt" <hamish@cloud.net.au>
> > >
> > > configure:12791: checking for SSLeay
> > > configure:12833: result: /usr
> > > configure:12845: checking for DES_cbc_encrypt in -lcrypto
> > > configure:12875: gcc -o conftest -DINET6 -g -O2  -L/usr/lib  conftest.c
> > > -lcrypto  ./../libpcap-0.9.5/libpcap.a  >&5
> [...]
> > 
> > I have found a workaround for it, I delete the entire
> > 
> >    /usr/lib/gcc/i686-linux-uclibc/4.2.0/include/openssl/
> > 
> > Looks to me like a bug. Since I can proceed now, I am staying with
> > this for a while.
> 
> From your config.log snippet it appears that configure is using your
> native gcc (not the cross-compiler), which is using headers from
> /usr. That looks like a bug, either in the configure script or in the
> relevant .mk files for programs that use OpenSSL.
> 

No, not quite. The config.log is obtained from the chroot to the
rootfs, and the so-called native gcc, is the gcc compiled from the
cross compiler, there is no cross compilers involved.

Regards.
