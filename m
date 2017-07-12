From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Jul 2017 09:23:47 +0200
Subject: [Buildroot] [PATCH] package/qt5: bump latest version to 5.9.1
In-Reply-To: <BN6PR03MB29146452670D6E67E98CBF46BFAF0@BN6PR03MB2914.namprd03.prod.outlook.com>
References: <1499796056-841-1-git-send-email-joshua.henderson@microchip.com>
 <7248234a-60d3-3bf5-0954-ff0442609136@mind.be>
 <BN6PR03MB29146452670D6E67E98CBF46BFAF0@BN6PR03MB2914.namprd03.prod.outlook.com>
Message-ID: <d801601f-d2cb-9ccd-56cf-4f51e575cacf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-07-17 03:41, Brent Sink wrote:
> All,
> 
> I did some testing on an i.MX6, and found that I need to export 
> QT_QPA_EGLFS_INTEGRATION=eglfs_viv, before running a Qt app. There is a 
> bug report for this here: https://bugreports.qt.io/browse/QTBUG-61156
> 
> 
> On 7/11/2017 8:45 PM, Arnout Vandecappelle wrote:
>>   Hi Joshua,
>>
>>   Quick review before you resubmit.
>>
>>   When you resubmit, make sure you send it together with the qt5wayland change as
>> one series, since that patch depends on this one.
> 
> Should this this be a part of this patch, or is it only specific for 
> imx?  They are saying that "the buildroot configuration is broken. As a 
> workaround, try exporting the environment variable 
> QT_QPA_EGLFS_INTEGRATION=eglfs_viv before running Qt apps. This should 
> not be necessary normally since the build environment is expected to set 
> the correct eglfs backend on a per target device basis. Qt's own device 
> specs do this, but for other build systems (Yocto, Buildroot) it's up to 
> those recipes to manage this."
> 
> Can anyone point me to where this environment variable should be added? 

 No, you shouldn't add the environment variable, you should change
BR2_PACKAGE_QT5BASE_DEFAULT_QPA. Which is part of the defconfig, not part of the
build system itself. It might be possible to set the default QPA based on other
packages selected, but it's a bit complicated so nobody has implemented that.

 At least, I think that is it. It's also possible that the
QT5BASE_CONFIGURE_OPTS or qmake.conf or qplatformdefs.h or
QT5BASE_ARCH_CONFIG_FILE has to be adapted.

> If this should be part of this patch, I'll create the patch and then 
> Josh can submit the final version.  Otherwise, I'll just submit a new patch.

 It should be a separate patch for sure, and it can be sent as part of the qt5
bump series or separately - since they don't conflict, either is possible.

 Regards,
 Arnout

> 
> Thanks!
> 
> -brent
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
