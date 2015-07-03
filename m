From: Julien CORJON <corjon.j@ecagroup.com>
Date: Fri, 3 Jul 2015 08:55:26 +0000
Subject: [Buildroot] [PATCH 3/3] qt5quick1, qt5script,
 qt5webkit: tag as deprecated
In-Reply-To: <20150703094304.663cee42@free-electrons.com>
References: <1435908049-11930-1-git-send-email-corjon.j@ecagroup.com>
 <4fef60e5-fbfb-4595-8c48-646c3d00a3d0@MAIL-SINTERS-01.sinters-int.fr>
 <20150703094304.663cee42@free-electrons.com>
Message-ID: <563d2a2d-458d-48eb-a9ce-93ff15f4b978@MAIL-SINTERS-01.sinters-int.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Thomas,

Le 03/07/2015 09:43, Thomas Petazzoni a ?crit :
> Julien,
>
> On Fri, 3 Jul 2015 07:20:54 +0000, Julien CORJON wrote:
>
>> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
...
>> +comment "Depracated Qt modules"
>
> Deprecated

Will be fix in a V2.

>
> but I don't think it's really worth to have them in a separate part of
> the menu, since all of them already have a "(deprecated)" indication in
> their prompt.

I'm ok with that

>
> However, I'm wondering if we should not simply make them depend on
> BR2_DEPRECATED_SINCE_2015_08. But that will make them disappear
> completely by default, unless the user enables BR2_DEPRECATED.
>
> Actually, our deprecation/removal process is a bit weird: deprecated
> should be a smoother thing than removal. But in practice, when we
> deprecate something by making it 'depends on
> BR2_DEPRECATED_SINCE_YYYY_MM', it gets automatically removed from your
> configuration without any notification (unless you enable manually
> BR2_DEPRECATED, of course). While if we remove it entirely, we add it
> to Config.in.legacy, and the users upgrading get a clear notification.
>
> So users are better notified of removals than deprecations.
>
> Arnout, what do you think about this?

For now Qt tag these 3 modules as deprecated but they did not reach the 
end of life.

In my opinion, users who start a new design should be informed that in 
the near future these modules will not be supported anymore when user 
who need to bump Qt for they existing design (as we do) should be able 
to do that without loosing they already existing configuration.

For these reasons I don't think we should use 
BR2_DEPRECATED_SINC_YYYY_MM neither add them to Config.in.legacy since 
this is not a Buildroot issue but a Qt one.

At the end, when Qt will stop provide these module, we should add them 
to Config.in.legacy.

>
> Thomas
>

-- 
Regards,

Julien Corjon
-------------- next part --------------
A non-text attachment was scrubbed...
Name: corjon_j.vcf
Type: text/x-vcard
Size: 428 bytes
Desc: corjon_j.vcf
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150703/c9010935/attachment.vcf>
