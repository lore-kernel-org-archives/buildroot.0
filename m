From: Julien CORJON <corjon.j@ecagroup.com>
Date: Thu, 22 Oct 2015 15:19:08 +0000
Subject: [Buildroot] [PATCH 1/2] qt5base: add optional gstreamer1 support
In-Reply-To: <877fmgigrr.fsf@dell.be.48ers.dk>
References: <1445414790-16583-1-git-send-email-peter@korsgaard.com>
 <20151021134228.64da3709@free-electrons.com>
 <877fmgigrr.fsf@dell.be.48ers.dk>
Message-ID: <0874644c-9a80-4da8-af8d-ea8cad036c35@MAIL-SINTERS-01.sinters-int.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

Le 21/10/2015 13:48, Peter Korsgaard a ?crit :
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
>   > Peter,
>   > On Wed, 21 Oct 2015 10:06:29 +0200, Peter Korsgaard wrote:
>   >> Indirectly fixes:
>   >> http://autobuild.buildroot.net/results/773/773d9996bd3da283eed6b75083b8bab6469d0423/
>   >> http://autobuild.buildroot.net/results/069/069f564fde821b55e710fbe93fe30a5cf11a6da5/
>   >> http://autobuild.buildroot.net/results/456/456d380f8b4478245e89f711c33fe0c2d23aaa3a/
>   >> http://autobuild.buildroot.net/results/7c8/7c8ebfc93a5b11e40251495715d742520b3b8291/
>   >>
>   >> And many more, as qt5multimedia needs qt5base to be built with gstreamer1
>   >> support as well.
>   >>
>   >> While qt5 has some gstreamer 0.10 support, it doesn't seem to be used much
>   >> any more and E.G. the 0.10 fallback code in qt5multimedia is broken so only
>   >> enable it for the 1.x series.
>   >>
>   >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>
>   > Please also look at http://patchwork.ozlabs.org/patch/504627/ and
>   > http://patchwork.ozlabs.org/patch/504628/ which have some overlap.
>
> The equivalent of 504628 is already in the tree since:
>
> commit a0f3a2b88d27df6f3e8e3d45bd8a0506a3d09455
> Author: Beno?t Th?baudeau <benoit@wsystem.com>
> Date:   Thu Aug 27 18:34:14 2015 +0200
>
> So I've marked is as superseeded.
>
> And 504627 looks pretty much like my patch except that it adds gstreamer
> 0.10 support which I think we shouldn't do (as qt5multimedia doesn't
> build with it).

Qt-5.5.0 announce support[1] for both gstreamer-0.10 & gstreamer-1.0. 
Also note that gstreamer-0.10 is still the Qt default version in case 
both are present.

>
> Once my patch is a applied I'll mark 504627 as superseeded. I wasn't
> able to reproduce the pkg-config issue you mentioned.

You probably missed that qt5base use host pkg-config to detect gstreamer 
version. As autobuild chroot environment have neither of them they both 
fail at qt5multimedia install time.

I already report a bug[2] but I was not able to fix it (running out of 
time). Will Wagner proposed a solution[3] to that issue but he did not 
spin it into Buildroot and Qt patches yet.

[1] https://wiki.qt.io/New_Features_in_Qt_5.5
[2] https://bugreports.qt.io/browse/QTBUG-48046
[3] https://patchwork.ozlabs.org/patch/504627/

Regards,

Julien Corjon
