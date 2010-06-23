From: Darcy L. Watkins <dwatkins@tranzeo.com>
Date: Wed, 23 Jun 2010 08:30:31 -0700
Subject: [Buildroot] [May15 patch 12/12] netsnmp: disable build with
 external toolchain
In-Reply-To: <1277216184.23331.8.camel@localhost.localdomain>
References: <1277216184.23331.8.camel@localhost.localdomain>
Message-ID: <1277307031.18561.19.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The fourth chunk in the buildroot-libtool.patch appears to be bogus.  It
adds a commented out chunk of code, but doesn't remove what appears to
have been intended to be the code to comment out (around line # 29xx in
ltmain.sh).  It would seem that an "exit 1" was replaced with "exit
$EXIT_FAILURE" so the patch broke.  I think it's possible that the patch
was refreshed without anyone catching this.

I also notice what appears to be two different variants of ltmain.sh
floating around in the packages - one circa 2007 (ver 1.5.24), the other
circa 2008 (ver 2.2.6).  Only the former is compatible with the patch.

The ltmain.sh in the netsnmp package is the newer one (not compatible
with the patch).  Do we need a variant of buildroot-libtool.patch for
the newer libtool, or is the newer ltmain.sh variant supposed to have
the cross compile problems fixed?

Regards,

Darcy

On Tue, 2010-06-22 at 07:16 -0700, Darcy L. Watkins wrote:
> I need to be able to build net-snmp in my buildroot using a
> crosstool-ng
> external toolchain.
> 
> Has anyone made progress or determined the underlying cause of why
> net-snmp cannot properly locate the libraries even though --sysroot
> points to the buildroot staging area (instead of using the toolchain
> default)?
> 
> Would adding redundant -L<path> to the staging library area work (and
> likely also -I<path> to the includes if needed)?
> 
> Any insight as to why this happens with net-snmp (or is it observed
> with
> some other packages too)?
