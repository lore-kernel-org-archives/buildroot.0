From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 28 Oct 2014 23:32:04 +0100
Subject: [Buildroot] [PATCH v4] cppunit: new package
In-Reply-To: <1413474395-20165-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
References: <1413474395-20165-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <54501964.4050702@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sebastien,

Le 16/10/2014 17:46, Sebastien Bourdelin a ?crit :
> CppUnit is the C++ port of the famous JUnit framework for unit testing.
> Test output is in XML or text format for automatic testing and GUI
> based for supervised tests.
> 
> http://www.freedesktop.org/wiki/Software/cppunit/
> 
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
> ---
> Changes v3 -> v4:
>   - move the package from "Librairies" > "Others" to "Development tools"
> 		 (suggested by arnout at mind.be)
>   - change the CPPUNIT_VERSION and remove the useless CPPUNIT_SOURCE
> 		 (suggested by jerzy.grzegorek at trzebnica.net and
> 		 arnout at mind.be)
>   - change the link which refer to the md5 hash (suggested by
> 		 arnout at mind.be)
>   - change the comment for the locally calculated hash in the .hash file
>   - change the commit title
>   - add a dependency to a toolchain with dynamic library supported
>   since the static situation is not correctly detected (suggested by
> 		 arnout at mind.be and thomas.petazzoni at free-electrons.com)
> ---
> Changes v2 -> v3:
>  - use the release tarball instead of the git repository (suggested by
> 		 arnout at mind.be)
>  - fix the Licence (suggested by arnout at mind.be)
>  - add upstream and locally compute .hash (suggested by
> 		 arnout at mind.be)
> ---
> Changes v1 -> v2:
>  - used AUTORECONF option (suggested by romain.naour at openwide.fr)
>  - removed useless CONFIGURE_CMDS (suggested by romain.naour at openwide.fr)

It's almost done but I noticed that the cppunit documentation is generated with
doxygen because the configure script doesn't handle one of these option:
--disable-doc, --disable-docs, --disable-documentation

The build will fail if doxygen is not found on the system (which is generally
the case in auto-builders)

I have attached a patch that implement --disable-docs option but since it touch
the configure.ac file, the package will need again CPPUNIT_AUTORECONF = YES.

Can you please integrate this patch in v5.
In the same time I'll upstream it.

Best regards,
-- 
Romain Naour

OPEN WIDE Ing?nierie - Paris
23/25, rue Daviel| 75013 PARIS
http://ingenierie.openwide.fr

Le blog des technologies libres et embarqu?es :
http://www.linuxembedded.fr
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-add-option-to-disable-documentations.patch
Type: text/x-patch
Size: 1254 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141028/ac50072b/attachment.bin>
