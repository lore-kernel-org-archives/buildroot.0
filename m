From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 11:37:25 +0200
Subject: [Buildroot] [PATCH 2/2] package/.mk files: remove
 --localstatedir=/var from autotools packages
In-Reply-To: <1413585393-8349-2-git-send-email-jkrause@posteo.de>
References: <1413585393-8349-1-git-send-email-jkrause@posteo.de>
 <1413585393-8349-2-git-send-email-jkrause@posteo.de>
Message-ID: <20141019113725.4b7c7921@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sat, 18 Oct 2014 00:36:33 +0200, J?rg Krause wrote:
> Remove --localstatedir=/var from all autotools packages where it is no longer
> needed.
> 
> Also remove --localstatedir=/var/lib/dhcp from package dhcp. localstatedir is
> used by dhcp to set the default directory for the leases files. This can also 
> be done by setting --with-*-lease-file=/var/lib/dhcp/*, which is done in
> dhcp.mk.

I've indeed checked that in the dhcp configure.ac script, localstatedir
is only used when the --with-*-lease-file options are not passed.

Therefore, patch applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
