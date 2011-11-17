From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Thu, 17 Nov 2011 22:21:45 +0100
Subject: [Buildroot] Report from the Buildroot Developer Day
In-Reply-To: <CAAXf6LUGj-F04ktNJC1r7-Uy1Ob6WgRqzAdFCk1rJvCk7HZaBA@mail.gmail.com>
References: <20111102160349.4afe5935@skate> <201111152217.08212.arnout@mind.be>
 <CAAXf6LUGj-F04ktNJC1r7-Uy1Ob6WgRqzAdFCk1rJvCk7HZaBA@mail.gmail.com>
Message-ID: <CAEYzJUE7w2r0uSfjNoWpBoEpFHGEppEFnj-WEnJbHfauN51HwQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17 November 2011 14:57, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> On Tue, Nov 15, 2011 at 11:17 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On Wednesday 02 November 2011 15:03:49 Thomas Petazzoni wrote:
>>> On the feature that is often discussed on the Buildroot list, and
>>> which was on the agenda for this meeting was the general topic of
>>> "package management". To summarize, the idea would be to add some
>>> tracking of which Buildroot package installs what files, with the
>>> goals of :
>>>
>>> ?* Being able to remove files installed by a package when this package
>>> ? ?gets unselected from the menuconfig ;
>>
>> ?I completely agree with the final conclusion that this is almost impossible to
>> achieve in a simple, consistent and reliable way. ?Something that would help a
>> lot for that purpose, however, is to have a 'make clean-target' target. ?This
>> would wipe $(TARGET_DIR) and remove all .stamp_target_installed files. ?The
>> next build will re-copy the skeleton and reinstall all packages, which should
>> be sufficient and shouldn't take very long. ?clean-staging would also be nice
>> but is probably a bit more difficult to implement because of the toolchain.
>
> Just for the record: I like this idea...

Here is a (old) patch that tries to do that:

http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/29333/

I use it in one project and I like it very much. It would be nice if
mainline Buildroot
had this functionality.

Best regards,
Bj?rn Forsman
