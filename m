From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Sat, 10 Nov 2012 16:51:41 +0200
Subject: [Buildroot] Various problem using buildroot-2012.05
In-Reply-To: <qaol7k.eta.ln@bernd-kuhls.de>
References: <1340005565.16617.YahooMailClassic@web161402.mail.bf1.yahoo.com>
 <20120618103657.721db39b@skate> <qaol7k.eta.ln@bernd-kuhls.de>
Message-ID: <509E69FD.2000804@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd

10.11.2012 16:28, Bernd Kuhls kirjoitti:
> Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
> @public.gmane.org> wrote in news:20120618103657.721db39b at skate:
>
>> Le Mon, 18 Jun 2012 00:46:05 -0700 (PDT),
>> Ming-Ching Tiew <mctiew@yahoo.com> a ??crit :
>>> Because there are many packages are not made to compile in a cross
>>> environment. For many, it's not a trial task to adapt those packages
>>> for cross compiling. 
>> Which packages are you talking about? If there are of general interest,
>> some people might be interested in helping to get them to cross-compile.
> Hi,
>
> in my case it?s Perl, along with Spamassassin to be build on-top of it. The 
> current effort to cross-compile Perl is problematic in regard to cross-
> compile CPAN modules, so now I am trying to compile Perl on the target 
> machine using a buildroot-made gcc_target toolchain along with some 
> dependency libs.

Yes, Perl is a (as you can see from various patches and problems related
to perl in this mailing list) is a really
major PITA to cross-compile.

If you try to use buildroot-made target gcc to compile perl, that is,
you use buildroot to cross-compile gcc to run natively inside
uClibc (?) environment, then you might encounter problems.

As Thomas has said in few times here for people telling about problems
of native gcc-toolchain, buildroot is about cross-compiling stuff
and buildroot produced native gcc-toolchain is really not supported and
might be still broken
(I don't know what the current status of it is now).

I remember that I promised to Thomas to investigate the native gcc for
x86 (under uClibc) thing and the only solution I have so far
managed to cook is by making a completely self-sustaining, buildroot
independent environment with working perl 5.16, python 2.7,
gcc 4.7, binutils 2.22 and lot's of other stuff. I decided to use RPM
for package management and spend healthy amount of three
weekends of studying how to make RPMs.

Maybe, when I have more time, I will compare my working native uClibc
gcc-toolchain and buildroot produced native uClibc gcc-toolchain
and cook some patches.

In case that buildroot produced native toolchain won't work, I will be
happy to send you my native uClibc-based gcc-toolchain
that you can chroot into, and see if that is of any help.

Mind you that it's still in beta-phase...

Best Regards
Stefan

> Kind regards, Bernd
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121110/080ae49e/attachment.html>
