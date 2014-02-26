From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Feb 2014 23:53:09 +0100
Subject: [Buildroot] [PATCH] libxml2: do not detect zlib/lzma when not
	available
In-Reply-To: <1393450055-30751-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 26 Feb 2014 22:27:35 +0100")
References: <1393450055-30751-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ppm9bi5m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The host-libxml2 package does not depend on zlib or lzma, but may
 > detect versions available on the host. This can cause problems in the
 > following situation:

 >  1 host-libxml2 is built, finds an available lzma library in the
 >    system, enables lzma support by using it.

 >  2 host-xz is built, which installs a different version of the lzma
 >    library into $(HOST_DIR)

 >  3 host-libxslt is built, tries to link against libxml2, which fails
 >    because now the visible lzma library is the one from
 >    $(HOST_DIR)/usr/lib and no longer the one libxml2 was built agains.

 > To fix this, this patch passes --without-zlib and --without-lzma to
 > the host package.

 > In addition, since the target variant of libxml2 does not have
 > provisions to depend on the target lzma, we also pass --without-lzma
 > for the target variant. The case of zlib for the target was already
 > properly taken into account.

 > Fixes:

 >   http://autobuild.buildroot.org/results/6dc/6dcef647eb0f0db7de3f34194eb15ceebc645b39/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
