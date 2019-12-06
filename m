From: =?UTF-8?Q?Lukas_J=c3=bcnger?= <lukas.juenger@ice.rwth-aachen.de>
Date: Fri, 6 Dec 2019 13:22:53 +0100
Subject: [Buildroot] xen tools depend on bash, perl and coreutils
Message-ID: <e48fe6d7-a671-ceae-b8b8-94de015b7201@ice.rwth-aachen.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

When building the Xen tools for the Xen hypervisor with buildroot, 
startup scripts and tool scripts are included that depend on bash, perl 
and stat. These scripts are run, when e.g. an additional vm is brought 
up (e,h, locking.sh in /etc/xen/scripts). Without bash, stat and perl 
this fails, and it is a bit tricky to debug.

Should the BR2_PACKAGE_XEN_TOOLS therefor have a dependency on 
BR2_PACKAGE_BASH, BR2_PACKAGE_PERL and BR2_PACKAGE_COREUTILS?

Thanks,
Lukas

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 5388 bytes
Desc: S/MIME Cryptographic Signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191206/8609d90e/attachment.p7s>
