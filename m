From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Aug 2017 17:58:10 +0200
Subject: [Buildroot] [PATCH v2 1/1] webkitgtk: Add patch for properly
 picking GL flags when building
In-Reply-To: <20170803181034.GB17397@momiji>
References: <20170803113109.20158-1-aperez@igalia.com>
 <20170803154156.58737072@windsurf.home>
 <20170803181034.GB17397@momiji>
Message-ID: <20170803175810.71d1fcca@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 3 Aug 2017 18:10:34 +0300, Adrian Perez de Castro wrote:

> On Thu, 3 Aug 2017 15:41:56 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> > On Thu,  3 Aug 2017 14:31:09 +0300, Adrian Perez de Castro wrote:  
> > > This solves build failures caused by WebKit trying to include X11 headers
> > > when support for X11 is disabled in Mesa3D. A common situation is when
> > > configuring both GTK+ and WebKitGTK+ only with Wayland support.  
> > 
> > Have such errors occurred in the autobuilders? If so, we want to have a
> > reference to such autobuilder failures in the commit log.  
> 
> Unfortunately, I have not seen this kind of build failure in the autobuilder
> logs, sorry. But the issue certainly exists, and I can experience it myself,
> and I am aware of a couple of work mates who have hit this ? one of them
> Carlos Lopez, who made the patch for the WebKit CMake files.

In this case, ideally having a defconfig that exhibits the issue is
always nice. Don't bother adding it now, but next time, when you fix a
build failure, adding some kind of minimal defconfig is very good. For
trivial build issues, it's not needed. But for build issues that
involve multiple packages in specific configurations (such as a
condition of a given OpenGL provider and WebkitGtk), having a defconfig
is good.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
