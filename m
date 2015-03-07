From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 09:03:54 +0100
Subject: [Buildroot] [PATCH 08/10 v7] package/nvidia-tegra23-binaries:
 new package
In-Reply-To: <20150306231558.GE4220@free.fr>
References: <cover.1423597914.git.yann.morin.1998@free.fr>
 <af61ad6f5736862b334002ce47727c9ce3bb2ab3.1423597914.git.yann.morin.1998@free.fr>
 <20150221234636.50616706@free-electrons.com>
 <20150221225836.GB4246@free.fr>
 <20150223124136.5fb4ea97@nserafini-N550JK>
 <54F7898A.6090601@free.fr> <20150306231558.GE4220@free.fr>
Message-ID: <20150307090354.60c844a3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

Adding Bernd in the Cc loop, he might have some insights.

On Sat, 7 Mar 2015 00:15:58 +0100, Yann E. MORIN wrote:

> OK, we have the current situation:
> 
>   - Buildroot uses Xorg 1.17.1, which implements ABI 19;
> 
>   - nvidia-tegra23 only has support for ABI up to 14;
> 
>   - NVidia won't update those drivers.

Correct, that's my understanding.

> Question: is Xorg ABI backward compatible? I.e. are drivers written for
> a specific ABI able to work on a newer ABI?

My understanding is that no, there is no backward compatibility. Maybe
I'm wrong, but I remember a few years ago having to downgrade the X.org
server version + a bunch of other X.org libraries, in order to have a
sufficiently old X.org server to match the ABI used by proprietary ATI
drivers.

Now the question is: is it possible to offer a version selection for
the X.org server ? Will an old X.org server build/work fine with recent
versions of the X.org libraries around it, so that we only have to
change the version of the X.org server, or will we enter an horrible
mess of "if the X.org server is at version <foo>, then we must use
version <bar> of this library, and version <foobar> of this other
library" ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
