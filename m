From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 29 Jul 2017 21:31:29 +0300
Subject: [Buildroot] [PATCH] libssh2: fix build with libgcrypt and
 mbedtls enabled
In-Reply-To: <20170729155242.3a67c438@windsurf.lan>
References: <aee7e0b01fec4b43854973bba5a967f438d6dcb4.1501216093.git.baruch@tkos.co.il>
 <20170729155242.3a67c438@windsurf.lan>
Message-ID: <20170729183129.q7iwi5lhxnzaz5ij@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Jul 29, 2017 at 03:52:42PM +0200, Thomas Petazzoni wrote:
> On Fri, 28 Jul 2017 07:28:13 +0300, Baruch Siach wrote:
> > The --without-libgcrypt configure parameter is not enough to disable the
> > libgcrypt back-end. This breaks the build when mbedtls (default backend) is
> > enabled, and libgcrypt builds before libssh2. Seed ac_cv_libgcrypt to really
> > disable libgcrypt when it is not the selected crypto back-end.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/b4e/b4e39890e003e9e590a5bf17c9300c653020d88c/
> > http://autobuild.buildroot.net/results/45a/45a9b3559ceea4e1399794f9612f717f7c57a4a3/
> > http://autobuild.buildroot.net/results/ae4/ae4afec62ca297df1cd02350601f1d62fc3cd1b7/
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  package/libssh2/libssh2.mk | 1 +
> >  1 file changed, 1 insertion(+)
> 
> Applied to master, thanks. However, could you submit a bug report
> upstream, because this is clearly a bug.

Upstream changed the crypto backend selection code significantly after the 
last release. Hopefully we won't be needing this workaround after the next 
release.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
