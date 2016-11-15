From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Nov 2016 13:03:28 +0100
Subject: [Buildroot] [PATCH v2] htop: enable unicode if possible
In-Reply-To: <20161114110448.9162-1-jezz@sysmic.org>
References: <20161114110448.9162-1-jezz@sysmic.org>
Message-ID: <20161115130328.42a20c5e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Nov 2016 12:04:48 +0100, J?r?me Pouiller wrote:

> +ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),)

You should have used positive logic instead:

ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
enable feature
else
disable feature
endif

> +HTOP_CONF_OPTS = --disable-unicode

You should use += here instead of =, since we are in a condition. This
helps avoiding stupid bugs in the future, if additional CONF_OPTS
assignments are added earlier in the file.

Applied to next with those two issues fixed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
