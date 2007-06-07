From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 7 Jun 2007 20:36:09 +0200
Subject: [Buildroot] Why are recent 2.4.3* kernels ignored?
In-Reply-To: <1181236134.6170.14.camel@localhost>
References: <1181236134.6170.14.camel@localhost>
Message-ID: <20070607183609.GJ2853@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 07, 2007 at 07:08:54PM +0200, Mats Erik Andersson wrote:
>Hi all,
>
>caused by me wasting time today to arrange Buildroot
>to accept a kernel 2.4.33.3, and also observing aldot's
>svn-commit of today for defconfig of Buildroot -- his patching
>that halts with kernel 2.4.31 of the previous series --
>I am seriously wandering why kernels 2.4.33 and 2.4.34
>are not being accepted as viable and natural targets
>in the offered setup. Please, tell me!

step into the kernel-dir. run
make headers_install

If this generates useable headers then don't hesitate to send me a
patch.
>
>My own accomodations for 2.4.33.3 forced me to do several
>linking tricks and faked build flags (like .unpacked and
>.configured) in order to position kernel header directories
>where they are expected to be, and simultaneously keep my
>previous kernel source directory. The major obstacle to
>overcome seems to be the availability/extraction of header
>files out of the kernel tar-ball. If most of us are so 
>picky of only supplying the very most recent 2.6-kernel,
>why not do the same with the 2.4-series?

Feel free to send patches to add the most recent 2.4 kernel.
The reason why i'm still at 2.6.20.4 is simply because i didn't have
time to forward the openswan patches to a more recent version. Patches
to do this are welcome (provided they are tested for the variants of
ipsec that are currently supported with 2.6.20.4, of course).

HTH,
