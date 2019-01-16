From: Vadim Kochan <vadim4j@gmail.com>
Date: Wed, 16 Jan 2019 15:58:21 +0200
Subject: [Buildroot] [PATCH v4 1/2] libopenssl: bump version to 1.1.1a
In-Reply-To: <20190115224239.26125-1-ps.report@gmx.net>
References: <20190115224239.26125-1-ps.report@gmx.net>
Message-ID: <20190116135821.pbjzcpixjbuacu3o@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Jan 15, 2019 at 11:42:38PM +0100, Peter Seiderer wrote:
> - remove all parallel build patches (openssl build-system changed)
> 
> - rebased 0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
>   to apply to Configurations/unix-Makefile.tmpl (Makefile template)
> 
> - removed 0002-cryptodev-Fix-issue-with-signature-generation.patch
>   (upstream applied)
> 
> - rebased 0003-Reproducible-build-do-not-leak-compiler-path.patch to
>   apply to crypto/build.info (Makefile template)
> 
> - fix musl/uclibc build failure, use '-DOPENSSL_NO_ASYNC'
> 
> - remove legacy enable-tlsext configure option
> 
> - fix host library install path
> 
> - change legacy INSTALL_PREFIX to DESTDIR
> 
> - remove 'libraries gets installed read only, so strip fails'
>   workaround (not needed anymore)
> 
> - change engine directory from /usr/lib/engines to
>   /usr/lib/engines-1.1
> 
> - change license file hash, no license change, only the following
>   hint was removed:
> 
>     Actually both licenses are BSD-style Open Source licenses.
>     In case of any license issues related to OpenSSL please
>     contact openssl-core at openssl.org.
> 
> - fix host-libopenssl compile setting rpath as decribed in
>   libopenssl-1.1.0h/NOTES.UNIX
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v3 -> v4:
>   - bump version to 1.1.1a
>   - remove all parallel build patches hash file entries
>   - re-remove 0004-Revert-util-dofile.pl-only-quote-stuff-that-actually.patch
>     (upstream applied)
>   - fix hist library install path
>   - removed 0002-cryptodev-Fix-issue-with-signature-generation.patch
>     (upstram applied)
>   - remove follow up patch for openssh (not longer needed since
>     version bump to 7.9p1, see https://www.openssh.com/releasenotes.html
>     Portability)
> 
> Changes v2 -> v3:
>   - no changes
> 
> Changes v1 -> v2:
>   - add OPENSSL_NO_ASYNC workaround for musl compile too
>     (suggested by Bernd Kuhls)
> 
>   - fix host-libopenssl compile (reported by Ryan Coe) by setting rpath
>     (suggested by Ryan Coe)
> 
>   - fix 0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
>     and 0003-Reproducible-build-do-not-leak-compiler-path.patch to apply
>     to the Makefile templates (instead of re-generated Makefile)
>     (reported by Ryan Coe)
> 
>   - add 0004-Revert-util-dofile.pl-only-quote-stuff-that-actually.patch
>     (suggested by Bernd Kuhls)
> 
> Notes:
> 
>  - There was a previous attempt to bump the openssl version by
>    David Mosberger <davidm@egauge.net>. I could not find the
>    corresponding patch in patchwork or on the mailing list,
>    only a reply by Arnout Vandecappelle (see [2]) and the
>    answer by David Mosberger (see [3]).
> 
>  - Compile checked packages (depending explicit on libopenssl or host-libopenssl):
>    O.k:
>      - hostapd
>      - libpjsip
>      - mosquitto
>      - wpa_supplicant
> 
>     Failure:
>      - softether/host-softether
> 
>  - Compile checked packages (depending on openssl or host-openssl):
>     O.k.:
>       - alljoyn-base
>       - apr
>       - apr-util
>       - freeswitch
>       - openssh
> 
>     Failure:
>       - android-tools
>       - apache (CMake configure errro, unrelated?)
> 
> [2] http://lists.busybox.net/pipermail/buildroot/2017-August/200859.html
> [3] http://lists.busybox.net/pipermail/buildroot/2017-August/200898.html
> ---

Just some worries, I was trying to port openssl 1.1.x for one of the
project and there were some issues with API compatibility for example
for openssh (and mey be some other like curl, wget), it was an year ago
and may be mostly the packages switched to openssl 1.1.x API but
it is not better to make openssl 1.1.x as one of the openssl provider
to do not break other packages ?

Best regards,
Vadim Kochan
