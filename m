From: Brent Sink <brents_3@hotmail.com>
Date: Wed, 12 Jul 2017 01:41:39 +0000
Subject: [Buildroot] [PATCH] package/qt5: bump latest version to 5.9.1
In-Reply-To: <7248234a-60d3-3bf5-0954-ff0442609136@mind.be>
References: <1499796056-841-1-git-send-email-joshua.henderson@microchip.com>
 <7248234a-60d3-3bf5-0954-ff0442609136@mind.be>
Message-ID: <BN6PR03MB29146452670D6E67E98CBF46BFAF0@BN6PR03MB2914.namprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

I did some testing on an i.MX6, and found that I need to export 
QT_QPA_EGLFS_INTEGRATION=eglfs_viv, before running a Qt app. There is a 
bug report for this here: https://bugreports.qt.io/browse/QTBUG-61156


On 7/11/2017 8:45 PM, Arnout Vandecappelle wrote:
>   Hi Joshua,
>
>   Quick review before you resubmit.
>
>   When you resubmit, make sure you send it together with the qt5wayland change as
> one series, since that patch depends on this one.

Should this this be a part of this patch, or is it only specific for 
imx?  They are saying that "the buildroot configuration is broken. As a 
workaround, try exporting the environment variable 
QT_QPA_EGLFS_INTEGRATION=eglfs_viv before running Qt apps. This should 
not be necessary normally since the build environment is expected to set 
the correct eglfs backend on a per target device basis. Qt's own device 
specs do this, but for other build systems (Yocto, Buildroot) it's up to 
those recipes to manage this."

Can anyone point me to where this environment variable should be added?  
If this should be part of this patch, I'll create the patch and then 
Josh can submit the final version.  Otherwise, I'll just submit a new patch.

Thanks!

-brent
