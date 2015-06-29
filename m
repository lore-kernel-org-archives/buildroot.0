From: Tal Zilcer <talz@ezchip.com>
Date: Mon, 29 Jun 2015 15:39:12 +0000
Subject: [Buildroot] [PATCH 1/2] package/gcc: fix ARC failure to build
 in 2 phases.
In-Reply-To: <20150629162906.415e456f@free-electrons.com>
References: <1435582227-26345-1-git-send-email-talz@ezchip.com>
 <20150629162906.415e456f@free-electrons.com>
Message-ID: <AM3PR02MB11407402CE0DA7E56F56AAE6BBAA0@AM3PR02MB1140.eurprd02.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Sent: Monday, June 29, 2015 5:29 PM

> If you're using <pkg>_OVERRIDE_SRCDIR, then the assumption is that your source tree is patched with whatever change is needed for the package to build fine without applying any of the Buildroot patches.
We have one source tree for both build phases of GCC.
First phase must have this patch while second phase must NOT have it.
it doesn't seems reasonable to have two GCC source trees because of this patch.

> In any case, I don't think it's worth the effort making that conditional, just register the post-rsync hook unconditionally.
It is only to explain our intentions, do you prefer a comment or just to add the RSYNC hook?

> BTW, this problem should have been sorted out by the ARC developers, maybe you should ping them about this?
Adding Alexey to this correspondence

Thanks,

Tal
