From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 5 Sep 2013 21:20:36 +0200
Subject: [Buildroot] [PATCH] apply-patches.sh: detect missing patches
In-Reply-To: <20130905140135.GC3136@free.fr>
References: <20130813160017.GA2590@harvey.netwinder.org>
 <CAAXf6LXBHm7nG__780PqUaO+v9+4j2KON7UO0dw4Ej2qC3=XGg@mail.gmail.com>
 <CAAXf6LV9HPWdzqV_F5zQ+aABtVxZGRRkhDszF2Qx8vyXMb+PhA@mail.gmail.com>
 <20130905100459.13173009@skate> <5228425A.7090502@lucaceresoli.net>
 <20130905140135.GC3136@free.fr>
Message-ID: <CAAXf6LWWnb5xQUtZA8p3kgoU2et-kD6x9TzyzXykgNbxdsuv+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ralph,

On Thu, Sep 5, 2013 at 4:01 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> All,
>
> On 2013-09-05 10:35 +0200, Luca Ceresoli spake thusly:
>> Thomas Petazzoni wrote:
>> >Dear Thomas De Schampheleire,
>> >
>> >On Thu, 5 Sep 2013 09:03:33 +0200, Thomas De Schampheleire wrote:
>> >
>> >>>Although I agree with the concept of checking for existence, I'm not
>> >>>sure about the action to take.
>> >>>Earlier in apply-patches.sh, if a patch is in an unsupported format,
>> >>>it is simply skipped (and a message printed). I think the action in
>> >>>that case should line up with the nonexisting patch case, so either
>> >>>give a warning and continue, or an error and stop.
>> >>Any input from others?
>> >My general feeling is that when something goes wrong or looks wrong, we
>> >should abort with an error, and not try to continue with something
>> >more-or-less broken/incorrect.
>>
>> I agree. Who reads a million lines of build outputwhen make exits returning
>> zero? Definitely BR should stop and shout out loud about missing or
>> incorrect patches.
>
> I concur: we should abort on incorrect/missing/malformed patch.
>

Would you mind sending a second patch that changes the 'unknown patch
format' case so that an error is thrown?

Additionally, in your current patch, I would suggest changing the 'if
test ...' into 'if [ ... ], for the sake of lining up with the style
in the rest of the script.

Note that if you don't have time to send a second patch, just let me
know, then I will.

Best regards,
Thomas
