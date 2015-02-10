From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 09 Feb 2015 21:07:48 -0300
Subject: [Buildroot] [PATCH 1/3] glibc: add version 2.21
In-Reply-To: <1423408027-49694-2-git-send-email-Vincent.Riera@imgtec.com>
References: <1423408027-49694-1-git-send-email-Vincent.Riera@imgtec.com>
 <1423408027-49694-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <54D94BD4.50108@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/08/2015 12:07 PM, Vicente Olivert Riera wrote:
> - Add version 2.21
> - Add a hash value for it
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/glibc/Config.in  |    3 +++
>  package/glibc/glibc.hash |    1 +
>  2 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index 8c033f2..37e108e 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -38,6 +38,9 @@ config BR2_GLIBC_VERSION_2_19
>  config BR2_GLIBC_VERSION_2_20
>  	bool "2.20"
>  
> +config BR2_GLIBC_VERSION_2_21
> +	bool "2.21"
> +
>  endchoice
>  
> 

IMHO, you are missing this:

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 37e108e..3fe0dd4 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -51,3 +51,4 @@ config BR2_GLIBC_VERSION_STRING
        default "2.19-svnr25243" if BR2_EGLIBC_VERSION_2_19
        default "2.19" if BR2_GLIBC_VERSION_2_19
        default "2.20" if BR2_GLIBC_VERSION_2_20
+       default "2.21" if BR2_GLIBC_VERSION_2_21

Otherwise, it fails to download glibc.
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
