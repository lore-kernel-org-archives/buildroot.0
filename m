From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 30 Jan 2016 13:53:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/input-tools: fix broken
 download URL
In-Reply-To: <1454146185-29856-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454146185-29856-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56ACB23D.7080909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-01-16 10:29, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/3db/3dbd112b8fc82d3ce7508ec31f212969685e53a9/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/input-tools/input-tools.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
> index c70ef47..48c1e53 100644
> --- a/package/input-tools/input-tools.mk
> +++ b/package/input-tools/input-tools.mk
> @@ -7,7 +7,7 @@
>  INPUT_TOOLS_VERSION = 20051019
>  INPUT_TOOLS_SOURCE = joystick_$(INPUT_TOOLS_VERSION).orig.tar.gz
>  INPUT_TOOLS_PATCH = joystick_$(INPUT_TOOLS_VERSION)-5.diff.gz
> -INPUT_TOOLS_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/j/joystick
> +INPUT_TOOLS_SITE = http://archive.debian.org/debian/pool/main/j/joystick
>  INPUT_TOOLS_LICENSE = GPLv2+
>  INPUT_TOOLS_LICENSE_FILES = utils/Makefile
>  
> 

 This is not good - the reason why we use snapshot.debian.org to begin with is
to make sure that they always remain downloadable at the same version... I'm not
sure if archive gives us the same promise, I think on archive, old versions will
be removed if the file has expired in the older distro. And anyway, archive is
only available after so many years. Perhaps, though, since it already exists on
archive, it is OK.

 An alternative fix would be to change the 20141023T043132Z into 20101023T043132Z.

 I wonder if the 20141023T043132Z has ever worked to begin with - normally
snapshot should really never ever remove anything...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
