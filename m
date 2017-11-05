From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Nov 2017 20:22:58 +0100
Subject: [Buildroot] [PATCH 1/2] package/freerdp: optional systemd's
 journald support
In-Reply-To: <71f6fa9a2fb7b720f16c296a0f68096b2d87f4a6.1509907598.git.yann.morin.1998@free.fr>
References: <cover.1509907598.git.yann.morin.1998@free.fr>
 <71f6fa9a2fb7b720f16c296a0f68096b2d87f4a6.1509907598.git.yann.morin.1998@free.fr>
Message-ID: <42fde6ff-e432-184c-a25f-38440eeea207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-11-17 19:46, Yann E. MORIN wrote:
> FreeRDP now has support for writing to the journal, so we must ensure
> proper dependency and correct options.
> 
> Partially fixes:
>     http://autobuild.buildroot.org/results/81aa66ddd88919295ccb5f34b527b737627263a7/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/freerdp/freerdp.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
> index 382cd39647..d6320de4c2 100644
> --- a/package/freerdp/freerdp.mk
> +++ b/package/freerdp/freerdp.mk
> @@ -56,6 +56,14 @@ else
>  FREERDP_CONF_OPTS += -DWITH_PULSEAUDIO=OFF
>  endif
>  
> +# For the systemd journal
> +ifeq ($(BR2_PACAKGE_SYSTEMD),y)

 PACAKGE?

 Regards,
 Arnout

> +FREERDP_CONF_OPTS += -DWITH_LIBSYSTEMD=ON
> +FREERDP_DEPENDENCIES += systemd
> +else
> +FREERDP_CONF_OPTS += -DWITH_LIBSYSTEMD=OFF
> +endif
> +
>  ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
>  FREERDP_CONF_OPTS += -DWITH_NEON=ON
>  else
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
