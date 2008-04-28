From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 28 Apr 2008 10:19:58 -0300
Subject: [Buildroot] QWidget cannot check for file existence when cross
	compiling
In-Reply-To: <1209303687.31310.6.camel@rhodan.rho>
References: <20080427095133.504A83C6E3@busybox.net>
	<1209303687.31310.6.camel@rhodan.rho>
Message-ID: <d6cda7730804280619t28c08fe7racbee68f00a8fb7d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I had seen this in classpath.

It's a problem with it's configure. Only God knows why, but they added
a check in the configure script that when crosscompiling, it will just
fail with Qt integration enabled. There are 2 ways to fix it: drop the
--enable-qt in classpath.mk or patch configure.

Kind Regards,
   Thiago A. Correa

On Sun, Apr 27, 2008 at 10:41 AM, p <pmeloy@shaw.ca> wrote:
> I've been trying to get past this error:
>
>  checking QT_LIBS... -L/home/pat/buildroot/build_arm/staging_dir/usr/lib
>  -lQtGui -lpng -lQtNetwork -lQtCore -lz -lm -lrt -lpthread -ldl
>  checking
>  for /home/pat/buildroot/build_arm/staging_dir/usr/include/QtGui/QWidget... configure: error: cannot check for file existence when cross compiling
>  make: ***
>  [/home/pat/buildroot/build_arm/classpath-0.97.1/.stamp_configured] Error
>  1
>
>  I checked and the QWidget file does exist in the path specified. I
>  thought maybe it was something missing on the host so I installed
>  everything QT4ish that seemed remotely appropriate.
>
>  I just checked out the buildroot SVN this morning and modified the
>  qtopia4.mk to use a few different snapshots of 4.4.0 (the original
>  snapshot specified no longer exists) but always the same result.
>
>  Any clues as to how to get past this?
>
>
>  _______________________________________________
>  buildroot mailing list
>  buildroot at uclibc.org
>  http://busybox.net/mailman/listinfo/buildroot
>
