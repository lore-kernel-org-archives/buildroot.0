From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 3 Nov 2010 23:52:34 +0100
Subject: [Buildroot] [Review] Add gcc 4.5.1
In-Reply-To: <4CD1B69C.8020402@zacarias.com.ar>
References: <1285020197-30269-1-git-send-email-Martin.Banky@gmail.com>
	<4CD1B69C.8020402@zacarias.com.ar>
Message-ID: <201011032352.34417.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On Wednesday 03 November 2010 20:23:08 Gustavo Zacarias wrote:
> Word of caution, gcc 4.5 isn't able to build good ARM kernels that can
> load modules for versions <2.6.36 unless a patch is applied, see
> https://bugzilla.kernel.org/show_bug.cgi?id=16310

From what I understand:
- bug was introduced between 2.6.35-rc1 and -rc2: use the gcc option
  only for powerpc
- the mentioned gcc option was previously applied to all architectures
- the bug has not been fixed on the 2.6.35.y tree
- it was fixed during the 2.6.36 devel cycle

Which leads to the conclusion that:
- 2.6.34 and prior         : not impacted
- 2.6.35 and dot-releases  : impacted
- 2.6.36 ( and above ;-) ) : not impacted

Sounds reasonable?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
