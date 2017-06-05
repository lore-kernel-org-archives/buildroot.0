From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 12:05:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/libldns: bump version to 1.7.0
In-Reply-To: <20170603131253.10900-1-bernd.kuhls@t-online.de>
References: <20170603131253.10900-1-bernd.kuhls@t-online.de>
Message-ID: <20170605120530.6f424359@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Jun 2017 15:12:53 +0200, Bernd Kuhls wrote:
> Commit https://git.nlnetlabs.nl/ldns/commit/host2str.c?id=f7b3a9700e91f8e46477f335c5aaac7c6cdd8acb
> added compatability with openssl 1.1.0 but, at the same time, breaks
> build without openssl:
> 
> ./host2str.c:1934:74: error: unknown type name ?BIGNUM?
>  ldns_print_bignum_b64_line(ldns_buffer* output, const char* label, const BIGNUM* num)
> 
> This bump makes openssl a mandatory dependency to circumvent the
> problem, we do not gain much by leaving out crypto support in a
> sensitive area like dns. The only package using libldns, freeswitch,
> selects openssl as well, so we have no use case for having libldns
> without openssl support.
> 
> --disable-dane-verify is needed until we bump our openssl to 1.1.x.,
> this fixes the following configure error:
> 
> checking for SSL_get0_dane... no
> configure: error: OpenSSL does not support offline DANE verification
> (Needed for the DANE-TA usage type).  Please upgrade OpenSSL to version
> >= 1.1.0 or rerun with --disable-dane-verify or --disable-dane-ta-usage  
> 
> Removed patches applied upstream:
> 
> 0001-bugfix-548-Double-free-for-answers-4096.patch
> https://git.nlnetlabs.nl/ldns/commit/?h=release-1.7.x&id=2853eb352b4461e98f2926ace4ea3810cedf4167
> 
> 0002-whitespace-bug-in-ldns-read-zone.patch
> https://git.nlnetlabs.nl/ldns/commit/?h=release-1.7.x&id=d6037a22fbedb8ef3a22de4107e4eaa36840865b
> 
> 0003-let-doxyparse-output-manpage-generation-issues.patch
> https://git.nlnetlabs.nl/ldns/commit/?h=release-1.7.x&id=168ee09a4bf184947798c3ee3ac99b6651470d64
> 
> 0004-Comment-out-debugging-remnants.patch
> https://git.nlnetlabs.nl/ldns/commit/?h=release-1.7.x&id=a0a943d504debb05ce4d62ea81c2d218a6cc8727
> 
> 0005-Remove-manpage-content-nondeterminicity-warnings.patch
> https://git.nlnetlabs.nl/ldns/commit/?h=release-1.7.x&id=a56e48856d519d12f1ef600848f335615467f147
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...1-bugfix-548-Double-free-for-answers-4096.patch |  28 --
>  .../0002-whitespace-bug-in-ldns-read-zone.patch    |  47 ---
>  ...oxyparse-output-manpage-generation-issues.patch | 116 ------
>  .../0004-Comment-out-debugging-remnants.patch      |  31 --
>  ...manpage-content-nondeterminicity-warnings.patch | 429 ---------------------
>  package/libldns/Config.in                          |   1 +
>  package/libldns/libldns.hash                       |   8 +-
>  package/libldns/libldns.mk                         |  28 +-
>  8 files changed, 14 insertions(+), 674 deletions(-)
>  delete mode 100644 package/libldns/0001-bugfix-548-Double-free-for-answers-4096.patch
>  delete mode 100644 package/libldns/0002-whitespace-bug-in-ldns-read-zone.patch
>  delete mode 100644 package/libldns/0003-let-doxyparse-output-manpage-generation-issues.patch
>  delete mode 100644 package/libldns/0004-Comment-out-debugging-remnants.patch
>  delete mode 100644 package/libldns/0005-Remove-manpage-content-nondeterminicity-warnings.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
