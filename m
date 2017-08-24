From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Aug 2017 23:11:35 +0200
Subject: [Buildroot] [PATCH] bcusdk: enable tpuarts support in eibd
In-Reply-To: <20170824073008.GB22055@airbook.vandijck-laurijssen.be>
References: <20170824073008.GB22055@airbook.vandijck-laurijssen.be>
Message-ID: <20170824231135.4a4a8e98@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Aug 2017 09:30:08 +0200, Kurt Van Dijck wrote:
> Hey,
> 
> Please find my patch below.
> It enables an extra interface type for eibd.
> I don't understand why it wasn't there.
> 
> Kind regards,
> Kurt
> 
> --
> commit e62160001f09bff9be8e74b6d47da11c349bb2a6
> Author: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> Date:   Thu Aug 24 09:16:36 2017
> 
>     bcusdk: enable tpuarts support in eibd
>     
>     This commit will enable tpuarts in eibd as well.
>     tpuarts is equally important to FT1.2.
>     It makes no sense to enable only some interfaces.
>     
>     Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>

Thanks, I've applied your patch to the next branch. However, I have a
few comments/questions:

 - Could you use "git send-email" next time to send your patch? Indeed
   the formatting of your patch was not correct, so I had to fix it up
   manually. I.e you shouldn't be adding a "personal" message at the
   top of the patch, but just e-mail out the output of "git
   format-patch", which is exactly what "git send-email" guarantees to
   do correctly.

 - I've added to the commit log some information about the size
   increase caused by this new option. Since it's just 8 KB, it doesn't
   justify adding a new Buildroot Config.in option.

 - Our DEVELOPERS file doesn't list anyone looking after the bcusdk
   package. Would you be willing to take care of this package, since
   you're using it? Basically, it only means that you would be
   receiving notifications when there are build failures on this
   package, and potentially be CC'ed on patches touching this package.

Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
