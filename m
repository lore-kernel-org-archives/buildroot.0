From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Oct 2013 16:30:25 +0200
Subject: [Buildroot] [PATCHv2] toolchain-external: add a specific check
 to avoid Angstrom toolchains
In-Reply-To: <87zjq1bcyv.fsf@dell.be.48ers.dk>
References: <1381652900-12516-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <52600C75.5030503@mind.be> <87zjq1bcyv.fsf@dell.be.48ers.dk>
Message-ID: <20131022163025.59769db1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Arnout,

On Tue, 22 Oct 2013 16:24:24 +0200, Peter Korsgaard wrote:

>  >  Just for my info, how is it possible that we cannot use such an
>  > Angstrom toolchain as an external toolchain, but it is possible to use
>  > a buildroot-generated one? We can also generate a host dir with loads
>  > of libs, and these are perfectly usable as external toolchain, right?
> 
> No, we can afaik only reuse a buildroot toolchain if it is "bare",
> E.G. no packages selected.

Yes, absolutely. Ideally, my check for "angstrom" toolchain shouldn't
check for angstrom, but should instead validate that the toolchain is
"pure" (i.e only the C library). Unfortunately, I don't quite see an
easy and reliable way to make sure that the only libraries/headers
provided are the ones of the C library.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
