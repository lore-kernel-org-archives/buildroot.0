From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 17 Apr 2017 17:10:36 +0200
Subject: [Buildroot] question about x86 portability issues
Message-ID: <20170417151036.GF11446@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi developers,

with Buildroot we have some compile issues when using uClibc-ng or
musl toolchains. The reason is the x86 specific code is using 
deprecated sigreturn and setcontext functions.

With the attached patch I could compile libunwind with the uClibc-ng
toolchain.

But the best solution would be if the code would use a direct
syscall to rt_sigreturn as the x86_64 code does:
http://git.savannah.gnu.org/gitweb/?p=libunwind.git;a=blob;f=src/x86_64/Gos-linux.c;h=6f70d3ffdb1e514a567d0c2146c852765bda953d;hb=HEAD#l148

What do you think?

I think sigreturn() is a noop in GNU C Library for x86 and x86_64.

Thanks,
 Waldemar


-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-x86-do-not-use-deprecated-sigreturn.patch
Type: text/x-diff
Size: 1201 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170417/1dfa1eef/attachment.bin>
