From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 01 Nov 2012 14:48:01 +0100
Subject: [Buildroot] [PATCH 09/10] glib-networking: remove redundant
 dependency on gettext
In-Reply-To: <201210142321.11131.yann.morin.1998@free.fr>
References: <20121014210734.17845.64519.stgit@localhost>
 <20121014211110.17845.3033.stgit@localhost>
 <201210142321.11131.yann.morin.1998@free.fr>
Message-ID: <50927D91.6060804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/14/12 23:21, Yann E. MORIN wrote:
> Arnout, All,
>
> On Sunday 14 October 2012 Arnout Vandecappelle (Essensium/Mind) wrote:
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
>> ---
>>   package/glib-networking/Config.in |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
>> index dab35ea..f1aa7ee 100644
>> --- a/package/glib-networking/Config.in
>> +++ b/package/glib-networking/Config.in
>> @@ -2,7 +2,7 @@ config BR2_PACKAGE_GLIB_NETWORKING
>>   	bool "glib-networking"
>>   	depends on BR2_USE_WCHAR # glib2
>>   	select BR2_PACKAGE_LIBGLIB2
>> -	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
>> +	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
>>   	help
>>   	  Network-related GIO modules for glib.
>
> The commit message says "remove redundant dependency on gettext", but this
> change changes the dependency on plain gettext to gettext-if-locales.
>
> Thus, I think the subject is wrong, and should be changed to something like:
>      glib-networking: only depends on gettext if locales are used

  Actually, on second revision: glib-networking uses gettext directly so we should
therefore select it here as well.  It worked fine in testing because libglib2
anyway depends on locale.

  Therefore, I'll replace this with unconditionally depending on gettext in
the .mk file.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
