From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 2 Feb 2012 12:19:50 +0100
Subject: [Buildroot] [RFC 00/15] Automatically produce legal compliance
	info
In-Reply-To: <4F2A56EF.1030405@lucaceresoli.net>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
 <201201312327.22738.yann.morin.1998@free.fr>
 <CAAXf6LVW_4J-aqqRx1DemP42dLnZbBFnGoiPBSa89QmN0E6yoA@mail.gmail.com>
 <4F29B30F.303@lucaceresoli.net>
 <CAAXf6LU1jQEHr8bd4XwZ0Ao2jQD_riPSyuyAbfUrT4xWsNMxWQ@mail.gmail.com>
 <4F2A56EF.1030405@lucaceresoli.net>
Message-ID: <CAAXf6LVDXnhvWH_mrmzBe+PPmUe+ppOapxM8fCra77AFwV6NRQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Luca,

On Thu, Feb 2, 2012 at 10:27 AM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> Thomas De Schampheleire wrote:
>>>
>>> I think the best way is to just package BR itself in the legal-info
>>> subdir. I'll have to check if/how it is feasible.
>>> I'd also copy the current .config, which IMHO is part of the "scripts
>>> used to control compilation".
>>>
>>> OTOH I don't think a pre-legal-package script would be a good idea, as
>>> it would easily allow to trick and create a fake GPL-compliant release.
>>> In other words, what I use for building must go directly in the stuff
>>> to be released.
>>
>>
>> I don't think we should attempt a guaranteed GPL-compliant release. We
>> have no control over what someone did with its buildroot repository,
>> whether or not they modified the LICENSE variables etc. A malicious
>> company will be able to create a non-compliant tarball in many ways.
>> By modifying buildroot itself, by using a pre-legal-package script,
>> but also by post-processing the tarball. It's not something we should
>> try to guard against IMO.
>>
>> Moreover, I think there are valid use cases. For example, in our case,
>> we build a proprietary package from within buildroot. This means we
>> need the sources available. A customer shouldn't get these sources.
>> But our .config or defconfig does enable the package. As a result, if
>> the customer does 'make', there will be an attempt to find the
>> proprietary sources, and the build will fail.
>> A pre-legal-package script could make such modifications to the
>> defconfig file: disable the proprietary packages.
>> Another use cas is where the pre-legal-package script could copy in
>> binary proprietary applications from elsewhere.
>> Or add a README file specific for the project.
>> Or maybe modify the login banner to indicate in the target image that
>> this is no official release, but one built by the customer.
>> Or ...
>>
>> None of these are attempts to trick the customer or to be deviant from
>> GPL or other license obligations.
>
>
> After having slept on it, and after your clarifications, I think you're
> probably right.
>
> On one hand, it's not feasible to have Buildroot enforce a compliant
> release, and I would not take the risk of saying it does even if it did.
>
> On the other hand, there are ways a pre-legal-package script may be
> useful, as your examples demonstrate.
>
> By the law you must release the sources, but not necessarily make them
> straightforward to use. So to fulfill legal obligations you probably
> don't need such a script (provided that BR can package all the code that
> must be released).
>
> But there are also FOSS-friendly device vendors that might want to sell
> a product with some proprietary software on them, while releasing the
> open-source part in a way that is fully usable except for the absence
> of the proprietary parts.
>
> Bottom line: I think the script you suggest would be useful, but non
> strictly necessary. So I consider it something that might be added
> later, unless it's a simple addition to the current patchset.
> I'd prefer to keep the first patchset thin, for better review/discussion
> and to ease Peter's integration work.

Ok, I understand.
Let's keep the script out of the patchset for now. We can add it later.

Best regards,
Thomas
