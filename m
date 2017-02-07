From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Tue, 7 Feb 2017 18:21:51 +0100
Subject: [Buildroot] [PATCH v6 0/9] bump/choice for qt 5.8.0
In-Reply-To: <20170207180857.160bfecf@free-electrons.com>
References: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <20170207180857.160bfecf@free-electrons.com>
Message-ID: <3616295d-e887-eb11-366b-a30b10f32bef@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,

On 02/07/2017 06:08 PM, Thomas Petazzoni wrote:
> Andreas, Zoltan, Peter,
>
> First of all, thanks a lot for all your work on Qt5. Qt is definitely a
> very important package in Buildroot, so it's great to have a group of
> contributors taking care of it.
>
> On Tue, 31 Jan 2017 08:59:02 +0100, Zoltan Gyarmati wrote:
>
>> Julien Corjon (3):
>>   qt5enginio : move into legacy compatibility
>>   qt53d/qt5quickcontrols2/qt5serialbus : move out of tech preview
> I've applied those two patches. However, I am not entirely happy with
> them, because the status of each module (tech preview, legacy) actually
> depends on whether you consider Qt 5.6 or 5.8. So maybe we should
> remove this classification entirely, and instead document the status of
> each module in their Config.in help text. This way, we can say in the
> help text: "This module is considered tech preview in Qt 5.6, but is in
> the core Qt since 5.8", etc.
>
> Could one of you work on this? It should be an easy thing.
  I can take this, together with the per module config help texts
proposed by Arnout. Expect this patchset by tomorrow morning.

>
>>   Conditional revert "qt5base: install bundled fonts to target"
> This commit is applied.
>
>> Naumann Andreas (6):
>>   qt5: add choice between version 5.6.2 and 5.8.0
> This is applied, with a number of changes:
>
>     [Thomas:
>      - tweak commit log about GStreamer related changes, suggested by Arnout
>      - move the gcc 4.8 dependency from the main qt5 option to just the
>        qt5.8 selection, so that qt5.6 can still be built if gcc < 4.8 is
>        used. Noticed by Arnout.
>      - rename the options of the version selection to not include the
>        version number itself so that we don't have to keep legacy
>        symbols. Noticed by Arnout.
>      - introduce changes to qt5quickcontrols2.mk needed to handle qt5.6
>        vs. qt5.8, borrowed from a later patch in the series.
>      - add patch for python-pyqt5 to fix the build with Qt 5.8.
>      - add fix to libv4l.mk from Peter Seiderer to fix the build with Qt
>        5.8.
>      - renumber patches for 5.6.2, suggested by Arnout.]
>
>>   qt5declarative: enable Quick for non-GL platforms for Qt 5.8.0
> This is not applied, as there were still some comments. Could you
> address them and resubmit an updated version?
>
>>   qt5quickcontrols: More deterministic target install
> Applied.
>
>>   qt5quickcontrols/qt5quickcontrols2: enable for software renderer for
>>     Qt 5.8.0
> Not applied, it's related to "qt5declarative: enable Quick for non-GL
> platforms for Qt 5.8.0".
>
>>   python-pyqt5: Depend directly on Qt5 rather than its toolchain
>>     requirements
> Applied, ans also the corresponding python-pyqt change.
>
>>   python-pyqt5: Fix for Qt 5.8.0
> Applied, but merged into the 5.8 bump, since it's needed. I've also
> merged into the same commit the freetype related build fix from Peter
> Seiderer, and the v4l2 fix also from Peter.
>
> Could you monitor the autobuilders in the next few days and see if Qt
> related issues pop up?
Yep,
>
> We really wanted to have Qt 5.8 in 2017.02, for which we will release
> rc1 in a few days. It was a bit of a risky decision, so we hope that we
> won't have too many build issues following this bump. And if we do,
> that we'll have your help to fix them up :-)
>
> Thanks again!
>
> Thomas
Thanks,

Zoltan Gyarmati
https://zgyarmati.de


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170207/28596dd3/attachment.asc>
