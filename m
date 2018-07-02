From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Jul 2018 05:59:17 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-06-22
In-Reply-To: <20180628021156.GH24526@momiji> (Adrian Perez de Castro's message
 of "Thu, 28 Jun 2018 02:11:56 +0300")
References: <20180623060022.2632920794@mail.bootlin.com>
 <20180628021156.GH24526@momiji>
Message-ID: <8736x2e19m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > On Sat, 23 Jun 2018 08:00:22 +0200 (CEST), Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
 >> x86_64 | webkitgtk-2.18.6 | NOK |
 >> http://autobuild.buildroot.net/results/187796535af53ece426641ff7d88aabada281674
 >> |

 > I think that the issue with this one is that webkitgtk.mk is passing
 > -DENABLE_ACCELERATED_2D_CANVAS=ON, which requires GStreamer-GL, but
 > nothing is enforcing that GStreamer is built with OpenGL support.

 > Either we disable the option when it's known that GStreamer won't have
 > OpenGL support built, or we add dependencies ensuring that GStreamer gets
 > the needed OpenGL support.

 > What would be preferred? I am kind of leaning towards enabling the option
 > only when it's known that the GStreamer-GL support is being built, and
 > disabling it otherwise (automatically, that is).

Yes, that sounds sensible to me.

Do you have any plans for moving to webkitgtk 2.20.x? The 2.18.x looks
to be affected by a number of security issues.

-- 
Bye, Peter Korsgaard
