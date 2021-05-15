From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 15 May 2021 22:40:34 +0200
Subject: [Buildroot] [PATCH/next v2 1/1] package/libbluray: add optional
 support for libudfread
References: <20210515070141.396977-1-bernd.kuhls@t-online.de>
 <20210515161529.GT2506__39571.1449951463$1621095355$gmane$org@scaer>
Message-ID: <27o5nhx5eu.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 15 May 2021 18:15:29 +0200 schrieb Yann E. MORIN:

> Bernd, All,
> 
> On 2021-05-15 09:01 +0200, Bernd Kuhls spake thusly:
>> Signed-off-by: Bernd Kuhls
>> <bernd.kuhls@t-online.de>
> 
> In fact, this is fixing a hidden optional dependency, so I've applied to
> master. Thanks!

Hi Yann,

this is a bad idea because libbluray-1.2.1 contains a bug detecting 
libudfread so I sent the patch for the -next branch which contains the 
bump to the fixed libbluray version 1.3.0.

My original patch from February also contained a backported patch to fix 
the problem for libbluray-1.2.1: http://patchwork.ozlabs.org/project/
buildroot/patch/20210221172307.289368-1-bernd.kuhls at t-online.de/

So for the master branch, which is broken atm w.r.t. to the detection of 
udfread by libbluray, we have three choices:

- revert this commit
- apply the full patch http://patchwork.ozlabs.org/project/buildroot/
patch/20210221172307.289368-1-bernd.kuhls at t-online.de/
- bump libbluray to 1.3.0

Regards, Bernd

PS: @Yann:
I did not sent this mail CC to you because all mails I try to send are 
bouncing for years now:

<yann.morin.1998@free.fr>: host mx1.free.fr[212.27.48.7] said: 451 too 
many
    errors from your ip (194.25.134.83), please visit
    http://postmaster.free.fr/ (in reply to DATA command)
