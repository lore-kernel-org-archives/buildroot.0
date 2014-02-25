From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 25 Feb 2014 10:15:13 +0400
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-02-23
In-Reply-To: <20140225060341.GP4869@tarshish>
References: <20140224073008.3ECD8100F60@stock.ovh.net>
 <CAAXf6LVNCe6OeGpe8sngvwErdQPgfbFfHg8f2mxmZBPqajL8AQ@mail.gmail.com>
 <20140224213601.6c287457@skate> <20140225052234.GO4869@tarshish>
 <CAMo8BfJKYb9=iUNr3vnMkPqQGERhD4mY-NsGFxpa-0MDg+=znw@mail.gmail.com>
 <20140225060341.GP4869@tarshish>
Message-ID: <CAMo8BfKUQ0CUxB7GC4oSe5G4NoDOOsa3fARNFtqYx6G7kRBo9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 25, 2014 at 10:03 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Max,
>
> On Tue, Feb 25, 2014 at 09:47:06AM +0400, Max Filippov wrote:
>> On Tue, Feb 25, 2014 at 9:22 AM, Baruch Siach <baruch@tkos.co.il> wrote:
>> > On Mon, Feb 24, 2014 at 09:36:01PM +0100, Thomas Petazzoni wrote:
>> >> > >               wireshark-1.10.5 | 1
>> >> >     xtensa |               wireshark-1.10.5 | NOK |
>> >> > http://autobuild.buildroot.net/results/3bbba270745d96a08ff6eb98f9f3d39ca3a3ea9e/
>> >> >
>> >> > {standard input}:119517: Error: operand 1 of 'j' has out of range
>> >> > value '4294825646'
>> >> > {standard input}:119521: Error: operand 1 of 'j' has out of range
>> >> > value '4294828543'
>> >> > {standard input}:119525: Error: operand 1 of 'j' has out of range
>> >> > value '4294829836'
>> >> > {standard input}:119529: Error: operand 1 of 'j' has out of range
>> >> > value '4294830953'
>> >> > {standard input}:119533: Error: operand 1 of 'j' has out of range
>> >> > value '4294832702'
>> >> > {standard input}:119537: Error: operand 1 of 'j' has out of range
>> >> > value '4294834399'
>> >> > {standard input}:119541: Error: operand 1 of 'j' has out of range
>> >> > value '4294835783'
>> >>
>> >> Compiler problem. Should we disable wireshark for now?
>> >
>> > This problem appeared after the last wireshark version bump, and may as well
>> > disappear after the next. The same goes for kmod
>> > (http://autobuild.buildroot.net/results/1a6/1a6e7119feeb8c6098daf0d5cdc41aa778a30693/)
>>
>> I had a look at these two issues,
>> kmod triggers a real bug in xtensa ld, by specifying --gc-sections option.
>
> Thanks for investigating the issue. I'll try to come up with a patch for this.
>
>> Disabling this option might be a workaround.
>> With wireshark gcc generates 'j' jumps instead of 'jx' when jump
>> targets are too far.
>> Looks like gcc bug.
>
> As you can see from the error message above, the target addresses seem to be
> wrong (i.e., < 0).

These are not addresses but offsets from the 'j' instruction; messages
indicate that
jump offsets are out of valid range -131068 to +131075 bytes.

-- 
Thanks.
-- Max
