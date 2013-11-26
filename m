From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Nov 2013 18:06:27 +0100
Subject: [Buildroot] [PATCH 4/5] fs/custom: generate complete,
 partition-based device images
In-Reply-To: <529457D6.8060700@mind.be>
References: <cover.1385157864.git.yann.morin.1998@free.fr>
 <ddf2a31498f7f8e1ec0d40d73849bc254ec00b6d.1385157864.git.yann.morin.1998@free.fr>
 <52931907.2040207@mind.be> <20131125190551.GA3435@free.fr>
 <5293CEC8.9010601@mind.be> <20131125224548.GB3435@free.fr>
 <5293D598.20408@mind.be> <20131125230340.GC3435@free.fr>
 <529457D6.8060700@mind.be>
Message-ID: <20131126170627.GA3948@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2013-11-26 09:12 +0100, Arnout Vandecappelle spake thusly:
> >>On 25/11/13 23:45, Yann E. MORIN wrote:
> >My reasoning is I want varuable to be expanded, like in:
> >     BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE="$(TOPDIR)/board/raspberrypi/partitions"
> 
>  You do know that make doesn't interpret quotes or backslashes? So the \"
> construct is passed verbatim to the shell. The $(...) on the other hand is
> always expanded, except when quoted by doubling the $$.

Yes, I know both. Fact is, given the constructit is not easy to know who
would do the evaluation: make or the shell. But it has to be make, since
$(FOO) is not a variable expansion in shell. So yes, single quotes will
work, too.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
