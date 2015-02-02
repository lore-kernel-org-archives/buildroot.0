From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 2 Feb 2015 14:42:16 +0100
Subject: [Buildroot] [PATCH] python-coherence: new package
In-Reply-To: <8761bmtx6l.fsf@dell.be.48ers.dk>
References: <1422573566-17421-1-git-send-email-yegorslists@googlemail.com>
 <8761bmtx6l.fsf@dell.be.48ers.dk>
Message-ID: <CAGm1_kt8ezeDA_aZGRL0CVuNCkAUg_YevbHNhrP5Arbqi7ujnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 31, 2015 at 11:14 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:
>
>  > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>  > ---
>  >  package/Config.in                              |  1 +
>  >  package/python-coherence/Config.in             |  9 +++++++++
>  >  package/python-coherence/python-coherence.hash |  2 ++
>  >  package/python-coherence/python-coherence.mk   | 14 ++++++++++++++
>  >  4 files changed, 26 insertions(+)
>  >  create mode 100644 package/python-coherence/Config.in
>  >  create mode 100644 package/python-coherence/python-coherence.hash
>  >  create mode 100644 package/python-coherence/python-coherence.mk
>
>  > +config BR2_PACKAGE_PYTHON_COHERENCE
>  > +    bool "python-coherence"
>  > +    depends on BR2_PACKAGE_PYTHON
>  > +    select BR2_PACKAGE_PYTHON_TWISTED
>  > +    select BR2_PACKAGE_PYTHON_PYASN
>  > +    help
>  > +      A DLNA/UPnP Media Server and Framework for the Digital Living.
>  > +
>  > +      http://coherence-project.org/
>  > +++ b/package/python-coherence/python-coherence.mk
>  > @@ -0,0 +1,14 @@
>  > +################################################################################
>  > +#
>  > +# python-coherence
>  > +#
>  > +################################################################################
>  > +
>  > +PYTHON_COHERENCE_VERSION = 0.6.6.2
>  > +PYTHON_COHERENCE_SITE = $(call github,coherence-project,Coherence,Coherence-$(PYTHON_COHERENCE_VERSION))
>  > +PYTHON_COHERENCE_SETUP_TYPE = setuptools
>  > +PYTHON_COHERENCE_LICENSE = MIT
>  > +PYTHON_COHERENCE_LICENSE_FILES = LICENSE
>  > +PYTHON_COHERENCE_DEPENDENCIES = python-twisted python-zope-interface python-pyasn
>
> Sorry, forgot to mention that I've added the missing select for
> zope-interface.

Actually select comes from BR2_PACKAGE_PYTHON_TWISTED. The point is,
that BR2_PACKAGE_PYTHON_TWISTED doesn't need zope at compile time, so
I don't have it in twisted's dependencies. coherency needs both as
dependency. But I think, it is OK to leave the settings as they are
now.

Yegor
