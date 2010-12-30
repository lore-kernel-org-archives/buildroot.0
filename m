From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 30 Dec 2010 23:31:48 +0100
Subject: [Buildroot] [git commit master 1/1] genext2fs.sh: improve
	number of blocks calculation
In-Reply-To: <20101230222011.4B7A08EE7F@busybox.osuosl.org>
References: <20101230222011.4B7A08EE7F@busybox.osuosl.org>
Message-ID: <201012302331.49472.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Thursday 30 December 2010 23:10:21 Peter Korsgaard wrote:
> +    BLOCKS=$(expr 500 + \( $BLOCKS + $INODES / 8 \) \* 11 / 10)

POSIX specifies that you can do arithmetics in the shell:

2.6.4 Arithmetic Expansion

  Arithmetic expansion provides a mechanism for evaluating an arithmetic
  expression and substituting its value. The format for arithmetic expansion
  shall be as follows:

  $((expression))

You do even need to do variable expansion, it's implicit when doing
arithmetics expansion:

  If the shell variable x contains a value that forms a valid integer
  constant, then the arithmetic expansions "$((x))" and "$(($x))" shall
  return the same value.

So I'd write that as:

  BLOCKS=$(( 500 + (BLOCKS+INODES/8) * 11 / 10 ))

Much more readable, IMHO.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
