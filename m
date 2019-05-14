From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 09:42:50 +0200
Subject: [Buildroot] [PATCH 1/6] boot/optee-os: install trusted shared
 libraries
In-Reply-To: <CAN5uoS_D9K8Tuuemt--+oNNVgmRjRNmiWb0XHBS__wunXwk9Bg@mail.gmail.com>
References: <20190513201602.2549-1-etienne.carriere@linaro.org>
 <20190513225957.679620c0@windsurf.home>
 <CAN5uoS_D9K8Tuuemt--+oNNVgmRjRNmiWb0XHBS__wunXwk9Bg@mail.gmail.com>
Message-ID: <20190514094250.5566823e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Etienne,

On Tue, 14 May 2019 08:14:41 +0200
Etienne Carriere <etienne.carriere@linaro.org> wrote:


> > The first one should I guess not be needed, because it was already
> > non-conditional, so I don't see why it should become conditional.  
> 
> OP-TEE OS content may change and possibly no TA being built.
> For example, maybe one day the package will not build TAs unless some
> per in-tree TA configuration.
> This change aims at making this build script to be more flexible.

Hm, OK. I generally don't like those conditionals, because then you
don't get any error if those TAs should have been built, but have not.
But if it's indeed dependent on the platform configuration, we don't
really have much choice. So let's keep those conditionals, but please
use make conditions with $(if ...) as I suggested in my previous e-mail.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
