From: Ivan Sergeev <vsergeev@kumunetworks.com>
Date: Mon, 18 Nov 2013 14:37:59 -0800
Subject: [Buildroot] [PATCH 1/1] dbus-python: select pyexpat dependency
In-Reply-To: <1384814104-11809-1-git-send-email-vsergeev@kumunetworks.com>
References: <1384814104-11809-1-git-send-email-vsergeev@kumunetworks.com>
Message-ID: <CAPyrzo1JdOBrWPbDR3-B5CJXQi0O5nGoK_HQOQv6rWNYAMhJqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some reason git send-email didn't attach the patch. I've attached it
here.

Thanks,
~vsergeev
Ivan Sergeev


On Mon, Nov 18, 2013 at 2:35 PM, Ivan Sergeev <vsergeev@kumunetworks.com>wrote:

> dbus-python requires xml.parsers.expat, which is provided by the pyexpat
> module. This patch enables the pyexpat module when dbus-python is selected.
>
> Before:
>
> # systemd-analyze
> Traceback (most recent call last):
>   File "/usr/bin/systemd-analyze", line 3, in <module>
>     import dbus, sys
>   File "/usr/lib/python2.7/site-packages/dbus/__init__.py", line 100, in
> <module>
>   File "/usr/lib/python2.7/site-packages/dbus/_dbus.py", line 46, in
> <module>
>   File "/usr/lib/python2.7/site-packages/dbus/bus.py", line 46, in <module>
>   File "/usr/lib/python2.7/site-packages/dbus/connection.py", line 42, in
> <module>
>   File "/usr/lib/python2.7/site-packages/dbus/proxies.py", line 35, in
> <module>
>   File
> "/usr/lib/python2.7/site-packages/dbus/_expat_introspect_parser.py", line
> 26, in <module>
> ImportError: No module named xml.parsers.expat
> # python
> Python 2.7.3 (default, Nov 18 2013, 14:12:39)
> [GCC 4.7.2] on linux2
> Type "help", "copyright", "credits" or "license" for more information.
> >>> import dbus
> Traceback (most recent call last):
>   File "<stdin>", line 1, in <module>
>   File "/usr/lib/python2.7/site-packages/dbus/__init__.py", line 100, in
> <module>
>   File "/usr/lib/python2.7/site-packages/dbus/_dbus.py", line 46, in
> <module>
>   File "/usr/lib/python2.7/site-packages/dbus/bus.py", line 46, in <module>
>   File "/usr/lib/python2.7/site-packages/dbus/connection.py", line 42, in
> <module>
>   File "/usr/lib/python2.7/site-packages/dbus/proxies.py", line 35, in
> <module>
>   File
> "/usr/lib/python2.7/site-packages/dbus/_expat_introspect_parser.py", line
> 26, in <module>
> ImportError: No module named xml.parsers.expat
> >>>
> #
>
> After:
>
> # systemd-analyze
> Startup finished in 2252ms (kernel) + 973ms (userspace) = 3225ms
> # python
> Python 2.7.3 (default, Nov 18 2013, 13:07:32)
> [GCC 4.7.2] on linux2
> Type "help", "copyright", "credits" or "license" for more information.
> >>> import dbus
> >>>
> #
>
> NOTE: I had to delete output/build/python-2.7.3/ for the enabled pyexpat
> to take effect during a rebuild (simple "make") of buildroot. I presume
> this is because it's configured and built with python-2.7.3, but perhaps
> this should be handled automatically  -- marking python-2.7.3 "dirty"
> somehow?
>
> Thanks,
> ~vsergeev
> Ivan Sergeev
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131118/3e459efa/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-dbus-python-select-pyexpat-dependency.patch
Type: text/x-patch
Size: 919 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131118/3e459efa/attachment.bin>
