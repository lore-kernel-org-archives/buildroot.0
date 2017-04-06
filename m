From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 6 Apr 2017 19:19:51 +0200
Subject: [Buildroot] [PATCH 0/7 v4] support/test-pkg: fixes and
 enhancements
In-Reply-To: <20170406155554.GB3538@scaer>
References: <cover.1487195062.git.yann.morin.1998@free.fr>
 <b39f073b-f6fb-d0e4-9977-31dc8c4d51e1@mind.be> <20170405191610.GA3609@scaer>
 <573ed965-5286-80a8-b4b6-291998013137@mind.be> <20170406155554.GB3538@scaer>
Message-ID: <7e01e41f-285a-3440-7610-545d37062df2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-04-17 17:55, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2017-04-06 10:48 +0200, Arnout Vandecappelle spake thusly:
>> On 05-04-17 21:16, Yann E. MORIN wrote:
[snip]
>>> Well, as long as I can specify a list of toolchains, that is not the
>>> default, that's fine. If I just have to do a wget to have a local file,
>>> I'm OK with that.
>>>
>>> But I *want* to be able to use a custom list of toolchains.
>>
>>  You don't need to get it from a URL, do you? I think having the list of
>> toolchains passed as a BR2_EXTERNAL is much more appropriate. Basically, I now have
>>
>> TOOLCHAINS_PATH=configs/toolchains
> 
> Please, make that an option to the script, not an environment variable!

 That's what I wanted to do, of course.

> 
>     --toolchains-dir=/path/to/configs/toolchains

 Thanks for the naming tip, I would have chosen something much more stupid.

> 
>> which points to a directory containing toolchain configs. I can add an option
>> that allows you to override that directory. I don't see much point in getting
>> this from a URL, is there?
> 
> Well, if I can use a custom list of toolchians, I'm fine. Now, that I
> need to pre-populate that directory by myself is acceptable. If I need
> to store the toolchain configs remotely, it now behooves to me to
> download them fiurst and feed local files to the script. That's OK.

 Yeah, and you can also make a link farm if needed.

> 
>>>>>       support/test-pkg: print number of toolchain and progress
>>>>>       support/test-pkg: the list of toolchains really contains URLs
>>>>  With the toolchain URLs gone, this is not true anymore.
>>> Well, I am not sure what you meant: we can't have a list of remote
>>> config files to use anymore? That is sad... :-(
>>  Can you explain your use case for a list of *remote* config files?
> 
> It's just that my "tool_s_" are stored in their own repositor_ies_...

 But do those repositories contain toolchain.config files? They would typically
contain the config file for building the toolchain, not for using it as an
external toolchain, right?

 Some extra extensions that would be nice:

- specifying a shell glob pattern to match the toolchain;

- once we have a tool that can calculate the custom external toolchain
arguments: specify a list of toolchain tarball URLs and download derive the
toolchain_defconfig from there.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
