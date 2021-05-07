From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 07 May 2021 09:32:25 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/dmalloc: needs -fPIC
In-Reply-To: <2fbb1df2-1c2c-f497-e4a4-a3fabdff3b52@mind.be> (Arnout
 Vandecappelle's message of "Sat, 1 May 2021 15:09:50 +0200")
References: <20210417104919.1856286-1-fontaine.fabrice@gmail.com>
 <2fbb1df2-1c2c-f497-e4a4-a3fabdff3b52@mind.be>
Message-ID: <87o8dn0zjq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 17/04/2021 12:49, Fabrice Fontaine wrote:
 > [snip]
 >> diff --git a/package/dmalloc/0001-add-fpic.patch b/package/dmalloc/0001-add-fpic.patch
 >> deleted file mode 100644
 >> index 230a9e15f1..0000000000
 >> --- a/package/dmalloc/0001-add-fpic.patch
 >> +++ /dev/null
 >> @@ -1,58 +0,0 @@
 >> -Without -fPIC, dmalloc does not build with:
 >> -
 >> -/home/test/mips-4.4/bin/mips-linux-gnu-ld
 >> --sysroot=/home/test/outputs/test-35/staging -shared --whole-archive
 >> -soname libdmallocxx.so -o libdmallocxx.so.t libdmallocxx.a
 >> -/home/test/mips-4.4/bin/mips-linux-gnu-ld:
 >> libdmalloc.a(arg_check.o): relocation R_MIPS_HI16 against
 >> `_dmalloc_flags' can not be used when making a shared object;
 >> recompile with -fPIC
 >> -libdmalloc.a(arg_check.o): could not read symbols: Bad value
 >> -
 >> -This patch, taken from
 >> -http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/dmalloc/files/dmalloc-5.2.4-fpic.patch?hideattic=0&view=markup,
 >> -fixes the problem by passing the -fPIC flag. It isn't passed through
 >> -the ./configure environment in order to not clutter the configuration
 >> -cache with incorrect values.

 >  I was going to apply, and then I read the sentence above and I wasn't so sure.
 > I don't know though what Thomas means with "in order not to clutter the
 > configuration cache with incorrect values"... Thomas, it's just 11 years ago,
 > I'm sure you still remember the reasoning behind it?

 >  Oh what the heck, this is useless anyway. I've applied after all. Thomas, in
 > the unlikely case that you *do* remember and that this fix is wrong, please
 > revert 19ec872f169a851b48ba04d22432b7c0939847d4. Otherwise, the autobuilders
 > will let us know.

I *think* this was related to back when we tried to use a shared
config.cache between packages, E.G. commit 5432f26f0e78fc74a5.

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
