From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Feb 2020 20:36:55 +0100
Subject: [Buildroot] [PATCH v2] package/libssh: add support for mbedtls
 crypto backend
In-Reply-To: <20190924132602.25186-1-gliga.mircea@gmail.com> (Mircea Gliga's
 message of "Tue, 24 Sep 2019 16:26:02 +0300")
References: <20190918110609.7172-1-gliga.mircea@gmail.com>
 <20190924132602.25186-1-gliga.mircea@gmail.com>
Message-ID: <875zgook6g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mircea" == Mircea Gliga <gliga.mircea@gmail.com> writes:

 > At this point Buildroot doesn't allow to use mbedTLS crypto
 > backend even though libssh supports it. In case of fully statically
 > linked ELF executables the size difference between OpenSSL and mbedTLS
 > is significant: it matters for embedded targets with very limited
 > storage.

 > This patch adds support for compiling libssh with mbedTLS as a
 > crypto backend. It also allows the selection of the crypto backend
 > libssh will use through a choice in the package config.

 > Currently, the selection of the backend is based on a priority order,
 > which is not always desirable, as in some cases multiple backends
 > can exists at the same time for various reasons.

 > Switch to OpenSSL as the default crypto backend, instead of libgcrypt,
 > since OpenSSL is more commonly used.

 > Signed-off-by: Mircea Gliga <gliga.mircea@gmail.com>

 > ---
 > Changes V1->V2:
 > * choice now selects the crypto provider package
 > * more detailed description in commit message
 > * switch default crypto backend to OpenSSL

Committed after changing the selects to depends on to match libssh2,
thanks and sorry for the slow response.

-- 
Bye, Peter Korsgaard
