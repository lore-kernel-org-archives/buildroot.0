From: Robin Gilks <robin.gilks@tait.co.nz>
Date: Thu, 20 Sep 2007 11:17:05 +1200
Subject: [Buildroot] AVR32 libiberty build failure
In-Reply-To: <1190178050.4516.56.camel@aeglos.sweden.atmel.com>
References: <46EF36B4.2000703@tait.co.nz> 
	<20070918112636.GA2231@aon.at><1190125596.4064.52.camel@elrond.sweden.atmel
	.com><46F0A447.8000906@tait.co.nz><1190178050.4516.56.camel@aeglos.sweden.a
	tmel.com>
Message-ID: <46F1ADF1.4020403@tait.co.nz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson wrote:
>>
> 
> There has been some changes, which has killed the AVR32 toolchain
> in the main trunk, and I am trying to find out why.
> You can try the Buildroot at http://www.atmel.no/buildroot/

I'm getting much further now but I had to patch the Makefile in 
gcc-final/gcc to get the path correct for ORIGINAL_AS_FOR_TARGET as 
configure had made it an absolute path instead of relative to (or 
directly pointing to) the staging_dir directory (i.e. it had 
/usr/bin/.... instead of /home/...../staging_dir/usr/bin/...)

I think the derivation of this value is buried in the m4 scripting of 
configure.ac but I can't make head nor tail of that!!

-- 
Robin


=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
 altered or corrupted during transmission.
=======================================================================
