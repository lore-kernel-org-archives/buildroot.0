From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Feb 2021 21:14:07 +0100
Subject: [Buildroot] [PATCH] support/download/svn: fix date format for
 archive creation
In-Reply-To: <20210222182801.GD2276@scaer>
References: <20210219212154.27107-1-vfazio@xes-inc.com>
 <20210220095148.GI2276@scaer>
 <4cba7ba3-06c7-b45b-81c8-4746bcee2bcf@mind.be>
 <20210222182801.GD2276@scaer>
Message-ID: <20210222201407.GE2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,All,

I was rushing for dinner, so forgot to properly complete my mail before
sending it; here's a complement...

On 2021-02-22 19:28 +0100, Yann E. MORIN spake thusly:
> On 2021-02-22 11:58 +0100, Arnout Vandecappelle spake thusly:
> > On 20/02/2021 10:51, Yann E. MORIN wrote:
> > > On 2021-02-19 15:21 -0600, Vincent Fazio spake thusly:
> > >> Now the returned date is massaged to drop the sub-seconds.
> [--SNIP--]
> > A much simpler solution is
> > date="$( date -d "${date}" -u +%Y-%m-%dT%T%:z )"
> > which is fully portable over any POSIX-compliant version of date.
[--SNIP--]
> Eventually, I've settled for: 

... for: +%Y-%m-%dT%H:%M:%S+00:00

> Actually, sub-second precision *is* allowed by ISO8601. [...]

And so, I still think it is better to have that clamping in the helper.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
