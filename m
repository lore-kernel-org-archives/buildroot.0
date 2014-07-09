From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 9 Jul 2014 05:19:19 +0000
Subject: [Buildroot] [PATCH] ARC: disable packages that require atomic
 builtins
In-Reply-To: <53BAC241.9070808@mind.be>
References: <1404742914-21583-1-git-send-email-abrodkin@synopsys.com>
 <53BAC241.9070808@mind.be>
Message-ID: <1404883158.4553.6.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,


On Mon, 2014-07-07 at 17:52 +0200, Arnout Vandecappelle wrote:
>  What about the other packages that use zeromq? cppzmq, czmq, filemq, mongrel2,
> php-zmq, python-pyzmq, zmqpp?

I see that dependencies list is getting longer and longer.

In coming days we're about to release a new version of tools for ARC and
as a part of this upcoming release we'll enable atomic operations by
default for ARC. This should immediately fix all those previously broken
packages.

So I'd prefer to wait for mentioned update and if it works as we expect
there will be no need in fixing more packages... moreover we'll need to
re-enable packages we already disabled like "jack2", "msgpack" and some
others.

Regards,
Alexey
