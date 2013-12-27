From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 27 Dec 2013 16:22:09 +0200
Subject: [Buildroot] Analysis of build failures, december 26th
In-Reply-To: <20131227103511.2c218d17@skate>
References: <20131227073009.1283F101A83@stock.ovh.net>
 <20131227103511.2c218d17@skate>
Message-ID: <201312271622.09927.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 27 December 2013 11:35:11 Thomas Petazzoni wrote:
> >      avr32 |                  qt5base-5.2.0 | NOK |
> >http://autobuild.buildroot.net/results/e3af369e55431222f6ba3ab37f838e1355
> >60cc35/
> 
> Apparently no support for AVR32:
> 
> ../../include/QtCore/../../src/corelib/global/qprocessordetection.h:323:6:
> error: #error "Unable to determine byte order!"
> 
> Disallow Qt5 on AVR32 ?

I have tried uncommenting these lines from this header file:

// #elif defined(__avr32__)                                                           
// #  define Q_PROCESSOR_AVR32                                                        
// #  define Q_BYTE_ORDER Q_BIG_ENDIAN                                                

... but build failed with another error:

  thread/qthread_unix.cpp:126: error: thread-local storage not supported for this target

It seems there is no support for avr32.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131227/3745fe61/attachment-0001.html>
