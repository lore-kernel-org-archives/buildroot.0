From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 22 May 2018 14:15:59 +0300
Subject: [Buildroot] [PATCH v2 1/6] libtirpc: add host package
In-Reply-To: <20180522125414.1764d946@windsurf>
References: <176e048d628384df6d3b2d82f2b9c7e4cf58892e.1526985017.git.baruch@tkos.co.il>
 <20180522125414.1764d946@windsurf>
Message-ID: <20180522111559.ahkj7tehlawhks2m@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, May 22, 2018 at 12:54:14PM +0200, Thomas Petazzoni wrote:
> On Tue, 22 May 2018 13:30:12 +0300, Baruch Siach wrote:
> > The libtirpc host package is only for two headers that the host rpcgen
> > utility from the nfs-utils package needs to build. glibc used to provide
> > these headers. In version 2.26 glibc deprecated them with its bundled
> > Sun RPC. Recently Fedora stopped enabling Sun RPC in glibc. So we can no
> > longer rely on these headers being present on the host.
> > 
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> Thanks for this new iteration. Did you test this on Fedora 28 ?

I simulated missing Sun RPC by renaming the /usr/include/rpc{,svc} directories 
in my host (Debian testing). I symlinked <rpc/netdb.h> to the new location. 
This in addition to rename of the host rpcgen binary.

> Because when I tried your first iteration, I did install rpc/types.h by
> hand, but then the build failed again because another rpc/ header was
> missing, and this is where I gave up.

The only additional header I needed is netconfig.h (not under rpc/).

> I'll try to test your patch series on Fedora 28, but I'm a bit short on
> time today for this.

No problem. The autobuilder looks pretty clean otherwise.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
