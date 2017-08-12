From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sat, 12 Aug 2017 11:08:13 -0400
Subject: [Buildroot] [PATCH v6 0/3] Qt WebEngine support
In-Reply-To: <20170812095737.58da25f5@windsurf>
References: <20170811013358.26864-1-gael.portay@savoirfairelinux.com>
 <20170811212937.62d819fc@tux.kirchner>
 <20170811223048.0c445573@windsurf>
 <20170812094839.70a0c4b1@tux.kirchner>
 <20170812095737.58da25f5@windsurf>
Message-ID: <20170812150813.ondf3yfcsjcg5443@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Aug 12, 2017 at 09:57:37AM +0200, Thomas Petazzoni wrote:
> ...
> 
> But still, we need to resolve this:
> 

Right.

>  * Why qtwebengine builds this application for 32 bit ?
> 

I think it is because the target is 32 bits. I will have a deeper look to v8 to
understand why they are doing this.

I just had a quick look, and I found this [1].

>  * If it really needs to do so (which would be weird), then qtwebengine
>    should select BR2_HOSTARCH_NEEDS_IA32_COMPILER
> 

BTW, it seems this bug is quite new in Qt; it appeared since QtWebengine 5.9 [2]
and [3].

I will check if it requirement to build Qt WebEngine.

[1] https://github.com/v8/v8/blob/master/gypfiles/toolchain.gypi#L1000-L1043
[2] https://bugreports.qt.io/browse/QTBUG-59504
[3] https://bugreports.qt.io/browse/QTBUG-61873

Regards,
Gael
