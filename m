From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 23:25:49 +0100
Subject: [Buildroot] [PATCH v3 1/1] erlang: remove non-SMP build option
In-Reply-To: <1513780359-3685-1-git-send-email-fhunleth@troodon-software.com>
References: <1513780359-3685-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20171228232549.3d08820b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Dec 2017 09:32:39 -0500, Frank Hunleth wrote:
> The non-SMP scheduler was deprecated with the Erlang/OTP 20.0 release and
> slated for removal with the next major Erlang release. Since the non-SMP
> scheduler isn't even built anymore, this option no longer has the
> intended effect of saving space or compile time. The SMP scheduler
> supports both SMP and non-SMP processors, so removing the option will
> not break any platforms.
> 
> We do not need to add a legacy entry, because the new behavior is the
> same as with the option previously set (i.e. SMP enabled).
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
> Changes v2 -> v3:
>   - Removed text from Config.in.legacy and added info as to why it wasn't
>     needed (thanks to Yann)
> Changes v1 -> v2:
>   - Added text to Config.in.legacy to explain the removal of the option

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
