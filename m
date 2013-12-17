From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Dec 2013 14:19:26 +0100
Subject: [Buildroot] [PATCH v4 2/2] manual: update for multiple global
	patch dirs
In-Reply-To: <CAAXf6LVu=ZUYZ-O-+WcCcnY2sCs8Nn-OiEwRwNkrjyqwhakE=Q@mail.gmail.com>
References: <1387270827-4379-1-git-send-email-rjbarnet@rockwellcollins.com>	<1387270827-4379-2-git-send-email-rjbarnet@rockwellcollins.com>
 <CAAXf6LVu=ZUYZ-O-+WcCcnY2sCs8Nn-OiEwRwNkrjyqwhakE=Q@mail.gmail.com>
Message-ID: <52B04F5E.1010602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/12/13 13:58, Thomas De Schampheleire wrote:
> On Tue, Dec 17, 2013 at 10:00 AM, Ryan Barnett
> <rjbarnet@rockwellcollins.com> wrote:
>> Updating the documentation to reflect that multiple directories can
>> now be specified for BR2_GLOBAL_PATCH_DIR. Along with giving an
>> example use case of how to use multiple global patch directories.
>>
>> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
>> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
>> Cc: Arnout Vandecappelle <arnout@mind.be>
>>
>> ---
>> Changes v3 -> v4:
>>    - Fixed minor spelling mistakes and wording (suggested by Arnout)
>>    - Reword section about order that patches are applied along with
>>      making it clearer about when to use BR2_GLOBAL_PATCH_DIR
>>      (suggested by Arnout)
>>
>> Changes v2 -> v3:
>>    - None
>>
>> Changes v1 -> v2:
>>    - Fixed minor spelling mistakes and wording (suggested by Thomas D)
>> ---
>>   docs/manual/customize-packages.txt |   91 ++++++++++++++++++++++++++++++++----
>>   docs/manual/patch-policy.txt       |   20 +++++---
>>   2 files changed, 95 insertions(+), 16 deletions(-)
>>
> [..]
>>
>> -For a specific version <packageversion> of a specific package <packagename>,
>> -patches are applied as follows.
>> +For a specific version +<packageversion>+ of a specific package
>> ++<packagename>+, patches are applied from +BR2_GLOBAL_PATCH_DIR+ as
>> +follows:
>>
>> -First, the default Buildroot patch set for the package is applied.
>> +. For every directory - +<global-patch-dir>+ - that exists in
>> +  +BR2_GLOBAL_PATCH_DIR+, a +<package-patch-dir>+ will be determined as
>> +  follows:
>> ++
>> +* If the directory
>> +  +<global-patch-dir>/<packagename>/<packageversion>/+ exists.
>> ++
>> +* Otherwise, if the directory +<global-patch-dir>/<packagename>+ exists.
>
> I find this wording strange:
> '.... will be determined as follows: if the directory A exists.
> Otherwise, if the directory B exists.'
>
> What about:
> '.... will be determined as follows: A, if it exists. Otherwise, B, if
> it exists.'

  Actually for me, Ryan's formulation sounds more natural: if ... else if 
... else ....


[snip]

>> +  enumerated in the order they are specified. The patches are applied
>> +  as described in the previous step.
>> +
>>   . Run the +<packagename>_POST_PATCH_HOOKS+ commands if defined.
>>
>>   If something goes wrong in the steps _3_ or _4_, then the build fails.
>
> I think it's a pity that there is duplication between this section and
> the one on BR2_GLOBAL_PATCH_DIR.
> However, it seems this was an explicit request made by Arnout.
>
> Arnout, would it not be better to remove the duplication, but rather
> use hyperlinks to refer from one section to the other, with the
> detailed explanation about patch order being in this 'How patches are
> applied' section?

  I meant to say that the remark about numbering the patches should be 
duplicated, so that's just one sentence.

  I do agree that it would be better to move the whole discussion about 
the order in which patches are applied to this section (including a 
specific comment about the linux patches), with a crossref from the 
global patch dir section. However, Ryan didn't really change that 
structure (there was already some amount of duplication), so I think it 
can safely be done in a separate patch.

  IOW: I'm OK with committing this one as is, except for the gloabl typo.


  Regards,
  Arnout

>
> Best regards,
> Thomas
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
