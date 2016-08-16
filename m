From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Aug 2016 17:07:01 +0200
Subject: [Buildroot] [PATCH 2/2] tinycbor: fix issue on unnamed union
In-Reply-To: <39A58E7A-0045-4782-AE36-3BB3DF6D42D7@gmail.com> (Fabrice
 Fontaine's message of "Tue, 16 Aug 2016 16:11:54 +0200")
References: <1471290845-115279-1-git-send-email-fabrice.fontaine@orange.com>
 <1471290845-115279-2-git-send-email-fabrice.fontaine@orange.com>
 <87fuq5xnt4.fsf@dell.be.48ers.dk>
 <39A58E7A-0045-4782-AE36-3BB3DF6D42D7@gmail.com>
Message-ID: <87inv0vjl6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Dear Peter,
 > It seems that the link you provided is not correct as in this build,
 > the old tinycbor 0.3.1 is being compiled.

Yes, naturally - There won't be any autobuilder results for 0.3.2 before
your patches get included in the buildroot repo.

I was expecting your patches to fix some of our existing (E.G. using
0.3.1) autobuilder issues, but that is apparently not the case?

 > Could you provide me the correct link so I can reproduce the issue? I
 > suspect you encountered a totally new issue with src/open_memstream.c
 > which is being compiled only if open_memstream is found in the
 > toolchain but this file is also using fopencookie which does not seem
 > to be available in the toolchain. If I can reproduce the issue, I
 > will make a new patch to check the presence of fopencookie an send it
 > upstream.

You should be able to reproduce the issue if you build the defconfig
from

http://autobuild.buildroot.net/results/f4d/f4d15afb44f471878dbdee7c67cd836bd2b79904/

After applying your 2 tinybcr patches.

 > Concerning your original question, tinycbor 0.3.2 includes directly
 > the patch from Thomas, more details can be found her:
 > https://github.com/01org/tinycbor/commit/31c7f81d45d115d2007b1c881cbbd3a19618465c.

Ok, so that means we can drop 
0001-Makefile-use-installation-logic-compatible-with-old-.patch, good.

> The second patch removes the unnamed union, more details can be found
> here: https://patchwork.ozlabs.org/patch/652187/.

Ok. It would be nice to mention that in the commit message.

-- 
Venlig hilsen,
Peter Korsgaard 
