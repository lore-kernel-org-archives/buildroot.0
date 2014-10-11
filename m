From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 11 Oct 2014 21:24:20 +0400
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-10-09
In-Reply-To: <CAAXf6LUBxAVgsy=935AxzW9MVScbp6kV6YHde2Lt6cNPk7G-DQ@mail.gmail.com>
References: <20141010063012.D7B521012DC@stock.ovh.net>
 <CAMo8BfKw9NCroCWfNdcDzxP5ZSX5JsuXtBdZpvx9xs1gMp_7-g@mail.gmail.com>
 <CAMo8BfK8DUPCyUUHoC0N2-GP1YOwvt1b=8ifApupiP5=FctL1Q@mail.gmail.com>
 <CAAXf6LUBxAVgsy=935AxzW9MVScbp6kV6YHde2Lt6cNPk7G-DQ@mail.gmail.com>
Message-ID: <CAMo8BfJSwS5xQzv=_TyBP2JxNgQSSWzhoLfcme+FtYkQg7es2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 11, 2014 at 3:45 PM, Thomas De Schampheleire
<thomas.de.schampheleire@gmail.com> wrote:
> Hi Max,
>
> On Sat, Oct 11, 2014 at 12:05 AM, Max Filippov <jcmvbkbc@gmail.com> wrote:
>> On Fri, Oct 10, 2014 at 5:49 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
>>> On Fri, Oct 10, 2014 at 10:30 AM, Thomas Petazzoni
>>> <thomas.petazzoni@free-electrons.com> wrote:
>>>>       xtensa |                        kmod-18 | NOK | http://autobuild.buildroot.net/results/ccb67643055a63e90f8ffbcc18da7137db6d3fbe/
>>>>       xtensa |                        kmod-18 | NOK | http://autobuild.buildroot.net/results/89e1a6328e0105021a22858e97f12107ad786782/
>>>>       xtensa |                        kmod-18 | NOK | http://autobuild.buildroot.net/results/415966eab988b04b3f1ffa5ae1bdb9ff3665c3c1/
>>>
>>> That's the same bug with --gc-sections we've put a workaround in
>>> kmod-17, and now despite the workaround is still applied I see
>>> --gc-sections in ldflags.
>>
>> Ok, turns out it's caused by the commit
>>
>> cc7da47 kmod: add patches to support build on RHEL 5
>>
>> which added a patch that modifies configure.ac, but does not call reconfigure.
>> Because of that reconfigure is called at the build step, with empty environment,
>> leading to build error on xtensa.
>> However if I add KMOD_AUTORECONF = YES reconfiguring fails with the
>> following message:
>>
>> libkmod/docs/gtk-doc.make:270: error: HAVE_GTK_DOC does not appear in
>> AM_CONDITIONAL
>>
>
> A fix for this problem has been submitted by Gustavo / Vicente in the mean time:
>
> http://patchwork.ozlabs.org/patch/398508/
> http://patchwork.ozlabs.org/patch/398509/

Great, fixes my issue as well.

-- 
Thanks.
-- Max
