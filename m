From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 6 Oct 2014 18:03:51 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-10-05
In-Reply-To: <20141006094333.211d8a76@free-electrons.com>
References: <20141006063013.D7B26101723@stock.ovh.net>
 <20141006094333.211d8a76@free-electrons.com>
Message-ID: <1412618631.2656.2.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2014-10-06 at 09:43 +0200, Thomas Petazzoni wrote:
> >          arc |                    hostapd-2.2 | NOK | http://autobuild.buildroot.net/results/bc5100d6462af4e2805f2bc8d39c87a55d843e2b/
> 
> {standard input}: Assembler messages:
> {standard input}:863: Error: operand out of range (512 is not between -512 and 511)
> make[1]: *** [../src/wps/wps_attr_parse.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
> 
> ARC toolchain issue. Alexey ?

Indeed, that's our GCC issue.

We got a couple of similar issues resolved already but looks like
there're still corner cases which trigger this kind of errors.

Anyway I raised this bug with our GCC guys and hopefully it will be
resolved soon.

-Alexey
