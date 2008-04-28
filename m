From: p <pmeloy@shaw.ca>
Date: Mon, 28 Apr 2008 07:30:33 -0700
Subject: [Buildroot] QWidget cannot check for file existence when
	cross	compiling
In-Reply-To: <d6cda7730804280619t28c08fe7racbee68f00a8fb7d@mail.gmail.com>
References: <20080427095133.504A83C6E3@busybox.net>
	<1209303687.31310.6.camel@rhodan.rho>
	<d6cda7730804280619t28c08fe7racbee68f00a8fb7d@mail.gmail.com>
Message-ID: <1209393033.19474.15.camel@rhodan.rho>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks! Classpath.mk had a bit different entry than --enable-qt but I
commented out the whole if..endif dealing with qt and I made it past. 

On Mon, 2008-04-28 at 10:19 -0300, Thiago A. Corr?a wrote:
> I had seen this in classpath.
> 
> It's a problem with it's configure. Only God knows why, but they added
> a check in the configure script that when crosscompiling, it will just
> fail with Qt integration enabled. There are 2 ways to fix it: drop the
> --enable-qt in classpath.mk or patch configure.
> 
> Kind Regards,
>    Thiago A. Correa
> 
> On Sun, Apr 27, 2008 at 10:41 AM, p <pmeloy@shaw.ca> wrote:
> > I've been trying to get past this error:
> >
> >  checking QT_LIBS... -L/home/pat/buildroot/build_arm/staging_dir/usr/lib
> >  -lQtGui -lpng -lQtNetwork -lQtCore -lz -lm -lrt -lpthread -ldl
> >  checking
> >  for /home/pat/buildroot/build_arm/staging_dir/usr/include/QtGui/QWidget... configure: error: cannot check for file existence when cross compiling
> >  make: ***
> >  [/home/pat/buildroot/build_arm/classpath-0.97.1/.stamp_configured] Error
> >  1
