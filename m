From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Nov 2017 18:36:11 +0100
Subject: [Buildroot] Bug in RPATH fixing logic
In-Reply-To: <87d14ms2x2.fsf@dell.be.48ers.dk>
References: <20171112174013.25d90333@windsurf.home>
 <20171112174955.18449728@windsurf.home>
 <87y3nbs9jz.fsf@dell.be.48ers.dk>
 <20171112182403.5d5c8fe4@windsurf.home>
 <20171112174250.GD2947@scaer>
 <734d391a-b9b9-d728-9878-4e8c4599b106@grandegger.com>
 <87d14ms2x2.fsf@dell.be.48ers.dk>
Message-ID: <20171113173611.GB2861@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2017-11-13 14:50 +0100, Peter Korsgaard spake thusly:
> >>>>> "Wolfgang" == Wolfgang Grandegger <wg@grandegger.com> writes:
>  > This means: A symbolic link would work.
> Ok, great - Makes sense. I wonder how much effort it wil be to get
> binutils to generate symbolic links instead of hard links.

No way.

We'll have to provide post-install hooks to do the de-hardlinking step
ourselves.

Also, as Wolfgang noticed, gcc is also affected by the hardlink issue.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
