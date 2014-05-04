From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 04 May 2014 23:18:43 +0200
Subject: [Buildroot] [PATCH v2 03/24] armadillo: new package
In-Reply-To: <1398208556-4195-4-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Wed, 23 Apr 2014 01:15:35 +0200")
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
 <1398208556-4195-4-git-send-email-s.martin49@gmail.com>
Message-ID: <87wqe1i6oc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > Armadillo is a C++ linear algebra library.
 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 > ---
 > changes v1 -> v2:
 > - rebase
 > - add comment when toolchain has not C++
 > ---
 >  package/Config.in              |  1 +
 >  package/armadillo/Config.in    | 12 ++++++++++++
 >  package/armadillo/armadillo.mk | 15 +++++++++++++++
 >  3 files changed, 28 insertions(+)
 >  create mode 100644 package/armadillo/Config.in
 >  create mode 100644 package/armadillo/armadillo.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 07fd166..4475b07 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -766,6 +766,7 @@ source "package/zyre/Config.in"
 >  endmenu
 
 >  menu "Other"
 > +source "package/armadillo/Config.in"
 >  source "package/apr/Config.in"
 >  source "package/apr-util/Config.in"
 >  source "package/argp-standalone/Config.in"
 > diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
 > new file mode 100644
 > index 0000000..8d7e9f3
 > --- /dev/null
 > +++ b/package/armadillo/Config.in
 > @@ -0,0 +1,12 @@
 > +comment "armadillo needs a toolchain w/ C++"
 > +	depends on !BR2_INSTALL_LIBSTDCPP

As clapack needs largefile, then so does armadillo.

Committed with this and Yann's ordering comment fixed, thanks.

-- 
Bye, Peter Korsgaard
