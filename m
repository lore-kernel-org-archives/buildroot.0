From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 11 Dec 2009 16:23:58 +0100
Subject: [Buildroot] *Tons* of BR warnings like
	"package/Makefile.autotools.in:179: warning: overriding
	commands for target `/home/bjornfor/raid/forks/buildroot/output'"
In-Reply-To: <5f2b60912110653q3ad5824fpa86b07e38dab5a2@mail.gmail.com>
	(=?utf-8?Q?=22Bj=C3=B8rn?=
	Forsman"'s message of "Fri, 11 Dec 2009 15:53:22 +0100")
References: <5f2b60912101234r46ca2234w760ddd2a01032525@mail.gmail.com>
	<4B221A6E.3090105@gmail.com>
	<5f2b60912110236x1373eae0wf181f6720ca56ca3@mail.gmail.com>
	<874onxvjyx.fsf@macbook.be.48ers.dk>
	<5f2b60912110514o79498b66lae1603f5f4fe6345@mail.gmail.com>
	<87zl5ptxv4.fsf@macbook.be.48ers.dk>
	<5f2b60912110653q3ad5824fpa86b07e38dab5a2@mail.gmail.com>
Message-ID: <87vdgdttyp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:

 Bj?rn> I manually applied your patch (is there a better way of doing
 Bj?rn> it?)

git apply or patch

 Bj?rn> and when building a non-working configuration, there is no other
 Bj?rn> output than the warnings and then full stop. Make quits before
 Bj?rn> running the 'test' target! See the log:

Ahh yes, you never get that far with those warnings.

I think your BASE_DIR and/or BUILD_DIR variables somehow gets an extra
space appended/prepended.

Could you change the BASE_DIR := line in the toplevel makefile to simply
read:

BASE_DIR:=home/bjornfor/dev/buildroot/output

and try again?

-- 
Bye, Peter Korsgaard
