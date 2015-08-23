From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Aug 2015 20:58:57 +0200
Subject: [Buildroot] [PATCH] package/wf111: remove package
In-Reply-To: <20150823153737.GD3729@free.fr>
References: <1440202387-7291-1-git-send-email-yann.morin.1998@free.fr>
 <20150823163653.3989f210@free-electrons.com>
 <20150823153737.GD3729@free.fr>
Message-ID: <20150823205857.1625a64f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all,

On Sun, 23 Aug 2015 17:37:37 +0200, Yann E. MORIN wrote:

> > We are using this package for a real project,
> 
> Irrelevant.

Really? If usefulness in real life projects is irrelevant as an argument
for a feature in Buildroot, then it's Buildroot that is soon going to
become irrelevant.

> Some users of Buildroot want binary packages so they can use ipkg, opkg
> or rpm to install/remove/update packages on the target. We're however
> saying that's not something that Buildroot should provide.
> 
> Some users want a compiler on the target. Yet, we're still arguing that
> is not a goal Buildroot should pursue.

Those two arguments have nothing to do with the current topic. The
arguments you mention are general features that we have decided to not
support to keep the build system simple. The wf111 package does not add
*any* complexity to Buildroot. Contrary to some other packages that
have required addition/extensions to the common package infrastructure,
absolutely no changes were needed for the wf111 package.

So those two arguments are irrelevant.

> I do not think a corporate will should be the *sole* reason we have
> something in Buildroot.

I agree. But it's not only corporate will: we are not the only company
using it. As I said in my previous e-mail, another user on the mailing
list said he was using the wf111 package.

> > We did contact Bluegiga (the upstream for this package) about the
> > annoyance caused by the registration process needed to download the
> > tarball. However, for licensing/legal reasons, they apparently have no
> > other choice, and they are well aware of the annoyance caused by this
> > process.
> 
> OK, I would have bet you had contacted them. Sad they did not change
> their mind. :-(

They cannot change their mind. I even met a Bluegiga representative at
a trade show a few months ago, and discussed with him the matter. The
problem is that their hardware include a chip from a third-party
manufacturer that does not allow redistributing the code without
agreeing with some stupid licensing conditions. So there's nothing
Bluegiga can do (except using a different vendor for their future
products, but that will not solve the problem for wf111).

> > The wf111 package bundles a kernel module (built from source) and some
> > binary only user-space tools. For the embedded Linux systems that use
> > the Bluegiga WF111 chip, it makes things a lot easier to have the wf111
> > integrated in Buildroot, rather than having to build it separately.
> 
> Well, that's not an excuse.

Ah? Making the build process of an embedded Linux easy is not an excuse
to have a feature in Buildroot? Then what is the purpose of Buildroot?

> > In addition, the registration process is free and can be done by anyone
> > interested by the package.
> 
> From what I understood from their registration form (which I did not
> fill), is that this is a manual process on their side, and that
> non-coporate users will simply be treated as second-zone:
> 
>     Please use your business e-mail address in the form. Use of non
>     business e-mail domains may delay account creation.

That is indeed possible, unfortunately. Not something I can control.

> License for those packages not the problem. They are directly
> downloadable. There is no artificial technical barrier to getting their
> archives (tar/zip/git/...)
> 
> That package is the *only* one we have in BR (unless I missed any) for
> which this is not the case.

At the moment, yes. Remember that some time ago, a guy from The Qt
Company came on IRC and asked whether there was some interest in
supporting in Buildroot the Qt components that are not freely
available, but only available for paying Qt customers. What should we
do in this case? Also reject the patches?

> > So, I completely disagree with this removal proposal, especially since
> > there is absolutely no real problem caused by this package.
> 
> Oh, it does not. I was surprised to not see it in the autobuilders. But
> that's simply because it depends on a kernel to be built, and we never
> build a kernel.
> 
> The day we use a testing framework (like your nice pending proposal), we
> will start to see failures because of that package. And blacklisting it
> in the autobuilders' code would not be the right answer.
> 
> So, I completely disagree with these non-removal arguments you made.

I agree that the non-testability of the package is annoying, but I
don't really see how to overcome this problem. Keep this package in
private tree, and have every user of wf111 struggle with their
sub-optimal build system? Not ideal either.

So I agree it's not ideal, but I'm not sure the removal of the package
will actually make the situation better.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
