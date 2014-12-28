From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Dec 2014 12:33:56 +0100
Subject: [Buildroot] [PATCH 1/2] package/freerdp: do not use Neon
 extensions when not available
In-Reply-To: <8761cwdn90.fsf@dell.be.48ers.dk>
References: <cover.1419704115.git.yann.morin.1998@free.fr>
 <dc7aed907743824f29e6000e45e01388ae8cf0dd.1419704115.git.yann.morin.1998@free.fr>
 <8761cwdn90.fsf@dell.be.48ers.dk>
Message-ID: <20141228113356.GA4254@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-12-28 12:31 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > FreeRDP mis-detects the CPU, and may enable Neon extensions when it
>  > should not. Not all ARM processors have Neon extensions.
> 
>  > Heck, what's more, none non-ARM processor has Neon extensions!
>  > The regexp to detect the CPU is borked:  'arm*'  will also match 'arc'
>  > as well as 'arm'.
> 
> Huh, how does arm* march arc?

Already answered on IRC, but for the records: this is not a glob, this
is a regexp.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
