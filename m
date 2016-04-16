From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 16 Apr 2016 22:30:20 +0300
Subject: [Buildroot] [PATCH] memcached: fix musl build
In-Reply-To: <871t65fw44.fsf@dell.be.48ers.dk>
References: <1163900c34d6fa034bcb8defc1b0f6578a293b28.1460697551.git.baruch@tkos.co.il>
 <871t65fw44.fsf@dell.be.48ers.dk>
Message-ID: <20160416193020.GA2476@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sat, Apr 16, 2016 at 04:48:11PM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > Add a patch fixing pre-processor warnings that breaks the build. The patch is
>  > pending upstream.
> 
>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  > ---
>  >  .../memcached/0001-fix-build-with-musl-libc.patch  | 78 ++++++++++++++++++++++
>  >  1 file changed, 78 insertions(+)
>  >  create mode 100644 package/memcached/0001-fix-build-with-musl-libc.patch
> 
>  > diff --git a/package/memcached/0001-fix-build-with-musl-libc.patch
>  > b/package/memcached/0001-fix-build-with-musl-libc.patch
>  > new file mode 100644
>  > index 000000000000..068382051cde
>  > --- /dev/null
>  > +++ b/package/memcached/0001-fix-build-with-musl-libc.patch
>  > @@ -0,0 +1,78 @@
>  > +From 2137a608c77c467200d73469f723ba97ff6b3511 Mon Sep 17 00:00:00 2001
>  > +From: Natanael Copa <ncopa@alpinelinux.org>
>  > +Date: Mon, 18 Jan 2016 12:11:48 +0100
>  > +Subject: [PATCH] fix build with musl libc
>  > +
>  > +musl libc will warn if you include sys/signal.h instead of signal.h as
>  > +specified by posix. Build will fail due to -Werror explicitly beeing
>  > +set.
> 
> Is there any way to disable -Werror? -Werror should imho not be used for
> any released SW as it tends to break the build time and again.

Removing -Werror requires patching configure.ac. It's not required at this 
point with this patch applied. We can always do it later if it's needed.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
