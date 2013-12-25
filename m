From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 12:27:11 +0100
Subject: [Buildroot] [PATCH] Config.in files: use if/endif instead of
 'depends on' for main symbol
In-Reply-To: <cb372fafc2b420aeb2cc.1387575090@argentina>
References: <cb372fafc2b420aeb2cc.1387575090@argentina>
Message-ID: <20131225122711.10ac6304@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 20 Dec 2013 22:31:30 +0100, Thomas De Schampheleire wrote:
> In the Config.in file of package foo, it often happens that there are other
> symbols besides BR2_PACKAGE_FOO. Typically, these symbols only make sense
> when foo itself is enabled. There are two ways to express this: with
>     depends on BR2_PACKAGE_FOO
> in each extra symbol, or with
>     if BR2_PACKAGE_FOO
>         ...
>     endif
> around the entire set of extra symbols.
> 
> The if/endif approach avoids the repetition of 'depends on' statements on
> multiple symbols, so this is clearly preferred. But even when there is only
> one extra symbol, if/endif is a more logical choice:
> - it is future-proof for when extra symbols are added
> - it allows to have just one strategy instead of two (less confusion)
> 
> This patch modifies the Config.in files accordingly.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
