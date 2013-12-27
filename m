From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Dec 2013 15:24:21 +0100
Subject: [Buildroot] Analysis of build failures, december 26th
In-Reply-To: <201312271622.09927.fatih.asici@gmail.com>
References: <20131227073009.1283F101A83@stock.ovh.net>
 <20131227103511.2c218d17@skate>
 <201312271622.09927.fatih.asici@gmail.com>
Message-ID: <20131227152421.4194b149@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fatih A??c?,

On Fri, 27 Dec 2013 16:22:09 +0200, Fatih A??c? wrote:

> I have tried uncommenting these lines from this header file:
> 
> // #elif defined(__avr32__)                                                           
> // #  define Q_PROCESSOR_AVR32                                                        
> // #  define Q_BYTE_ORDER Q_BIG_ENDIAN                                                
> 
> ... but build failed with another error:
> 
>   thread/qthread_unix.cpp:126: error: thread-local storage not supported for this target
> 
> It seems there is no support for avr32.

Yes, AVR32 does not have TLS support, as far as I remember. We'll have
to disable Qt5 on this architecture, then.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
