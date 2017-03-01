From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 10:32:28 +0100
Subject: [Buildroot] [PATCH next] usb_modeswitch_data: install packed
 database
In-Reply-To: <20170301092134.kmrpdhrq5e3vf3q2@tarshish>
References: <fbab82af999db5392fe2ae2f671531ff91f801b9.1488260265.git.baruch@tkos.co.il>
 <20170301092134.kmrpdhrq5e3vf3q2@tarshish>
Message-ID: <20170301103228.1a55960c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Mar 2017 11:21:34 +0200, Baruch Siach wrote:

> On Tue, Feb 28, 2017 at 07:37:45AM +0200, Baruch Siach wrote:
> > The packed databased is significantly smaller than the unpacked. The unpacked
> > database is made of hundreds of small files. So the benefit is larger
> > filesystems that allocate a minimum of block per file. Database packing adds
> > some overhead to every invocation of usb_modeswitch. This added overhead
> > should not be noticeable in practice since usb_modeswitch normally runs only
> > once per USB device insert event.  
> 
> This turns out to be not such a great idea, since our Busybox tar build does 
> not support the 'z' command line option. The tcl script embedded in  
> usb_modeswitch_dispatcher relies on this option to extract device information 
> entries from the packed database.

Can we adapt the TCL code to do:

	gunzip -dc <file> | tar -xf -

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
