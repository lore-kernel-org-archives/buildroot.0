From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Sat, 16 May 2015 23:53:00 +0200
Subject: [Buildroot] [PATCH v2 8/9] atmel: add a flashing helper and
 documentation
In-Reply-To: <20150514033723.GA2558@tarshish>
References: <1431544977-2274-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1431544977-2274-9-git-send-email-alexandre.belloni@free-electrons.com>
 <20150514033723.GA2558@tarshish>
Message-ID: <20150516215300.GO3338@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 14/05/2015 at 06:37:23 +0300, Baruch Siach wrote :
> On Wed, May 13, 2015 at 09:22:56PM +0200, Alexandre Belloni wrote:
> > +You can then flash the board using the provided flasher.sh script in board/atmel:
> > +
> > +board/atmel/flasher.sh <builddir_path> <interface> <board>
> > +
> > +For example:
> > +board/atmel/flasher.sh /tmp/atmel_sama5d3_xplained/ /dev/ttyACM0 sama5d3_xplained
> 
> Since you didn't mention out of tree build in this document, I think 
> './output/' would be better as first argument example. Adding a comment on out 
> of tree build would be nice, though.
> 

Yeah, I thought about that and that is why I used ./output in usage().

I'll switch to:

"
For example, for an out of tree build made in
/tmp/atmel_sama5d3_xplained/ for the sama5d3 Xplained, you would use:
board/atmel/flasher.sh /tmp/atmel_sama5d3_xplained/ /dev/ttyACM0 sama5d3_xplained
"

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
