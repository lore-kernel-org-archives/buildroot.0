From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Nov 2012 15:41:08 +0100
Subject: [Buildroot] [PATCH 1/6] arch: improve definition of gcc mtune,
	mcpu, etc.
In-Reply-To: <8ef94365af539b190e9525a10c5b642dc7108cb9.1352987586.git.thomas.petazzoni@free-electrons.com>
References: <cover.1352987586.git.thomas.petazzoni@free-electrons.com>
 <8ef94365af539b190e9525a10c5b642dc7108cb9.1352987586.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201211151541.08400.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thursday 15 November 2012 14:53:48 Thomas Petazzoni wrote:
> As suggested by Yann E. Morin, there is a better way than our current
> big Config.in.common to define the gcc mtune, mcpu, march,
> etc. values. We can split the setting of those values in each
> architecture file, which makes a lot more sense.
> 
> Therefore, the Config.in file now creates empty kconfig variables
> BR2_ARCH, BR2_ENDIAN, BR2_GCC_TARGET_TUNE, BR2_GCC_TARGET_ARCH,
> BR2_GCC_TARGET_ABI and BR2_GCC_TARGET_CPU. The values of those
> variables are set by the individual Config.in.<arch> files. This is
> possible because such files are now only conditionally included
> depending on the top-level architecture that has been selected.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

You already had it, but here it is again:
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
