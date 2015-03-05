From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Thu, 5 Mar 2015 09:40:49 +0100
Subject: [Buildroot] [PATCH v3 3/4] python-cheetah: add host-package
 support
In-Reply-To: <20150304224940.69efc51c@free-electrons.com>
References: <1425484811-26238-1-git-send-email-gwenj@trabucayre.com>
 <1425484811-26238-3-git-send-email-gwenj@trabucayre.com>
 <20150304224940.69efc51c@free-electrons.com>
Message-ID: <20150305094049.055a39b7@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni
On Wed, 4 Mar 2015 22:49:40 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Dear Gwenhael Goavec-Merou,
> 
> On Wed,  4 Mar 2015 17:00:10 +0100, Gwenhael Goavec-Merou wrote:
> 
> > diff --git a/package/python-cheetah/python-cheetah.mk b/package/python-cheetah/python-cheetah.mk
> > index 08076b5..faf2436 100644
> > --- a/package/python-cheetah/python-cheetah.mk
> > +++ b/package/python-cheetah/python-cheetah.mk
> > @@ -9,5 +9,7 @@ PYTHON_CHEETAH_SOURCE = Cheetah-$(PYTHON_CHEETAH_VERSION).tar.gz
> >  PYTHON_CHEETAH_SITE = http://pypi.python.org/packages/source/C/Cheetah
> >  PYTHON_CHEETAH_LICENSE = MIT
> >  PYTHON_CHEETAH_SETUP_TYPE = setuptools
> > +PYTHON_CHEETAH_DEPENDENCIES += host-python-markdown
> 
> Are you sure you need to add host-python-markdown as a dependency to
> the target python-cheetah package ? I.e, I'd like to understand if what
> you need is:
> 
> PYTHON_CHEETAH_DEPENDENCIES = host-python-markdown
> 
>  (i.e adds host-python-markdown to the dependencies of both
>  python-cheetah and host-python-cheetah)
> 
> *OR*
> 
> PYTHON_CHEETAH_DEPENDENCIES = python-markdown
> 
>  (i.e adds python-markdown to the dependencies of python-cheetah, and
>  host-python-markdown to the dependencies of host-python-cheetah)
> 
> *OR*
> 
> HOST_PYTHON_CHEETAH_DEPENDENCIES = host-python-markdown
> 
>  (i.e adds host-python-markdown to the dependencies of
>  host-python-cheetah)
> 
I'm wrong, it's true, host-python-markdown is only needed for
host-python-cheetah. I think the best solution is the second option, ie.
PYTHON_CHEETAH_DEPENDENCIES = python-markdown to be sure to have the correct
dependency in all case (although python-cheetah as not really needed to
python-markdown to be compiles).
>
> Also, use '=' and not '+=' in such situations.
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

Regards
Gwen
