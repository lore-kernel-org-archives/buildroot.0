From: grunpferd at netscape.net <grunpferd@netscape.net>
Date: Sun, 6 Aug 2017 21:53:01 -0400
Subject: [Buildroot] Failing bind 9.11.1-P3 configure failure
Message-ID: <15dba6532c8-c03-26aa@webjas-vab011.srv.aolmail.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently unable to build bind 9.11.1-P3.



It looks like there is some confusion over the local existence of header files resulting in the following error message.
Previous version of bind compiles successfully.


...
checking for using OpenSSL for hash functions... no
checking for PKCS11 support... no
checking for PKCS11 tools... disabled
checking for native PKCS11... disabled
checking for clock_gettime... yes
checking for lmdb library... yes
checking for library containing mdb_env_create... no
configure: error: found lmdb include but not library.
package/pkg-generic.mk:217: recipe for target '/u/rfg/w/buildroot_tk1_gcc7_4.12/output/build/bind-9.11.1-P3/.stamp_configured' faile
d
make: *** [/u/rfg/w/buildroot_tk1_gcc7_4.12/output/build/bind-9.11.1-P3/.stamp_configured] Error 1

...


So buildroot can't configure bind-9.11.1-P3.


Ross








-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170806/da756c3d/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 135378 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170806/da756c3d/attachment.obj>
