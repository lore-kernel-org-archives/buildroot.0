From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 May 2010 22:26:12 +0200
Subject: [Buildroot] mdev
In-Reply-To: <201005102040.46995.korgull@home.nl> (Marcel's message of "Mon,
	10 May 2010 20:40:46 +0200")
References: <201005102040.46995.korgull@home.nl>
Message-ID: <87hbmf4i6z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcel" == Marcel  <korgull@home.nl> writes:

 Marcel> Hi,

 Marcel> I'm trying to create a couple of device nodes in /dev and
 Marcel> somehow doing this manually seems not preferred so I'm trying
 Marcel> to do this via mdev.

 Marcel> My first question is whether I'm on the right track by using mdev?

Yes, that's certainly an OK approach. For an even easier setup have a
look at devtmpfs in the kernel.

 Marcel> I tried mdev but I can't make it work. Probably this is because
 Marcel> I have something wrong in either the startup code , the
 Marcel> mdev.conf file or whatever.  Second I wonder how mdev works
 Marcel> because I think it needs MAKEDEV or something else) which I may
 Marcel> be missing and can't find in my buildroot. mknod is on my
 Marcel> system though.  mdev -s starts and returns after a second or
 Marcel> so, I see no errors and no other feedback.

Ok, good. To generate device nodes at runtime you then need tell the
kernel to use mdev as the hotplug agent. See
target/generic/target_busybox_skeleton/etc/inittab for an example of a
working setup.

 Marcel> I am looking for an example that works with spidev. My guess is
 Marcel> that the entry in mdev.conf should be something like :

 Marcel> spidev 0:153 0660

In general you only need entries in mdev.conf if you need special
handling (non-standard permissions or scripts executed).

 Marcel> Would my kernel need hotplug enabled ? (I guess it does).

Yes.

-- 
Bye, Peter Korsgaard
