From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Aug 2019 00:19:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/libssh2: security bump to
 version 1.9.0
In-Reply-To: <20190817193050.28205-1-fontaine.fabrice@gmail.com>
References: <20190817193050.28205-1-fontaine.fabrice@gmail.com>
Message-ID: <20190818001906.06416ab3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 17 Aug 2019 21:30:50 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2019-13115: In libssh2 before 1.9.0,
> kex_method_diffie_hellman_group_exchange_sha256_key_exchange in kex.c
> has an integer overflow that could lead to an out-of-bounds read in the
> way packets are read from the server. A remote attacker who compromises
> a SSH server may be able to disclose sensitive information or cause a
> denial of service condition on the client system when a user connects to
> the server. This is related to an _libssh2_check_length mistake, and is
> different from the various issues fixed in 1.8.1, such as CVE-2019-3855.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libssh2/libssh2.hash | 2 +-
>  package/libssh2/libssh2.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
