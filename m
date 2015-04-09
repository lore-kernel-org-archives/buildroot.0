From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 14:33:16 +0200
Subject: [Buildroot] Edit custom package install path
In-Reply-To: <CALQ+5acckG4TxdDSF4jr4QoSr-FZJFjsnD3g9Dz6U4ApbKQpyQ@mail.gmail.com>
References: <CALQ+5acckG4TxdDSF4jr4QoSr-FZJFjsnD3g9Dz6U4ApbKQpyQ@mail.gmail.com>
Message-ID: <20150409143316.510c2ff6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Igor Trevisan,

On Thu, 9 Apr 2015 14:26:33 +0200, Igor Trevisan wrote:

> I'd like to know if there's a way to chose or edit, from Menuconfig,
> the installation path of a given package.
> 
> Let suppose I added "mypackage" to buildroot and I want to give the
> user the power to define where this package
> will stay in the final root FS for my target: /opt, /usr/bin, other...
> 
> Is there a way to do this?

No, there is no way to do this. We cannot add one "installation path"
option to each of the 1500 packages we have in Buildroot.

The options are:

 * Move things around in a post-build script, if the thing can be moved
   after compilation.

 * Adjust the package .mk file to your needs.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
