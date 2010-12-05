From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Sun, 05 Dec 2010 21:54:30 +0100
Subject: [Buildroot] [PATCH] util-linux: bump version to util-linux-ng
 2.18
In-Reply-To: <20101205212409.114c5be8@surf>
References: <c26a121c90a5cc9c26c391be4e9568913df61769.1291561083.git.smiley73@users.sourceforge.net>	<4CFBF373.5060905@googlemail.com>
	<20101205212409.114c5be8@surf>
Message-ID: <4CFBFC06.40800@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 05.12.2010 21:24, schrieb Thomas Petazzoni:
>
> Yes, I was going to tell Heiko about your previous work. I remember
> that one thing made it a bit complicated to review: the relationship
> with libuuid. I'll try to have a look at the patches again and see if I
> can get them merged.
>
Just for information: Libuuid's origin is within the e2fsprogs package. 
Since util-linux-ng 2.16? it is also part of that package. I guess the 
goal is to remove libuuid from e2fsprogs and maintain it in ulng.

Recently, both packages provide a plausible libuuid. Both can be used. 
Since many emebedded developers will always use busybox (which provides 
blkid - 3rd? fork of beside e2fsprogs and ulng?) it may be better to 
provide libuuid by e2fsprogs - so you do not need to select another 
package.
If the devleopment goes on, ulng might become the leading 
implementation. So this version should be selectable, too.

Using both versions at the same time does not look reasonable to me.

Regards,
Ossy
