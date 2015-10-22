From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Oct 2015 23:33:34 +0200
Subject: [Buildroot] [PATCH v4] python-ranger: new package
In-Reply-To: <1445454558-16326-1-git-send-email-thijsvermeir@gmail.com> (Thijs
 Vermeir's message of "Wed, 21 Oct 2015 21:09:18 +0200")
References: <1445454558-16326-1-git-send-email-thijsvermeir@gmail.com>
Message-ID: <87mvvak2q9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thijs" == Thijs Vermeir <thijsvermeir@gmail.com> writes:

 > ranger is a console file manager with VI key bindings. It provides a
 > minimalistic and nice curses interface with a view on the directory hierarchy.
 > It ships with "rifle", a file launcher that is good at automatically finding
 > out which program to use for what file type.

 > http://ranger.nongnu.org

 > Signed-off-by: Thijs Vermeir <thijsvermeir@gmail.com>

 > ---
 > Changes v3 -> v4:
 > - rename python-ranger -> ranger

But you forgot to change the subject ;)
 > +config BR2_PACKAGE_RANGER
 > +	bool "ranger"
 > +	depends on BR2_USE_MMU # python3
 > +	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
 > +	depends on !BR2_STATIC_LIBS # python3
 > +	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
 > +	select BR2_PACKAGE_PYTHON_CURSES if BR2_PACKAGE_PYTHON
 > +	select BR2_PACKAGE_PYTHON3_CURSES if BR2_PACKAGE_PYTHON3
 > +	help
 > +	  ranger is a console file manager with VI key bindings. It provides a
 > +	  minimalistic and nice curses interface with a view on the directory hierarchy.
 > +	  It ships with "rifle", a file launcher that is good at automatically finding
 > +	  out which program to use for what file type.

Help text should be wrapped to ~72 chars so menuconfig displays
correctly in a 80 chars window.
 > +
 > +	  http://ranger.nongnu.org
 > diff --git a/package/ranger/ranger.hash b/package/ranger/ranger.hash
 > new file mode 100644
 > index 0000000..989d76e
 > --- /dev/null
 > +++ b/package/ranger/ranger.hash
 > @@ -0,0 +1 @@
 > +sha256 80917c93396e46272b6de63816d925eb708291a9f7a559d49b24c571ea0eeeb3 ranger-1.7.2.tar.gz

We normally add a comment explaining where the hash comes from (Locally
calculated in this case).

> diff --git a/package/ranger/ranger.mk b/package/ranger/ranger.mk
 > new file mode 100644
 > index 0000000..46f318b
 > --- /dev/null
 > +++ b/package/ranger/ranger.mk
 > @@ -0,0 +1,26 @@
 > +################################################################################
 > +#
 > +# ranger
 > +#
 > +################################################################################
 > +
 > +RANGER_VERSION = 1.7.2
 > +RANGER_SITE = $(call github,hut,ranger,v$(RANGER_VERSION))

I see that there's tarballs with gpg signatures on ranger.nongnu.org, so
I've changed to use that instead (and used the signature to validate the
hash).

Committed with these fixes, thanks!

-- 
Bye, Peter Korsgaard
