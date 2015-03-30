From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 22:37:46 +0200
Subject: [Buildroot] [PATCH 1/2] squid: bump to version 3.5.3
In-Reply-To: <1427639612-25592-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427639612-25592-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150330223746.5364707b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 29 Mar 2015 11:33:31 -0300, Gustavo Zacarias wrote:

> +# Atomics support requires __sync_add_and_fetch_8 (64-bits)
> +# That's only handled in gcc's libatomic for 32-bit arches

Following the discussion with Baruch, I've updated this comment to:

+# Atomics in Squid use __sync_add_and_fetch_8, i.e a 64 bits atomic
+# operation. This atomic intrinsic is only available natively on
+# 64-bit architectures that have atomic operations. On 32-bit
+# architectures, it would be provided by libatomic, but Buildroot
+# typically doesn't provide it.

and applied this patch, as well as PATCH 2/2.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
