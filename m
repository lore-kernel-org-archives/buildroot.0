From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 8 Jul 2010 00:33:24 +0200
Subject: [Buildroot] Controlling dependencies for package with manual
	Makefile
In-Reply-To: <8128F0FD6C26E14C8EB4BFDB92B8D6B201517E3A@2putt.int.lantronix.com>
References: <8128F0FD6C26E14C8EB4BFDB92B8D6B201517E3A@2putt.int.lantronix.com>
Message-ID: <201007080033.24836.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew, All,

On Thursday 08 July 2010 00:26:04 Matthew Davison wrote:
> > Is there a way to force buildroot to build package dependencies first,
> > without having to convert to an autotools compliant Makefile?
> 
> It's a bit of a kludge, but I discovered that I can just add the
> dependency package name directly into my package's target prerequisites.
> So for dependency <lib1>, I can modify my primary package target (in
> packagename.mk) to:
> packagename: lib1 <existing prerequisites go here>
>  
> This is far from ideal, but it does appear to be working.

From the docs, it seems it;s just the thing to do:
  http://buildroot.org/buildroot.html#manual-tutorial

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
