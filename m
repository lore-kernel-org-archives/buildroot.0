From: Robert Urban <urban@unix-beratung.de>
Date: Tue, 10 Mar 2009 01:55:28 +0100
Subject: [Buildroot] problems configuring libcurl
Message-ID: <49B5BA80.5090103@unix-beratung.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Folks,

i've enabled libcurl in svn-buildroot, but the configure-run fails with:

-snip-
checking for openssl/engine.h... yes
checking for ENGINE_load_builtin_engines... yes
checking for RAND_status... yes
checking for RAND_screen... no
checking for RAND_egd... yes
checking for CRYPTO_cleanup_all_ex_data... yes
checking for SSL_get_shutdown... yes
checking for yaSSL using OpenSSL compatibility mode... no
configure: Added
/big/home/urban/Build/Buildroot/svn/buildroot/build_i586/staging_dir/usr/lib
to LD_LIBRARY_PATH
checking for inflateEnd in -lz... grep: error while loading shared
libraries: libc.so.0: cannot open shared object file: No such file or directory
no
checking zlib.h usability... grep: error while loading shared libraries:
libc.so.0: cannot open shared object file: No such file or directory
no
checking zlib.h presence... grep: error while loading shared libraries:
libc.so.0: cannot open shared object file: No such file or directory
yes
configure: WARNING: zlib.h: present but cannot be compiled
configure: WARNING: zlib.h:     check for missing prerequisite headers?
configure: WARNING: zlib.h: see the Autoconf documentation
configure: WARNING: zlib.h:     section "Present But Cannot Be Compiled"
configure: WARNING: zlib.h: proceeding with the preprocessor's result
-snip-

it seems "grep" is failing, but an "ldd" of /bin/grep doesn't even list
"libc.so.0". hmm.

Anyone have a suggestion?

Rob Urban
