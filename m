From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 22:57:49 +0200
Subject: [Buildroot] [PATCH] package/xterm: Avoid freetype2 path
 poisoning using imake
In-Reply-To: <20180327074434.15306-1-valentin.korenblit@smile.fr>
References: <20180327074434.15306-1-valentin.korenblit@smile.fr>
Message-ID: <20180331225749.6217ae62@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Mar 2018 09:44:34 +0200, Valentin Korenblit wrote:
> When imake is installed on the host, it tries to include
> freetype headers from host, so we must override ac_cv_path_IMAKE
> to avoid this.
> 
> Extract from config.log:
> 
> configure:14803: checking if we should use imake to help
> configure:14820: result: yes
> configure:14829: checking for xmkmf
> configure:14846: found /usr/bin/xmkmf
> configure:14857: result: /usr/bin/xmkmf
> configure:14920: testing Using /usr/bin/xmkmf  ...
> configure:15015: testing IMAKE_CFLAGS  -I. -I/usr/include/freetype2
> 
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
> ---
>  package/xterm/xterm.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master after adjusting to ac_cv_path_IMAKE="" as suggested
by Romain.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
