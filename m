From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 19 Mar 2012 22:23:44 +0100
Subject: [Buildroot] [PATCH] Config.in.arch: add help and less cryptic
	names to architecture menu
In-Reply-To: <1332112382-30786-1-git-send-email-alvaro.gamez@hazent.com>
References: <1332112382-30786-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <201203192223.45202.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 19 March 2012 00:13:01 Alvaro G. M wrote:
> From: "Alvaro G. M" <alvaro.gamez@hazent.com>
> 
> 
> Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>

 Except for the small issues mentioned below:
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
> This is my penitence for the extra quote on Microblaze. 

 Good work!  Feel free to add extra quotes all over the place if this
is your penitence :-)

> I am not quite
> sure the help texts are good enough, but couldn't think of anything better.

 Good enough for me, for sure.  The links to wikipedia are really a 
good idea.

> ---
>  target/Config.in.arch |   95 ++++++++++++++++++++++++++++++++++++++++++------
>  1 files changed, 83 insertions(+), 12 deletions(-)
> 
> diff --git a/target/Config.in.arch b/target/Config.in.arch
> index 17e0236..860a85a 100644
> --- a/target/Config.in.arch
> +++ b/target/Config.in.arch
> @@ -8,40 +8,111 @@ choice
>           Select the target architecture family to build for.
>  
>  config BR2_arm
> -       bool "arm"
> +       bool "ARM (little endian)"
> +       help
> +         ARM is a 32-bit reduced instruction set computer (RISC) instruction
> +          set architecture (ISA) developed by ARM Holdings. Little endian.

 Whitespace error: spaces instead of tab.

> +         http://www.arm.com/
> +         http://en.wikipedia.org/wiki/ARM
>  config BR2_armeb

 There should be an empty line between the help text and the next 
config, otherwise it doesn't look good in xconfig.

> -       bool "armeb"
> +       bool "ARM (big endian)"
> +       help
> +         ARM is a 32-bit reduced instruction set computer (RISC) instruction
> +          set architecture (ISA) developed by ARM Holdings. Big endian.

 Whitespace error: spaces instead of tab.

> +         http://www.arm.com/
> +         http://en.wikipedia.org/wiki/ARM

[snip]

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120319/874f79b7/attachment-0001.html>
