From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jan 2016 15:05:51 +0100
Subject: [Buildroot] [PATCH] trousers: disable pie option on ARC
In-Reply-To: <1452866166.18381.50.camel@synopsys.com>
References: <1452860508-27467-1-git-send-email-ltrimas@synopsys.com>
 <20160115143357.422dab52@free-electrons.com>
 <1452866166.18381.50.camel@synopsys.com>
Message-ID: <20160115150551.4ae83c52@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey,

On Fri, 15 Jan 2016 13:56:07 +0000, Alexey Brodkin wrote:

> I'm afraid that won't work for ARC. That's because simple apps could be
> built but as we've seen already more complicated apps will fail to build.
> I.e. we need to have an ability to force disable PIE on ARC.

Aah, okay.

> Still check for PIE makes perfect sense but in addition to it we'll
> need a way to disable that check and force disable PIE.

Indeed. Then a compiler check could be done by the configure script,
and the Buildroot packages could specify the appropriate ac_cv_<foo>=no
variable.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
