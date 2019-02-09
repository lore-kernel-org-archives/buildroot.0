From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 09 Feb 2019 12:49:00 +0100
Subject: [Buildroot] [PATCH 2/2] package/libopenssl: add runtime fixes
 for tor
In-Reply-To: <20190209101139.13168-2-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 9 Feb 2019 11:11:39 +0100")
References: <20190209101139.13168-1-bernd.kuhls@t-online.de>
 <20190209101139.13168-2-bernd.kuhls@t-online.de>
Message-ID: <87lg2pxjv7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > For details see https://bugs.archlinux.org/task/61623
 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  ...ession-in-SSL_export_keying_material.patch | 533 ++++++++++++++++++
 >  1 file changed, 533 insertions(+)
 >  create mode 100644 package/libopenssl/0005-Fix-a-regression-in-SSL_export_keying_material.patch

 > diff --git
 > a/package/libopenssl/0005-Fix-a-regression-in-SSL_export_keying_material.patch
 > b/package/libopenssl/0005-Fix-a-regression-in-SSL_export_keying_material.patch
 > new file mode 100644
 > index 0000000000..4b857ca28c
 > --- /dev/null
 > +++ b/package/libopenssl/0005-Fix-a-regression-in-SSL_export_keying_material.patch
 > @@ -0,0 +1,533 @@
 > +From cbad0a61cd7c433be4e085de2d0eb0354fe4522f Mon Sep 17 00:00:00 2001
 > +From: Matt Caswell <matt@openssl.org>
 > +Date: Mon, 3 Dec 2018 18:14:57 +0000
 > +Subject: [PATCH 1/4] Revert "Reduce stack usage in tls13_hkdf_expand"

..

 > +Subject: [PATCH 2/4] Fix some SSL_export_keying_material() issues

..

 > +Subject: [PATCH 3/4] fixup! Fix some SSL_export_keying_material() issues

..

 >+Subject: [PATCH 4/4] fixup! Fix some SSL_export_keying_material() issues

Wait, why do you have 4 separate patches in a single file? Please add
them as separate patches instead.

-- 
Bye, Peter Korsgaard
