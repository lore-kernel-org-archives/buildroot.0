From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 6 Oct 2017 07:35:15 +0300
Subject: [Buildroot] [PATCH 1/2] openntpd: fix musl build with older
	kernel headers
In-Reply-To: <871smhic23.fsf@dell.be.48ers.dk>
References: <fcd9c70d93d412866e9f973469a81acfffa1860a.1506676404.git.baruch@tkos.co.il>
 <871smhic23.fsf@dell.be.48ers.dk>
Message-ID: <20171006043515.chpkvp4z2vpmd2bu@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, Oct 05, 2017 at 10:17:56PM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > musl provides its own SYS_getrandom definition, but not GRND_NONBLOCK.
>  > This breaks the build with kernel headers older than v3.17. Add a patch
>  > adding a local definition of GRND_NONBLOCK to fix the build.
> 
>  > The getentropy_linux.c file is in upstream tarball, but not in its git
>  > repository. It originates form OpenBSD. For this reason the patch is
>  > against the tarball, but not git formatted.
> 
> FYI, I believe upstream openntpd development only supports openbsd,
> similar to E.G. openssh, and the linux specific code is in
> openntpd-portable:
> 
> https://github.com/openntpd-portable/openntpd-portable

The getentropy_linux.c file is not in the openntpd-portable git repo:

  https://github.com/openntpd-portable/openntpd-portable/tree/master/compat

It is apparently copied when generating the tarball from the code openbsd 
libressl:

  https://github.com/libressl-portable/openbsd/blob/master/src/lib/libcrypto/arc4random/getentropy_linux.c

The same goes for libressl-portable, the target of the second patch in this 
series. For that reason the upstream pull request is against the openbsd tree, 
the real upstream for that file.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
