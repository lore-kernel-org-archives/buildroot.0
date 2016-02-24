From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Feb 2016 09:19:34 -0300
Subject: [Buildroot] [PATCH] qt: depends on BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <20160223233023.6b376939@free-electrons.com>
References: <1456246089-19346-1-git-send-email-gustavo@zacarias.com.ar>
 <20160223222219.24b95205@free-electrons.com>
 <56CCDAF1.9070209@zacarias.com.ar>
 <20160223233023.6b376939@free-electrons.com>
Message-ID: <56CD9FD6.7040409@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/02/16 19:30, Thomas Petazzoni wrote:

> Hello,
>
> On Tue, 23 Feb 2016 19:19:29 -0300, Gustavo Zacarias wrote:
>
>> It's possible, however how likely is it an arch that doesn't support
>> atomics (normally meaning very old) running a QT gui?
>
> The specific config I tested had the GUI support disabled, i.e just
> QtCore, not QtGui.
>
> Though I agree with you that generally speaking, usage on SPARC is
> unlikely. But by narrowing the dependency to just script and/or webkit,
> we have to propagate it to a lot less packages, which actually means
> that supporting this weird SPARC architecture creates less noise, which
> is what we want.
>
> Thomas

It seems it's both script & webkit that need atomics.
However i think the arch supports list is flawed as well, webkit hasn't 
worked for many of those architectures in the past - they build, yes, 
but they'll probably crash on startup.
But i'm not about to test all of them since that would require hardware, 
so i'm removing sparc as well since it's a cliche that can't be fixed.
Regards.
