From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 17 Sep 2012 22:41:08 +0200
Subject: [Buildroot] [PATCH v2 2/2] Add FAQ entry how to properly add
 package from github.
In-Reply-To: <CAHXCMML5X18Hs_zjGsOKAdYARnt8RFNiC7OBLuKkVM2HGtrHHw@mail.gmail.com>
References: <1347746247-12033-2-git-send-email-marek.belisko@open-nandra.com>
 <1347912277-3982-1-git-send-email-marek.belisko@open-nandra.com>
 <CAHXCMML5X18Hs_zjGsOKAdYARnt8RFNiC7OBLuKkVM2HGtrHHw@mail.gmail.com>
Message-ID: <CAAfyv36=M4=+8ztK3zd1dLCN=ApyT8ZOXBgvWLwJFDxzNsd_RQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Mon, Sep 17, 2012 at 10:28 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> Hi Marek,
>
> 2012/9/17 Marek Belisko <marek.belisko@open-nandra.com>:
>> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
>> ---
>>  docs/manual/faq.txt |   20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/docs/manual/faq.txt b/docs/manual/faq.txt
>> index 575d019..f04a93e 100644
>> --- a/docs/manual/faq.txt
>> +++ b/docs/manual/faq.txt
>> @@ -36,3 +36,23 @@ then probably you are running a Fedora (or similar) distribution, and
>>  you should install the +glibc-static+ package. This is because the
>>  +module-init-tools+ build process wants to link statically against the
>>  C library.
>> +
>> +How to add package from github
>> +------------------------------
>> +
>> +If package don't have version number and want to use SHA1
>> +(it's enough to use first 7 characters from SHA1):
>
> IANA native English speaker, but I'd have rephrased this with
> something like that:
Same here ;) . Your sentence is much better then mine. Will send updated patch.
Thanks.
>
> If the package has no release version, or its version cannot be
> identified using tag, then the sha1 of the particular commit should be
> used to identify the version (the first 7 characters of the sha1 are
> enough):
>
>> +
>> +------------------------
>> +FOO_VERSION = 1234567
>> +FOO_SOURCE = <user>-<package>-$(FOO_VERSION).tar.gz
>> +FOO_SITE = http://github.com/<user>/<package>/tarball/<branch>
>> +------------------------
>> +
>> +If package have version number use:
>
> Same here:
>
> If the package version matches a tag, then this tag should be used to
> identify the version:
>
>> +
>> +------------------------
>> +FOO_VERSION = v1.0
>> +FOO_SOURCE = <user>-<package>-$(FOO_VERSION).tar.gz
>> +FOO_SITE = http://github.com/<user>/<package>/tarball/$(FOO_VERSION)
>> +------------------------
>
>
> Regards,
>
> --
> Sam

Cheers,

mbe

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
