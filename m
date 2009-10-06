From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 06 Oct 2009 22:42:14 +0200
Subject: [Buildroot] dbus-binding-tool
Message-ID: <1254861734.11487.8.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

we are using the dbus-binding-tool from host-dbus-glib in one of our
packages and today I found that the dbus-binding-tool binary calls
'glib-genmarshal'. So unless dbus-binding-tool is called with the PATH
adjusted to include host_dir/usr/bin before the system path, it will
fail in case that no glib-genmarshal is available on the host system.

I wonder how this should best be handled. For now I have adjusted our
build to call make with the PATH environment variable adjusted similar
to how Makefile.autotools.in does it. Should this be the recommended way
to call make or should we rather patch dbus-binding-tool in the
host-dbus-glib compile to explicitly call glib-genmarshal from
host_dir ?


Sven
