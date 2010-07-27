From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 21:18:45 +0200
Subject: [Buildroot] build failed - cannot stat libz.so*
In-Reply-To: <20100727190310.GA10996@merkur.ravnborg.org>
References: <20100727190310.GA10996@merkur.ravnborg.org>
Message-ID: <20100727211845.1941d75a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sam,

On Tue, 27 Jul 2010 21:03:10 +0200
Sam Ravnborg <sam@ravnborg.org> wrote:

> While trying to do a sparc build of buildroot I hit
> the following issue:
> 
> cp: cannot stat
> `/home/sam/devel/buildroot.git/output/build/zlib-1.2.3/libz.so*': No
> such file or directory make: ***
> [/home/sam/devel/buildroot.git/output/build/zlib-1.2.3/.stamp_staging_installed]
> Error 1
> 
> I checked and there is no lib*.so file in that dir.

Yes, because your configuration has :

BR2_PREFER_STATIC_LIB=y

which isn't the default value, and we don't test static libraries very
often. The zlib package is relatively easy to fix with regard to this
problem.

However, I'm really not sure that it will work properly with other
packages.

Do you have a particular reason for using static libraries ?

Peter, do we want to support static libraries ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
