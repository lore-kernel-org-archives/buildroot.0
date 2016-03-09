From: Johan Sagaert <sagaert.johan@proximus.be>
Date: Wed, 9 Mar 2016 11:46:58 +0100
Subject: [Buildroot] patch: **** Only garbage was found in the patch
 input.
In-Reply-To: <871t7k41b9.fsf@dell.be.48ers.dk>
References: <56DF6755.3080402@proximus.be> <871t7k41b9.fsf@dell.be.48ers.dk>
Message-ID: <56DFFF22.4060207@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter ,

Op 9/03/2016 om 7:23 schreef Peter Korsgaard:
>>>>>> "Johan" == Johan Sagaert<sagaert.johan@proximus.be>  writes:
>   > Hi
>   > Applying 0001-logo.patch using patch:
>   > patch: **** Only garbage was found in the patch input.
>   > Patch failed!  Please fix 0001-logo.patch!
>
>   > I always use  git format patch to create patches  to use them
>   > as usual in buildroot.
>   > The modified files where image files, so this yields a binary patch.
>
>   > It looks like patch does not understand the binary format that git
>   > format patch creates.
>
> Indeed, gnu patch afaik doesn't support the binary git diff format.
>
>   > Is there any workaround this or do i have to revert to the old diff
>   > method for making patches
>   > of non text files ?
>
> Is this patch really something that is needed to fix a build issue of
> the package? From the file name it more sounds like som project specific
> customization of the rootfs. If that is so, why not just include the
> image in your rootfs overlay?
>
I have to replace a logo bitmap in the u-boot sources that are pulled 
from a git repository .
So  i will have to add a |PRE_BUILD_HOOK for the u-boot loader in this 
case to replace the
logo bmp file before building, since diff cant create patches of binary 
files.

Regards, Johan



|
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160309/077f46c8/attachment.html>
