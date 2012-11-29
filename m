From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 29 Nov 2012 21:27:56 +0100
Subject: [Buildroot] Problem building libglib2
In-Reply-To: <201211300731.53056.manningc2@actrix.gen.nz>
References: <CAE21AQquyvDfegH5f8FebeE8LFTnOY3r75Yuy6ZpWs72uD80MQ@mail.gmail.com>
 <201211300652.45293.manningc2@actrix.gen.nz> <20121129190813.5dc97298@skate>
 <201211300731.53056.manningc2@actrix.gen.nz>
Message-ID: <50B7C54C.3010103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/11/12 19:31, Charles Manning wrote:
> export
> PKG_CONFIG_SYSROOT_DIR=/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi

  That's the one.

  Charles, could you verify by setting this variable and rebuilding libglib2:

PKG_CONFIG_SYSROOT_DIR=/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi \
     make libglib2-dirclean libglib2


  All,

  We could obviously solve this by unexporting PKG_CONFIG_SYSROOT_DIR, but
perhaps the better approach is to remove those environment variables from our
custom pkgconf?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
