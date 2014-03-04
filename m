From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 19:19:25 +0100
Subject: [Buildroot] [PATCH 0/3 v2] linux: do not always depend on
 host-lzop
In-Reply-To: <20140303222317.795950dd@skate>
References: <cover.1391876537.git.yann.morin.1998@free.fr>
 <20140303222317.795950dd@skate>
Message-ID: <20140304191925.50aaf715@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 3 Mar 2014 22:23:17 +0100, Thomas Petazzoni wrote:
> Dear Yann E. MORIN,
> 
> On Sat,  8 Feb 2014 17:26:03 +0100, Yann E. MORIN wrote:
> 
> > Here is a small series that makes Linux not always depend on host-lzop,
> > and also cleans up a little bit the linux.mk.
> 
> Series applied, thanks.

And I've reverted it because it simply cannot work with internal
defconfig of the kernel, since they are only available after the kernel
has been extracted, which is too late to declare whether we need the
host-lzop dependency or not.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
