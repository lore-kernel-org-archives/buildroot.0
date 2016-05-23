From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 23 May 2016 22:19:56 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-05-13
In-Reply-To: <20160514154655.57ae0bad@free-electrons.com>
References: <20160514063024.2C7B91025E9@stock.ovh.net>
 <20160514154655.57ae0bad@free-electrons.com>
Message-ID: <3b2b5f3b-267b-103b-a93f-b8bf6e3e0606@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

Le 14/05/2016 ? 15:46, Thomas Petazzoni a ?crit :
> Hello,
> 
> J?r?me, Gustavo, Bernd, Fabio, Gwenhael, Romain, Vicente, Yann, Matt,
> Martin, Baruch, Samuel, Waldemar, Peter, please see below, there's some
> good stuff for you :-) Thanks!
> 
> On Sat, 14 May 2016 08:30:24 +0200 (CEST), Thomas Petazzoni wrote:
> 
>>      powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/a2bb339864bdfd2ddfd2ec487d9c3cb3181ce9ca/
> 
> Gustavo, this is the same issue as the one we add with the old
> CodeSourcery toolchain, but this time with a Crosstool-NG toolchain
> that uses gcc 4.7. What is so special with blktrace that it causes such
> issues?

It seems that the libaio bump has broken the blktrace package on powerpc, see:

http://lists.busybox.net/pipermail/buildroot/2016-April/157845.html

> 
>>        nios2 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/02bc45c115cbcda11f379ad3aecd1153ca25908a/
> 
> Romain?

I don't know, I tried with several gcc/binutils combination without success.

Also grantlee doesn't build on microblaze for the same reason, see:
http://autobuild.buildroot.net/?reason=grantlee-0.5.1

Now the nios2 compiler issue on Qt GUI has been fixed (see Problem 4)
http://lists.busybox.net/pipermail/buildroot/2014-November/112605.html

Grantlee is unlikely used on nios2 or microblaze, maybe we should disable it ?

Vicente, what do you think ?

Best regards,
Romain
