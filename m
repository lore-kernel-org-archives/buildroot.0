From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 20 Jun 2016 10:35:29 -0300
Subject: [Buildroot] [PATCH 1/3] imagemagick: bump to version 7.0.2-0
In-Reply-To: <20160619104526.71cbfe65@free-electrons.com>
References: <1465994063-17292-1-git-send-email-gustavo@zacarias.com.ar>
 <20160616202243.GI3665@free.fr> <57661211.1010403@zacarias.com.ar>
 <20160619104526.71cbfe65@free-electrons.com>
Message-ID: <5767F121.5010603@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/06/16 05:45, Thomas Petazzoni wrote:

> So can we have your Acked-by and/or Reviewed-by on this oldest patch?

Hi.
I'd ack it as is, however it needs a rebase, probably better to send a 
respin?

Rationale is simple: users might not necessarily install fonts via the 
ghostscript-fonts package (addressing Baruch's conditional concerns), 
but then my concern is how much of the functionality is really true 
without ghostscript itself (there are checks in configure):

-------------------------------------------------------------
checking for Ghostscript...
checking for Ghostscript version... 9.15
checking for gs color device... pnmraw
checking for gs alpha device... pngalpha
checking for gs CMYK device... pamcmyk32
checking for gs mono device... pbmraw
checking for gs PDF writing device... pdfwrite
checking for gs PS writing device... ps2write
checking for gs EPS writing device... eps2write
-------------------------------------------------------------

Which also leaks from the host/distro as we can see, and can't be easily 
turned off (lots of AC_CHECK_PROG plus other manual checks).
Which begs the question... how useful are the fonts without these? (i 
don't know the answer, i never used imagemagick that way).

But then the simple 'convert -list font' goes from empty to working with 
ghostscript-fonts installed, hence in the end it looks correct from a 
data file point of view, so i side with it being fine.

Regards.
