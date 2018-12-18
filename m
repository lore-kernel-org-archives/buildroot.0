From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Tue, 18 Dec 2018 17:32:18 +0100
Subject: [Buildroot] [PATCH 2/2] package/busybox: add init script for
 sysctl
In-Reply-To: <20181218050235.27187-3-casantos@datacom.com.br>
References: <20181218050235.27187-1-casantos@datacom.com.br>
 <20181218050235.27187-3-casantos@datacom.com.br>
Message-ID: <0ba00958-416a-3bac-4815-05b1d67fd02e@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/12/2018 06:02, Carlos Santos wrote:
> +	find $SYSCTL_SOURCES -maxdepth 1 -name '*.conf' -print0 2> /dev/null | \
> +	xargs -0 -r readlink -f | \
> +	{
> +		read -r file
> +		[ -z "$file" ] || /sbin/sysctl -q -p "$file" $SYSCTL_ARGS || return 1
> +	}

So it will only read the first file it finds ?
