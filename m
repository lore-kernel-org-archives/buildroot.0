From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 15 Oct 2010 17:25:38 -0300
Subject: [Buildroot] Deprecate rp-pppoe package
In-Reply-To: <D61182AC8012EA4EBC531B3AF23BE1099C8F95@tranzeo-mail2.12stewart.tranzeo.com>
References: <D61182AC8012EA4EBC531B3AF23BE1099C8F95@tranzeo-mail2.12stewart.tranzeo.com>
Message-ID: <4CB8B8C2.2010407@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/13/10 13:13, Darcy Watkins wrote:

> Hello,
> 
> I submitted a patch wrt this subject line / thread back in August.
> Essentially I updated the rp-pppoe package version (changed to
> autotools) and made sure that the PPPoE server side functionality works
> (on a powerpc target).
> 
> http://lists.busybox.net/pipermail/buildroot/2010-August/036907.html
> 
> http://lists.busybox.net/pipermail/buildroot/2010-July/036252.html
> 
> These changes were not included into buildroot-2010.08 because it was
> already at release candidate stage.  I don't see it committed / merged
> since either.  Will it make it in before 2010.11 hits release candidate
> stage?
> 
> 
> Regards,
> 
> Darcy

Hi Darcy.
Ok, managed to give it a spin on my powerpc rig.
My changes:

* RP_PPPOE_TARGETS_BIN and MANPAGES are basically the same, so merged.

* No need for RP_PPPOE_SOURCE if it uses the standard naming convention
(it does), so removed it.

* In INSTALL_TARGET_CMDS prefer $(INSTALL) over cp.

* NETSNMP_UNINSTALL? That should be RP_PPPOE_UNINSTALL :)

* In patch 002 (krn-plugin) you're hardcoding PLUGIN_DIR, i removed it
and just pass it to the package at build time (new RP_PPPOE_MAKE_OPTS)
based on pppd's package version. This is to avoid future breakage when
pppd changes version.

* Added RP_PPPOE_DEPENDENCIES = pppd, so that we build after pppd is
done, otherwise you may miss the pppd.h header.

* Cosmetic fixes.

Give it a spin, works for me.
Thanks and regards.
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-rp-pppoe-3.10.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101015/e17c3916/attachment-0001.ksh>
