From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 3 Dec 2008 14:14:39 +1100
Subject: [Buildroot] [PATCH] target/cramfs/cramfs.mk: Fix device
	table	not being passed to mkcramfs
In-Reply-To: <87tz9nuedv.fsf@macbook.be.48ers.dk>
References: <4934B65A.90804@genesysdesign.com.au>
	<87tz9nuedv.fsf@macbook.be.48ers.dk>
Message-ID: <20081203031439.GA15621@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 02, 2008 at 10:15:24AM +0100, Peter Korsgaard wrote:
> >>>>> "Jared" == Jared Holzman <j.holzman@genesysdesign.com.au> writes:
> 
> Hi,
> 
>  Jared> While mkcramfs was being patched to support a device table,
>  Jared> the target device table was not being passed to the mkcramfs
>  Jared> options. This patch fixes that
> 
> Thanks, committed as r24228.

Whoa! Has this been tested?

The device table is processed by running makedevs within the fakeroot
session, rather than relying on mkcramfs's device table support. (Same
as in many other buildroot targets, even though most of them have device
table support too.) Now the device table is being used twice, which may
or may not work?



Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
