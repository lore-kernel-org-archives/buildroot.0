From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 21 Feb 2015 13:40:14 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-02-19
In-Reply-To: <XnsA447C6537BF7FberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <20150220073016.77E101016AE@stock.ovh.net>
 <XnsA447C6537BF7FberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <54E87CAE.9010902@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd, All,

Le 20/02/2015 19:29, Bernd Kuhls a ?crit :
> Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
> @public.gmane.org> wrote in news:20150220073016.77E101016AE at stock.ovh.net:
> 
>>       x86_64 |                     fltk-1.3.2 | NOK | 
> http://autobuild.buildroot.net/results/cb107060a36192adf3c15ab62ebeb767204a23
> d9/
> 
> Hi,
> 
> I can not reproduce this build error.

Me neither...

As suggested by Thomas [1], we can try to bump to 1.3.3 release which include some
build system fixes.

https://github.com/fltk/test-only/commit/8efa0754954ce011e12ff1c111a466599902870e
This commit add the $(CXXFLAGS) exactly where the build is broken.
Not sure it really fix the issue... 

https://github.com/fltk/test-only/commit/4da6a35f6c8b5058105df1886dc0196ea055c373
This one improve the configure script which used directly `uname`.
Not sure either it fix the issue...

[1] http://lists.busybox.net/pipermail/buildroot/2014-November/111847.html

Best regards,
Romain

> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
