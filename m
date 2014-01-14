From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 Jan 2014 22:52:00 +0100
Subject: [Buildroot] [PATCH] package: icu: detect and add compiler
	symbol prefix to the assembly code
In-Reply-To: <1389006349-32377-1-git-send-email-Sonic.adi@gmail.com> (sonic
 adi's message of "Mon, 6 Jan 2014 19:05:49 +0800")
References: <1389006349-32377-1-git-send-email-Sonic.adi@gmail.com>
Message-ID: <87y52iw7sv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "sonic" == sonic adi <sonic.adi@gmail.com> writes:

 > From: Sonic Zhang <sonic.zhang@analog.com>
 > Some compiler, such as Blackfin GNU compiler, prefix a charater to any
 > C symbol in generated assembly code. If any assembly symbol is invoked
 > from C code, it needs to be prefixed as well.

 > Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>

Thanks. Has this been submitted upstream?

 > ---
 >  .../icu/icu-detect-compiler-symbol-prefix.patch    |  104 ++++++++++++++++++++
 >  1 file changed, 104 insertions(+)
 >  create mode 100644 package/icu/icu-detect-compiler-symbol-prefix.patch

 > diff --git a/package/icu/icu-detect-compiler-symbol-prefix.patch b/package/icu/icu-detect-compiler-symbol-prefix.patch
 > new file mode 100644
 > index 0000000..9ca7690
 > --- /dev/null
 > +++ b/package/icu/icu-detect-compiler-symbol-prefix.patch
 > @@ -0,0 +1,104 @@
 > +package: icu: detect and add compiler symbol prefix to the assembly code
 > +
 > +Some compiler, such as Blackfin GNU compiler, prefix a charater to any
 > +C symbol in generated assembly code. If any assembly symbol is invoked
 > +from C code, it needs to be prefixed as well.
 > +
 > +--- icu-51.2/source/configure	2014-01-06 17:13:20.907249812 +0800
 > ++++ icu-51.2.bak/source/configure	2014-01-06 17:12:57.335248659 +0800

Please adjust configure.ac and set ICU_AUTORECONF = YES instead.

-- 
Bye, Peter Korsgaard
