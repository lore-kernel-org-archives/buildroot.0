From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Nov 2009 13:41:30 +0100
Subject: [Buildroot] failure to bump libxml2 to version 2.7.6 :
	libtool-patch error
In-Reply-To: <B8B073A8C8E044988ED5D528DA4EFE70@apexjs> (Sagaert Johan's
	message of "Thu\, 26 Nov 2009 00\:19\:03 +0100")
References: <B8B073A8C8E044988ED5D528DA4EFE70@apexjs>
Message-ID: <877htda26d.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi
 Sagaert> In order to use the latest libxml 2.7.6 with a lot  bugs fixed
 Sagaert> I get this error when building : (just changed the version in the libxml2.mk)
 
 Sagaert> I don't see why a libtool-patch is been applied since there
 Sagaert> are no patch files in the package directory.

<package>_LIBTOOL_PATCH defaults to YES, so set it to NO if you don't
want it, E.G. add:

LIBXML2_LIBTOOL_PATCH = NO to package/libxml2/libxml2.mk

-- 
Bye, Peter Korsgaard
