From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jan 2017 23:06:45 +0100
Subject: [Buildroot] [PATCH] legacy/xserver: add a legacy entry for
	xserver >= 1.19.0
In-Reply-To: <20170126205915.GC3413@free.fr> (Yann E. MORIN's message of "Thu, 
 26 Jan 2017 21:59:15 +0100")
References: <20170108222011.3839-1-romain.naour@gmail.com>
 <20170108222011.3839-2-romain.naour@gmail.com>
 <20170124233306.40f3d345@free-electrons.com>
 <f51b9d8d-6853-b7fc-b16d-5205dda0da21@mind.be>
 <20170126205915.GC3413@free.fr>
Message-ID: <87efzpcw7e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> > Hum, but then we have the BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX option
 >> > defined in two different places, with two different prompts. Do we
 >> > really want to do this?
 >> 
 >> No we don't. We certainly don't want that changing some option (the server
 >> version) suddenly creates a legacy option.

 > My stake on this:

 >   - we must add a legacy entry for 1.18

Ok.

 >   - we must not add a legacy entry for AIGLX, because it is not yet
 >     legacy. It will turn legacy when the last xserver version we have
 >     that support AIGLX is dropped. For now, it is just an package option
 >     that is only available with some versions (1.17 and 1.14).

As I understood it, AIGLX support is now unconditionally enabled:

https://cgit.freedesktop.org/xorg/xserver/commit/?id=501d8e2beb337e072c93c9310fcd927a099b9c3b

So the legacy option would just state that this option is now
unconditionally enabled. I'm not sure how helpful that is. The user is
presumably already notified that the server version has changed
(E.G. from 1.14/1.17 to 1.19+).

-- 
Bye, Peter Korsgaard
