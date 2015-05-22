From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 22 May 2015 19:24:41 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-05-21
In-Reply-To: <874mn52i52.fsf@dell.be.48ers.dk>
References: <20150522063013.33F0D100C04@stock.ovh.net>
 <874mn52i52.fsf@dell.be.48ers.dk>
Message-ID: <20150522172441.GB5153@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas, All,

On 2015-05-22 09:20 +0200, Peter Korsgaard spake thusly:
>  >         i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/04a1c48d484debd7894fd32997ed50d3a0110b93/
>  >       x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/9accdfec87aa9922a4096b84a61a6e2dfd53561e/
> Gaah, more ipmiutil issues. I believe Yann is looking into this.

ipmiutil's Makefile.am-s are, let's say it politely, not the easiest to
work with...

So, regarding the parallel build issue, I'm bailing out. I am able to
reproduce it in about 1 build out of ten, but then hacking Makefile.am
is just of my league (they are ugly...).

Now, I'm looking at those new build failures. I suspect:
     25e15fd package/ipmiutil: really force md2 off

which introduced -DALLOW_GNU in the CFLAGS, and that has much mpre
impact...

Investigation in progress...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
