From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 1 Mar 2017 11:46:39 +0200
Subject: [Buildroot] [PATCH next] usb_modeswitch_data: install packed
 database
In-Reply-To: <20170301103228.1a55960c@free-electrons.com>
References: <fbab82af999db5392fe2ae2f671531ff91f801b9.1488260265.git.baruch@tkos.co.il>
 <20170301092134.kmrpdhrq5e3vf3q2@tarshish>
 <20170301103228.1a55960c@free-electrons.com>
Message-ID: <20170301094639.32amtih44dxoijxf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Mar 01, 2017 at 10:32:28AM +0100, Thomas Petazzoni wrote:
> On Wed, 1 Mar 2017 11:21:34 +0200, Baruch Siach wrote:
> > On Tue, Feb 28, 2017 at 07:37:45AM +0200, Baruch Siach wrote:
> > > The packed databased is significantly smaller than the unpacked. The unpacked
> > > database is made of hundreds of small files. So the benefit is larger
> > > filesystems that allocate a minimum of block per file. Database packing adds
> > > some overhead to every invocation of usb_modeswitch. This added overhead
> > > should not be noticeable in practice since usb_modeswitch normally runs only
> > > once per USB device insert event.  
> > 
> > This turns out to be not such a great idea, since our Busybox tar build does 
> > not support the 'z' command line option. The tcl script embedded in  
> > usb_modeswitch_dispatcher relies on this option to extract device information 
> > entries from the packed database.
> 
> Can we adapt the TCL code to do:
> 
> 	gunzip -dc <file> | tar -xf -

Of course. But that is something for upstream to deal with. As I'm much more 
time constrained than space constrained at the moment, I'll leave that to 
someone else.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
