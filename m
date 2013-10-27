From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 27 Oct 2013 12:04:34 +0100
Subject: [Buildroot] [PATCH v2] jq: new package
In-Reply-To: <1380157795-1854-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Wed, 25 Sep 2013 21:09:55 -0400")
References: <1380157795-1854-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87li1fug8t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > jq is like sed for JSON data - you can use it to slice and filter
 > and map and transform structured data with the same ease that sed,
 > awk, grep and friends let you play with text.

 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Committed with some minor changes (see below) - Thanks.

 > diff --git a/package/jq/jq.mk b/package/jq/jq.mk
 > new file mode 100644
 > index 0000000..59cea9c
 > --- /dev/null
 > +++ b/package/jq/jq.mk
 > @@ -0,0 +1,13 @@
 > +################################################################################
 > +#
 > +# jq
 > +#
 > +################################################################################
 > +
 > +JQ_VERSION = 1.3
 > +JQ_SITE = http://github.com/stedolan/jq/tarball/jq-$(JQ_VERSION)
 > +JQ_AUTORECONF = YES

It uses flex/bison so you should depend on host-flex + host-bison.

 > +JQ_LICENSE = jq license

The license is actually MIT for the code and CC-BY-3.0 for the
documentation.

 > +JQ_LICENSE_FILES = COPYING

It uses c99 syntax so we need to enforce -std=c99 in the cflags.

-- 
Bye, Peter Korsgaard
