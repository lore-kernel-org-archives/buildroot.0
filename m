From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jun 2015 17:49:20 +0200
Subject: [Buildroot] [PATCH 1/2] package/gcc: fix ARC failure to build
 in 2 phases.
In-Reply-To: <AM3PR02MB11407402CE0DA7E56F56AAE6BBAA0@AM3PR02MB1140.eurprd02.prod.outlook.com>
References: <1435582227-26345-1-git-send-email-talz@ezchip.com>
 <20150629162906.415e456f@free-electrons.com>
 <AM3PR02MB11407402CE0DA7E56F56AAE6BBAA0@AM3PR02MB1140.eurprd02.prod.outlook.com>
Message-ID: <20150629174920.10f52a00@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 Jun 2015 15:39:12 +0000, Tal Zilcer wrote:

> We have one source tree for both build phases of GCC.
> First phase must have this patch while second phase must NOT have it.
> it doesn't seems reasonable to have two GCC source trees because of this patch.

Ah right. I think there's probably a way to write the change so that it
does not try to use these object files during the initial gcc build.
This is really what the real fix is.

> > In any case, I don't think it's worth the effort making that conditional, just register the post-rsync hook unconditionally.
> It is only to explain our intentions, do you prefer a comment or just to add the RSYNC hook?

For now, we can just add the rsync hook, but...

> > BTW, this problem should have been sorted out by the ARC developers, maybe you should ping them about this?
> Adding Alexey to this correspondence

... I'd like to hear from Alexey about this, since I reported this
issue a while ago now.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
