From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Oct 2014 09:40:37 +0200
Subject: [Buildroot] [git commit] botan: limit to supported CPU
 architectures
In-Reply-To: <C89D20716E201D428CB114157FC1F4E380F4F02F@BLR-SJP-MBX-1.wipro.com>
References: <20141008195304.A0FF3B1B4F@busybox.osuosl.org>
 <C89D20716E201D428CB114157FC1F4E380F4F02F@BLR-SJP-MBX-1.wipro.com>
Message-ID: <20141009094037.13cf62f4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yuvaraj,

On Thu, 9 Oct 2014 04:56:28 +0000, yuvaraj.patil at wipro.com wrote:

> Similar issue is reported on Blackfin architecture for this package.
> http://autobuild.buildroot.net/results/a2a/a2ad841630b411df3fc26461a868fe796a8b67ff//
> 
> Does the fix provided in below email addresses this as well?

Yes, it does: as you can see by reading the patch, the fix consists in
adding a whitelist of the architectures supported by the botan package,
and the Blackfin architecture is not in this whitelist. Therefore, the
botan package will no longer be selectable in Blackfin configurations.

Thanks for looking into this and checking if the patch covered the
Blackfin case as well!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
