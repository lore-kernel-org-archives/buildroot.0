From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Sep 2011 21:37:11 +0200
Subject: [Buildroot] [PATCH 8/8] Add support for the RTAI real-time
	extension
In-Reply-To: <87zki1606a.fsf@macbook.be.48ers.dk>
References: <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
 <7866cdfadfff98de581f66937b224319f83bc681.1316290714.git.thomas.petazzoni@free-electrons.com>
 <87zki1606a.fsf@macbook.be.48ers.dk>
Message-ID: <201109222137.11568.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Sunday 18 September 2011 22:54:53, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 
writes:
>  Thomas> Signed-off-by: Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> Thomas> ---
>  Thomas>  linux/Config.ext.in     |   13 +++++++++++++
>  Thomas>  linux/linux-ext-rtai.mk |   47
> +++++++++++++++++++++++++++++++++++++++++++++++ Thomas>  package/Config.in
>       |    1 +
>  Thomas>  package/rtai/Config.in  |    2 ++
>  Thomas>  package/rtai/rtai.mk    |   16 ++++++++++++++++
>  Thomas>  5 files changed, 79 insertions(+), 0 deletions(-)
>  Thomas>  create mode 100644 linux/linux-ext-rtai.mk
>  Thomas>  create mode 100644 package/rtai/Config.in
>  Thomas>  create mode 100644 package/rtai/rtai.mk
> 
>  Thomas> +++ b/package/rtai/Config.in
>  Thomas> @@ -0,0 +1,2 @@
>  Thomas> +config BR2_PACKAGE_RTAI
>  Thomas> +        bool "rtai"
> 
> Wrong indentation, no help text and should depend on
> BR2_LINUX_KERNEL_EXT_RTAI.
> 
> I've fixed that and committed, thanks.

 Since the option is not user selectable (due to select BR2_PACKAGE_RTAI in 
the BR2_LINUX_KERNEL_EXT_RTAI), it doesn't make sense to have a user visible 
config option here.  I guess Thomas's mistake was not to skip the help text, 
but to add "rtai" after the bool...

 Patch follows.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
