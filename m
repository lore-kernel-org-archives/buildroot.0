From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 17 Nov 2011 14:05:47 +0100
Subject: [Buildroot] RFC: package patching
In-Reply-To: <20111116190306.6e9596a0@skate>
References: <CAAXf6LXWc56UcU0s0DBRAVd4SKgB+3P6N49Dc4aGkYFP4oq20Q@mail.gmail.com>
 <87k471n59k.fsf@macbook.be.48ers.dk>
 <201111151914.38517.arnout@mind.be> <20111115222819.4dd46e3b@skate>
 <CAAXf6LVgWfk4SeocyimX6qZXLjB5sBhj3i+igAOenBEF9v1t3Q@mail.gmail.com>
 <20111116190306.6e9596a0@skate>
Message-ID: <CAAXf6LW_qTUwtbdC+QjYnUAd1w5gZ4H55-6+G1Gnt3NV-s4F5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 16, 2011 at 7:03 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Wed, 16 Nov 2011 07:44:54 +0100,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> > As Arnout suggests, I think that most packages should just have
>> > patches whose filename do not contain the version. Only packages
>> > that support multiple versions would have subdirectories.
>>
>> I'm not sure if this is so black-and-white. If a patch backports a
>> change from 1.2.3 to 1.2.2, then IMO the patch should really be named
>> 1.2.2, even if only 1.2.2 is present in Buildroot. If it is named
>> without version, then it will also be taken along when bumping the
>> package (and possibly but not necessarily cause a patch conflict).
>> Only in cases were the change made by the patch is generic and not
>> intended for a specific version, should we remove the version from the
>> patch name.
>
> A generic patch doesn't exist, a patch is *always* for a specific
> version of a source tree. The fact that it might apply on multiple
> versions of a given package is just pure luck. Therefore, I don't see
> where the distinction between "generic patch" and a "version-specific"
> patch is.

How does a version-bumper currently go about? How is he supposed to
know whether a patch is still valid or not?

Although you are right that there is no such thing as a generic patch,
I still feel there is a conceptual difference between:
* modifications intended for all versions of a package, for example
modifications that we know will never go upstream because they are
buildroot-specific, and
* modifications which are intended for a specific version, for example
a backport of a change that was already fixed in a later version.

To remove our reliance on 'luck', I agree it may be best to add
version numbers to either type of patch. If a package has multiple
versions, the patch may simply be duplicated with separate version
numbers.

But, should we mark the difference between such patches in a different way?

Best regards,
Thomas
