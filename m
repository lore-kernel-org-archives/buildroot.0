From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 08:42:21 +0100
Subject: [Buildroot] [PATCH v2 1/2] trousers: new package
In-Reply-To: <1446659225-30438-1-git-send-email-nrubinstein@aldebaran.com>
References: <1446659225-30438-1-git-send-email-nrubinstein@aldebaran.com>
Message-ID: <20151224084221.12044000@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear No? Rubinstein,

On Wed,  4 Nov 2015 18:47:04 +0100, No? Rubinstein wrote:
> Signed-off-by: Al West <al.west@v-nova.com>
> Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>
> 
> ---

I've applied, but there were a number of remaining issues that had to
be fixed:

    [Thomas:
     - use a 'select' instead of a 'depends on' for openssl
     - select libiconv when locale support is not available, otherwise the
       build fails due to missing iconv.h
     - disable on BR2_STATIC_LIBS configurations as it doesn't build. It
       could be made to build by patching the trousers Makefile.
     - add missing dependency on thread support in the toolchain
     - add Config.in comment about the thread and dynamic library
       dependencies.
     - add missing <pkg>_LICENSE and <pkg>_LICENSE_FILES variables.]

Please monitor autobuild.buildroot.org in the coming days to see if
there are any failures related to this new package.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
