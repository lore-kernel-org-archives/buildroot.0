From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 21:56:31 +0200
Subject: [Buildroot] [PATCH] host-mkpasswd: fix crash on Fedora 28 build
 host
In-Reply-To: <20180502090508.12893-1-chemobejk@gmail.com>
References: <20180502090508.12893-1-chemobejk@gmail.com>
Message-ID: <20180503215631.6f62e406@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 May 2018 12:05:08 +0300, Stefan Becker wrote:
> crypt() is an optional glibc feature. Some distros, like Fedora 28, are
> phasing it out to be replaced with libxcrypt [1]. Unfortunately this
> change is only ABI compatible, not source code compatible, i.e. the code
> will compile with warnings about undefined crypt(), but the resulting
> binary will crash.
> 
> Follow the guidance in the Fedora bug and include crypt.h when
> _XOPEN_CRYPT is not defined.
> 
> [1] https://bugzilla.redhat.com/show_bug.cgi?id=1566464
> 
> Signed-off-by: Stefan Becker <chemobejk@gmail.com>
> ---
>  package/mkpasswd/mkpasswd.c | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
