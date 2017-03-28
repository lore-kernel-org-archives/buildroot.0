From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 28 Mar 2017 10:12:55 +0200
Subject: [Buildroot] Issue performing switch_root to a UBIFS partition
In-Reply-To: <ad3b2e98-dd3b-66e6-afcd-741bbbdfde56@mind.be>
References: <CAGm1_kuAPosDi1Wc89_oKYr3J=t5py3nFL9F4bO3dZM+N54Ncw@mail.gmail.com>
 <efffdb66-2095-29cc-05ee-db25625c8371@mind.be>
 <CAGm1_ksp-PGMVE69feTDgSMdZDsyzMuYCPkwc75UWy-PhWasvg@mail.gmail.com>
 <ad3b2e98-dd3b-66e6-afcd-741bbbdfde56@mind.be>
Message-ID: <CAGm1_kuF8Dqo7ctHRF7Og3smXcsgKby1vwH0yM9HM8a1Mw1nww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 27, 2017 at 5:16 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 27-03-17 14:59, Yegor Yefremov wrote:
>> getpid()                                = 915
>
>  PID must be 1. Forgot to mention that in the script representation :-) Of
> course, here it's due to the strace... To avoid, you could use "strace -fp 1 &"
> but I'm not sure how that would behave across the exec.

This doesn't work.

>> write(2, "BusyBox v1.26.2 (2017-03-24 16:3"..., 41BusyBox v1.26.2
>> (2017-03-24 16:39:44 CET)) =
>> write(2, " multi-call binary.\n", 20 multi-call binary.
>> )   = 20
>> write(2, "\nUsage: ", 8
>> Usage: )                = 8
>
>  Did this Usage: part also come out when running without strace? It's very weird
> that the rest of the usage output is not appearing. Or perhaps that's because
> you get a kernel panic immediately afterwards because PID 1 exits?

This is what I get, if I invoke switch_root without moving /dev, /sys
and /proc and without strace:

# exec /sbin/switch_root /newroot/ /sbin/init
BusyBox v1.26.2 (2017-03-24 16:39:44 CET) multi-call bina
Welcome to Buildroot

The whole stuff is very strange. Have you tried it yourself with
recent BR and kernel?

>> can't open /dev/ttyO0: No such file or directory
>
>  Still no explanation where this comes from...

Yegor
