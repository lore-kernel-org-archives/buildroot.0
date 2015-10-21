From: Christian Stewart <christian@paral.in>
Date: Wed, 21 Oct 2015 21:37:27 +0000
Subject: [Buildroot] [PATCHv6] package/golang: new package
In-Reply-To: <20151021232135.1997edb6@free-electrons.com>
References: <1438277053-10053-1-git-send-email-yann.morin.1998@free.fr>
 <20151021230701.4701e646@free-electrons.com>
 <CA+h8R2p5xgF7rJJW5z0AzB7b359F=S9yWrXpiTmCVK-D0Sk8pw@mail.gmail.com>
 <20151021232135.1997edb6@free-electrons.com>
Message-ID: <CA+h8R2qHiYCzdMuM+WnUYypEi4c+_SRb23hDH4WcEKFfTLTWWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

... to everyone this time...


> Maybe the host-golang compiler needs to be passed some magic arguments
> or environment variables to build?
>

Yes, this is the case. You have to specify GOARCH and similar. It's done in
the docker package pull request, see

https://github.com/paralin/buildroot/blob/44464ffc4e67c3ee7483ac7b70c6bf67bda2e399/package/lxcdocker/lxcdocker.mk

These things are already not copied if only host-golang is built.
>

Then I don't see the issue. If you're wanting to use Go as an interpreter,
Go needs to be able to access all of the source code required to compile
the code and the dependencies. So, the runtime is required to be copied.

Thanks!
Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151021/3f990a66/attachment.html>
