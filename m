From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 11 Nov 2013 22:43:40 +0100
Subject: [Buildroot] [PATCH 2/4] pkg-infra: introduce pre/post-step hooks
In-Reply-To: <CAAXf6LULdQO4m__yTpKGxc0GOKBERMvDQiOw-KqHT6sDZbQ=zQ@mail.gmail.com>
References: <cover.1384182040.git.yann.morin.1998@free.fr>
 <45a2fcd241df87a109cc7ca1044217788f407c02.1384182040.git.yann.morin.1998@free.fr>
 <CAAXf6LULdQO4m__yTpKGxc0GOKBERMvDQiOw-KqHT6sDZbQ=zQ@mail.gmail.com>
Message-ID: <CAHXCMMKcdG3oZOXuC3EzA6jtnBB4ithdBm+_TJ0Zv3FpBJhspw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/11/11 Thomas De Schampheleire <patrickdepinguin@gmail.com>

> On Mon, Nov 11, 2013 at 4:03 PM, Yann E. MORIN <yann.morin.1998@free.fr>
> wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> > This hooks will let us instrument the build process in many ways:
> >   - log current step to see what broke
> >   - time each step to see what is worth optimising
> >   - sanity-check installed files (rpath, overwritten files...)
> >   - call user-provided script
> >   - ...
> >
> > The steps are coarse-grain, and all have a 'start' and a 'end' hooks.
> > Here is the list of available steps (8 total):
> >   - extract
> >   - patch
> >   - configure
> >   - build
> >   - install-host
> >   - install-staging
> >   - install-image
> >   - install-target
> >
> > The download, clean and uninstall steps are not instrumented on purpose.
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> > ---
> >  package/pkg-generic.mk | 40 ++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
>
> Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131111/172daead/attachment.html>
