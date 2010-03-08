From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Mon, 8 Mar 2010 16:51:44 -0500
Subject: [Buildroot] mtd-utils fails to build
In-Reply-To: <877hpmv63z.fsf@macbook.be.48ers.dk>
References: <BD79186B4FD85F4B8E60E381CAEE190902242788@mi8nycmail19.Mi8.com>
	<877hpmv63z.fsf@macbook.be.48ers.dk>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19090224279E@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, March 08, 2010 2:47 PM, Peter Korsgaard wrote:
>>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

 H> Hello all,
 H> I am trying to do a clean build using the current git pull of buildroot.

 H> Everything goes as expected until trying to build mtd-utils. When trying
 H> to build mkfs.jffs2 the build cannot find zlib.h and errors out.

 H> It appears that a compile and assemble, but do not link (option -c), happens
 H> first for each file followed by compile and place output into <file>
 H> (option -o).

 H> The problem appears to be that the -c option happens without passing the
 H> --sysroot configuration so the compiler cannot locate the external headers.

 H> Following is a snip of the last part of the build:

> Thanks, fixed in git:

That fixed it!  Thanks for the quick feedback!

Regards,
Hartley
