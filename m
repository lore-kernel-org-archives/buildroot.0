From: =?utf-8?Q?=C3=89meric?= Vigier <emeric.vigier@savoirfairelinux.com>
Date: Thu, 3 Apr 2014 11:43:26 -0400 (EDT)
Subject: [Buildroot] new package not built, AR prefix not passed to make
In-Reply-To: <504826970.101021.1396539134908.JavaMail.root@mail>
Message-ID: <130678126.102439.1396539806273.JavaMail.root@mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Why is AR prefix not passed to make here? Is this related to the
> generic-package?

I believe I found part of my answer on gnu.org libc manual:
  You may need to set AR to cross-compiling versions of ar if the native tools
  are not configured to work with object files for the target you configured for.

$ ar --help
[...]
ar: supported targets: elf64-x86-64 elf32-i386 elf32-x86-64 a.out-i386-linux pei-i386 pei-x86-64 elf64-l1om elf64-k1om elf64-little elf64-big elf32-little elf32-big plugin srec symbolsrec verilog tekhex binary ihex

So I guess buildroot makes such a sanity check, right?
