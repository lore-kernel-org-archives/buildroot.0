From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jan 2016 00:06:35 +0100
Subject: [Buildroot] [PATCH v2 15/17] openal: add missing
 BR2_TOOLCHAIN_HAS_SYNC_4 dependency
In-Reply-To: <56ABB0C2.9070203@dawncrow.de>
References: <1453934861-26364-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453934861-26364-16-git-send-email-thomas.petazzoni@free-electrons.com>
 <56ABB0C2.9070203@dawncrow.de>
Message-ID: <20160130000635.018f59fa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andr?,

On Fri, 29 Jan 2016 19:34:42 +0100, Andr? Hentschel wrote:
> Hi Thomas,
> 
> Isn't openal looking for the atomic functions and not for the sync ones?
> As seen in the URL you provided:
> 
> libopenal.so.1.17.1: undefined reference to `__atomic_fetch_sub_4'
> libopenal.so.1.17.1: undefined reference to `__atomic_compare_exchange_4'
> libopenal.so.1.17.1: undefined reference to `__atomic_fetch_add_4'

Hum, you are right indeed. I will look into this again, but if it's a
dependency on __atomic functions, then it should depend on gcc >= 4.7
*and* link with libatomic.

Thanks for reviewing!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
