From: Floris Bos <bos@je-eigen-domein.nl>
Date: Tue, 04 Aug 2015 00:22:35 +0200
Subject: [Buildroot] [PATCH v1 2/3] aufs: new kernel extension.
In-Reply-To: <CA+h8R2pFkwsu+1dN=W_kjPHQq8du5MhaHjCNoP2D=K8ZMEvkug@mail.gmail.com>
References: <1438387017-10597-1-git-send-email-christian@paral.in>
 <1438387017-10597-2-git-send-email-christian@paral.in>
 <20150803211325.GQ3647@free.fr>
 <CA+h8R2pFkwsu+1dN=W_kjPHQq8du5MhaHjCNoP2D=K8ZMEvkug@mail.gmail.com>
Message-ID: <55BFE9AB.4050908@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/03/2015 11:23 PM, Christian Stewart wrote:
> Hi Yann,
>
>     Remove this 'depends on' but enclose the options inside an if...endif
>     block.
>
>
> Done here:
>
> https://github.com/paralin/buildroot/commit/8dd9e882fac4a4512d9dcad8fe19da02ff901e45 
>
>
>     > +     default BR2_PACKAGE_AUFS_4X if BR2_KERNEL_HEADERS_4_0 ||
>     BR2_KERNEL_HEADERS_4.1
>     > +     default BR2_PACKAGE_AUFS_3X if !(BR2_KERNEL_HEADERS_4_0 ||
>     BR2_KERNEL_HEADERS_4.1)
>
>     See the comment below, about kernel version...
>
>
> As you caught in your next email, these are *defaults*, or guesses. 
> The user should still verify if the version is correct. The guess is 
> correct a lot of the time and is helpful to the user because the aufs 
> branches are often not obviously named.

Problem is that the guess made may appear correct to the user, while it 
is not.

Oh, I'm using Linux 3.18.19, and buildroot selected "aufs3.18", that 
looks ok.
While he may need "aufs3.18.1+" instead.

By forcing the user to enter it manually, he would at least have to 
figure out what branches are available.



Yours sincerely,

Floris Bos

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150804/c7b819cf/attachment.html>
