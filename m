From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Feb 2019 20:12:58 +0100
Subject: [Buildroot] [PATCH v2,
 2/4] package/python-pyyaml: add host variant
In-Reply-To: <20190210142619.8207-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 10 Feb 2019 15:26:17 +0100")
References: <20190210142619.8207-1-fontaine.fabrice@gmail.com>
 <20190210142619.8207-2-fontaine.fabrice@gmail.com>
Message-ID: <87pnrwu8g5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > host-python-pyyaml is needed for mongodb 4.0.6
 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/python-pyyaml/python-pyyaml.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
 > index 95f0f0bb9e..961a3135db 100644
 > --- a/package/python-pyyaml/python-pyyaml.mk
 > +++ b/package/python-pyyaml/python-pyyaml.mk
 > @@ -11,5 +11,7 @@ PYTHON_PYYAML_SETUP_TYPE = distutils
 >  PYTHON_PYYAML_LICENSE = MIT
 >  PYTHON_PYYAML_LICENSE_FILES = LICENSE
 >  PYTHON_PYYAML_DEPENDENCIES = libyaml
 > +HOST_PYTHON_DEPENDENCIES = host-libyaml

check-package nicely warns about this:

Applying: package/python-pyyaml: add host variant
package/python-pyyaml/python-pyyaml.mk:14: possible typo: HOST_PYTHON_DEPENDENCIES -> *PYTHON_PYYAML*

I've changed it to HOST_PYTHON_PYYAML_DEPENDENCIES = host-libyaml

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
