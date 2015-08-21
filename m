From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 21 Aug 2015 14:29:50 +0100
Subject: [Buildroot] Bug in package tftp
In-Reply-To: <55D70AD3.2030302@gmx.de>
References: <55D70AD3.2030302@gmx.de>
Message-ID: <55D727CE.9080706@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andreas,

On 08/21/2015 12:26 PM, universe II wrote:
> diff -Naur a/tftpd/S80tftpd-hpa b/tftpd/S80tftpd-hpa

that's not correct. You made the patch manually using "diff" from the
package directory, so the paths are not relative to $(TOPDIR). Anyway,
why you didn't make the patch using git?
You make the changes to the package/tftpd/S80tftpd-hpa file. Add that
file. Commit. And then use "git send-email --to=buildroot at buildroot.org
-1" (-1 to send only one patch starting from the HEAD).

Regards,

Vincent.
