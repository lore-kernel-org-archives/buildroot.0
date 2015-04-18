From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Apr 2015 17:28:09 +0200
Subject: [Buildroot] [PATCH] target-finalize: fix calling ldconfig
In-Reply-To: <20150418155705.3ff66f18@free-electrons.com>
References: <1429287033-21225-1-git-send-email-yann.morin.1998@free.fr>
 <20150418155705.3ff66f18@free-electrons.com>
Message-ID: <20150418152809.GA4538@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-18 15:57 +0200, Thomas Petazzoni spake thusly:
> On Fri, 17 Apr 2015 18:10:33 +0200, Yann E. MORIN wrote:
> > On some systems (e.g. Fedora 20), the build breaks when parsing include
> > directives in our /etc/ld.so.conf, with error messages as thus:
> > 
> >     /sbin/ldconfig: need absolute file name for configuration file
> >     when using -r
> > 
> > So, enforce the path to the ld.so.conf file to point to our own, in the
> > target/ directory.
> > 
> > Reported-by: Al West <al.west@v-nova.com>
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  Makefile | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> Applied, thanks. But I must admit I would prefer a real overhaul of our
> ldconfig handling (that takes into account glibc vs. uclibc vs. musl,
> etc.).

Yes, I do agree. However, that will take quite longer, and we needed a
quick fix

I'll see if I can have tim eto look into that in the coming days, but to
be honest, I can't promise anything...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
