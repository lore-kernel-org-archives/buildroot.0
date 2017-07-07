From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Jul 2017 13:58:23 +0200
Subject: [Buildroot] [PATCH] toolchain-wrapper: fix breakage after
 host/usr removal
In-Reply-To: <20170707074330.27294-1-arnout@mind.be>
References: <20170707092406.722b80f4@windsurf.lan>
 <20170707074330.27294-1-arnout@mind.be>
Message-ID: <20170707135823.032c25d6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 7 Jul 2017 09:43:30 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The toolchain wrapper, when called through PATH, strips the last three
> levels of /proc/self/exe to find HOST_DIR. However, after the host/usr
> removal, this should be just two levels.
> 
> The toolchain wrapper has different logic for when it is called with a
> full path (i.e. $HOST_DIR/usr/bin/arm-linux-gcc) then when it is called
> through the PATH (i.e. just arm-linux-gcc). The latter is never used
> internally in Buildroot, that's why this wasn't discovered through
> testing.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Mark Jackson <mpfj-list@newflow.co.uk>
> ---
> Sorry for the breakage :-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
