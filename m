From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 May 2014 21:11:04 +0200
Subject: [Buildroot] [PATCH 2/2] package/rsyslog: needs MMU (fork)
In-Reply-To: <6uqc4bxpjv.ln2@ID-313208.user.individual.net>
References: <1400092133-16971-1-git-send-email-bernd.kuhls@t-online.de>
 <1400092133-16971-2-git-send-email-bernd.kuhls@t-online.de>
 <20140514183816.GI4096@tarshish>
 <6uqc4bxpjv.ln2@ID-313208.user.individual.net>
Message-ID: <20140514191104.GB3495@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-05-14 20:57 +0200, Bernd Kuhls spake thusly:
> Baruch Siach <baruch@tkos.co.il> wrote in
> news:20140514183816.GI4096 at tarshish: 
> 
> >> +     depends on BR2_USE_MMU # fork()
> > 
> > Please also update the dependencies comment.
> 
> afaics nowhere in buildroot exists a comment for the !BR2_USE_MMU case.

Partially wrong. See:
    http://buildroot.net/downloads/manual/manual.html#_literal_config_in_literal_file


  * MMU support
    - Dependency symbol: BR2_USE_MMU
    - Comment string: no comment to be added 

So, indeed, we do not add 'MMU' in the comment, but still the depndency
should be propagated to the comment, so we'd want:

    comment "rsyslog needs a toolchain w/ largefile, wchar, threads"
        depends on BR2_USE_MMU
        depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || !BR2_USE_WCHAR

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
