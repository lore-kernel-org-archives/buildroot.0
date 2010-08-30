From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 30 Aug 2010 17:01:22 +0200
Subject: [Buildroot] package/atk/atk.mk:43: *** recipe commences before
	first target. Stop.
In-Reply-To: <4C7BC441.3010006@jdines.net>
References: <4C7B99D5.9010703@jdines.net> <87bp8kxlve.fsf@macbook.be.48ers.dk>
	<4C7BC441.3010006@jdines.net>
Message-ID: <201008301701.22856.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On Monday 30 August 2010 16:46:25 James J. Dines wrote:
> That patch indeed gets things rolling.  For further edification it
[--SNIP--]
> Can anyone offer a good/thorough
> explanation of what is going on by any chance, or do I have to figure it
> out the old fashioned way?

Well, in this case, it had nothing to do with make-3.82. It was 'just' a
variable definition that was spanning multiple lines, and did not have a
back-slash at the end of one of those lines, so the next line was interpreted
by make as a recipe without rule.

If you're suggesting that make-3.81 was not choking on this line, then this
would have been a bug in make (which I doubt...).

Or I mis-interpreted your message... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
