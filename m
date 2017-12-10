From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Dec 2017 21:01:51 +0100
Subject: [Buildroot] [PATCH] libressl: enable for noMMU
In-Reply-To: <20171210181606.GA27756@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Sun, 10 Dec 2017 19:16:06 +0100")
References: <20171210181606.GA27756@waldemar-brodkorb.de>
Message-ID: <87zi6qwdw0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > We need to use pthread_atfork for Linuxthreads.
 > Add a check if fork() is available, otherwise use vfork().

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 >  package/libressl/0003-uclibc-linuxthreads.patch | 12 ++++++
 >  package/libressl/0004-uclibc-fork.patch         | 52 +++++++++++++++++++++++++
 >  package/openssl/Config.in                       |  2 -
 >  3 files changed, 64 insertions(+), 2 deletions(-)
 >  create mode 100644 package/libressl/0003-uclibc-linuxthreads.patch
 >  create mode 100644 package/libressl/0004-uclibc-fork.patch

The patches are missing descriptions and signed-off-by.

Have these patches been sent upstream? Were they accepted? While
minimal, these are really feature patches and in a security critical
package.

-- 
Bye, Peter Korsgaard
