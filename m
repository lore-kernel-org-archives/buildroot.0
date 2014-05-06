From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 May 2014 14:07:45 +0200
Subject: [Buildroot] [PATCH] toolchain package: set version as 'virtual'
 instead of 'undefined'
In-Reply-To: <0533846efc9952901283.1399373479@argentina>
References: <0533846efc9952901283.1399373479@argentina>
Message-ID: <20140506140745.1b072d2c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Tue, 06 May 2014 12:51:19 +0200, Thomas De Schampheleire wrote:
> This patch causes the log messages to change from:
> 
> >>> toolchain-external undefined Downloading
> >>> toolchain-external undefined Extracting
> ...
> 
> to
> 
> >>> toolchain-external virtual Downloading
> >>> toolchain-external virtual Extracting
> ...
> 
> and similar for 'toolchain' and 'toolchain-buildroot', simply because it
> looks nicer.
> At the same time, the directory names also become toolchain-virtual,
> toolchain-buildroot-virtual, toolchain-external-virtual instead of the
> corresponding 'undefined' variants.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Shouldn't we instead migrate these to use the virtual package
infrastructure, and make this infrastructure define this magic 'virtual'
version?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
