From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 23:14:20 +0200
Subject: [Buildroot] [PATCH] configs/lego_ev3: bump kernel to 4.4 series
In-Reply-To: <20161015165155.20004-1-vincent.stehle@laposte.net> (Vincent
 Stehle's message of "Sat, 15 Oct 2016 18:51:55 +0200")
References: <d7af770a-9e6e-abfc-d034-1bb301c716e5@mind.be>
 <20161015165155.20004-1-vincent.stehle@laposte.net>
Message-ID: <87h98d71sj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vincent" == Vincent Stehle <vincent.stehle@laposte.net> writes:

Hi,

 > One remark though: the ev3dev project has a separate drivers tree
 > managed as a git submodule of the kernel (!) I do not really know how
 > to cope with that properly, so I just added a patch to repair the
 > build for the moment.

How important are those drivers?

We do actually support git submodules nowadays, but it has to be
explicitly enabled per package. I'm not sure we really want to
unconditionally enable it for the linux package so we would need to add
a Config.in option to enable it.

A nicer method might be to handle these drivers through our
linux-extensions support. Take a look at linux/linux-ext-fbtft.mk and
package/fbtft for an example of this.

--
Bye, Peter Korsgaard
