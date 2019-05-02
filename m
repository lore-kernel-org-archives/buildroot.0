From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Thu, 2 May 2019 11:50:16 +0200
Subject: [Buildroot] make source not working for host-ldd crosstool-ng
Message-ID: <cdf1cac9-9fb4-06ee-1d3f-44907d67dc51@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

There seems to be a bug in the host-ldd crosstool-ng package. It
unconditionally tries to download "gpl.txt", even after running make
source. It should check if it's already available. See the error below,
when running "make" disconnected.

Who's responsible here?

thanks

                                 martin


$ make
>>> host-ldd crosstool-ng-1.23.0 Extracting

cp /home/gelin/gelin_build/buildroot-2019.02.1/dl/ldd/xldd.in
/home/gelin/gelin_build/buildroot-2019.02.1/output/build/host-ldd-crosstool-ng-1.23.0/
chmod a+rx
/home/gelin/gelin_build/buildroot-2019.02.1/output/build/host-ldd-crosstool-ng-1.23.0/xldd.in
wget -O
/home/gelin/gelin_build/buildroot-2019.02.1/output/build/host-ldd-crosstool-ng-1.23.0/gpl.txt
https://raw.githubusercontent.com/crosstool-ng/crosstool-ng/crosstool-ng-1.23.0/licenses.d/gpl.txt
--2019-05-02 11:39:05--
https://raw.githubusercontent.com/crosstool-ng/crosstool-ng/crosstool-ng-1.23.0/licenses.d/gpl.txt
Resolving raw.githubusercontent.com (raw.githubusercontent.com)...
failed: Temporary failure in name resolution.
wget: unable to resolve host address 'raw.githubusercontent.com'

package/pkg-generic.mk:168: recipe for target
'/home/gelin/gelin_build/buildroot-2019.02.1/output/build/host-ldd-crosstool-ng-1.23.0/.stamp_extracted'
failed
make: ***
[/home/gelin/gelin_build/buildroot-2019.02.1/output/build/host-ldd-crosstool-ng-1.23.0/.stamp_extracted]
Error 4

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3616 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190502/c64d6eb9/attachment.bin>
