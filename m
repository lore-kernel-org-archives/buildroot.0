From: Elizabeth Oldham <beth@the-hug.org>
Date: Wed, 10 Oct 2007 11:13:37 +0100 (BST)
Subject: [Buildroot] [MIPS] toolchain/gcc/Config.in broken
In-Reply-To: <120071009213155.GU20951@aon.at>
References: <470ADDA8.3080105@ruby.dti.ne.jp> <20071009070816.GP20951@aon.at>
	<470B5043.5010606@ruby.dti.ne.jp> <20071009122700.GB15786@aon.at>
	<470B88CC.9040705@ruby.dti.ne.jp> <470BD383.4060504@the-hug.org>
	<20071009193325.GR20951@aon.at> <470BD9AB.2020909@the-hug.org>
	<470BEB08.3060209@the-hug.org> <120071009213155.GU20951@aon.at>
Message-ID: <19271.192.168.2.100.1192011217.squirrel@home.the-hug.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Tue, Oct 09, 2007 at 09:56:40PM +0100, Elizabeth Oldham wrote:
>> Elizabeth Oldham wrote:
>> gcc supports it, but AFAIK it isn't used on MIPS/Linux, so I assume
>> buildroot/uclibc wont be interested in it?
> It shouldn't hurt to support it IMHO.

I'd find it confusing having an abi that wasn't supported on the thing I
was building for, but whatever.

> Look quite similar to what i currently have, yes.

ish.  n32 is a 64bit variant, not supported on 32bit cores. The default
should be based on the ISA selected, as in my

+	default BR_mips_ABI_O32 if BR_mips_32 || BR_mips_32r2
+	default BR_mips_ABI_N32 if BR_mips_64 || BR_mips_64r2

With whatever naming convention you want to apply of course.

And o32 should end up as just 32 by the time it gets passed to gcc configure.

Beth
