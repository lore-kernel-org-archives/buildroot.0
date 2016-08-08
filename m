From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Mon, 8 Aug 2016 15:56:21 +0000
Subject: [Buildroot] Analysis of build results for 2016-08-05
In-Reply-To: <20160807112654.7b520594@free-electrons.com>
References: <20160806063028.356101023A1@stock.ovh.net>
 <20160807112654.7b520594@free-electrons.com>
Message-ID: <1470671781.31195.45.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Sun, 2016-08-07 at 11:26 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> Here is the usual analysis of build failures. Waldemar, Alexey, Vlad,
> Gustavo, Frank, Gwenhael, Angelo, Fran?ois, Romain, Bernd, can you have
> a look below? Thanks!
> 
> On Sat,??6 Aug 2016 08:30:28 +0200 (CEST), Thomas Petazzoni wrote:
> > 
> > ?????????arc |????????????????bootutils-1.0.0 | NOK | http://autobuild.buildroot.net/results/4059a5afe3e471d4b25db493d4c5eec646a8b0e1/
> cannot find crtbeginT.o: No such file or directory
> 
> Alexey, Vlad ?
> > 
> > ?????????arc | host-gcc-final-arc-2016.09-... | NOK | http://autobuild.buildroot.net/results/3afc00e64274e89de2cf81e1dda8854327b89291/
> configure: error: Link tests are not allowed after GCC_NO_EXECUTABLES.
> 
> Alexey, Vlad ?
> 

The failures listed above occurred due to the same issue - crtbeginT.o file was missing as the corresponding dependency wasn't added.
The issue has already been solved internally and will be included in our next engineering build. We hope that new build happen tomorrow or
the day after tomorrow. Anyway we will send patch patch with bumping to new arc toolchain as soon as it will come up.


> ?????????arc |???????????????????stella-4.7.2 | NOK | http://autobuild.buildroot.net/results/1752ca6a393b43750022db3faee85cfc9d360bc4/
> > x86_64-linux-gnu-g++: error: unrecognized command line option '-matomic'
> > x86_64-linux-gnu-g++: error: unrecognized command line option '-matomic'
> >?
> > Why is the heck a x86_64-linux-gnu compiler used on an ARC
> > configuration? There are some configure scripts issues as well:
> >?
> > Looking for C++ compiler... ./configure: line 110: eval: -g: invalid option
> > eval: usage: eval [arg ...]
> > ./configure: line 110: eval: -c: invalid option
> > eval: usage: eval [arg ...]
> 

I am looking at this issue now. I will report about it ASAP.
> > 
> Thomas

Thank you for your reports.

-- 
Best regards,
Vlad Zakharov <vzakhar@synopsys.com>
