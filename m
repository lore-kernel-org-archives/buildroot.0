From: Rico Bachmann <bachmann@tofwerk.com>
Date: Wed, 25 Apr 2012 09:40:09 +0200
Subject: [Buildroot] [PATCH v3] Add new package apr-util
References: <1335268524-31735-1-git-send-email-bachmann@tofwerk.com>
 <20120424140548.5cf4c706@skate>
Message-ID: <op.wda8w7l1705kjs@rico>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

Am 24.04.2012, 14:05 Uhr, schrieb Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:

> Hello Rico,
>
> Le Tue, 24 Apr 2012 13:55:24 +0200,
> Rico Bachmann <bachmann@tofwerk.com> a ?crit :
>
>> Signed-off-by: Rico Bachmann <bachmann@tofwerk.com>
>> ---
>> v1: Add package apr-util
>>     Add patch to remove check for apr
>>     because check for apr search for ./apr and not for defined folder
>> v2: Change spaces to tab in *.mk
>> v3: Add Signed-off-by and comments to package-patch
>> ---
>> ---
>
> Those two lines with '---' are useless.
>
>> diff --git a/package/apr-util/apr-util-1.4.1-remove-checkapr.patch  
>> b/package/apr-util/apr-util-1.4.1-remove-checkapr.patch
>> new file mode 100644
>> index 0000000..128a1b0
>> --- /dev/null
>> +++ b/package/apr-util/apr-util-1.4.1-remove-checkapr.patch
>> @@ -0,0 +1,17 @@
>> +Signed-off-by: Rico Bachmann <bachmann@tofwerk.com>
>> +---
>> +disable the check for APU_FIND_APR because the check only looks into  
>> folders
>> +named apr, and our source-tree is called apr-versionnumber (e.g.  
>> apr-1.4.6)
>> +---
>
> The description should be *before* the Signed-off-by, and not separated
> by ---.
>
> It seems like you misunderstand what the format of a patch should be.
> Here is an explanation that I hope will clarify things:

I'm really not that into patches... no diffrence if it is the patch
format or patches at all... At the moment, I'm learning by doing...

Thanks for your explanation.

>
> ------------------------8<-------------------
> This is the title, should be less than ~80 chars
>
> This is a long description that explains what the patch is doing, why,
> how, and all other details that are useful. This description (and the
> title above, and the above Signed-off-by line) will be part of the
> commit log and remain in the Git history. Therefore, it should *not*
> contain any changelog information about the patch, or other "personal"
> messages. The title and the description must be separated by one empty
> line.
>
> Signed-off-by: Foo Bar <foo@bar.com>
> ---
> This is some text that will *not* be included in the Git history, so it
> is typically used for the changelog.
>
>  package/Config.in                                  |    1 +
>  package/apr-util/Config.in                         |    7 +++++++
>  .../apr-util/apr-util-1.4.1-remove-checkapr.patch  |   17  
> +++++++++++++++++
>  package/apr-util/apr-util.mk                       |   14 ++++++++++++++
>  4 files changed, 39 insertions(+), 0 deletions(-)
>  create mode 100644 package/apr-util/Config.in
>  create mode 100644 package/apr-util/apr-util-1.4.1-remove-checkapr.patch
>  create mode 100644 package/apr-util/apr-util.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 5ae1c81..805f56a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -375,6 +375,7 @@ endmenu
> menu "Other"
>  source "package/apr/Config.in"
> +source "package/apr-util/Config.in"
>  source "package/fftw/Config.in"
>  source "package/libargtable2/Config.in"
>  source "package/argp-standalone/Config.in"
> ------------------------8<-------------------
>
> Regards,
>
> Thomas

I'll try to send a proper formated patch today. As soon as I find time.

And I do my best to get my next patch in the right format from beginning!

so long
Rico

-- 
Erstellt mit Operas revolution?rem E-Mail-Modul: http://www.opera.com/mail/
