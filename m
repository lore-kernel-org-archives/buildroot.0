From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 9 Feb 2016 22:47:40 +0100
Subject: [Buildroot] [PATCH 1/1] skeleton: Rename /etc/profile.d/umask
 to umask.sh
In-Reply-To: <1454946165-8192-1-git-send-email-nicolas.cavallari@green-communications.fr>
References: <1454946165-8192-1-git-send-email-nicolas.cavallari@green-communications.fr>
Message-ID: <56BA5E7C.604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08-02-16 16:42, Nicolas Cavallari wrote:
> /etc/profile only sources files that matches the /etc/profile.d/*.sh
> pattern, so /etc/profile.d/umask was never sourced.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

 Given that I don't like the alternative you posted:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 However, I think it would be even better to throw away umask.sh completely and
embed it in /etc/profile. There is really no reason to make this a separate file.

 Regards,
 Arnout

> ---
>  system/skeleton/etc/profile.d/{umask => umask.sh} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename system/skeleton/etc/profile.d/{umask => umask.sh} (100%)
> 
> diff --git a/system/skeleton/etc/profile.d/umask b/system/skeleton/etc/profile.d/umask.sh
> similarity index 100%
> rename from system/skeleton/etc/profile.d/umask
> rename to system/skeleton/etc/profile.d/umask.sh
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
