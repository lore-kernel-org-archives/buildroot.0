From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 12 Nov 2014 10:55:22 +0000
Subject: [Buildroot] [PATCH] uClibc: ARC: enable generic string
	implementations
In-Reply-To: <20141110135034.2e03b27c@free-electrons.com>
References: <1415616842-7640-1-git-send-email-abrodkin@synopsys.com>
 <20141110135034.2e03b27c@free-electrons.com>
Message-ID: <1415789721.10608.6.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2014-11-10 at 13:50 +0100, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> I personally don't like to see such a change done in an architecture
> specific way, if the feature is not architecture specific. So we should
> evaluate if this works on other architectures, see what is the binary
> footprint for this feature, and then decide if we want to enable it by
> default in our uClibc configurations.

I agree that it's better to not have this kind of generic options
selected by architectures.

But the point is I don't have any real hardware except ARC and ARM
boards (Cubieboard2 & Wandboard Quad).

For ARC I do see improvements and still stable behavior of toolchain and
target binaries.

For ARM I don't see any difference in LMbench because most if not all
string routines are already implemented in assembly, sio the option in
question makes no sense.

But for other architectures like BlackFin, PPC, MIPS difference could be
in both performance and stability but this is something I cannot test.

So volunteers are more than welcome.

But what if nobody else cares?

-Alexey
