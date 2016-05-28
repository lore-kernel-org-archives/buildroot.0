From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 28 May 2016 17:50:23 +0200
Subject: [Buildroot] [PATCH v3 5/6] package/flannel: Add
 BR2_TOOLCHAIN_HAS_THREADS
In-Reply-To: <20160528154158.70f4f025@free-electrons.com>
References: <cover.1464286518.git.geoff@infradead.org>
 <627469f0b7b4e604da3a5ab3ef721f138a1c95a8.1464286518.git.geoff@infradead.org>
 <20160528154158.70f4f025@free-electrons.com>
Message-ID: <20160528155022.GK22609@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Hello,
> 
> On Thu, 26 May 2016 18:21:33 +0000, Geoff Levand wrote:
> > flannel uses the cgo package, so needs a toolchain with thread
> > support.
> > 
> > Signed-off-by: Geoff Levand <geoff@infradead.org>
> > ---
> >  package/flannel/Config.in | 4 ++++
> >  1 file changed, 4 insertions(+)
> 
> There are still some issues with the flannel build:
> 
>   http://autobuild.buildroot.org/results/d98/d98e1857590738313a293b58f02230539bbaa405/build-end.log
> 
> The error is:
> 
> /home/buildroot/autobuild/run/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find Scrt1.o: No such file or directory
> 
> My understanding is that this happens when trying to build PIE binaries
> that are statically linked. uClibc does not support that, or at least
> not with our current toolchain support. Would it be possible to not
> build PIE binaries with Go ? Or alternatively, investigate if it can be
> fixed in uClibc ?
> 
> Waldemar, maybe you have some input about this problem ?

Not more then you already told us.
The rule of thumb is: uClibc-ng  + PIE + static = unsupported.

If anyone wnt to work on this, I am happy to include any patches.
But I think some GCC magic must be done for this, too.

best regards
 Waldemar 
