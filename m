From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Oct 2013 21:16:22 +0100
Subject: [Buildroot] Architecture build statistics
In-Reply-To: <52701682.2040208@zankel.net>
References: <20131029204108.5d707d09@skate>
	<52701682.2040208@zankel.net>
Message-ID: <20131029211622.62459eef@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Zankel,

On Tue, 29 Oct 2013 13:11:46 -0700, Chris Zankel wrote:

> Great statistics. Xtensa definitely needs some work here ;-)

It seems yes :-)

Are you interested in receiving a daily e-mail with the Xtensa build
failures, if any?

> I looked into the failures a while ago and started to create patches. 

Please submit them, then :)

> However, one major issue was lacking NPTL support in uClibc. We are 
> currently working on it and are getting close to support it. This 
> already should push the pct columns higher :-)

Unfortunately, seeing the absolute desert of release activity the
uClibc project is showing, I am not sure when any feature of this size
can be merged, and even worse released :-(

In the mean time, it would be good if we could identify such packages,
and add the appropriate dependencies to avoid autobuilder failures. Can
you point us which packages need NPTL support?

For the record, the 10 packages causing the highest number of problems
since July, 1st 2013, are:

+-------------------+-----+
| reason            | cnt |
+-------------------+-----+
| binutils-2.21.1   |  96 |
| m4-1.4.16         |  37 |
| binutils-2.22     |  30 |
| libnspr-4.9.6     |  21 |
| m4-1.4.17         |  17 |
| cdrkit-1.1.11     |  14 |
| ffmpeg-0.8.12     |   8 |
| iozone-3_414      |   8 |
| gstreamer-0.10.36 |   6 |
| libpfm4-4.3.0     |   6 |
+-------------------+-----+

Looks like fixing binutils is a good thing to do in the very near
future. Can you send a patch for that?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
