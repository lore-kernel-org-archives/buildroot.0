From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 14:47:42 +0200
Subject: [Buildroot] Cross Toolchain support for blackfin
In-Reply-To: <87ljbdv7g2.fsf@macbook.be.48ers.dk>
References: <4BF6B272.595C.0012.0@lntsec.com>
	<87ljbdv7g2.fsf@macbook.be.48ers.dk>
Message-ID: <20100521144742.4acbf742@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 21 May 2010 13:07:57 +0200
Peter Korsgaard <jacmet@sunsite.dk> wrote:

>  TarunJain>  I am planning to build a cross tool chain for blackfin
>  TarunJain> processor, for which i have download the latest available
>  TarunJain> "buildroot-2010.02.tar.gz" in which i was unable to find
>  TarunJain> the target architecture for blackfin, please guide me to
>  TarunJain> the same.
> 
> Sorry, we don't have any blackfin support in Buildroot.

Well, in fact I have a beginning of something working here :

 * I've added very basic support for Blackfin in Crosstool-NG.
   Crosstool-NG is therefore able to generate a cross-compilation
   toolchain for Blackfin (FDPIC ELF binary format). The support is
   very, very basic and there are certainly some issues. This feature
   is available in Crosstool-NG 1.7.0.

 * I have made some very basic modification to Buildroot, and I'm able
   to generate a root filesystem for Blackfin with just Busybox (I
   haven't tried other packages at the moment). If you're interested in
   this basic beginning, let me know and I'll clean it up. However, be
   ready for some deep troubles : Blackfin support in CT-NG and
   Buildroot is really in pre-alpha-horribly-untested-buggy-stage.

For now, it only works with Busybox compiled statically, but the
filesystem boots on a real Blackfin platform. For some reason, dynamic
libraries do not work (dynamically-linked programs simply exit, without
any error message and I didn't had the time to investigate).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
