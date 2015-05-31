From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 31 May 2015 10:55:49 +0200
Subject: [Buildroot] [PATCH] package/sconeserver: fix static link with
 openssl
In-Reply-To: <20150531103804.3f9f22a6@free-electrons.com>
References: <1432995551-11598-1-git-send-email-yann.morin.1998@free.fr>
 <20150531103804.3f9f22a6@free-electrons.com>
Message-ID: <20150531085549.GA3658@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-05-31 10:38 +0200, Thomas Petazzoni spake thusly:
> On Sat, 30 May 2015 16:19:11 +0200, Yann E. MORIN wrote:
> > When linking statically, the order of libraries on the linker command
> > line is important, and sconeserver got it wrong.
> > 
> > Also, isconeserver does not use pkg-config, so it misses the private
> 
>         ^^ typo
> 
> > libs of -lcrypto, which is linking with -lz.
> > 
> > Fix that:
> >   - add a patch to configure.in to fix the order of libraries;
> >   - forcibly pass -lz when lkinking statically with openssl.
> 
>                              ^^^ typo
> 
> Applied with those two typos fixed. 

Thanks! :-)

>It's really a pity that pkg-config
> isn't more widely used :-/ If openssl grows another dependency, we
> would have to fix this again...

For 2015.05, I only 'fixed' sconeserver with the patch you applied, but
for upstream, I submitted a more involved patch that makes use of
pkg-config, which upstream seems to be happy with so far (but have not
yet merged):
    https://github.com/sconemad/sconeserver/pull/1

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
