From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 17:06:00 +0200
Subject: [Buildroot] [PATCH] package/lz4: add option to install library
 only (without lz4 binary)
In-Reply-To: <20200523173425.15367-1-edo.rus@gmail.com>
References: <20200523173425.15367-1-edo.rus@gmail.com>
Message-ID: <20200727170600.055f2e5e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 23 May 2020 20:34:25 +0300
Ed Spiridonov <edo.rus@gmail.com> wrote:

> Often lz4 is used as a library, and not as a standalone program.
> Excluding lz4 binary will save some space in this case.
> 
> Signed-off-by: Ed Spiridonov <edo.rus@gmail.com>
> ---
>  package/Config.in     |  2 +-
>  package/lz4/Config.in |  9 +++++++++
>  package/lz4/lz4.mk    | 14 ++++++++++++++
>  3 files changed, 24 insertions(+), 1 deletion(-)

Thanks, I have applied to master, after doing a number of changes. See:

  https://git.buildroot.org/buildroot/commit/?id=2acb27e298c54935f890111fc5897a11350b913b

I have also complained to upstream lz4 about the fact that their
program is linked statically against their library, which doubles the
storage consumption:

  https://github.com/lz4/lz4/issues/888

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
