From: Denis Thulin <denis.thulin@openwide.fr>
Date: Tue, 23 Jun 2015 18:14:35 +0200 (CEST)
Subject: [Buildroot] [PATCH 2/3] python-robotframework: New package
In-Reply-To: <5586B1C4.3020901@mind.be>
Message-ID: <605803345.2006607.1435076075482.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On 06/21/15 14:44, Arnout Vandecappelle wrote:
> On 06/15/15 12:06, Denis THULIN wrote:
> > A generic test automation framework written in python.
> > 
> > Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
> [snip]
> > diff --git
> > a/package/python-robotframework/python-robotframework.hash
> > b/package/python-robotframework/python-robotframework.hash
> > new file mode 100644
> > index 0000000..7d9ec46
> > --- /dev/null
> > +++ b/package/python-robotframework/python-robotframework.hash
> > @@ -0,0 +1,2 @@
> > +# sha356 calculated by scanpypi
> > +sha356
> > 	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
> >  robotframework-2.9a2.tar.gz
> 
>  Doesn't this give an error? I couldn't check for myself since the
>  file has
> vanished from pypi...

The file is still on pypi : 
https://pypi.python.org/packages/source/r/robotframework/robotframework-2.9a2.tar.gz
But sha356 does not exist as far as I know and the sha256 was wrong anyway
because I accidently deleted a line from scanpypi.py

> 
> > diff --git a/package/python-robotframework/python-robotframework.mk
> > b/package/python-robotframework/python-robotframework.mk
> > new file mode 100644
> > index 0000000..437d5f4
> > --- /dev/null
> > +++ b/package/python-robotframework/python-robotframework.mk
> > @@ -0,0 +1,14 @@
> > +################################################################################
> > +#
> > +# python-robotframework
> > +#
> > +################################################################################
> > +
> > +PYTHON_ROBOTFRAMEWORK_VERSION = 2.9a2
> > +PYTHON_ROBOTFRAMEWORK_SOURCE =
> > robotframework-$(PYTHON_ROBOTFRAMEWORK_VERSION).tar.gz
> > +PYTHON_ROBOTFRAMEWORK_SITE =
> > https://pypi.python.org/packages/source/r/robotframework/
> > +PYTHON_ROBOTFRAMEWORK_SETUP_TYPE = distutils
> > +PYTHON_ROBOTFRAMEWORK_LICENSE = Apache License 2.0
> 
>  Apache-2.0
>

I will correct that.


Regards,

Denis
 
> 
>  Regards,
>  Arnout
> 
> > +PYTHON_ROBOTFRAMEWORK_LICENSE_FILES = LICENSE.txt
> > +
> > +$(eval $(python-package))
> > 
> 
> 
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR
> Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> 
