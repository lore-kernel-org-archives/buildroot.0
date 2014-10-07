From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Oct 2014 23:06:31 +0200
Subject: [Buildroot] [PATCH 1/3] package/libva: Bump version to 1.4.0
In-Reply-To: <XnsA3BFE9C44990FberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1412623692-3322-1-git-send-email-bernd.kuhls@t-online.de>
 <87ppe3fwnn.fsf@dell.be.48ers.dk>
 <XnsA3BFE9C44990FberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20141007210631.GA27580@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-10-07 22:58 +0200, Bernd Kuhls spake thusly:
> Peter Korsgaard <jacmet@uclibc.org> wrote in 
> news:87ppe3fwnn.fsf at dell.be.48ers.dk:
> 
> > Committed all 3, thanks. For future patches, it would be good if you
> > would add the tarball hashes as the libva* release announcements had
> > them (I've added them now).
> 
> Hi,
> 
> ok, I will do so.
> 
> Until now I did not really bother for my non-security-related packages 
> because I remembered the commit description
> http://git.buildroot.net/buildroot/commit/support/download/check-hash?id=
> 9bd8b59526c4521879f0ae5f765cb1a748725c49 where Yann talked about "sensitive 
> packages, related to security: openssl, dropbear, ca-certificates...", so I 
> thought hashes are optional[1].

Yes, that is the primary reason for adding hashes. And we do want hashes
for those sensitive packages. However...

> It seems I did not notice the change of 
> policy regarding hashes.
> In other words: Is there a reason _not_ to include a hash for a source 
> tarball?

... there are a few other good reasons we accept hashes:

  - it ensures a broken download is detected, so the user quickly knows
    that the tarball is broken because of the download; sometimes,
    upstreams breaks their distributions (e.g. the recent sourceforge
    breakage...).

  - non-compliant downloads are removed (rm -f) so they are not
    accidentally used in another context (e.g. I do share my BR2_DL_DIR
    with other stuff).

  - consequently, it helps the autobuilders prune their failed
    downloads.

But in the end there is no clear policy, except:

  - we *do* want hashes for security-related packages;
  - hashes for other packages are a nice bonus.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
