From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 14 Feb 2014 20:03:52 +0100
Subject: [Buildroot] [PATCH V5 3/3] i.MX: use temp directory for
 Freescale self-extractors
In-Reply-To: <1392337580-16568-4-git-send-email-eric.nelson@boundarydevices.com>
References: <1392337580-16568-1-git-send-email-eric.nelson@boundarydevices.com>
 <1392337580-16568-4-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <20140214190352.GA3428@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-02-13 17:26 -0700, Eric Nelson spake thusly:
> The Freescale packages imx-lib, libfslcodec, libfslparser, and libfslvpuwrap
> are each bundled as self-extracting tar-balls that contain a shell script
> and a EULA in their package headers.
> 
> These self-extractors also contain a command to create the destination
> directory using "mkdir" (no -p) prior to extraction.
> 
> Since we want to place the output into the build directory, which has already
> been created at the time of extraction, this causes a warning message
> from "mkdir".
> 
> This patch changes things so that each package is extracted first into a
> sub-directory, and the content is moved into the eventual build directory.

In fact, I was not clear in my previous reply: as your testing shows,
and as Arnout suggested, we can well leave with this warning.

So, to make it clear this time: I don;t think we should try to play it
smart with this whole directory mess: the archives do extract in a
properly-named directory, so lets just accept the little warning.

The changes introduced by this patch, although not too complex, are not
trivial either.

I suggest we just drop this patch, unless Peter really wants it.

Sorry I was not explicit enough in my previous mail. Thank you for
staying with us all along the journey! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
