From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Mar 2014 12:09:09 +0100
Subject: [Buildroot] Xenomai support for pre and post patches
In-Reply-To: <CAEbDrgk-oaAJgHv=w02Hdzef9t7zphqWKBuq87eyD=FWHrA=Aw@mail.gmail.com>
References: <CAEbDrgmqihPwKwxhr-WGQmAShN2Ahr7SsovCXgLgbtDUz+RWgg@mail.gmail.com>
 <CAEbDrgk-oaAJgHv=w02Hdzef9t7zphqWKBuq87eyD=FWHrA=Aw@mail.gmail.com>
Message-ID: <20140328120909.260739cf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gregory Dymarek,

Thanks for your contribution!

On Fri, 28 Mar 2014 09:42:19 +0000, Gregory Dymarek wrote:

> The following patch adds support for pre- and post- adeos patches to
> Xenomai.

Can you explain why this is needed? You can already apply patches on
any package using the BR2_GLOBAL_PATCH_DIR option. See
http://buildroot.org/downloads/manual/manual.html#packages-custom for
details about it.

Basically, you can do:

	BR2_GLOBAL_PATCH_DIR=board/<company>/<project>/

and then, in:

	board/<company>/<project>/xenomai/

you put your patches, and then will be applied to Xenomai before it is
being built.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
