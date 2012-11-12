From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Mon, 12 Nov 2012 02:04:57 +0200
Subject: [Buildroot] Various problem using buildroot-2012.05
In-Reply-To: <50A02B0C.4000107@mind.be>
References: <1340005565.16617.YahooMailClassic@web161402.mail.bf1.yahoo.com>
 <20120618103657.721db39b@skate> <qaol7k.eta.ln@bernd-kuhls.de>
 <509E69FD.2000804@petroprogram.com> <50A02B0C.4000107@mind.be>
Message-ID: <50A03D29.7070608@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

12.11.2012 0:47, Arnout Vandecappelle kirjoitti:
> On 11/10/12 15:51, Stefan Fr?berg wrote:
>>
>> If you try to use buildroot-made target gcc to compile perl, that is,
>> you use buildroot to cross-compile gcc to run
>> natively inside
>> uClibc (?) environment, then you might encounter problems.
>>
>> As Thomas has said in few times here for people telling about
>> problems of native gcc-toolchain, buildroot is about
>> cross-compiling stuff
>> and buildroot produced native gcc-toolchain is really not supported
>> and might be still broken
>> (I don't know what the current status of it is now).
>
>  The current status is: we're going to remove it.  Thomas has just
> posted some
> patches to do that.
>

Awww...
Well, it's good that he mentioned it at this point, before I started
doing any real work with that native toolchain.


>  The idea is: if you need a toolchain on the target, there is no
> reason not to
> use a normal distro: debian, ubuntu, gentoo, ....
>
>
>  As for perl, however, I think we really would like to be able to
> cross-compile
> perl modules.  But that unfortunately still needs some work.  I messed
> about
> with it for a bit, but I can't say I really understand how the perl
> build system
> works.
>

Yeah.

Another "little" difficult case is Python.

Even tought Python uses autotools, it (and Perl) will always be the
worst cross-compile
friendly citizens in my book.
Way back, before buildroot, I tried many times to cross-compile it in
Mingw32 environment and it was an
absolute nightmare. With Perl I had even less luck.

Every time I find an interesting open source project that I would like
to try and cross-compile,
I will make an silent prayer to God's of programmers that the build
system that is revealed from
tarball will be a GNU autoconf script (or even cmake one for God's sake)
and not
some hodge-bodge, custom made, configuration nightmare.

Regards
Stefan

>
>  Regards,
>  Arnout
>
