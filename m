From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Aug 2016 07:52:55 +0200
Subject: [Buildroot] [PATCH 2/2] tinycbor: fix issue on unnamed union
In-Reply-To: <1471290845-115279-2-git-send-email-fabrice.fontaine@orange.com>
 (Fabrice Fontaine's message of "Mon, 15 Aug 2016 21:54:05 +0200")
References: <1471290845-115279-1-git-send-email-fabrice.fontaine@orange.com>
 <1471290845-115279-2-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <87fuq5xnt4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Until tinycbor 0.4 is released, patch from dev branch is needed to
 > remove the usage of unnamed union which are not supported by all
 > targets such as blackfin

What autobuilder issues does this fix?

I tried building this config after applying both patches:

http://autobuild.buildroot.net/results/f4d/f4d15afb44f471878dbdee7c67cd836bd2b79904/

But it now fails with:

src/open_memstream.c: In function ?open_memstream?:
src/open_memstream.c:105: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?vtable?
src/open_memstream.c:105: error: ?vtable? undeclared (first use in this function)
src/open_memstream.c:105: error: (Each undeclared identifier is reported only once
src/open_memstream.c:105: error: for each function it appears in.)
src/open_memstream.c:105: error: expected expression before ?{? token
src/open_memstream.c:111: warning: implicit declaration of function ?fopencookie?
src/open_memstream.c:111: warning: return makes pointer from integer without a cast
Makefile:198: recipe for target 'src/open_memstream.o' failed

So it isn't much of an improvement. Does it fix any other autobuilder issues?

-- 
Bye, Peter Korsgaard
