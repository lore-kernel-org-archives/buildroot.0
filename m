From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Tue, 22 Jun 2010 03:18:25 +0200
Subject: [Buildroot] sdl demo app install problem
In-Reply-To: <0D753D10438DA54287A00B027084269763715D5D81@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B027084269763715D5D31@AUSP01VMBX24.collaborationhost.net>
	<201006220147.29583.PeterHuewe@gmx.de>
	<0D753D10438DA54287A00B027084269763715D5D81@AUSP01VMBX24.collaborationhost.net>
Message-ID: <201006220318.27568.PeterHuewe@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Dienstag 22 Juni 2010 03:05:38 schrieb H Hartley Sweeten:
> 
> Well, I got it to install.  But, I'm not sure if this was the right way to
> do it.  I added the following to the *.mk file:
> 
> 
> FIRE_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install
>

Great :) - atleast it works - thanks for figuring it out.

I tried to rewrite the whole autoconf stuff meanwhile with (partial) success - 
but your solution seems far more elegant - but unfortunately I can't tell you 
whether this is the "correct" solution.


However I noticed that ncftp suffers from the same issue, but simply ignores 
it - but maybe we should fix it there too - but on the other hand these 
binaries aren't copied to the target fs, and ncftp gets stripped afterwards.

strip: Unable to recognise the format of the input file `../bin/ncftp'                                         
strip: Unable to recognise the format of the input file `../bin/ncftpbatch'  
strip: Unable to recognise the format of the input file `../bin/ncftpls'                                       
strip: Unable to recognise the format of the input file 
`../bin/ncftpbookmarks'                                
make[2]: [../bin/ncftpbookmarks] errors 1 (ignoriert)  


Peter
