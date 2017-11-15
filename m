From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Nov 2017 15:50:26 +0100
Subject: [Buildroot] Suggestion to improving buildroot download infra
In-Reply-To: <5A0C4958.9040608@petroprogram.com>
References: <5A0C4958.9040608@petroprogram.com>
Message-ID: <20171115155026.69153059@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Nov 2017 16:04:08 +0200, Stefan Fr?berg wrote:

> Is there a way to integrate parallel wget download into buildroot?

This will be a direct consequence of top-level parallel build support.
Not only parallel download, but downloading package A, while package B
is being built, etc.

> That would greatly speed the downloading process when doing "make source"
> and maybe even later all the downloading could be done in the 
> background, even
> when compiling some big package (for example, gentoo linux does that).
> 
> If I understand it correctly, there are at least two (if not including 
> the crude & fork method)
> ways to do parallel wget:
> 
> 1. use xarg:
> 
> echo $URL_LIST | xargs -n 1 -P ${NUMBER_OF_PARALLEL_DOWNLOADS} wget
> 
> or 2. use GNU parallel
> 
> parallel -a $URL_LIST --jobs ${NUMBER_OF_PARALLEL_DOWNLOADS} wget
> 
> How exactly, does buildroot collect the download urls when doing example,
> "make source" ? Does it collect them first into some list and then do 
> wget -i list ?
> Or does it just go each selected packet one-by-one and fetch the url for 
> each?

For the moment, the easiest is to comment the .NOTPARALLEL: statement
in the main Makefile, and then run:

	make -j8 source

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
