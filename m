From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 30 Jul 2015 18:31:55 +0200
Subject: [Buildroot] [PATCH] package/golang: new package
In-Reply-To: <CA+h8R2pvaeQ4K7szq+Dr7dYT1cjGTW3QhB4jRNhKj6NY7P289w@mail.gmail.com>
References: <1438202101-5106-1-git-send-email-yann.morin.1998@free.fr>
 <20150729231228.0a59fcde@free-electrons.com>
 <20150729212003.GB3722@free.fr>
 <20150729233725.60512298@free-electrons.com>
 <CA+h8R2pvaeQ4K7szq+Dr7dYT1cjGTW3QhB4jRNhKj6NY7P289w@mail.gmail.com>
Message-ID: <20150730163154.GA3744@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, all,

On 2015-07-29 22:28 +0000, Christian Stewart spake thusly:
> > We're not doing this for any other package, so why should we be doing
> > this for golang?
> >
> 
> Because it's very critical that Go have the exact same src, include, and
> pkg tree in that location. If we don't ensure any previous files have been
> cleared out it WILL cause major problems down the line.

But Thomas is right: we're not doing it for other packages, even if they
have the same requirements.

In fact, Buildroot only guarantees everything is perfect when building
from scratch. Any cycle of build-modify-build has never been guaranteed
to produce the same results as just the last build alone would give.

So, I concur with Thomas: we need not ensre cleanliness, and should
assume that directory is clean. Hence there's no reason to remove it
beforehand.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
