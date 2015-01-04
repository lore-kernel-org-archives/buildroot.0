From: Oli Vogt <oli.vogt.pub01@gmail.com>
Date: Mon, 5 Jan 2015 11:37:34 +1300
Subject: [Buildroot] [PATCH 1/1] python-django: new package
In-Reply-To: <20150104220810.131bd08d@free-electrons.com>
References: <1420244904-23270-1-git-send-email-oli.vogt.pub01@gmail.com>
 <20150104220810.131bd08d@free-electrons.com>
Message-ID: <CAAwwcmTD55=ZS7z_iTVmZz-cSmGw27wntqtcy4Bmm0+WJ_L6HA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas.

I should have put this in covering letter:

 Yes it should work with Python3 however I was not able to test it as I use
2.7. This meant I was not sure about core module dependencies. Thanks.
 Also: I only tested it as ARM cross compile.
 Sorry about the download link I 'hand-downloaded' the tarball to get
things started and did not delete it to test. Thanks again.

oli

On 5 January 2015 at 10:08, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear oli vogt,
>
> On Sat,  3 Jan 2015 13:28:24 +1300, oli vogt wrote:
>
> > diff --git a/package/python-django/Config.in
> b/package/python-django/Config.in
> > new file mode 100644
> > index 0000000..c48a381
> > --- /dev/null
> > +++ b/package/python-django/Config.in
> > @@ -0,0 +1,15 @@
> > +config BR2_PACKAGE_PYTHON_DJANGO
> > +     bool "python-django"
> > +     depends on BR2_PACKAGE_PYTHON
>
> What about Python 3 ? Django supports both Python 2 and Python 3. I've
> changed this to allow Django to be built with Python 3.
>
> > +PYTHON_DJANGO_VERSION = 1.7.1
>
> 1.7.2 is out, so I've bumped to this version.
>
> > +PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
> > +PYTHON_DJANGO_SITE =
> https://www.djangoproject.com/download/$(PYTHON_DJANGO_VERSION)/tarball/
>
> This didn't work, because the URL to download Django is just
> https://www.djangoproject.com/download/$(PYTHON_DJANGO_VERSION)/tarball/,
> while Buildroot expects $(PYTHON_DJANGO_SITE)/$(PYTHON_DJANGO_SOURCE).
> So I've switched to pypi as the source for Django.
>
> Patch applied with those changes, see
>
> http://git.buildroot.net/buildroot/commit/?id=71d6705ef6a3516325891bc117b3253b49ca0f5f
> .
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150105/438084e6/attachment.html>
