From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jul 2014 00:21:20 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-07-11
In-Reply-To: <20140712063006.DDD28100E08@stock.ovh.net>
References: <20140712063006.DDD28100E08@stock.ovh.net>
Message-ID: <20140712222120.GF3582@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-12 08:30 +0200, Thomas Petazzoni spake thusly:
>        arm |           perl-net-ssleay-1.64 | NOK | http://autobuild.buildroot.net/results/c7787542651e047631213e7be781008c60d48e0f/

Brain-damage.

The build system for perl-net-ssleay is completely f*ked-up for
cross-compilation. It tries to execute the openssl binary, and *runs* it
to verify a few things about openssl: availability, version...

Then it looks for openssl/ssl.h in host-system locations:
    $prefix/include  $prefix/inc32  /usr/kerberos/include

Of course $prefix is /usr, so it picks the host system openssl.

Ditto for the -L paths.

Totally brain-damaged.

And it is happy to just state:
    *** Found OpenSSL-1.0.1f installed in /usr

Yeah, we're packaging openssl-1.0.1h in Buildroot. 1.0.1f is on my host
system's openssl...

Grrr...

/me reaches for his chainsaw...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
