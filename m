From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 23 Dec 2015 15:21:02 +0100
Subject: [Buildroot] [PATCH v3 4/5] qt5webengine: new package
In-Reply-To: <567A7450.70404@ecagroup.com>
References: <1436380555-13657-3-git-send-email-corjon.j@ecagroup.com>
 <1436538022-18924-1-git-send-email-corjon.j@ecagroup.com>
 <1436538022-18924-4-git-send-email-corjon.j@ecagroup.com>
 <20150719150236.422b5b79@free-electrons.com>
 <55ACBCAF.6050404@ecagroup.com>
 <20150720112515.0b05d1ef@free-electrons.com>
 <20151223094050.GA14019@t450s.lan>
 <20151223104913.39d70293@free-electrons.com>
 <567A7450.70404@ecagroup.com>
Message-ID: <CAAMH-yuNSevj_UQPxjxeGZDMmxmVF2O9_B=D6y0ZKwHJc2N2nA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, Thomas, All,

Thanks for the quick replies.

On Wed, Dec 23, 2015 at 11:15 AM, Julien CORJON <corjon.j@ecagroup.com> wrote:
> Gary,
>
> Le 23/12/2015 10:49, Thomas Petazzoni a ?crit :
>> Gary,
>>
>> On Wed, 23 Dec 2015 10:40:50 +0100, Gary Bisson wrote:
>>
>>> Any update on this package? I'm asking since webkit is declared as
>>> deprecated/legacy without an alternative. Let me know if I can be of any
>>> help.
>
> I did not work on this qt module since my previous post. And QtWebkit
> will be removed in Qt 5.6.0 released package (but sources will be still
> available [1])
>
>>
>> Right now, there is no longer any qt5webengine patch pending in
>> patchwork, so we're waiting for someone to resend an updated version of
>> the patch.
>>
>> If you have some time, and Julien Corjon agrees, maybe you can adopt
>> his patch?
>
> Sure, you can adopt my patch and make every modifications needed to make
> it work :-)

Ok I'll look at it when I have time. I definitely would like to see
the package for next release. Not sure I'll be able to submit anything
before next year though.

Regarding the current patch, I'm not sure about the armhf patch, does
it default to armhf all the time (except when OS=android) even if the
toolchain doesn't support it?
Also dependencies need some work since this package implicitly depend
on OpenGL, so the select of BR2_PACKAGE_QT5DECLARATIVE_QUICK can fail
currently.

> With the release of Qt 5.6.0-beta I have start a branch to take a look
> on status of pending Qt patch and evaluate the integration effort of the
> 'new/not integrated yet' modules in Buildroot (canvas3D, location,
> QuickControl2, Wayland, WebEngine, WebView).

I don't feel brave enough to look at all those items, that's for sure.
I'll let you know once I've spent some time on webengine.

Regards,
Gary
