From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 28 Aug 2014 08:56:29 +0200
Subject: [Buildroot] [PATCH 1 of 2 for 2014.08] manual/user
 guide/customization: expand introduction text
In-Reply-To: <CAHXCMMJ+YMHPyJnSH=m=GQsa1R2EdP1c2haVQ3GjjSitA-QnyQ@mail.gmail.com>
References: <patchbomb.1409168409@localhost>
 <e21c7854621143b573bf.1409168410@localhost>
 <CAHXCMMJ+YMHPyJnSH=m=GQsa1R2EdP1c2haVQ3GjjSitA-QnyQ@mail.gmail.com>
Message-ID: <CAAXf6LUYenwE3H_n5KNAeQWr43ZrsRQmpnQTbsQzN58pjLJUSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 27, 2014 at 10:22 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> Hi Thomas, all,
>
> On Wed, Aug 27, 2014 at 9:40 PM, Thomas De Schampheleire
> <patrickdepinguin@gmail.com> wrote:
>> This patch expands the introduction text of chapter 'Project-specific
>> customization' by listing the type of customizations that can be performed
>> by a project.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> ---
>>  docs/manual/customize.txt |  25 +++++++++++++++++++++----
>>  1 files changed, 21 insertions(+), 4 deletions(-)
>>
>> diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
>> --- a/docs/manual/customize.txt
>> +++ b/docs/manual/customize.txt
>> @@ -3,11 +3,28 @@
>>
>>  == Project-specific customization
>>
>> -The following sections describe the various way in which you can
>> -customize Buildroot for a given project.
>> +Typical actions you may need to perform for a given project are:
>>
>> -For instructions on how to add new packages to Buildroot, refer to
>> -xref:adding-packages[]
>> +- configuring Buildroot (including build options and toolchain,
>> +  bootloader, kernel, package and filesystem image type selection)
>> +- configuring other components, like the Linux kernel and BusyBox
>> +- adding project-specific patches to some packages (using
>> +  +BR2_GLOBAL_PATCH_DIR+)
>> +- adding or overwriting files on the target filesystem (using
>> +  +BR2_ROOTFS_OVERLAY+)
>> +- modifying or deleting files on the target filesystem (using
>> +  +BR2_ROOTFS_POST_BUILD_SCRIPT+)
>> +- running arbitrary commands prior to generating the filesystem image
>> +  (using +BR2_ROOTFS_POST_BUILD_SCRIPT+)
>> +- running arbitrary commands after generating the filesystem image
>> +  (using +BR2_ROOTFS_POST_IMAGE_SCRIPT+)
>> +- adding project-specific packages
>> +
>> +This chapter describes how to make such project-specific customizations
>> +in Buildroot and how to store them in a way that you can build the same
>> +image in a reproducible way, even from a clean buildroot tree. By
>> +following the recommended strategy, you can even use the same Buildroot
>> +tree to build multiple distinct projects!
>>
>
> This is really good, but instead of implying that customization can
> stay aside of Buildroot tree, I would be clear about this, and maybe
> add that this location can be used to store
> non-redistribuable/non-disclosable (I'm not sure about this last
> adjective ;]) stuff.

I think I don't fully understand your comment here, could you rephrase?

Thanks,
Thomas
