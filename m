From: =?UTF-8?Q?Stefan_Fr=c3=b6berg?= <stefan.froberg@petroprogram.com>
Date: Fri, 12 Jan 2018 16:00:27 +0200
Subject: [Buildroot] [PATCH 1/1] unbound: new package
In-Reply-To: <20180112120803.0ddb7b6d@windsurf.lan>
References: <20180111232039.24270-1-stefan.froberg@petroprogram.com>
 <jt1miexfp7.ln2@ID-313208.user.individual.net>
 <7b6d5bbd-86f5-6c81-e26e-db8b29ae2831@petroprogram.com>
 <20180112120803.0ddb7b6d@windsurf.lan>
Message-ID: <5990987d-da1e-ec22-738b-6747bd6819cb@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi


Thomas Petazzoni kirjoitti 12.01.2018 klo 13:08:
> Hello,
>
> On Fri, 12 Jan 2018 12:45:06 +0200, Stefan Fr?berg wrote:
>
>>> Why not "select BR2_PACKAGE_OPENSSL"?
>>> Did you test with libressl as well?
>>>  
>> That cannot be select because it's a choise and if I remember buildroot
>> manual and
>> what Thomas said, you can't (or actually shouldn't) select from choice
>> unless
>> absolutely necessary (like, for example, in my turbovnc patch...have to
>> remember update that too...)
> It is correct that regular virtual packages cannot be selected.
>
> But openssl (like jpeg) is special, and you can select
> BR2_PACKAGE_OPENSSL. BR2_PACKAGE_OPENSSL is not part of a choice.
>
> The case of turbovnc is different: you wanted to select jpeg-turbo
> specifically, which is one jpeg implementation. And this is not
> possible.
>
> See the difference ? BR2_PACKAGE_OPENSSL is the virtual package itself,
> which has two implementations: libopenssl and libressl, selectable
> through a choice.
>
> BR2_PACKAGE_JPEG_TURBO is one implementation of the BR2_PACKAGE_JPEG
> virtual package. Selecting BR2_PACKAGE_JPEG is OK (just like selecting
> BR2_PACKAGE_OPENSSL is OK), but selecting BR2_PACKAGE_JPEG_TURBO
> doesn't work.
>
>

Ah, okay.

But Thomas, I can't use BR2_PACKAGE_JPEG for turbovnc because it uses
specific ABI (the so called TurboJPEG ABI)
from libjpeg-turbo package and vanilla jpeg does not provide it.

https://libjpeg-turbo.org/About/TurboJPEG

At least, *if* I remember correctly, turbovnc nagged something about
missing function when I tried to compile against vanilla jpeg.

Regards
Stefan
