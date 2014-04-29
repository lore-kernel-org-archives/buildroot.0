From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Apr 2014 00:52:49 +0200
Subject: [Buildroot] Patchwork cleanup #8: submitter notification
In-Reply-To: <20140429210905.GE3248@free.fr>
References: <CAAXf6LWPZAF2gMAFantNzF_KEuKNYheSCD0Qcs19Zgab7kU0Ow@mail.gmail.com>
 <20140429210905.GE3248@free.fr>
Message-ID: <20140430005249.2d0f01de@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 29 Apr 2014 23:09:05 +0200, Yann E. MORIN wrote:

> However, I can se one case where we would want to be able to set
> ownership and/or permissions on a synlink: to avoid the identity of the
> "builder" to seep down into the generated filesystem. But even in that
> case, only the numerical UID would end up in the generated filesystem,
> so it is not really a concern.

We do a "chown -R 0:0" on all files in the root filesystem, before
taking into account device tables. So I don't see how an ownership on
the build machine can leak into the generated root filesystem.

See fs/common.mk to see where's it's done.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
