From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Date: Sun, 29 Mar 2020 22:28:10 +0200
Subject: [Buildroot] [PATCH RESEND 1/1] package/optee-client: add option
 to configure REE-based storage location
In-Reply-To: <20200329222213.23bd8617@windsurf.home>
References: <20200324154255.1300634-1-heiko@sntech.de>
 <20200329222213.23bd8617@windsurf.home>
Message-ID: <9042869.4h9UI4cGT2@diego>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sonntag, 29. M?rz 2020, 22:22:13 CEST schrieb Thomas Petazzoni:
> Hello Heiko,
> 
> Thanks for your patch.
> 
> On Tue, 24 Mar 2020 16:42:55 +0100
> Heiko Stuebner <heiko@sntech.de> wrote:
> 
> > +config BR2_PACKAGE_OPTEE_CLIENT_REE_FS_PATH
> 
> Why REE_FS_PATH ? The CMake option is named TEE_FS_PARENT_PATH, so I
> assume this was a typo, and should have been TEE_FS_PATH, so I fixed
> that.
> 
> Also, the option should have been within a if BR2_PACKAGE_OPTEE_CLIENT
> ... endif block, so I fixed that up as well, and applied.
> 
> If the REE wording was really correct, let me know.

My reasoning was that the new option sets the path in the "rich execution
environment" (ree - aka Gnu/Linux) where encrypted data from the "trusted
execution environment" (tee) should be stored.

But that new name also is fine and maybe even better, because REE actually
does not seem to be used too often except in the depths of OP-TEE
documentation  ... and thanks for fixing the missing "if BR2..." block


Thanks
Heiko
