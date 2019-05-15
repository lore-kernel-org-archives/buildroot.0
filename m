From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 15 May 2019 12:42:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/brotli: fix build on microblaze
 with -02
In-Reply-To: <20190515115026.5a5b6632@windsurf>
References: <20190514211526.26467-1-fontaine.fabrice@gmail.com>
 <20190515122718.GB6334@momiji>
 <e214d7bb-e9b1-af4d-8143-0641a9e45758@micronovasrl.com>
 <20190515115026.5a5b6632@windsurf>
Message-ID: <9959e6bf-b084-e96b-ba33-394653928c38@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Il 15/05/2019 11:50, Thomas Petazzoni ha scritto:
> Hello,
> 
> On Wed, 15 May 2019 11:42:12 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>>>> +# prevents from triggering GCC ICE
>>>> +# A bug was reported to the gcc bug tracker:
>>>> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485
>>>> +ifeq ($(BR2_microblaze),y)
>>>> +BROTLI_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -O0"
>>>> +endif
>>>
>>> This is not a great fix, but still better than not being able to build the
>>> package at all, so I think it's okay to merge it. ?\_(?)_/?
>>
>> This is another package added to the list of Microblaze GCC6/7 bug 85180.
> 
> Be careful: we have two separate issues. Gcc bug 85180 and gcc bug 68485.
> 
> gcc bug 85180, which you were working on, causes the compiler to got in
> an infinite loop
> 
> gcc bug 68485, which this patch is about, causes the compiler to throw
> an ICE (Internal Compiler Error). I.e the compiler aborts, it does not
> enter in an infinite loop.

Right.

> It would be interesting to see if bug 68485 stills exists with gcc 8.x
> or 9.x.

Then I'm going to test both 8.x and 9.x right now for both bugs.

It seems hard to find a fix for GCC < 8.x and Microblaze is a niche.
So IMHO it seems a waste of time now with all these packages that fail.

Best regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
