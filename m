From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 3 Nov 2017 14:46:15 +0100
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <20171103143828.4f57ab67@windsurf>
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf> <20171102232155.11995715@windsurf>
 <CA+TH9Vkq1oPHSwTTJTzr4MdVRo6=zWMgG5pLKTsf3-ZAwhNKjw@mail.gmail.com>
 <20171103143828.4f57ab67@windsurf>
Message-ID: <CA+TH9V=Uw2C7L4M0P9+uos5M66EGjLLHFFq50EqJPEGppKhV2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

2017-11-03 14:38 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Fri, 3 Nov 2017 12:17:37 +0100, Angelo Compagnucci wrote:
>
>> >> Unhandled Exception:
>> >> System.ExecutionEngineException: System.NullReferenceException: Object reference not set to an instance of an object ---> System.NullReferenceException: Object reference not set to an instance of an object
>> >>
>> >> Angelo, could you have a look ?
>> >
>> > Still unfixed.
>>
>> Unfortunately I cannot reproduce the problem. Could be something
>> transient? It has not crashed anymore in the last few days.
>
> No, it's not a transient issue, as I've been able to reproduce a
> similar (but not identical) crash. The thing is that it fails when
> building on a ppc64le machine (the gcc112 autobuilder instance). I just
> reproduced it:
>
> Unhandled Exception:
> System.ExecutionEngineException: System.IndexOutOfRangeException: Index was outside the bounds of the array. ---> System.IndexOutOfRangeException: Index was outside the bounds of the array.
>    --- End of inner exception stack trace ---
> [...]

This is really strange. This error means that the code inside a mono
vm running program is failing, so mono is running correctly!

>
> So it seems like host-mono doesn't build on a ppc64le machine. Looking
> at the host-monolite tarball, I see it's a bunch of .dll built for x86.
> Is this supposed to work on other architectures as well?

Yes it is. host-mono it's used to bootstrap the mono compilation for
the target so it must run on the host architecture.

IMHO seems like something related to memory, mono changed so much in
the latests releases and it uses much more memory during the
compilation. I cannot reproduce the bug on my setup with 16GB of RAM
and the config that fails on the autobuilder.

Could you give me the config you are using?

Thanks!

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
