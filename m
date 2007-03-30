From: don <don_reid@comcast.net>
Date: Fri, 30 Mar 2007 16:25:57 -0700
Subject: [Buildroot]  GCC version detection in toolchain/gcc/Makefile.in
Message-ID: <20070330232557.GA18174@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> Inside of that file, it uses the line: "ifeq ($(findstring
> >3.4.,$(GCC_VERSION)),3.4.)" to detect gcc version 3.4.X.  But then a
> >few lines down, in a separate ifeq, it uses the line: "ifeq
> >($(findstring 4.,$(GCC_VERSION)),4.)".  I believe this is supposed to
> >detect version "4.X.X" of GCC.  But it also seems to match 3.4.X
> >(because that also has '4.' in it.
> >
> >Am I right that this is an issue, or am I missing something?
>
> That sounds plausible, yes.
> What do you suggest to distinguish between gcc version 4.4.9 and
> 3.4.6?

Does make accept the '^' character for start of string/line?

With grep you can do this:

 $ echo 3.4.1 | grep "4.1"
 3.4.1
 $ 
 $ echo 3.4.1 | grep "^4.1"

-- 
Don
