From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Nov 2016 12:13:41 +0100
Subject: [Buildroot] [PATCH 00/15] Reproducible builds
In-Reply-To: <1479376839-27795-1-git-send-email-jezz@sysmic.org>
References: <1479376839-27795-1-git-send-email-jezz@sysmic.org>
Message-ID: <20161117121341.4a63ed15@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Nov 2016 11:00:24 +0100, J?r?me Pouiller wrote:
> This series try to continue work initiated by Gilles Chanteperdrix:
>   http://lists.busybox.net/pipermail/buildroot/2016-April/thread.html#160064
>   http://lists.busybox.net/pipermail/buildroot/2016-June/thread.html#163905

Thanks for taking over this effort. This is definitely interesting.

> Other thing known to break reproducibility:
>   - use of lzop (it unconditionally include timestamps in result)

I guess we can patch lzop to avoid this issue, right?

>   - since gcc versions supporting SOURCE_DATE_EPOCH are not widely available,
>     external toolchains probably won't work.

Instead of patching gcc, can we solve the problem in the toolchain
wrapper? I.e, maybe the toolchain wrapper can set __DATE__ and __TIME__
by passing -D__DATE__=... -D__TIME__=... to gcc ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
