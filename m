From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 7 Jul 2011 23:55:43 +0200
Subject: [Buildroot] [PATCH 06/28] package: fix patching procedure for
	host packages
In-Reply-To: <87ei21pxpt.fsf@macbook.be.48ers.dk>
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <04a4534f698a676c73be6f4ca82235cb1cce69c8.1309895466.git.thomas.petazzoni@free-electrons.com>
 <87ei21pxpt.fsf@macbook.be.48ers.dk>
Message-ID: <201107072355.44204.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas, All,

On Thursday 07 July 2011 23:50:06 Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>  Thomas> -$$($(2)_TARGET_PATCH):			NOHOSTPKG=$(3)
>  Thomas> +$$($(2)_TARGET_PATCH):			RAWNAME=$(patsubst host-%,%,$(1))
> 
> Here's to hoping we'll never have a package called 'host' ;)

We already raised that potential issue with Thomas, and the conclusion is
that we do not allow a package which name starts with 'host-'. See:
  http://lists.busybox.net/pipermail/buildroot/2011-July/043880.html

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
