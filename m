From: John Voltz <john.voltz@gmail.com>
Date: Fri, 20 Jun 2008 11:15:58 -0400
Subject: [Buildroot] problem with dbus.mk
Message-ID: <46a136670806200815p7034b6c5y6dbe39035796af62@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I discovered a bit of a problem in dbus.mk.

*DBUS_XML_DEP:=**$(BUILD_DIR)/**libxml2**-2.6.29/.stamp_staging_installed


*

What happens when libxml2 has not been downloaded, extracted, or built and
you depend on .stamp_staging_installed?

Build failure. I would suggest a revert on dbus.mk.


Regards,

John
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080620/3c45dfca/attachment.htm 
