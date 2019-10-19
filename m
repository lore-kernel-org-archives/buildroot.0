From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Oct 2019 00:20:19 +0200
Subject: [Buildroot] [RFC PATCH v2 05/30] llvm: add config to build
 backend for host arch
In-Reply-To: <59ddb71c-d7e4-c314-3d19-d28d8fea68cd@mind.be>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
 <20191017152929.49153-6-michael.drake@codethink.co.uk>
 <59ddb71c-d7e4-c314-3d19-d28d8fea68cd@mind.be>
Message-ID: <fa174a39-24ea-3b27-fb67-68a431863df7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/10/2019 00:04, Arnout Vandecappelle wrote:
> 
> On 17/10/2019 17:29, Michael Drake wrote:
>> From: Joseph Kogut <joseph.kogut@gmail.com>
>  We need a bit more explanation why this option is useful/needed.
> 
> 
>> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
>> Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
>> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>

 I think I should clarify my review a little...

 I think this should be split into two patches, where I doubt the second one is
relevant:

1. Add the host arch as a target for the host-llvm build. I think this can be
done unconditionally, which makes the patch a whole lot simpler.

2. Add a Config.in.host option for llvm. This is only useful if you want to use
host-llvm outside of Buildroot, in a post-build/image script. I don't think this
is the case.

 If the patch is reduced to the first bit, then I think the
BR2_PACKAGE_HOST_LLVM_HOST_ARCH symbol (the only bit remaining in
Config.in.host) should move to Config.in. And the change to the .mk file becomes
very simple, as I indicated.

 Regards,
 Arnout
