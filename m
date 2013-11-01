From: Mirek Frajkowski <kerim.fryer@gmail.com>
Date: Fri, 1 Nov 2013 15:29:31 +0000
Subject: [Buildroot] Mono package
Message-ID: <CA+R-mPPYzHxdfxvfcmo=bzEhd9A4rs1Gsf9=onaYxjh74VAmLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I would like to contribute to buildroot by sending Mono package, which I
believe many people will find useful.

Mono has to be cross compiled in two steps:

1. Native code - for the virtual execution system, garbage collector and
other unmanaged bits
2. Managed code - this includes C# compiler, assembler, class libraries and
so on

Due to this fact it is divided into two sub-folders/sub-packages. The build
configuration itself is not very complicated, however one thing is worth
pointing out.

Mono signs its binary files and thus we have to disable stripping of the
binaries in the buildroot, which is done through "Config.in" file.

Everything else is pretty much straight forward and self explanatory.

Package is also installed in staging directory, just in case someone needs
to compile other packages which depend on Mono.

Please find the Mono package attached.

Any comments and suggestions are more than welcome. If you find it not
working or failing to build let me know as well.

Regards,
Mirek
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131101/eb0a6c78/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-package-mono.tar.bz2
Type: application/x-bzip2
Size: 1062 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131101/eb0a6c78/attachment.bz2>
