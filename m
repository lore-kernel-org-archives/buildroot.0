From: Julien Boibessot <julien.boibessot@free.fr>
Date: Wed, 31 Jul 2019 12:48:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/host-mtd: fixes build
In-Reply-To: <20190731092534.31da3132@windsurf>
References: <1564402300-3993-1-git-send-email-julien.boibessot@free.fr>
 <20190731092534.31da3132@windsurf>
Message-ID: <f9baa408-a6b9-2078-9bc4-96d36830ec87@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 31/07/2019 09:25, Thomas Petazzoni wrote:
> Hello Julien,
>
> The commit title should rather be:
>
> 	package/mtd: add host-zstd dependency to host variant to fix build

OK

>
> On Mon, 29 Jul 2019 14:11:40 +0200
> julien.boibessot at free.fr wrote:
>
>> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
>>
>> Fixes following build error when Host doesn't have zstd devt files:
> This should also mention that the issue was introduced in the commit
> bumping to 2.1.1, and add references to the autobuilder failures.

OK. autobuilder failures came *after* my patch ;-)

>
> However, why does this problem only occurs for the host variant, and
> not the target variant.
>
> Why is this warning causing a build failure ? Normally warnings are
> just warnings, not errors.
>
> Is this zstd dependency optional somehow ?

It seems like zstd is now needed if ubifs is selected, like stated in
mtd configure.ac:

    AM_COND_IF([BUILD_UBIFS], [
            need_uuid="yes"
            need_xattr="yes"
            need_zlib="yes"
            need_lzo="yes"
            need_zstd="yes"                   <<<<<<<<
            need_openssl="yes"
    ])


So you were right, target mtd build is also impacted....

I will resend a patch to correct both target and host build.

Regards,
Julien

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190731/584bf9f9/attachment.html>
