From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 18 Oct 2015 02:48:13 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-10-15
In-Reply-To: <20151016063019.E3466101619@stock.ovh.net>
References: <20151016063019.E3466101619@stock.ovh.net>
Message-ID: <1445129293.7271.17.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fr, 2015-10-16 at 08:30 +0200, Thomas Petazzoni wrote:
> Build statistics for 2015-10-15
> ===============================
> 
> Detail of failures
> ===================
> 
> ????mips64el |???????????????swupdate-2015.07 | NOK |
> http://autobuild.buildroot.net/results/aaad892a487affe9f62ce4e54ff8bc
> 897f4b99a3/
> ??????x86_64 |???????????????swupdate-2015.07 | NOK | http://autobuil
> d.buildroot.net/results/d9e8298898da6355f6b46a032f951b4ca196d103/
> ????mips64el |???????????????swupdate-2015.07 | NOK | http://autobuil
> d.buildroot.net/results/de3c39640ca972bd3a07e66859f348421342666e/
> ????mips64el |???????????????swupdate-2015.07 | NOK | http://autobuil
> d.buildroot.net/results/d1e446d2c552efd8eb9b34bdc7f50fe7ecccf31c/

Looks related to [1], but I was not able to fix this by changing LD to
gcc instead of ld. But honestly, I am not a toolchain expert and surely
I missed something.

For me it looks like there is a problem with linking the object files
from each 'objs-y' directory into a single object file 'built-in.o'.

A simple solution is to build the subdirectories 'core' and 'handlers'
with the libs-y instead of the objs-y target.

Any thoughts?

[1]?http://git.buildroot.net/buildroot/commit/package/pv?id=1980bf056e1
6c604c1f33ce9771d725da096cfe7
