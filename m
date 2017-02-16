From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Feb 2017 09:36:30 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-13
In-Reply-To: <c2a9e08b-74a1-be16-740f-3b560abdc1fc@mind.be>
References: <20170214072856.3AE8320B8C@mail.free-electrons.com>
 <20170214142725.1b9e98ae@free-electrons.com>
 <20170214232912.42d8a2df@free-electrons.com>
 <8760kbj44g.fsf@dell.be.48ers.dk>
 <20170215093351.46cf9b57@free-electrons.com>
 <c2a9e08b-74a1-be16-740f-3b560abdc1fc@mind.be>
Message-ID: <20170216093630.04c3dba3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Feb 2017 00:14:53 +0100, Arnout Vandecappelle wrote:

>  Indeed, the __STDC_LIMIT_MACROS definition was removed in glibc 2.18 (commit
> 1ef74943ce2f114c78b215af57c2ccc72ccdb0b7). That's why it only happens with old
> external glibc toolchains.
> 
>  Unfortunately we don't have a version symbol for glibc. But in this case, I
> think the easy way out is to just add -D__STDC_LIMIT_MACROS to LIBRAW_CFLAGS
> when jasper is selected. This macro isn't used anymore in recent glibc, so it
> certainly doesn't hurt to define it.

Good idea, so I've done this:

  https://git.buildroot.org/buildroot/commit/?id=d246cf5fd01bb0d20a0e64194ffed514ea8dd0aa

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
