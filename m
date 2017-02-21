From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 21 Feb 2017 13:15:05 +0200
Subject: [Buildroot] GObject introspection
Message-ID: <20170221111505.n57qgjfzkfynlesw@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot list,

GObject introspection[1] is not currently packaged for Buildroot. Quite a few 
packages disable introspection support at build time. If fact, we go into 
great trouble to disable introspection in libgtk3. Is there a reason why we 
don't package GObject introspection other than "nobody felt the need"? Does 
introspection require special build time handling?

My goal is to package pydbus[2] that depends on a newer version of 
python-gobject (latest is 3.22, we currently package 2.28), which in turn 
depends on GObject introspection.

The current Buildroot option for dbus Python binding is dbus-python, but it is 
based on dbus-glib which is "obsolete and unmaintained"[3].

Any other option or suggestion?

Thanks,
baruch

[1] https://wiki.gnome.org/Projects/GObjectIntrospection

[2] https://github.com/LEW21/pydbus

[3] https://www.freedesktop.org/wiki/Software/DBusBindings/

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
