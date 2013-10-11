From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Oct 2013 09:20:26 +0200
Subject: [Buildroot] [PATCHv3 19/20] package: package-based
 implementation of source, external-deps and legal-info
In-Reply-To: <52572C61.6010707@mind.be>
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-20-git-send-email-thomas.petazzoni@free-electrons.com>
 <5256E2BC.8020503@mind.be> <20131010233303.783bfd6d@skate>
 <52572C61.6010707@mind.be>
Message-ID: <20131011092026.429bc0f8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Fri, 11 Oct 2013 00:38:25 +0200, Arnout Vandecappelle wrote:

>   I don't think it's useful to make them packages, because they are 
> really different. Adding the propagation of -all-source etc. to the 
> dependencies can easily be done in ROOTFS_TARGET_INTERNAL.

Yeah, that's indeed another option. We're already doing it with
$(1)-show-depends.

>   In a later stage, we could consider to move the (few) common parts into 
> some common package/rootfs infrastructure, but the gain is limited I expect.

Note that we have another strange location for a dependency on a
package: the target-root-passwd target, which sets the root password,
might depend on the host-mkpasswd package. So while normally, we
consider all the target-<foo> targets in system/system.mk as useless
for 'make source', 'make external-deps' and so on, it's not really the
case for this one. Except that host-mkpasswd in fact has all its source
code directly in package/mkpasswd/ (we don't download anything), and
it's used purely on the host, so maybe we can ignore this problem?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
