From: ing. Federico Fuga <fuga@studiofuga.com>
Date: Fri, 23 Nov 2007 18:45:08 +0100
Subject: [Buildroot] [patch] QTopia4 fail to compile tslib support
Message-ID: <474711A4.80505@studiofuga.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have seen that in the qtopia4.mk script the compilation would fail if
the -qt-mouse-tslib is appended to the configure script.
I have contacted the folks at the trolltech and they remarked that some
sql options currently passed to configure are only available on the
commercial release of QTopia4: these drivers are db2, oci and tds.
I send you a patch that corrects that error (only enables these options
on the commercial version).
There is also another, more complicated patchset, that enables the user
to chose if enable the stl support, the gfx transformed driver and the
use of sqlite2 (but sqlite2 is not yet available on buildroot, hope
it'll be soon). this set also include the tslib patch.
Hope that helps,
Best regards,

ing. Federico Fuga


-------------- next part --------------
A non-text attachment was scrubbed...
Name: qtopia4-commoptions.patch
Type: text/x-patch
Size: 1920 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20071123/b790055b/attachment.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: qtopia4-newoptions.patch
Type: text/x-patch
Size: 4659 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20071123/b790055b/attachment-0001.bin 
