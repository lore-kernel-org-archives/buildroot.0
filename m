From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Feb 2013 19:40:54 +0100
Subject: [Buildroot] Proposed util-linux split
In-Reply-To: <20130226193330.04f77759@skate>
References: <512C941A.1070207@zacarias.com.ar> <20130226193330.04f77759@skate>
Message-ID: <20130226194054.0ab6cb97@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tue, 26 Feb 2013 19:33:30 +0100, Thomas Petazzoni wrote:

> I would suggest that we upgrade util-linux and add the necessary PAM
> dependency when needed. We already have package/linux-pam/, so it
> shouldn't be a big effort.
> 
> Of course, only the util-linux programs that actually need PAM support
> should make this library become a dependency of util-linux.

I just checked, and PAM is only needed when login-utils is enabled.

Also, 2.22 has apparently moved to a non-recursive usage of automake,
which should make the build much, much faster.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
