From: Woody Wu <narkewoody@gmail.com>
Date: Thu, 5 Sep 2013 14:02:35 +0800
Subject: [Buildroot] GTK+ for framebuffer?
In-Reply-To: <20130904093510.031f559b@skate>
References: <20130903100905.GA324@zuhnb712.ap.bm.net>
 <20130903133145.370bb2d4@skate>
 <20130904024019.GA875@zuhnb712.ap.bm.net>
 <20130904093510.031f559b@skate>
Message-ID: <20130905060235.GA15735@zuhnb712.ap.bm.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 04, 2013 at 09:35:10AM +0200, Thomas Petazzoni wrote:
> Dear Woody Wu,
> 
> On Wed, 4 Sep 2013 10:40:19 +0800, Woody Wu wrote:
> 
> > Even I cannot find libgtk (neither 2.x or 3.x) in buildroot.  I
> > enabled a lot of options which looks like related to gtk, then I got
> > libraries like glib, pango, atk, etc., but just no gtk.  Where is the
> > option to enable it? I think I looked through all the options :(
> 
> Hint: in menuconfig, hit '/', and then search for LIBGTK2. This will
> show you where the option for Gtk is located, what are its
> dependencies, and which of its dependencies are not satisfied at the
> moment.
> 
> Here is what I have here:
> 
> Symbol: BR2_PACKAGE_LIBGTK2 [=n]
> Type  : boolean
> Prompt: libgtk2
>   Defined at package/libgtk2/Config.in:1
>   Depends on: BR2_PACKAGE_XORG7 [=n] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_INSTALL_LIBSTDCPP [=y]
>   Location:
>     -> Target packages
>        -> Libraries
>  (2)      -> Graphics
> 
> This tells you that libgtk2 package is currently not selected ([=n] on
> the first line). This tells you the libgtk2 package is located in
> Target packages -> Libraries -> Graphics. And more importantly, the
> line "Depends on:" gives you the list of dependencies. In the example
> above, there are four dependencies: the last three dependencies (wchar,
> threads and C++) are satisfied. However, the first dependency,
> BR2_PACKAGE_XORG7 is not satisfied (see the [=n]).
> 
> So to be able to enable Gtk, you need to enable X.org.
> 
> > BTW: in your opinion, GtkFB and gtk on TinyX, which one is faster?
> 
> I have no idea as I haven't benchmarked. However, I'm not sure why you
> keep talking about GtkFB: the DirectFB for Gtk is no longer maintained,
> so it cannot be used. Your only reasonable option today for Gtk 2.x is
> with X.org.
> 
> A while ago, I remember switching a project from Gtk/DirectFB (at the
> time it was more or less working) to Gtk/X.org because it ended up
> working better. I don't quite remember if it was a font rendering
> problem, or a performance problem, but clearly, Gtk/X.org fixed the
> problem.
> 

Thoams,

Many thanks for your information.  Now I feel more clear that I should
go Gtk/X.org.  On the other side, I have no experience on running x.org
on an embeded system. What things in buildroot I should enable to build
a minimal system that can at lest run the gtk demons on TinyX? My
display is just framebuffer. I understand, the question may sounds a
little stupid.  Looking forward for your help.


-- 
I can't go back to yesterday - because I was a different person then
