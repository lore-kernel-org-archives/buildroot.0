From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 2 Dec 2020 18:18:01 +0100
Subject: [Buildroot] [PATCH v3] package/trace-cmd: bump to version 2.9.1
In-Reply-To: <CADYdroNAR6hJbyXRqwZ_Y-CuOGrJ2GPcCcON_tFbiuzfsy5iFA@mail.gmail.com>
References: <20201103155335.212037-1-nolange79@gmail.com>
 <1a359277-1c75-f5eb-2998-5c79d837c7ea@mind.be>
 <CADYdroNAR6hJbyXRqwZ_Y-CuOGrJ2GPcCcON_tFbiuzfsy5iFA@mail.gmail.com>
Message-ID: <d16cf456-1f03-8021-aa82-ece054a3ddf1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/12/2020 17:37, Norbert Lange wrote:
> Am Di., 1. Dez. 2020 um 21:35 Uhr schrieb Arnout Vandecappelle <arnout@mind.be>:
>>
>>  Hi Norbert,
>>
>> On 03/11/2020 16:53, Norbert Lange wrote:
[snip]
>>>  define TRACE_CMD_BUILD_CMDS
>>> -     $(MAKE) $(TARGET_CONFIGURE_OPTS) \
>>> -             CFLAGS="$(TRACE_CMD_CFLAGS)" \
>>> -             CPPFLAGS="$(TRACE_CMD_CPPFLAGS)" \
>>> -             $(TRACE_CMD_MAKE_OPTS) \
>>> -             -C $(@D) all
>>> +     $(TARGET_CONFIGURE_OPTS) \
>>> +     CFLAGS="$(TRACE_CMD_CFLAGS)" \
>>> +     CPPFLAGS="$(TRACE_CMD_CPPFLAGS)" \
>>
>>  Can you explain in the commit message why these are passed in the environment
>> now instead of on the command line?
> 
> I do a "normal" build now, instead of using a fragment in a subdirectory.

 Err... Before it was "make all", where do you see the anything about a fragment
in a subdirectory?

> Means the Makefile would like to do stuff like adding include paths which doesnt
> work if the variables are overriden.

 Yes, that's exactly the kind of explanation I would expect in the commit message.

> 
> As rationale I would use: "Thats the way you normally build packages",
> aswell as "Thats how you would DL the source" (instead of doing a git
> fetch, in regards to last point).

 It was git before because kernel.org has only recently started supporting
tarball downloads from git (where "recently" is about a year ago I think, maybe
even two).


 Regards,
 Arnout

> Of course I don't know why it was done in a entirely different manner
> before, so I might be missing something
> 
> Norbert
> 
