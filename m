From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Jul 2014 19:14:19 +0200
Subject: [Buildroot] [PATCH 0/3] Make exim more configurable
In-Reply-To: <53C63FE1.1010308@lucaceresoli.net>
References: <1404489386-7523-1-git-send-email-luca@lucaceresoli.net>
 <20140715213125.1b848b48@free-electrons.com>
 <53C63546.4040204@lucaceresoli.net>
 <20140716102957.76a63a7a@free-electrons.com>
 <53C63FE1.1010308@lucaceresoli.net>
Message-ID: <20140716171419.GB9252@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2014-07-16 11:03 +0200, Luca Ceresoli spake thusly:
[--SNIP--]
> Well, yes, that's true... I'm probably biased by the fact that
> configuring exim is so uncomfortable, but that's no excuse I guess. :)

Why do you even need to _customise_ the exim username in the first place?

Can't we just call that user 'exim' once and for all?
We alredy have a 'mail' user. Can't we just use that?

I fail to see how the _name_ of the user has any impact. If the exim's
default username is not what we use, then we should either use exim's
default or, if we do not like the default username and prefer the one we
have inBuildroot, change exim's username to match what we use.

So, what is the point of customising the _username_. All that matters
when dealing with file access are the UID and GID. The username is just
a convenience string, which sole purpose is to be nice to us mere
humans... ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
