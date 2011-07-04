From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 5 Jul 2011 00:08:38 +0200
Subject: [Buildroot] [PATCH 07/28] barebox: use = instead of := and
	re-indent
In-Reply-To: <b98e01894aa9475d1480f8c2337190caf1281b7e.1309815048.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
 <b98e01894aa9475d1480f8c2337190caf1281b7e.1309815048.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201107050008.38502.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Monday 04 July 2011 23:33:24 Thomas Petazzoni wrote:
> -BAREBOX_VERSION:=2011.05.0
[--SNIP--]
> +BAREBOX_VERSION = 2011.05.0

What is the rationale for using '=' instead of ':='?

Using '=' evaluates the assignemnt every time it is referenced, which can
be a little bit costly when there are tons of them (like in buildroot);
while using ':=' does the evaluation only once, at the time of the
assignment, not evaluation.

I agree that the code should be homogeneous, but I'd think it should be
fast as well. He, if I can get butter, buter's money, and a litle smile
from the dairywoman! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
