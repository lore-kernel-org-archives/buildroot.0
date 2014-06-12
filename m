From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Thu, 12 Jun 2014 10:29:41 -0500
Subject: [Buildroot] problems with make graph-build on x86_64
Message-ID: <CAE9DZURkabAJ50=Upw9vuzDFsRnMLRoKBuKGLm_=V4Fn+4f-bw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I tried a make-graph build for the first time on Debian 7.2 / 32 bit the
other day.  It worked flawlessly.  Today, I tried it on RHEL 6.4 headless
server / x86_64.  This time, I got errors I was not able to resolve.

bash-4.1$ make graph-build
./support/scripts/graph-build-time --type=histogram --order=name
--input=output/build/build-time.log
--output=output/graphs/build.hist-name.pdf
Traceback (most recent call last):
  File "./support/scripts/graph-build-time", line 55, in <module>
    import matplotlib.pyplot as plt
  File "/usr/lib64/python2.6/site-packages/matplotlib/pyplot.py", line 78,
in <module>
    new_figure_manager, draw_if_interactive, show = pylab_setup()
  File
"/usr/lib64/python2.6/site-packages/matplotlib/backends/__init__.py", line
25, in pylab_setup
    globals(),locals(),[backend_name])
  File
"/usr/lib64/python2.6/site-packages/matplotlib/backends/backend_gtkagg.py",
line 10, in <module>
    from matplotlib.backends.backend_gtk import gtk, FigureManagerGTK,
FigureCanvasGTK,\
  File
"/usr/lib64/python2.6/site-packages/matplotlib/backends/backend_gtk.py",
line 8, in <module>
    import gtk; gdk = gtk.gdk
  File "/usr/lib64/python2.6/site-packages/gtk-2.0/gtk/__init__.py", line
64, in <module>
    _init()
  File "/usr/lib64/python2.6/site-packages/gtk-2.0/gtk/__init__.py", line
52, in _init
    _gtk.init_check()
RuntimeError: could not open display
make: *** [graph-build] Error 1

Has anyone experienced this same problem?  I'm not sure if this is a x86_64
problem or not having X11 installed.

Thanks,

Dallas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140612/fa9e135b/attachment.html>
