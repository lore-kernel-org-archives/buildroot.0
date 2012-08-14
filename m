From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Aug 2012 19:07:12 +0200
Subject: [Buildroot] Suggestion: increase username buffer size in
	busybox login
In-Reply-To: <CADiAo4LZ0e=Goo13SKodFo6PL0iEsVG5tPsdQ6jp6yhOsBX4DQ@mail.gmail.com>
References: <CADiAo4LZ0e=Goo13SKodFo6PL0iEsVG5tPsdQ6jp6yhOsBX4DQ@mail.gmail.com>
Message-ID: <201208141907.13002.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dmitry, All,

On Tuesday 14 August 2012 15:47:50 Dmitry Golubovsky wrote:
> Would anybody object to increase the size of the username buffer that
> busybox login has:
> 
> loginutils/login.c, line 37
> 
> enum {
> 	TIMEOUT = 60,
> 	EMPTY_USERNAME_COUNT = 10,
> 	USERNAME_SIZE = 32,
> 	TTYNAME_SIZE = 32,
> };
> 
> I would like to submit a patch to increase USERNAME_SIZE to 256.
> 
> My rationale is (disclaimer: mainly influenced by my own
> buildroot-based project): now that we have PAM in place, more
> interesting login schemes are possible such as authentication against
> some remote host/domain which asks for usernames like user at host or
> user at domain (or domain\user).
> 
> Where did the size 32 come from?
> 
> Or would it be better to raise this with busybox developers?

Yep, probably. If there's a hard-reason for 32, they are the guys that
will know for sure, and if the change is accepted, they are the guys
that can apply it ;-)
    busybox at busybox.net

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
