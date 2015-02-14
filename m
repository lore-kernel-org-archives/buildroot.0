From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Feb 2015 23:00:03 +0100
Subject: [Buildroot] [PATCH 4/4] br-reproduce-build: quote all variables
In-Reply-To: <20150214221046.69bc7075@free-electrons.com>
References: <cover.1423910953.git.yann.morin.1998@free.fr>
 <0b43bc60a4856f45924e3814010dc49d0240b1a4.1423910953.git.yann.morin.1998@free.fr>
 <20150214221046.69bc7075@free-electrons.com>
Message-ID: <20150214220003.GG3886@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-02-14 22:10 +0100, Thomas Petazzoni spake thusly:
> On Sat, 14 Feb 2015 11:52:06 +0100, Yann E. MORIN wrote:
> 
> > -wget -O ${BUILD_DIR}/config http://autobuild.buildroot.org/results/${BUILD_ID}/config
> > +wget -O "${BUILD_DIR}/config http://autobuild.buildroot.org/results/${BUILD_ID}/config"
> 
> How can this work? You're putting both the -O argument and the URL
> within the same quotes.

Indeed, it can not work. And I noticed that when testing, and I fixed
it, but...

> > -wget -O ${BUILD_DIR}/gitid http://autobuild.buildroot.org/results/${BUILD_ID}/gitid
> > +wget -O "${BUILD_DIR}/gitid http://autobuild.buildroot.org/results/${BUILD_ID}/gitid"
> 
> Ditto.

... obviously, I forgot to commit --amend... :-(

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
