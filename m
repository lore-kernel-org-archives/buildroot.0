From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 3 Oct 2013 10:30:25 +0200
Subject: [Buildroot] Some legal-info observations/problems
In-Reply-To: <524C4A67.9000000@mind.be>
References: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
 <524C4A67.9000000@mind.be>
Message-ID: <CAAXf6LWzfomT3bhng2+pnFp65836CWToag+8Nk5obtbu-9PgeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Wed, Oct 2, 2013 at 6:31 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 10/02/13 16:06, Thomas De Schampheleire wrote:
>>
>> Hi,
>>
>> I am starting to use the legal-info infrastructure now, and this
>> resulted in a number of observations/problems, which I'll list below.
>>
>> 1. there is no longer a provision to 'hide' proprietary packages from
>> the manifest, and not get warnings on them. Previously you could mark
>> a package as license: PROPRIETARY, but this has been removed. I still
>> think that a similar feature is useful.
>
>
>  I don't see why this is relevant. You probably anyway want to filter the
> license results to only contain the relevant licenses (i.e. the licenses
> that require you to mention the authors and the license in the
> documentation). And you can simply set the license to PROPRIETARY and grep
> it out of the csv file.

While some manipulation of the manifest will be necessary anyhow,
simply grepping out PROPRIETARY is not always correct. Currently, some
firmware packages list PROPRIETARY as license but do expect them to be
in the manifest, but not in the sources (REDISTRIBUTE=NO). So
according to the original thread and my reply to Luca on this thread,
I think these LICENSEs should be changed from PROPRIETARY to an actual
license. At the same time, I think it is nice if buildroot can do the
PROPRIETARY filtering for me.

By the way: do you really trim the manifest to only contain what is
absolutely necessary? I don't see a big problem in listing everything
and even providing sources for the BSD-licensed packages.

[..]

>
>> Of course, it's probably difficult to change this, because some
>> packages can be built for host _and_ target, and the legal-info
>> infrastructure does not know which of these was used for a particular
>> project.
>
>
>  Actually it's not, the host packages are added explicitly to
> TARGETS_LEGAL_INFO.

You're right, it shouldn't be this hard after all...

Thanks for your input,
Thomas
