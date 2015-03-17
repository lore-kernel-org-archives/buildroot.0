From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 14:49:23 +0100
Subject: [Buildroot] Blackfin Buildroot toolchain issue
In-Reply-To: <55082FFD.30305@zacarias.com.ar>
References: <20150315221722.3645eb35@free-electrons.com>
 <55082FFD.30305@zacarias.com.ar>
Message-ID: <20150317144923.7e9b7fbb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 17 Mar 2015 10:45:33 -0300, Gustavo Zacarias wrote:

> I'll take a look, but my efforts regarding the blackfin toolchain were a
> "best effort" scenario - just getting the toolchain to build where it
> didn't before.
> I have no hardware to test anything so even if it builds it might not
> work correctly at all.

Sure. So we need to decide whether it's worth support Blackfin in the
internal toolchain backend at all.

> In the mean time i've sent a patch to switch blackfin's default to an
> external (ADI) toolchain.

Great. But I've recently added a Buildroot-generated Blackfin external
toolchain in the autobuilder toolchain configurations, so we need to
decide if we want to support that or not.

From my point of view, since Blackfin already requires a very specific
combination of compiler + binutils version, it's a bit of a dead end in
terms of internal toolchain support, so we could just as well get rid
of it entirely.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
