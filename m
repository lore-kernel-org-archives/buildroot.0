From: Asaf Kahlon <asafka7@gmail.com>
Date: Sun, 22 Dec 2019 19:39:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pathlib2: select
 python-scandir
In-Reply-To: <20191222144200.048e1559@windsurf>
References: <20191216194815.5436-1-asafka7@gmail.com>
 <20191222144200.048e1559@windsurf>
Message-ID: <CALFsTFWKxZkoyyxJETMsO1966tm5OGr8aWSWYCX6p4bk9+_fLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Dec 22, 2019 at 3:42 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon, 16 Dec 2019 21:48:15 +0200
> Asaf Kahlon <asafka7@gmail.com> wrote:
>
> > scandir is a runtime dependency of pathlib2.
> >
> > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> > ---
> >  package/python-pathlib2/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/package/python-pathlib2/Config.in b/package/python-pathlib2/Config.in
> > index e28de4c12e..ca948c271f 100644
> > --- a/package/python-pathlib2/Config.in
> > +++ b/package/python-pathlib2/Config.in
> > @@ -1,6 +1,7 @@
> >  config BR2_PACKAGE_PYTHON_PATHLIB2
> >       bool "python-pathlib2"
> >       depends on BR2_PACKAGE_PYTHON
> > +     select BR2_PACKAGE_PYTHON_SCANDIR # runtime
>
> I see this in the setup.py:
>
>     extras_require={
>         ':python_version<"3.5"': ['scandir'],
>         },
>
> Doesn't that mean that it is needed only if the Python version is < 3.5 ?

Yeah that's true, but pathlib2 can be chosen only for python 2,
so we can say for sure it's needed.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Regards,
Asaf.
