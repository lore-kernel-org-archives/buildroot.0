From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jun 2018 23:15:26 +0200
Subject: [Buildroot] [PATCH 1/1] boost: fiber needs exception_ptr
In-Reply-To: <CAPi7W80JU8wjeKDnNgT6Qnf5aPHGiuRZdce7QVXwe9p2ZBdhoA@mail.gmail.com>
References: <20180625184506.455-1-fontaine.fabrice@gmail.com>
 <20180625213518.45fe3a6d@windsurf.home>
 <CAPi7W80JU8wjeKDnNgT6Qnf5aPHGiuRZdce7QVXwe9p2ZBdhoA@mail.gmail.com>
Message-ID: <20180625231526.20de6fdf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jun 2018 22:50:57 +0200, Fabrice Fontaine wrote:

> > What do you mean by "transient" ? Perhaps you meant "transitive" ?
> >  
> I got this "transient dependencies" from
> https://gist.github.com/ax3l/7450482 but you're right transitive is better.

Transient means temporary (in french "fugace", "?ph?m?re", according to
http://www.wordreference.com/enfr/transient). So I believe "transient"
here is not correct.

> > > that needs exception_ptr.
> > > An other option would be to make boost fiber depends on boost context
> > > (https://www.boost.org/doc/libs/1_67_0/libs/fiber/doc/  
> > html/fiber/overview.html)
> >
> > If boost fiber relies on boost context, then boost fiber should select
> > boost context.
> >  
> Indeed a select would be better, I will update my patch.
> However, I was thinking to add a dependency because that's what is
> currently done for BR2_PACKAGE_BOOST_COROUTINE which depends on
> BR2_PACKAGE_BOOST_CONTEXT. But after checking the history in patchwork (
> http://patchwork.ozlabs.org/patch/539552), it seems this one is a special
> case and you wanted to avoid duplicating the dependencies of boost-context
> in boost-coroutine.

To be honest, I believe a "select" would have been more appropriate as
well in the coroutine->context dependency.

A hidden BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS dependency would help
simplify the handling of its architecture dependency.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
