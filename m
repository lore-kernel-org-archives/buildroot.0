From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Wed, 23 Sep 2020 20:49:11 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5declarative: remove optional
 quick module option
In-Reply-To: <20200923203659.334cf251@windsurf>
References: <20200923182300.58950-1-b.bilas@grinn-global.com>
 <20200923203659.334cf251@windsurf>
Message-ID: <9d4124a8-28de-386a-2a51-c883f5842465@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 23.09.2020 20:36, Thomas Petazzoni wrote:
> On Wed, 23 Sep 2020 20:23:00 +0200
> Bartosz Bilas <b.bilas@grinn-global.com> wrote:
>
>> Since commit [1] we are not able to disable/enable this module
>> so let's force to set Qt5 OpenGL support by default
>> if it's possible because currently quick's components
>> are being built anyway.
>>
>> This should fix the build errors with qt5location package
>> which includes couple of built-in components that require
>> OpenGL support [2] when Qt Quick module is detected.
>>
>> http://autobuild.buildroot.net/results/ddd/ddda7cdb9400f6ca7d548e9b5ada18674fbe42e0/
>> http://autobuild.buildroot.net/results/ddb/ddb25ebb591ed6029a7bd4934464171358553936/
>>
>> [1] https://git.buildroot.net/buildroot/commit/package/qt5/qt5declarative/qt5declarative.mk?id=1bdceb5d735aad5fbf32b35e3a7f573ecb727e20
>> [2] https://code.woboq.org/qt5/qtdeclarative/src/quick/scenegraph/coreapi/qsgmaterialshader.h.html#105
>>
>> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> I am still confused: why should we force something in qt5declarative,
> to fix a build issue in qt5location ?

I've been thinking about which way is the right way to fix that. I 
thought to use

select BR2_PACKAGE_QT5BASE_OPENGL if BR2_PACKAGE_QT5DECLARATIVE

within qt5location package but it also isn't perfect because OpenGL 
isn't mandatory even when qt5declarative is enabled...

> Isn't it a bug in qt5location to use the ->program() method when OpenGL
> is disabled, while this method is only available when OpenGL support is
> enabled ?
It seems to be a bug actually in qt5location but I think we should have 
some workaround to fix build errors temporarily until Qt doesn't fix 
that properly.
> Thomas 


Best
Bartek
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200923/94113fe7/attachment.html>
