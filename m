From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 20:10:49 +0200
Subject: [Buildroot] [PATCH] gcc: arc-2017.03-rc2: Fix "unrecognized
	supposed constant" error
In-Reply-To: <20170515155657.22513-1-abrodkin@synopsys.com> (Alexey Brodkin's
 message of "Mon, 15 May 2017 18:56:57 +0300")
References: <20170515155657.22513-1-abrodkin@synopsys.com>
Message-ID: <87vap29eja.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > This fixes the following problem:
 > arc-linux-gcc -c -Os -fPIC iso9660.i
 > iso9660.c: In function 'strip_trail':
 > iso9660.c:155:1: error: unrecognized supposed constant
 >  }
 >  ^
 > (unspec:SI [
 >         (symbol_ref:SI ("*.LANCHOR1") [flags 0x182])
 >     ] ARC_UNSPEC_GOTOFFPC)
 > iso9660.c:155:1: internal compiler error: in arc_legitimate_constant_p, at config/arc/arc.c:6028

 > Found by Buildroot autobuilder [1].

 > The fix [2] is in arc-2017.03 development branch of ARC GCC and once it
 > becomes a part the next release of ARC tools this should be removed
 > from Buildroot.

 > [1] http://autobuild.buildroot.net/results/c90/c909e8c397ab972b6aa4d370572cad4fae284d00/build-end.log
 > [2]
 > https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/139fed9d29ab935b3bc5159c0bdf7b8b8a39442d

Committed, thanks.

I just noticed that we still have a patch from arc-2016.09. Can you
confirm that this isn't needed any more?

https://git.buildroot.org/buildroot/tree/package/gcc/arc-2016.09-release/895-arc-define-_REENTRANT-when-pthread-is-passed.patch

-- 
Bye, Peter Korsgaard
