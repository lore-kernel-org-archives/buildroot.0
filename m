From: Nicole <nicole@cats-muvva.net>
Date: Thu, 14 Jun 2012 08:19:38 +0100
Subject: [Buildroot] Passing compile flags to every component
In-Reply-To: <4FD9160B.9010306@mind.be>
References: <4FD8FFB1.2010702@cats-muvva.net> <4FD9160B.9010306@mind.be>
Message-ID: <4FD9908A.3040603@cats-muvva.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you very much, Arnout.

I shall also bear in mind your instructions for posting configs ... I 
didn't know the etiquette. Perhaps this could be added to the e-mail 
that welcomes you to the list.

Nicole

On 06/13/2012 11:36 PM, Arnout Vandecappelle wrote:
> On 06/13/12 23:01, Nicole wrote:
>> Sorry if this is a newbie question. Can anyone give me some directions
>> about how to to pass a set of {C{,XX,PP},LD}FLAGS
>> to the build of each and every application that will be put on the
>> disk image?
>>
> [snip]
>> BR2_TARGET_OPTIMIZATION="-pipe"
>> BR2_TARGET_LDFLAGS=""
>
> Those are the buildroot config options you want to modify.
>
> It's not 100% guaranteed to work for all packages (some packages do
> explicit
> massaging of the CFLAGS passed to them; the Linux kernel is one of them).
>
> For the -mtune=geode flag, specifically, that should be selected
> automatically
> if you choose geode as the sub-architecture.
>
> PS: Please avoid posting a full config - do a 'make savedefconfig' and
> post the
> resulting defconfig file.
>
> Regards,
> Arnout

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 2332 bytes
Desc: S/MIME Cryptographic Signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120614/767a6fcb/attachment.p7s>
