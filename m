From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 5 Jul 2010 21:27:03 +0200
Subject: [Buildroot] [PATCH 02/10] ext-toolchain: Fix ARCH_SYSROOT
	detection
In-Reply-To: <38de16ad34f664850915235fa9b58659fe78a6e7.1278349072.git.thomas.petazzoni@free-electrons.com>
References: <cover.1278349072.git.thomas.petazzoni@free-electrons.com>
	<38de16ad34f664850915235fa9b58659fe78a6e7.1278349072.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201007052127.03882.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 05 July 2010 18:58:55 Thomas Petazzoni wrote:
> For the detection of the ARCH_SYSROOT_DIR (which contains the C
> library variant specific to the compiler flags), we used to pass only
> the -march argument instead of the full TARGET_CFLAGS. This was done
> because TARGET_CFLAGS contains --sysroot, and we don't want to tell
> here the compiler which sysroot to use, because we're specifically
> asking the compiler where the *normal* arch sysroot directory is.
> 
> Unfortunately, there are some multilib variants that aren't decided
> only based on -march, but also on -msoft-float or other compiler
> flags. Therefore, we take the opposite approach: pass the full
> TARGET_CFLAGS, from which we have stripped the --sysroot option.
> 
> For example, this allows a PowerPC CodeSourcery toolchain, on which
> we're using the soft-float multilib variant, to work properly as an
> external toolchain.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
