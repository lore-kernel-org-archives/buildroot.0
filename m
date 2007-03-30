From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 30 Mar 2007 20:34:59 +0200
Subject: [Buildroot] GCC version detection in toolchain/gcc/Makefile.in
In-Reply-To: <a04f56da0703290736x257e4f8aqb968db9a2402e06c@mail.gmail.com>
References: <a04f56da0703290736x257e4f8aqb968db9a2402e06c@mail.gmail.com>
Message-ID: <20070330183459.GB22338@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 29, 2007 at 10:36:27AM -0400, Zachary P. Landau wrote:
>Hello,
>
>I think there may be a problem in the GCC version detection code
>inside of toolchain/gcc/Makefile.in, but I wanted to verify it with
>people before filing a bug.  I am looking at the latest checkin of
>Makefile.in (revision 17836).
>
>Inside of that file, it uses the line: "ifeq ($(findstring
>3.4.,$(GCC_VERSION)),3.4.)" to detect gcc version 3.4.X.  But then a
>few lines down, in a separate ifeq, it uses the line: "ifeq
>($(findstring 4.,$(GCC_VERSION)),4.)".  I believe this is supposed to
>detect version "4.X.X" of GCC.  But it also seems to match 3.4.X
>(because that also has '4.' in it.
>
>This caused an issue for me when trying to compile openssl with gcc
>3.4.6.  The incorrect TARGET_SOFT_FLOAT option was being used because
>the "4." detection was overwriting the correct value detected a few
>lines above.
>
>Am I right that this is an issue, or am I missing something?

That sounds plausible, yes.
What do you suggest to distinguish between gcc version 4.4.9 and 3.4.6?
