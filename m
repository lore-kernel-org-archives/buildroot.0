From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 19 Nov 2013 07:43:53 -0300
Subject: [Buildroot] [PATCH v2] alsa-lib: Make alsa mixer lib depend on
 BR2_PREFER_STATIC_LIB.
In-Reply-To: <1384767673-8834-1-git-send-email-Sonic.adi@gmail.com>
References: <1384767673-8834-1-git-send-email-Sonic.adi@gmail.com>
Message-ID: <528B40E9.1010605@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/18/2013 06:41 AM, sonic.adi at gmail.com wrote:

> From: Sonic Zhang <sonic.zhang@analog.com>
> 
> The mixer in ALSA library depends on runtime library loader which
> doesn't available if building for static library.
> 
> Propagate this dependency to package alsa-utils, alsamixergui,
> gstreamer, gstreamer1 and mpd as well.

I'm not convinced this can't be worked around, and also think that
depending on tiny bits for usual options isn't all that friendly
(example: alsamixer depending on the mixer component of alsa-lib rather
than selecting it becomes almost a hidden option).

From a quick look at the source of alsa-lib lack of dl functions is kind
of expected/handled (see src/dlmisc.c), it probably just broke in recent
releases or just wasn't completely finished.
Did you try fixing it up with some additional #ifdef guards in the
offending places?
Regards.
