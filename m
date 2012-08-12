From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Aug 2012 16:50:03 +0200
Subject: [Buildroot] [PATCH] python: fix interpreter directive for
	python scripts
In-Reply-To: <CAMkyJgAgra7W+7-NZyT_Oz9HAHLGMgziLBU+kR-hdjexJsHtow@mail.gmail.com>
References: <1344665427-27181-2-git-send-email-net147@gmail.com>
 <50279BDA.6080407@gmail.com>
 <CAMkyJgAgra7W+7-NZyT_Oz9HAHLGMgziLBU+kR-hdjexJsHtow@mail.gmail.com>
Message-ID: <201208121650.03902.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jonathan, Avishay, Thomas, All,

On Sunday 12 August 2012 15:19:17 Avishay Orpaz wrote:
> I've just ran into this kind of problem. It can be solved per package by
> adding "-e /usr/bin/python" to the setup build command.

Or introduce a new package infrastrucutre, like for autotools-based and
cmake-based packages. For example, we could add a "pysetup" (or whatver)
infrastructure:

  $(eval $(pysetup-package))

Which would automatically call ./setup in the package directory, passing the
proper arguments, instead of reimplementing that in every python packages?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
