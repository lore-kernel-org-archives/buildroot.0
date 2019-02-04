From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Feb 2019 21:45:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/thrift: bump to 0.12.0,
 add support for openssl 1.1.x
In-Reply-To: <20190121151716.16323-1-patrick.havelange@essensium.com> (Patrick
 Havelange's message of "Mon, 21 Jan 2019 16:17:16 +0100")
References: <20190121151716.16323-1-patrick.havelange@essensium.com>
Message-ID: <871s4ns2on.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Patrick" == Patrick Havelange <patrick.havelange@essensium.com> writes:

 > Switching to CMake as the autotools are not crosscompiler compatible.
 > Removed the patches related to autotools as no longer used.

 > Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
 > ---
 >  ...ipedTransport-peek-to-avoid-linker-e.patch | 31 +++++++
 >  package/thrift/0001-libevent-cross.patch      | 16 ----
 >  package/thrift/0002-autoreconf.patch          | 28 -------
 >  package/thrift/0003-zlib-cross.patch          | 16 ----
 >  ...k-minimum-required-version-of-automa.patch | 47 -----------
 >  .../0005-configure.ac-C-11-is-optional.patch  | 28 -------
 >  package/thrift/thrift.hash                    |  6 +-
 >  package/thrift/thrift.mk                      | 84 +++++++++----------
 >  8 files changed, 73 insertions(+), 183 deletions(-)
 >  create mode 100644 package/thrift/0001-Force-to-keep-TPipedTransport-peek-to-avoid-linker-e.patch
 >  delete mode 100644 package/thrift/0001-libevent-cross.patch
 >  delete mode 100644 package/thrift/0002-autoreconf.patch
 >  delete mode 100644 package/thrift/0003-zlib-cross.patch
 >  delete mode 100644 package/thrift/0004-THRIFT-3071-check-minimum-required-version-of-automa.patch
 >  delete mode 100644 package/thrift/0005-configure.ac-C-11-is-optional.patch

 > diff --git a/package/thrift/0001-Force-to-keep-TPipedTransport-peek-to-avoid-linker-e.patch b/package/thrift/0001-Force-to-keep-TPipedTransport-peek-to-avoid-linker-e.patch
 > new file mode 100644
 > index 0000000000..92c55d05a4
 > --- /dev/null
 > +++ b/package/thrift/0001-Force-to-keep-TPipedTransport-peek-to-avoid-linker-e.patch
 > @@ -0,0 +1,31 @@
 > +From f87ae3963e651fe9f4b3125192c77aae86c007e0 Mon Sep 17 00:00:00 2001
 > +From: Patrick Havelange <patrick.havelange@essensium.com>
 > +Date: Mon, 21 Jan 2019 09:49:23 +0100
 > +Subject: [PATCH] Force to keep TPipedTransport::peek() to avoid linker error.
 > +
 > +Otherwise got the "defined in discarded section" linker error
 > +with x86-64-musl toolchain. This is probably a toolchain issue - the
 > +compiler shouldn't remove that function.
 > +
 > +Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
 > +Upstream-status: Not Applicable

That sounds a bit odd, but oh well.

Committed, thanks.

-- 
Bye, Peter Korsgaard
