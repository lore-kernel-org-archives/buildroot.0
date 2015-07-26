From: kyak <bas@bmail.ru>
Date: Sun, 26 Jul 2015 18:49:53 +0300 (MSK)
Subject: [Buildroot] [PATCH 1/1] xterm: force detection of libICE
In-Reply-To: <20150726133211.GD3770@free.fr>
References: <1437749654-29431-1-git-send-email-bas@bmail.ru>
 <20150725212807.GD1847@free.fr> <alpine.LNX.2.20.1507261047230.883@bas>
 <20150726133211.GD3770@free.fr>
Message-ID: <alpine.LNX.2.20.1507261839280.883@bas>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Sure, i should've attached this information in the first place. After all, 
i too used it for debugging of this problem.

Full build log: http://paste.pound-python.org/show/dQ2gfhqx7aQMHAQlRVfK/

config.log: http://paste.pound-python.org/show/EsWJPVSwSaYKN2S0UYJH/

Basically, when configure tests for libICE, it attempts to use host search 
path looking for IceConnectionNumber symbol:

"warning: library search path "/usr/lib64" is unsafe for 
cross-compilation"

On Sun, 26 Jul 2015, Yann E. MORIN wrote:

> Mikhail, All,
>
> On 2015-07-26 10:55 +0300, kyak spake thusly:
>> I get the following error:
>>
>>>>> xterm 314 Building
>
> It would have been more useful to also see the output of the configuring
> part, too.
>
> Also, can you look at output/build/xterm-314/config.log why it does not
> find libICE?
>
> Otherwise, I'm not able to reproduce this error with your .config... ;-/
>
> Regards,
> Yann E. MORIN.
>
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
>
