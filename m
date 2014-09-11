From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Sep 2014 12:34:10 +0200
Subject: [Buildroot] [PATCH 1/1] ipmitool: new package
In-Reply-To: <CAJeZidJzRhJoyx9ARDDk9vhcF1K7CtZOEvk7R6QCRKLXrJS19g@mail.gmail.com>
References: <1410421465-9788-1-git-send-email-david.bachelart@bbright.com>
 <20140911112614.0996937a@free-electrons.com>
 <CAJeZidJzRhJoyx9ARDDk9vhcF1K7CtZOEvk7R6QCRKLXrJS19g@mail.gmail.com>
Message-ID: <20140911123410.338d3c83@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear David Bachelart,

Please try to keep as quotation the text your are replying to, thanks.

On Thu, 11 Sep 2014 12:13:22 +0200, David Bachelart wrote:

> I submitted a new patch, setting the license field to MIT.

Great, thanks.

> The package builds fine with the last two configurations, but does not
> build using the first one. The link step breaks, looking for a _fork
> symbol. Since it seems related to the MMU, the second configuration did not
> make sense anymore.

Hum, I'm confused. Here is the list of configurations I provided:

 * http://autobuild.buildroot.org/toolchains/configs/br-arm-basic.config
 * http://autobuild.buildroot.org/toolchains/configs/bfin-linux-uclibc.config
 * http://autobuild.buildroot.org/toolchains/configs/bfin-uclinux.config 
 * http://autobuild.buildroot.org/toolchains/configs/br-arm-full-nothread.config

The first and fourth configurations are MMU-enabled configurations, so
clearly when you say the first configuration doesn't build due to
missing _fork, it's not possible.

Maybe you want to say that the first and fourth configurations built
fine, but not the second and third? If that's the case, then your new
patch that adds "depends on BR2_USE_MMU" looks good.

Thanks for the additional testing!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
