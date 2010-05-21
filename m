From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 09:53:53 +0200
Subject: [Buildroot] libglib2 build
In-Reply-To: <87vdahvitt.fsf@macbook.be.48ers.dk>
References: <FEB4C28CC3154F1885B80CEB507D4F51@apexjs>
	<87vdahvitt.fsf@macbook.be.48ers.dk>
Message-ID: <20100521095353.22e3b223@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 21 May 2010 09:02:06 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> Normally it is:
> 
> ./staging/usr/bin/x86_64-linux-nm -D
> target/lib/libuClibc-0.9.31.so|grep res_query 000000000002ff08 T
> __res_query 000000000002ffbf T __res_querydomain

res_query() is defined as soon as either UCLIBC_HAS_IPV4 or
UCLIBC_HAS_IPV6 are defined in uClibc configuration. In the 0.9.31
uClibc configuration that Buildroot uses, UCLIBC_HAS_IPV4 is always
selected. So this should not happen *unless* you created a different
uClibc configuration which doesn't have UCLIBC_HAS_IPV4. Did you made
any change to the default uClibc configuration used in Buildroot ?

Just as Peter showed, could you check if res_query is actually
available in your libc binary ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
