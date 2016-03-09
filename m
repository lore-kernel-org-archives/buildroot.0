From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Mar 2016 07:23:22 +0100
Subject: [Buildroot] patch: **** Only garbage was found in the patch
	input.
In-Reply-To: <56DF6755.3080402@proximus.be> (Johan Sagaert's message of "Wed, 
 9 Mar 2016 00:59:17 +0100")
References: <56DF6755.3080402@proximus.be>
Message-ID: <871t7k41b9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Johan" == Johan Sagaert <sagaert.johan@proximus.be> writes:

 > Hi
 > Applying 0001-logo.patch using patch:
 > patch: **** Only garbage was found in the patch input.
 > Patch failed!  Please fix 0001-logo.patch!

 > I always use  git format patch to create patches  to use them
 > as usual in buildroot.
 > The modified files where image files, so this yields a binary patch.

 > It looks like patch does not understand the binary format that git
 > format patch creates.

Indeed, gnu patch afaik doesn't support the binary git diff format.

 > Is there any workaround this or do i have to revert to the old diff
 > method for making patches
 > of non text files ?

Is this patch really something that is needed to fix a build issue of
the package? From the file name it more sounds like som project specific
customization of the rootfs. If that is so, why not just include the
image in your rootfs overlay?

-- 
Bye, Peter Korsgaard
