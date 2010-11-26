From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 27 Nov 2010 00:23:28 +0100
Subject: [Buildroot] Report from the Buildroot Developer Day,
	29th October 2010
In-Reply-To: <20101126144510.5e6504fd@surf>
References: <20101123221417.0d6867c6@surf>
	<AANLkTi=A4sufp9mSKrBzHtPE87WsLPw4k6+jti6hM0He@mail.gmail.com>
	<20101126144510.5e6504fd@surf>
Message-ID: <201011270023.28293.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas & Thomas, All,

On Friday 26 November 2010 14:45:10 Thomas Petazzoni wrote:
> On Fri, 26 Nov 2010 13:16:45 +0100
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> wrote:
> > What about allowing components to be located in a separate location,
> > outside of buildroot?
[--SNIP--]
> The topic was shortly raised this morning on the IRC channel, but no
> clear solution was found yet. Input, feedback and ideas on the matter
> are definitely appreciated.

I did not follow the IRC log, but here's my suggestion...

Add a config knob where the user can enter the path to a directory.
That directory is expected to contain packages in sub-directories,
the way we currently have in package/ in Buildroot. Then, for each
package that is present there, we use it instead of our own version.

The Linux kernel, the bootloaders is special, as it is not in package/, but that can
probably be handled.

Of course, that's not currently trivial to implement (it might even
be completely impossible the way we currently include packages), but
it can be worth investigating...

Well, my 2 cents... ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
