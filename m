From: Andrew Wiley <debio264@gmail.com>
Date: Mon, 12 Jan 2009 16:22:52 -0600
Subject: [Buildroot] Can't Login to New System
In-Reply-To: <ecbbfeda0901121422t5aad880amf988d2d55d237dcc@mail.gmail.com>
References: <1231316636.6374.5.camel@hactar.vie.riedel.net>
	<ecbbfeda0901121422t5aad880amf988d2d55d237dcc@mail.gmail.com>
Message-ID: <ecbbfeda0901121422v44252c68r61ad8a937557569@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 7, 2009 at 2:23 AM, Bernhard Weirich
<bernhard.weirich@riedel.net> wrote:
> Hi Andrew,
>
> just a wild guess, but I had the same problem and the issue was that neither
> uclib nor kernel was built with floating point support.
> so maybe check if you have floats...
>
> Regards Bernhard
>

This may be a stupid question, but is that setting somewhere in the
buildroot toolchain config, in the kernel config, or somewhere else
entirely? I've looked for it, but I can't seem to find it.
I'm pretty sure the Cirrus Labs cross toolchain uses software floating
point, because in the guide for setting it up, you have to run this
command:
$ sudo mkdir -p /opt/buildroot/toolchain_build_arm_nofpu/ccache-2.4/cache
I thought that was pretty funny when I noticed it. I may be
misinterpretting that, because I'm pretty sure the EDB9302 does have a
FPU, but it may be something wierd about the Qwerk, or I may just be
an idiot. That instruction is found at
http://terk.svn.sourceforge.net/viewvc/terk/embed/trunk/share/docs/QwerkDevelopmentGuide.html#SettingUpTheARMCompiler

Andrew Wiley
