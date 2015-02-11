From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Feb 2015 18:52:34 +0100
Subject: [Buildroot] [PATCH 08/10 v7] package/nvidia-tegra23-binaries:
	new package
In-Reply-To: <20150211144230.4a750cde@nserafini-N550JK>
References: <cover.1423597914.git.yann.morin.1998@free.fr>
 <af61ad6f5736862b334002ce47727c9ce3bb2ab3.1423597914.git.yann.morin.1998@free.fr>
 <20150211144230.4a750cde@nserafini-N550JK>
Message-ID: <20150211175234.GA4003@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicolas, All,

On 2015-02-11 14:42 +0100, Nicolas Serafini spake thusly:
> Thanks for this new version of the patch. I was in holliday the two
> previous week, so sorry I have not responded for the previous version
> of the patch.

No problem! hope you enjoyed it! ;-)

> I have done some tests and there is only one small bug into the
> .mk file. The correction is below into the patch.
[--SNIP--]
> > +ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_TEGRA2),y)
> must be replaced by
> ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_TEGRA2),y)

Dang... Nice catch!

> > +NVIDIA_TEGRA23_BINARIES_FIRMWARE = \
> > +	nvrm_avp.bin nvavp_vid_ucode_alt.bin nvavp_os_0ff00000.bin \
> > +	nvavp_os_eff00000.bin
> > +endif
> > +ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_TEGRA3),y)
> must be replaced by
> ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_TEGRA3),y)

Ditto.

Thanks for the review!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
