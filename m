From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Thu, 02 Apr 2009 15:22:29 +0200
Subject: [Buildroot] dbus-python and pyexpat
Message-ID: <49D4BC15.2070100@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I try to use the dbus-python package. It compile fine, but when
I try to use it on the target, I get this error:

# python
Python 2.4.5 (#1, Mar 26 2009, 16:56:57) 
[GCC 4.3.3] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import dbus
Traceback (most recent call last):
  File "<stdin>", line 1, in ?
  File "/usr/lib/python2.4/site-packages/dbus/__init__.py", line 100, in ?
    from dbus._dbus import Bus, SystemBus, SessionBus, StarterBus
  File "/usr/lib/python2.4/site-packages/dbus/_dbus.py", line 46, in ?
    from dbus.bus import BusConnection
  File "/usr/lib/python2.4/site-packages/dbus/bus.py", line 46, in ?
    from dbus.connection import Connection
  File "/usr/lib/python2.4/site-packages/dbus/connection.py", line 42, in ?
    from dbus.proxies import ProxyObject
  File "/usr/lib/python2.4/site-packages/dbus/proxies.py", line 35, in ?
    from dbus._expat_introspect_parser import process_introspection_data
  File "/usr/lib/python2.4/site-packages/dbus/_expat_introspect_parser.py", line 26, in ?
    from xml.parsers.expat import ExpatError, ParserCreate
  File "/usr/lib/python2.4/xml/parsers/expat.py", line 4, in ?
ImportError: No module named pyexpat
>>> 

The strange thing is that there seem to be no pyexpat package in
buildroot yet. So I don't understand how dbus-python can be
functional on the target.

Best Regards,
-- 
Jean-Christian de Rivaz
