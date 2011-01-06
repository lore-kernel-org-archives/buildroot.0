From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jan 2011 12:32:38 +0100
Subject: [Buildroot] Problem building avahi
In-Reply-To: <D473AD103FC84CD18D1AF9AB6EAE9D2B@WSA.local>
References: <B3C53ADB207D471B8656E4BCBBDDD557@WSA.local>
	<20110105171027.1e64ffe6@surf>
	<D473AD103FC84CD18D1AF9AB6EAE9D2B@WSA.local>
Message-ID: <20110106123238.1c227155@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 6 Jan 2011 12:11:26 +0100
"Andreas Stahl" <a.stahl@wsa-electronic.de> wrote:

> I build in /usr/buildroot-2010.11 for some historical reason, but not
> as root. The buildroot directory belongs to the devel group and i'm a 
> member of this group.

Ok, good. At least this has exhibited an interesting bug of Buildroot
that we'll have to fix.

> Ok, I now extracted buildroot to /opt/buildroot-2010.11 and everything
> works now. Thanks for that hint!

Great.

> Hmm, the uImage now is in output/images and got not copied to
> output/target/boot/ and is not in the rootfs.tar ?

No. On non-x86 embedded systems it's not very usual to have the kernel
image *inside* the root filesystem. It's usually flashed separatly from
the root filesystem image.

However, if there is demand for such a feature, we could certainly add
an option to the kernel build process.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
