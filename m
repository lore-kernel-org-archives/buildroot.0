From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Fri, 03 Nov 2017 14:15:18 +0100
Subject: [Buildroot] [PATCH v2] uboot-tools: bump to version 2017.09
In-Reply-To: <20171103135056.47701a6c@windsurf>
References: <1509562398-20833-1-git-send-email-fabio.estevam@nxp.com>
 <20171103135056.47701a6c@windsurf>
Message-ID: <d6fb31e1-ae41-4af6-824c-5330461abc64@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On p?tek 3. listopadu 2017 13:50:56 CET, Thomas Petazzoni wrote:
> I'm not sure if it's this version bump, or Matthew Weber's patch about
> pylibfdt, but we're seeing new build failures with host-uboot-tools:
>
>   http://autobuild.buildroot.net/?reason=host-uboot-tools-2017.09
>
> Could one of you have a look?

Hi,
I believe that this is caused by a change to host-dtc in commit 
b8c3e941731ddfc3728045142aa9081adeeeaee2. Since this commit, host-dtc has 
started installing its own libfdt into host/include/libfdt*. U-Boot uses 
#include directives in form of <system/ones>, not "user/ones", so it finds 
a copy of libfdt provided by dtc, not its own modified version. I sent a 
quick and dirty patch which fixes this earlier today:

http://lists.busybox.net/pipermail/buildroot/2017-November/206092.html

With kind regards,
Jan
