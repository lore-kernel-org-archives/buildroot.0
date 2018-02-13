From: Chris Brandt <Chris.Brandt@renesas.com>
Date: Tue, 13 Feb 2018 20:24:21 +0000
Subject: [Buildroot] [PATCH 1/2] cramfs: change to new site location
In-Reply-To: <20180213211453.519b65eb@windsurf.lan>
References: <20180213195449.51516-1-chris.brandt@renesas.com>
 <20180213195449.51516-2-chris.brandt@renesas.com>
 <20180213211453.519b65eb@windsurf.lan>
Message-ID: <SG2PR06MB1165EA4292BE78ADF8D3A1678AF60@SG2PR06MB1165.apcprd06.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, February 13, 2018, Thomas Petassoni wrote:
> Do you know how endianess if handled by cramfs with the more recent
> version of the cramfs tools ?

All I can tell you is that there is not a command line option for it.
So, I assume it's not supported.


$ output/build/host-cramfs-5aea81001ac6/mkcramfs 
usage: output/build/host-cramfs-5aea81001ac6/mkcramfs [-h] [-e edition] [-i file] [-n name] [-D file] dirname outfile
 -h         print this help
 -E         make all warnings errors (non-zero exit status)
 -e edition set edition number (part of fsid)
 -i file    insert a file image into the filesystem (requires >= 2.4.0)
 -n name    set name of cramfs filesystem
 -p         pad by 512 bytes for boot code
 -s         sort directory entries (old option, ignored)
 -v         be more verbose
 -x         use extended block pointers (requires >= 4.15)
 -X         allow XIP of ELF files (imply -x)
 -z         make explicit holes (requires >= 2.3.39)
 -D         Use the named FILE as a device table file
 -q         squash permissions (make everything owned by root)
 dirname    root of the filesystem to be compressed
 outfile    output file



I don't have any big endian systems, so I can't test it either.

But, Nicolas said that if someone is willing to test it and sign off on 
it, he would add it to his repository.


Chris
