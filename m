From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 10:58:57 +0200
Subject: [Buildroot] [PATCH 03/12] package/volume-key: new package
In-Reply-To: <20200723010810.3237608-4-aduskett@gmail.com>
References: <20200723010810.3237608-1-aduskett@gmail.com>
 <20200723010810.3237608-4-aduskett@gmail.com>
Message-ID: <20200723105857.285d0375@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Jul 2020 18:08:01 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> The volume-key project provides a library for manipulating storage volume
> encryption keys and storing them separately from volumes, and an associated
> command-line tool, named volume_key.
> 
> The main goal of the software is to allow restoring access to an encrypted
> hard drive if the primary user forgets the passphrase. The encryption key back
> up can also be useful for extracting data after a hardware or software failure
> that corrupts the header of the encrypted volume, or to access the company
> data after an employee leaves abruptly.
> 
> Updated versions of udisks are dependent on this package.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Why is this package introduced ? According to udisks it was at some
point a dependency of libblockdev:

+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libblockdev -> volume-key -> cryptsetup

But I don't see where it is used in the libblockdev package.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
