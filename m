From: Barney Barumba <barney.b@iname.com>
Date: Fri, 5 Jun 2009 15:39:44 +1000
Subject: [Buildroot] xfsprogs in BR 2009.05
Message-ID: <20090605053945.149BF8735C@cal1-1.us4.outblaze.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Building xfsprogs in BR 2009.05 gives me the following error:

  make: *** No rule to make target `libtool-cross', needed by `xfsprogs'.  Stop.

This appears to be because libtool removed the libtool-cross target
between 2009.02 and 2009.05. Changing the dependency from 'libtool-cross'
to 'libtool' in the makefile (xfsprogs.mk), and manually selecting libtool
in the makefile appears to work, but that's just me hacking without really
knowing what's going on!

Is this the correct fix for this problem?

After that, there is an error building xfs_copy, but removing that from
the build appears to build the rest of the tools successfully.

If the libtool fix is correct, I'll look into the xfs_copy error more,
but I don't really want to go there until I know I'm building with the
correct libraries.

Cheers,

Barney

-- 
Be Yourself @ mail.com!
Choose From 200+ Email Addresses
Get a Free Account at www.mail.com
