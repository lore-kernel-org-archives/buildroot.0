From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jan 2020 20:50:34 +0100
Subject: [Buildroot] [PATCH] libnss: Re-add ZLIB_INCLUDE_DIR varible
In-Reply-To: <20200122164450.17963-1-thomas.preston@codethink.co.uk> (Thomas
 Preston's message of "Wed, 22 Jan 2020 16:44:50 +0000")
References: <20200122164450.17963-1-thomas.preston@codethink.co.uk>
Message-ID: <87lfpzxoc5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Preston <thomas.preston@codethink.co.uk> writes:

 > The libnss patch adding ZLIB_INCLUDE_DIR is added to upstream on
 > 2020-01-07 but the 3.49.1 release on 2020-01-13 does not contain this
 > patch, so we have actually prematurely removed it from Buildroot.

 > This only affects host-libnss when libzlib is not installed in the host
 > system. When building for the target, the toolchain-wrapper already
 > looks in the target sysroot default include path - where zlib.h is
 > installed.

 > Re-add this patch, so that we can build host-libnss 3.49.1.

 > Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>

Committed after fixing the prefix, thanks.

-- 
Bye, Peter Korsgaard
