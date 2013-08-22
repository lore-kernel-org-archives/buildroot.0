From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 22 Aug 2013 15:59:52 +0200
Subject: [Buildroot] [PATCH] openssh: fix tab/spacing in init script
In-Reply-To: <CANxTyt5Q_NG1mzdq4vZJq7dYMjmbbRoAViJ-qi4qhy4LgjYZ0g@mail.gmail.com>
References: <1377047460-1937-1-git-send-email-danomimanchego123@gmail.com>
 <CAAXf6LUO9M-Nghy8ZVMS7L0y2J+=3G6kw1eJKnMUhWOt9wGg4Q@mail.gmail.com>
 <CANxTyt5Q_NG1mzdq4vZJq7dYMjmbbRoAViJ-qi4qhy4LgjYZ0g@mail.gmail.com>
Message-ID: <CAAXf6LXSo5Z56BO611E1iv5WUzvtzH+0Ocvr6LD3vSanmrLHkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Danomi,

On Wed, Aug 21, 2013 at 3:39 PM, Danomi Manchego
<danomimanchego123@gmail.com> wrote:
> On Tue, Aug 20, 2013 at 11:39 PM, Thomas De Schampheleire
> <patrickdepinguin@gmail.com> wrote:
>>
>> I haven't checked if there are such problems, but have you considered
>> checking all init scripts for the same type of problems and fixing them in
>> this same patch?
>
>
> Thomas,
>
> I looked through the other init scripts.  There's some variation, mostly in:
>
> * Tabs vs spacing.
> * Where spaces are used instead of tabs, sometimes two spaces are used per
> level, other times four.
> * Indentation of start/stop under the case "$1"  /  esac clause.
>     * Some of the start/stop begin in the first column, aligned with 'case'.
>     * Some of them have two spaces, followed by actions offset with a tabs.
>     * Some of them have two spaces, followed by actions offset with a
> sapces.
>     * Some are offset with tab, followed by actions offset with two tabs.
>
> So I took the approach of leaving that part alone, and just fixing the lines
> that were offset by a mix of spaces and tabs, since that seemed clearly bad.
>
> I'd be willing to go through all of them and make them uniform, if
> recommended guidelines can be stated with regards to the above variations.
> Tabs are tempting only because it's a single character in text files that go
> in the target - otherwise, I'm normally in the tabs-are-evil camp, since
> thing which start out with tabs tend get modified with spaces over time, and
> because editor rendering of tab width can vary.  So I'd be willing to go
> either way.

Thanks for checking. Seems there was more variance than I expected.

I'm not sure what to do here. Unless such init scripts have been
copied from elsewhere (in which making cosmetic changes may be
undesirable), I'm ok with having them changed according to a given
guideline.

Before trying to establish such a guideline, what does the community
think about this?
If there is no consensus in changing, then no need for a guideline.

Thanks,
Thomas
