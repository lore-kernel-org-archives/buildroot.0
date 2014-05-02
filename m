From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 02 May 2014 10:49:02 +0200
Subject: [Buildroot] [PATCH v4] manual/configure.txt: fix C++ escaping
In-Reply-To: <330afb14854c4fbd104f.1399017758@argentina> (Thomas De
 Schampheleire's message of "Fri, 02 May 2014 10:02:38 +0200")
References: <330afb14854c4fbd104f.1399017758@argentina>
Message-ID: <87oazgpnup.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > For asciidoc, a string like '+these are some words+' will be displayed in
 > monospace font. Such sequences are identified by searching for a matching
 > pair of + signs in the same block.

 > The string 'C++' also contains such + signs. In most cases, this does not
 > pose a problem and no escaping is necessary. However, if 'C++' occurs twice
 > in the same block, the + signs will be matched to each other, and asciidoc
 > formats all text between them as monospaced text. In this case, escaping of
 > one of these 'C++' occurances is necessary to get the right formatting.

 > In one place of the manual, there is a sentence that causes such a problem:
 >     "you only have to tell whether your toolchain supports C++ or not and
 >     whether it has built-in RPC support. If your external toolchain uses
 >     the 'uClibc' library, then you have to tell Buildroot if it supports
 >     largefile, IPv6, RPC, wide-char, locale, program invocation, threads
 >     and C++."

 > Commit 082dec8ce440236b1477e568f0965f05ad241adb was based on a patch fixing
 > this problem in one place of the manual, but was incorrectly changed while
 > committing.

 > This patch reverts the incorrect changes in that commit, and solves the
 > problem correctly.

 > Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

 > ---
 > v4:
 >  - (ThomasDS) update commit message

Committed, thanks.

-- 
Bye, Peter Korsgaard
