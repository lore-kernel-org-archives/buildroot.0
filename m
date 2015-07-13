From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Jul 2015 18:01:47 +0300
Subject: [Buildroot] [PATCH] package/dropbear: fix generatign keys on RO
 file systems
In-Reply-To: <1436798945-6869-1-git-send-email-yann.morin.1998@free.fr>
References: <1436798945-6869-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150713150147.GU2451@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mon, Jul 13, 2015 at 04:49:05PM +0200, Yann E. MORIN wrote:
> +	if ! [ -d /etc/dropbear ]; then
> +		if ! rm -f /etc/dropbear; then

'rm -f' always succeeds.

> +			mkdir -p /etc/dropbear
> +		else
> +			mkdir -p $(readlink -f /etc/dropbear)
> +		fi
> +	fi

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
