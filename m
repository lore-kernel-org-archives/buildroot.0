From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 5 Dec 2013 19:04:05 +0100
Subject: [Buildroot] genmanual: generates kconfiglib.pyc in Buildroot
 source tree
In-Reply-To: <20131205175218.GA3405@free.fr>
References: <20131204225227.GH3332@free.fr> <52A03286.3070808@mind.be>
 <20131205175218.GA3405@free.fr>
Message-ID: <CAHXCMMKE4oP=rbrCryLSA7bn3upRzuXKMdNT15Zv2zfehieAgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Arnout, all,

2013/12/5 Yann E. MORIN <yann.morin.1998@free.fr>

> Arnout, All,
>
> On 2013-12-05 09:00 +0100, Arnout Vandecappelle spake thusly:
> > On 04/12/13 23:52, Yann E. MORIN wrote:
> > >Samuel, All,
> > >
> > >When one runs 'make manual', python will create:
> > >     support/scripts/kconfiglib.pyc
> > >in the Buildroot source tree.
> > >
> > >Python will happily run, even if it is not able to generate that file
> > >(eg. because the source tree is read-only).
> > >
> > >However, the file is not cleaned on 'make clean'. I'm a bit reluctant at
> > >adding it since it would try to remove a file outside of $(O), which
> > >could break parallel builds in multiple $(O) at the same time... Not
> > >sure what to do here.
> > >
> > >Since we do not really care about speed, would it be possible to tell
> > >python not to generate it at all?
> >
> >  I do 'man python', and the first thing I see is
> >
> > -B     Don't write .py[co] files on import. See also
> PYTHONDONTWRITEBYTECODE.
>
> Hey! I read the manpage, but only greped for '\.pyc' not for this.
> Thanks for pointing it to me.
>
> >  I'd say, go for it! Unfortunately, you can't add it directly in the #!
> line
> > of the script because all the arguments are concatenated together. So I
> > guess the PYTHONDONTWRITEBYTECODE environment variable should be set when
> > calling the script.
>
But, in manual.mk, you can explicitly call:
python -B $(TOPDIR)/support/scripts/gen-manual-lists.py


> Patch on its way.


Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131205/4590a129/attachment.html>
