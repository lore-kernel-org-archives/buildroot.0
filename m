From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 8 Sep 2014 13:59:11 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140908142902.4adfd667@free-electrons.com>
References: <20140907063013.1CB98101499@stock.ovh.net>	<20140907100918.6b017a09@free-electrons.com>	<540D69A4.4080503@imgtec.com>	<20140908103445.6a8858b4@free-electrons.com>	<540D6ADB.30300@imgtec.com>	<20140908111733.1966e641@free-electrons.com>	<540D9F28.1010709@imgtec.com>
 <20140908142902.4adfd667@free-electrons.com>
Message-ID: <540DA81F.4080405@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/08/2014 01:29 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
>
> On Mon, 8 Sep 2014 13:20:56 +0100, Vicente Olivert Riera wrote:
>
>> One could think we should add that dependence to the
>> BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT symbols instead, but there are
>> packages depending on that symbol which compile fine on MIPS64 n32, for
>> instance grantlee.
>
> That doesn't make sense. More precisely, it's your commit
> a88dceb951de977ad2d896d697f87d98e9705280 that doesn't make sense.
> You're adding a "depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT" to
> grantlee because grantlee has "select BR2_PACKAGE_QT_SCRIPT".
>
> The reason why your commit doesn't make sense appears clearly now: the
> set of architectures that have support for QtScript and QtWebkit is not
> the same. So, if QtScript is restricted to certain architectures,
> please introduce a BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT separate from
> BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT, and use them appropriately.
>
> Thomas

Those were my first days with Buildroot. Less than two weeks I guess.

Well, I think we should remove the dependence on 
BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT in both grantlee and qt_script 
packages. I made a confusion because qt_webkit was failing due to it's 
JavaScriptCore part. That's not related to the Qt's script modue, so 
qt_script (and the packages depending on qt_script) shouldn't depend on 
BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT.

Does this make sense to you?

-- 
Vincent
