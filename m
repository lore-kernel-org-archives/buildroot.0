From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 16 Mar 2021 21:53:14 +0100
Subject: [Buildroot] [PATCH v1 3/3] package/batman-adv: add note about
 linux mainline kernel module alternative
In-Reply-To: <20210316201923.GC3443324@scaer>
References: <20210316181429.30804-1-ps.report@gmx.net>
 <20210316181429.30804-3-ps.report@gmx.net>
 <20210316201923.GC3443324@scaer>
Message-ID: <20210316215314.4d71f86c@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Tue, 16 Mar 2021 21:19:23 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, All,
>
> On 2021-03-16 19:14 +0100, Peter Seiderer spake thusly:
> > Since version 2.6.38 batman-adv is integreated into the linux mainline
> > kernel ([1], [2]) so add a note about it in the Config.in help text.
>
> We do not wupport building kernels before 3.0 (and even that is 10 years
> old now, so I'm not sure how solid it would be).
>
> As such, does it make sense to have the out-of-tree B.A.T.M.A.N Adv
> kernel module at all?
>
> Note also that the versionwe have is 2019.3, two years old, and the
> in-tree version for recent kernels is probably in better shape than what
> we carry.

See

	https://patchwork.ozlabs.org/project/buildroot/patch/20210311210804.9616-2-ps.report at gmx.net/

for update to 2021.0


>
> Shouldn't we drop this package, now?

Would suspect the use case/reason why batman-adv is still provided as out-of-tree module is
to enable up-to-date batman with older kernels...as the 2021.0 release announcement mentions
compatibility with 4.4 to 5.11 (see [3])...

Regards,
Peter

[3] https://www.open-mesh.org/news/100

>
> > [1] https://kernelnewbies.org/Linux_2_6_38
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c6c8fea29769d998d94fcec9b9f14d4b52b349d3
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
> In the meantime: applied to master, thanks.
>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  package/batman-adv/Config.in | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/package/batman-adv/Config.in b/package/batman-adv/Config.in
> > index 9d3d7967b9..eae94fd130 100644
> > --- a/package/batman-adv/Config.in
> > +++ b/package/batman-adv/Config.in
> > @@ -6,6 +6,8 @@ config BR2_PACKAGE_BATMAN_ADV
> >  	depends on BR2_LINUX_KERNEL
> >  	help
> >  	  batman-adv mesh networking kernel module
> > +	  Note: batman-adv is part of the linux mainline
> > +	  kernel since version 2.6.38
> >
> >  	  https://www.open-mesh.org/projects/batman-adv/
> >
> > --
> > 2.30.1
> >
>
