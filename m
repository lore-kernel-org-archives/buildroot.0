From: Christoph Engelbert <me@noctarius.com>
Date: Wed, 18 Jul 2018 13:23:42 +0200
Subject: [Buildroot] [PATCH 1/1] <wireless-regdb>: Adds
 "regulatory.db[.p7s]" to /lib/firmware
In-Reply-To: <20180718131839.1995b40c@windsurf>
References: <20180716151303.18064-1-me@noctarius.com>
 <20180718131839.1995b40c@windsurf>
Message-ID: <E894B8F4-C70E-4AE1-91D0-B16176A7B6D1@noctarius.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Thomas,

Thanks for applying the patch. I?ll take your recommendations into consideration next time. Guess that was probably not the last patch to send ;-) Especially since (at the moment) I?m fighting myself through the process to get a full blown nanopi neo air working from the buildroot process.

Thanks,
Chris

> On 18. Jul 2018, at 13:18, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
> Hello,
> 
> On Mon, 16 Jul 2018 18:13:03 +0300, Christoph Engelbert wrote:
>> With kernel version 4.15, Linux started to support loading regulatory.db and regulatory.db.p7s files
>> directly from /lib/firmware, without the need of crda. If the kernel can't load those files it'll
>> fallback to using crda, but the direct way is preferred.
>> 
>> This patch copies those those files under /lib/firmware. The use of crda shouldn't be necessary with
>> kernels of 4.15 or later.
>> 
>> Signed-off-by: Christoph Engelbert <me@noctarius.com>
>> ---
>> package/wireless-regdb/wireless-regdb.mk | 4 ++++
>> 1 file changed, 4 insertions(+)
> 
> Thanks for your contribution, I've applied your patch. However, I would
> like to recommend a few improvements for your future contributions, if
> possible:
> 
> - No need to enclose the package name between < and > in the commit
>   title, i.e just "package: description" is enough.
> 
> - When sending new iterations, please change the patch subject prefix
>   to PATCH v2, PATCH v3, etc. You can do that with "git format-patch
>   -v2" or git format-patch --subject-prefix="PATCH v2"
> 
> - Also when sending new iterations, adding a changelog below the "---"
>   sign is very nice, because it allows the people reviewing your patch
>   understand what has changed.
> 
> - Finally, the commit log description should be wrapped to 72
>   characters.
> 
> But again: I applied your patch after doing minor fixes in the commit
> title and commit log, so those recommendations are valid for your
> future contributions only :-)
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
