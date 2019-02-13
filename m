From: Chuck Tuffli <ctuffli@gmail.com>
Date: Wed, 13 Feb 2019 09:45:25 -0800
Subject: [Buildroot] PC post-build.sh issue
In-Reply-To: <CAB_FnGeg_fbQuRKUDPvx706SosXKrftZxw3ZVo3TMPPJ4g_Syw@mail.gmail.com>
References: <CAKAYmMKFmVTyZau57e-WPUeriPrUAQ_W7w9Ypd8gKf6rQeh6ww@mail.gmail.com>
 <87h8d9wi5a.fsf@dell.be.48ers.dk>
 <CAB_FnGeg_fbQuRKUDPvx706SosXKrftZxw3ZVo3TMPPJ4g_Syw@mail.gmail.com>
Message-ID: <CAKAYmMK6=r_KmnNvUKDKtNB6NB-OMNuTkfku23vdGgBPD_X8kw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 12, 2019 at 8:45 AM Gr?goire Delattre
<gregoire.delattre@gmail.com> wrote:
>
> On Tue, Feb 12, 2019 at 9:00 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>>
>> >>>>> "Chuck" == Chuck Tuffli <ctuffli@gmail.com> writes:
>>
>>  > I've been using buildroot to generate a BIOS-based disk image for an
>>  > x86_64 system and seem to need to change the file:
>>  >    board/pc/post-build.sh
>>  > to copy from the i386-pc directory instead of the i387-pc directory.
>>  > I.e. the last line in the else clause is:
>>  >     cp -f "$HOST_DIR/lib/grub/i386-pc/boot.img" "$BINARIES_DIR"
>>  > Is this an indication I've mis-configured something else or is 'i387' a typo?
>>
>
> Indeed this is a typo ! Looks like an unexpected CTRL-a in vim...
> I'll fix this quickly, sorry for the inconvenience.
>
>>
>> Heh, that indeed looks like a typo. It was introduced by commit
>> 0b28397a9b (board/pc: ensure grub.cfg is copied to target filesystem)
>>
>> Gr?goire?

No problem, thanks for the fix!

--chuck
