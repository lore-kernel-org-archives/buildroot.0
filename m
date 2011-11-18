From: Konrad Eisele <konrad@gaisler.com>
Date: Fri, 18 Nov 2011 11:39:48 +0100
Subject: [Buildroot] [PATCH 0/2] intro
In-Reply-To: <CAAXf6LXj3OgU-3w4H9UYfjor_sm+W0gkBs-T8KGxfBrfjoqsxg@mail.gmail.com>
References: <1321539489-19737-1-git-send-email-konrad@gaisler.com>
 <201111172336.18958.arnout@mind.be>
 <CAAXf6LXj3OgU-3w4H9UYfjor_sm+W0gkBs-T8KGxfBrfjoqsxg@mail.gmail.com>
Message-ID: <4EC635F4.3030300@gaisler.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De Schampheleire wrote:
> On Fri, Nov 18, 2011 at 12:36 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>  Hoi,
>>
>>  I'm not very enthousiastic about either of these two features.
>>
>> On Thursday 17 November 2011 14:18:07 Konrad Eisele wrote:
>>> The aim of patch-1 is to make it possible to have configuration subtrees.
>>> This makes it possible to have a structure like this:
>>>
>>> buildroot-kconfigs
>>> + linux-kconfigs
>>> + busybox-kconfigs
>>> + uclibc-kconfigs
>>> + crosstools-kconfigs
>>>
>>> Where all configuration appear in one xconfig screen. Currently I have focues on
>>> qconfig only, I think however adding support for gconfig and mconfig is possible
>>> easily. The subtree feature is enabled with the -s option to qconfig: "qconfig -s <kconf>"
>>
>> - The subtree that has to be included depends on your buildroot configuration.
>> So you have to include all possible linux, busybox, uclibc, ... configs and
>> protect them with IFs.  I can hardly imagine that Kconfig can deal with such
>> huge configurations.
>>
>> - I don't like the size explosion of the buildroot tree that we would see
>> if all these configs are included.
>>
>> - The packages which have kconfigs are the ones that are most likely to need
>> board-specific modifications, which may define additional config options.  This
>> means that copying the config tree into buildroot isn't going to cut it.
>>
>> - Running configs for these things is a bit of an expert step.  In particular
>> because the configs have to be post-processed by buildroot and because
>> you have to save them explicitly afterwards in a place different from the
>> output directory.  I think that part should be smoothed out first.  Until
>> then, I consider it a good thing that the normal user runs 'make xconfig'
>> while the expert user runs 'make {,linux-,busybox-}menuconfig'.
>>
>> - I don't know what it will look like visually because the patch failed to
>> compile for me (current_conf_level is undefined), but I wonder if there is a
>> significant advantage compared to just menus.  At least in menuconfig
>> it wouldn't really make a difference.
>>
>>
>>> The other feature that patch-1 adds is a config-entry type "execute: It is
>>> like a string, however when doubleclicking (trying to edit) in qconfig
>>> (only in qconfig currently) then the string is executed using "system(<str>)".
>>> The goal is to be able to execute "make" from inside the gui, without having
>>> to exit.
>>
>>  Here I simply don't see the benefit.  Whatever needs to be executed there
>> can just be done with the normal make after the config finishes.  If people
>> want to push a button to run make, give them Eclipse with a buildroot
>> plugin :-)
>>
> 
> In fact, similar features (e.g. including one menuconfig into another)
> were discussed in the context of crosstool-ng integration into
> buildroot. See the thread "Report from the Buildroot Developer Day"
> and Yann's comments on it.

Maybe there is some interest in it then.
I have created a split patch as requested, splitting subtree and execution tag.
I sent it to the buildroot list.  The patch is called:
 [PATCH 1/1] kconfig: Add a configuration subtree command to kconfig
hope you got it.

> 
> 
> Best regards,
> Thomas
> 
> 
