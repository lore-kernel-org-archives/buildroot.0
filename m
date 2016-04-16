From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Apr 2016 23:20:15 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	yem/no-custom-help
Message-ID: <cover.1460841291.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series reverts the recently introduced custom help feature,
because it can not be correctly implemented without dirty hacks.

The issue is that the external.mk makefile is only sourced when the $(O)
directory is already configured (i.e. when there is a .config file).

So, in an unconfigutred $(O) directory, the custom help would not be
displayed. Fixing that would require that we either:
  - move the custom help to its own .mk file (eek!), or
  - be able to source external.mk unconditionally.

While the first solution is definitely trivial to implement (and was
implemented with patches posted to the list), it is definitely not nice.
It xcomplexifies the br2-external tree needlessly.

Assessing the implacts of the second solution is however a very complex
topic, and definitely not trivial.

In the end, since there is not much gained by advertising and including
the custom help in the main help, just remove that.

Regards,
Yann E. MORIN.


The following changes since commit 04d0a5793fd802b1bcd091cfdd84a464d438579e:

  configs/stm32f469_disco: new configuration for STM32F469 Discovery board (2016-04-16 12:44:07 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/no-custom-help

for you to fetch changes up to 433663cc842dbcbfbbde08d84d199682ca0b9518:

  Revert "core: add the possibility to provide help for custom rules" (2016-04-16 23:14:10 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      Revert "core: also display the custom help with our main help"
      Revert "core: add the possibility to provide help for custom rules"

 Makefile                             | 10 +---------
 docs/manual/customize-outside-br.txt | 14 --------------
 2 files changed, 1 insertion(+), 23 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
