From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 28 Jun 2018 02:11:56 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-06-22
In-Reply-To: <20180623060022.2632920794@mail.bootlin.com>
References: <20180623060022.2632920794@mail.bootlin.com>
Message-ID: <20180628021156.GH24526@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 23 Jun 2018 08:00:22 +0200 (CEST), Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

>       x86_64 |               webkitgtk-2.18.6 | NOK | http://autobuild.buildroot.net/results/187796535af53ece426641ff7d88aabada281674 |     

I think that the issue with this one is that webkitgtk.mk is passing
-DENABLE_ACCELERATED_2D_CANVAS=ON, which requires GStreamer-GL, but
nothing is enforcing that GStreamer is built with OpenGL support.

Either we disable the option when it's known that GStreamer won't have
OpenGL support built, or we add dependencies ensuring that GStreamer gets
the needed OpenGL support.

What would be preferred? I am kind of leaning towards enabling the option
only when it's known that the GStreamer-GL support is being built, and
disabling it otherwise (automatically, that is).

Cheers,

 Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180628/85ce447c/attachment.asc>
