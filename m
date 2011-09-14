From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Sep 2011 18:19:59 +0200
Subject: [Buildroot] Questions related to "Incorrect selection of the C
	library" error
In-Reply-To: <20110914115217.5a64e8d0@skate>
References: <CAOPDcRz+PpksWoMJBh5mzk8+E7YcdKj=httB1nxajGanmKTNow@mail.gmail.com>
 <20110914115217.5a64e8d0@skate>
Message-ID: <201109141820.00295.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wednesday 14 September 2011 11:52:17, Thomas Petazzoni wrote:
> > The following lib (ld*-uClibc.so.*) is missing in my lib dir.
> > Where does this lib come from?
> 
> From the external toolchain.
> 
> > In my .config, I have selected BR2_TOOLCHAIN_EXTERNAL=y
> > and I have set the path for my toolchain, and the prefix.
> >
> > 
> >
> > But where can I set the path for my installed uClibc directory?
> > ( /usr/<arch>-linux-uclibc )
> 
> In the toolchain menu:
>  * Select "External toolchain" as Toolchain type
>  * Select "Custom toolchain" as Toolchain
>  * Put the path of your toolchain in Toolchain path

 What Thomas means is: you have to install uClibc in the same place as the 
cross compiler.  

Cross-compiler and libc (and various other things like dynamic library loader 
and debugger) are intimately linked. Together they are called the toolchain.  

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
