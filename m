From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 29 Dec 2016 21:37:33 +0100
Subject: [Buildroot] [PATCH] efl: remove 'upower' ecore module.
In-Reply-To: <76354a97-29d4-9e69-d36f-bc66e79d923c@gmail.com>
References: <20161229145650.4013-1-barbieri@profusion.mobi>
 <76354a97-29d4-9e69-d36f-bc66e79d923c@gmail.com>
Message-ID: <35b6111f-576b-45d1-766c-2b8082306c37@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 29/12/2016 ? 17:20, Romain Naour a ?crit :
> Hi Gustavo,
> 
> Le 29/12/2016 ? 15:56, Gustavo Sverzut Barbieri a ?crit :
>> Ecore will reach 'upower' using D-Bus in order to detect if the system
>> state changes. This is optional, but done by default and if D-Bus
>> itself fails, then an error message will be presented.
> 
> What's the error message ?
> I don't see any dbus message related to upower.

Which efl version did you use ?

Some warning related to upower has been removed in efl 1.18 [1].

[1]
https://git.enlightenment.org/core/efl.git/commit/?id=f54a2eb5703381f9e80604cdca84f91b72ae0090

> 
>>
>> Since we do not ship upower target package, just remove that from
>> target. Since it's useless for host, remove it as well.
> 
> The efl upower module is used by the enlightenment battery module.
> It's started here but I'm not sure it's really working (100% Battery).
> 
> Also, the efl package install several build tools and files on the target.
> It would be difficult to update all of these hooks between release.
> I recommend to use a post-build script in this case.
> 
> I admit, I didn't noticed this module until now :p
> 
> Maybe it easier to package upower and add it to efl dependencies ?

Can you try upower added with this patch ?

http://patchwork.ozlabs.org/patch/709564/

Best regards,
Romain

> 
> Best regards,
> Romain
> 
