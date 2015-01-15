From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 Jan 2015 07:37:02 -0300
Subject: [Buildroot] [PATCH] package/gcc: disable libitm for sparc <v9
In-Reply-To: <20150115093742.1fb23f1f@free-electrons.com>
References: <1421281784-5243-1-git-send-email-gustavo@zacarias.com.ar>
 <20150115093742.1fb23f1f@free-electrons.com>
Message-ID: <54B7984E.7090705@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/15/2015 05:37 AM, Thomas Petazzoni wrote:

> Applied, thanks. Is it only SPARCv8 that doesn't have libitm support,
> or could other architectures be affected? If other architectures are
> affected, we may want to introduce a BR2_ARCH_HAS_LIBITM or some other
> similar thing.
> 
> Another weird thing: we're not enabling libitm, so why is gcc enabling
> it by itself, if it knows that the architecture cannot support it?

There are other architectures that could be affected, most notably old
processors/cores.
I don't think we need to do anything more special about it, most of the
time gcc will detect and enable it if the architecture supports it,
which basically boils down to your second question, it's failing to
realize sparc v8 can't handle it.
It probably has to do with the sparc tuple being used for sparc64 as
well (64 bit kernel 32 bit userland) and sparc v8 being terribly old and
hardly used outside of LEON (V9 dates from 1993!).
Regards.
