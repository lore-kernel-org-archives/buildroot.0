From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Oct 2018 19:20:30 +0100
Subject: [Buildroot] [PATCH] merge_config.sh: Fix finding redundant
 config mechanism
In-Reply-To: <20181023151902.GA18148@smart-All-Series>
References: <1539989903-19803-1-git-send-email-Afshin.Nasser@gmail.com>
 <CANQCQpaxMvn2OEfP0aztbFRk0KTOTnt8nugZ-gwKL7oML1eQUw@mail.gmail.com>
 <7189ed78-6481-0290-f13b-88e3c1008937@mind.be>
 <20181023151902.GA18148@smart-All-Series>
Message-ID: <13fac09f-009d-4bbf-1cce-d7d3cd2fd2d6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/23/18 4:19 PM, Nasser Afshin wrote:
> Hi Arnout,
> 
> On Sat, Oct 20, 2018 at 05:01:33PM +0100, Arnout Vandecappelle wrote:
[snip]
>>  I think Angelo's patch is the best approach after all.
> 
> I agree with you. The -b switch can be used to have a general solution
> for both cases.
> 
>>
>>  However, there is one comment that I made on Angelo's patch that still applies
>> here:
>>
>>  Since the kconfig stuff comes from upstream but is modified, we also maintain
>> the changes as a stack of patches in support/kconfig/patches. So you should
>> generate a new patch for this change and add it to the series file. I'm not sure
>> why we don't use a vendor branch and just merge, but that's the way we do it :-).
>>
>>
>>  Also, Nasser, we require your Signed-off-by to contain your full name. The
>> Signed-off-by is a short way for you to assert that you are entitled to
>> contribute the patch under buildroot's GPL license.  See
>> http://elinux.org/Developer_Certificate_Of_Origin for more details. Itis an
>> official statement, so it should be done with your full and real name. And
>> please make sure that the author information matches the Signed-off-by.
> 
> Sorry, this was a miss-configuration on the machine I've used to send the
> patch. I'll correct my Signed-off-by clause.
> 
> Should I resend the patch applying Angelo -b approach?

 Yes, please do. Make sure you keep Angelo's authorship and add your Sob. And
please fix the remaining two comments I made:

- remove the hunk that replaces alldefconfig with olddefconfig;

- a patch should be added to support/kconfig/patches.


 As it happens, I talked today with the guy who submitted the merge_config.sh
script to the kernel (apparently this script comes from yocto, originally). He
thinks it would be a good idea to upstream this -b option to the kernel. I
didn't find the kconfig maintainer (Masahiro) though, but it's worth a try.

 Regards,
 Arnout

>>
>>
>>  Regards,
>>  Arnout
>>
>> [1] http://patchwork.ozlabs.org/patch/824051/
>>
> 
> Regards,
> Nasser Afshin
> 
