From: Dimitrios Siganos <dimitris@siganos.org>
Date: Sun, 17 Feb 2013 20:57:01 +0000
Subject: [Buildroot] bump libnl to 3.2.21 before release
In-Reply-To: <512127BC.9050004@zacarias.com.ar>
References: <51212637.6020406@siganos.org> <512127BC.9050004@zacarias.com.ar>
Message-ID: <5121441D.5040506@siganos.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/02/13 18:55, Gustavo Zacarias wrote:
> On 02/17/2013 03:49 PM, Dimitrios Siganos wrote:
>> If you linked against 3.2.18 or 3.2.19 your binary will not be
>> compatible with >= 3.2.20. You will have to relink your binary. We are
>> sorry for any inconvenience this may cause.
>>
>> Note: The API/ABI that is exported as of 3.2.21 is considered 100%
>> stable. No more exceptions that cause confusion and breakage. I will no
>> longer merge patches that break API/ABI even though the API seems unused
>> at this point. Things have been broken too many times.
> 
> The keyword here is "binary".
> Breaking ABI isn't important in the buildroot context of packages since
> you're building from source thus you don't care about ABI.
> It's the same boat like when we moved the openssl package from 0.9.8* to
> 1.0.*
> Is there any explicit problem 3.2.18 causes that affects you?
> Regards.
> 

There is no problem that I can't work around but it is an inconvenience
that can be avoided.

How am I affected? We do binary releases of our software applications
and 3.2.18 doesn't work for us and we'd have to release a special
version for that or create a patch for buildroot.

The important thing to note here is that version 3.2.18 broke backwards
compatibility and version 3.2.20 restored it. For example, v3.2.16 is
compatible with 3.2.21 but 3.2.18 isn't compatible with either of them.

If there is no specific reason to stay at 3.2.18 then why not go to
3.2.21 and spare some buildroot users (the ones that operate in mixed
open/closed source) from that unnecessary libnl hassle?

Regards,
Dimitris
