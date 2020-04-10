From: Juan A. Rubio <jarubio2001@gmail.com>
Date: Fri, 10 Apr 2020 12:48:04 +0100
Subject: [Buildroot] evmctl sign fails in fakeroot 1.20.2
Message-ID: <CAE58QoM1yfu4GXYrkAZWWnhuXMtm_13toi=1VMmhqAMbuZexAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I've recently experienced issues while signing binaries with 'evmctl' from
within the fakeroot script. 'evmctl' produces IMA signatures that are
stored in extended attributes (
https://sourceforge.net/p/linux-ima/wiki/Home/#labeling-the-filesystem-with-securityima-extended-attributes).
The version of fakeroot in Buildroot (1.20.2) is actually not handling this
correctly.

This particular issue was fixed back in 2016 in fakeroot version 1.21.
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=801977

I've verified that fakeroot 1.24 does not present this problem. If there is
an interest, I could submit a patch.

BR,
Juan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200410/88716aec/attachment.html>
