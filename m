From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Nov 2012 13:07:03 +0100
Subject: [Buildroot] Built a file system,
 have a working kernel - how to login ?
In-Reply-To: <CAF-Ht3zwxboYWZ6Q3ocMtFaAnQ9xEo+qfWfSsovdZuZa3sotkQ@mail.gmail.com>
References: <CAF-Ht3yZfCDAMpPGJ7NFd_RQ0brOwxw3pSSoA3YFtzVf7kpf2g@mail.gmail.com>
 <20121117111132.17a91542@skate>
 <CAF-Ht3xTA8gLLFS5j64LFSQ9_U5O7+42Uj0Yq4CMZWWZb3g3YA@mail.gmail.com>
 <20121117123531.431cbd65@skate>
 <CAF-Ht3zwxboYWZ6Q3ocMtFaAnQ9xEo+qfWfSsovdZuZa3sotkQ@mail.gmail.com>
Message-ID: <20121117130703.03beb6e1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Juha Lumme,

On Sat, 17 Nov 2012 20:45:09 +0900, Juha Lumme wrote:

> The board boots from memory card currently, and I tarball the output/target
> directory and then decompress to the second partition on the memory card.
> This worked for a full 250MB debian file system, so I'm assuming it should
> work here as well..?

Aaargggh, no!

From the Buildroot manual:

   target/ which contains almost the complete root filesystem for the
   target: everything needed is present except the device files
   in /dev/ (Buildroot can?t create them because Buildroot doesn?t run
   as root and doesn?t want to run as root). Therefore, this directory
   should not be used on your target.

Please enable a tarball root filesystem image, and then extract is as
root on the partition of your memory card.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
