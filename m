From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2020 22:29:50 +0100
Subject: [Buildroot] [PATCH] Revert "package/perl-crypt-ssleay: new
 package"
In-Reply-To: <20200325094559.5046-1-patrickdepinguin@gmail.com>
References: <20200325094559.5046-1-patrickdepinguin@gmail.com>
Message-ID: <20200326222950.10e9c875@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 25 Mar 2020 10:45:59 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> This reverts commit 25033cfb8612c6d0f45c89806f7e0669ffbf0e8a.
> 
> This perl package is deprecated and gives following recommendations while
> building:
> 
>     *** THIS IS NOT AN ERROR, JUST A MESSAGE FOR YOUR INFORMATION ***
> 
>         Do you really need Crypt::SSLeay?
> 
>         Starting with version 6.02 of LWP, https support was unbundled into
>         LWP::Protocol::https. This module specifies as one of its prerequisites
>         IO::Socket::SSL which is automatically used by LWP::UserAgent unless
>         this preference is overridden separately. IO::Socket::SSL is a more
>         complete implementation, and, crucially, it allows hostname
>         verification. Crypt::SSLeay does not support this. At this point,
>         Crypt::SSLeay is maintained to support existing software that already
>         depends on it.
> 
>         However, it is possible that your software does not really depend on
>         Crypt::SSLeay, only on the ability of LWP::UserAgent class to
>         communicate with sites over SSL/TLS.
> 
>         If are using version LWP 6.02 or later, and therefore have installed
>         LWP::Protocol::https and its dependencies, and do not explicitly use
>         Net::SSL before loading LWP::UserAgent, or override the default socket
>         class, you are probably using IO::Socket::SSL and do not really need
>         Crypt::SSLeay.
> 
>         Before installing Crypt::SSLeay, you may want to try specifying a
>         dependency on LWP::Protocol::https.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  DEVELOPERS                                    |  2 -
>  package/Config.in                             |  1 -
>  package/perl-crypt-ssleay/Config.in           | 12 ------
>  .../perl-crypt-ssleay/perl-crypt-ssleay.hash  |  6 ---
>  .../perl-crypt-ssleay/perl-crypt-ssleay.mk    | 18 --------
>  package/perl-try-tiny/perl-try-tiny.mk        |  1 -
>  .../tests/package/test_perl_crypt_ssleay.py   | 43 -------------------
>  7 files changed, 83 deletions(-)
>  delete mode 100644 package/perl-crypt-ssleay/Config.in
>  delete mode 100644 package/perl-crypt-ssleay/perl-crypt-ssleay.hash
>  delete mode 100644 package/perl-crypt-ssleay/perl-crypt-ssleay.mk
>  delete mode 100644 support/testing/tests/package/test_perl_crypt_ssleay.py

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
