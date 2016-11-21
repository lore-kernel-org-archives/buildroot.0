From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 21:39:25 +0100
Subject: [Buildroot] [PATCH 3/4] qextserialport: use 'make install' to
 install to staging
In-Reply-To: <20161120221329.5827-3-arnout@mind.be>
References: <20161120221329.5827-1-arnout@mind.be>
 <20161120221329.5827-3-arnout@mind.be>
Message-ID: <20161121213925.218f8ddb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Nov 2016 23:13:28 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:

> The QExtSerialPort and qextserialport.pc files are created by
> Buildroot so they still have to be installed explicitly. Note that
> upstream installs in the QtExtSerialPort directory, not QExtSerialPort,
> so we follow that decision.

This breaks the pkg-config use case, because the installed
qextserialport.pc (added by patch 0003) is not updated to reflect the
QExtSerialPort -> QtExtSerialPort include directory changed.

> Why do we have this 0002-main-include.patch anyway? It's clearly a
> feature patch... And apparently no attempt has been made to upstream
> it?

To be honest, I don't remember. I do remember doing this patch for some
reason (at the time, I was using qextserialport for a specific
project), but I can't remember what the reason was (just convenience,
or a real issue). Since there is no package in Buildroot that depends
on qextserialport, I guess we could try to drop this patch, and see if
somebody complains? :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
