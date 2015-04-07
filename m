From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 21:34:51 +0200
Subject: [Buildroot] [PATCH v2] Makefile: remove extra ifdef/endif of
 top Makefile
In-Reply-To: <1428383349-20804-1-git-send-email-yamada.masahiro@socionext.com>
References: <1428383349-20804-1-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <20150407213451.2da186b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Masahiro Yamada,

On Tue,  7 Apr 2015 14:09:09 +0900, Masahiro Yamada wrote:
> The GNU make's origin function know undefined variable well,
> so the outer ifdef/endif conditional checking is unneeded.
> 
> From `info make` documentation, origin will return
> 
>   `undefined'
>      if VARIABLE was never defined.
>   `command line'
>      if VARIABLE was defined on the command line.
>    ...
> 
> Therefore, $(origin V) will get a value anyway, killing ifdef/endif
> is viable and safe.
> 
> Furthermore, I've checked the minimal requirements from the top
> Makefile is GNU make 3.81, and that version of GNU make has support
> of origin function well already, so now it's safe to kill the outer
> conditional checking, without upgrading the minimal requirements.
> 
> Signed-off-by: Cheng Renquan <crq@kernel.org>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> [ Commit description is borrowed from Linux Kernel
>   (commit b8b0618cf6fa) and adjusted for Buildroot ]
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
