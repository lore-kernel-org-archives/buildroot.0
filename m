From: Floris Bos <bos@je-eigen-domein.nl>
Date: Thu, 9 Aug 2018 23:55:15 +0200
Subject: [Buildroot] [PATCH v2 1/1] qt5wayland: add fix from upstream to
 compile without QtQuick
In-Reply-To: <20180809234736.010b22fc@windsurf>
References: <1533515813-11533-1-git-send-email-bos@je-eigen-domein.nl>
 <20180809234736.010b22fc@windsurf>
Message-ID: <a069c583-65e5-c788-95d8-53bc3da07d6f@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 08/09/2018 11:47 PM, Thomas Petazzoni wrote:
> config BR2_PACKAGE_QT5WAYLAND
>>   	bool "qt5wayland"
>>   	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
> Is this OpenGL support dependency needed because of qt5wayland itself,
> or was it needed only because of the qt5declarative dependency ?
>
> BR2_PACKAGE_WAYLAND doesn't require OpenGL support, so I'm wondering if
> qt5wayland needs it or not. If it doesn't, could you send a follow-up
> patch fixing this ?

It currently does not compile without OpenGL.

But I was also wondering whether or not that was meant to be as well.
So had already opened an issue upstream: 
https://bugreports.qt.io/browse/QTBUG-69779

Would indeed be nice if it was possible to do without OpenGL, as then we 
could finally port some old Qt 4 QWS applications to Qt 5.


Thanks for the merge.


Yours sincerely,

Floris Bos
