From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Nov 2013 18:03:52 +0100
Subject: [Buildroot] [git commit] udisks: only build documentation if
 requested
In-Reply-To: <CAAXf6LWDaws1VFNq77tLJXtOgafg3DQ-7J6k3xGXznn5ta_PsA@mail.gmail.com>
References: <20131119225051.6B8BB9BD38@busybox.osuosl.org>
 <CAAXf6LU97aF9Fj2a=0XYcCZLnsXWnWJk29bXQRz-5CHEsUa5zQ@mail.gmail.com>
 <87hab7v5rq.fsf@dell.be.48ers.dk>
 <CAAXf6LWDaws1VFNq77tLJXtOgafg3DQ-7J6k3xGXznn5ta_PsA@mail.gmail.com>
Message-ID: <528CEB78.1050203@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/11/13 09:27, Thomas De Schampheleire wrote:
> On Wed, Nov 20, 2013 at 9:25 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>>
>>   >> -UDISKS_CONF_OPT = --disable-remote-access
>>   >> +UDISKS_CONF_OPT = --disable-remote-access \
>>   >> +       $(if $(BR2_HAVE_DOCUMENTATION),,--disable-man-pages)
>>
>>   > Since BR2_HAVE_DOCUMENTATION is deprecated, shouldn't we disable the
>>   > man pages unconditionally?
>>
>> We could, but so far we haven't removed BR2_HAVE_DOCUMENTATION, so I
>> kept it for now.
>>
>> I'm planning on removing the option very soon in the 2014.02 cycle.
>
> Ok, great.
> Do we have an overview when which deprecated features will be removed?

  For reference, here's a list of when things were deprecated:

2012-11-10 BR2_HAVE_DOCUMENTATION
2013-09-19 BR2_INSTALL_OBJC
2013-09-19 BR2_INSTALL_FORTRAN
2013-01-24 BR2_GDB_VERSION_7_2
2013-01-24 BR2_GDB_VERSION_7_3
2012-12-11 BR2_KERNEL_HEADERS_3_1
2012-12-11 BR2_KERNEL_HEADERS_3_3
2012-12-11 BR2_KERNEL_HEADERS_3_5
2013-03-01 BR2_KERNEL_HEADERS_3_6
2013-04-05 BR2_KERNEL_HEADERS_3_7
2013-06-08 BR2_KERNEL_HEADERS_3_8
2013-09-03 BR2_KERNEL_HEADERS_3_9
2010-04-09 BR2_PACKAGE_SQUASHFS3 (therefore BR2_TARGET_ROOTFS_SQUASHFS3)
2012-11-10 BR2_PACKAGE_AUTOCONF
2012-11-10 BR2_PACKAGE_AUTOMAKE
2012-12-09 BR2_PACKAGE_CCACHE
2010-09-20 BR2_PACKAGE_LZMA
2012-11-03 BR2_PACKAGE_NETKITBASE
2012-11-03 BR2_PACKAGE_NETKITTELNET
2012-10-22 BR2_PACKAGE_PKG_CONFIG
2012-03-18 BR2_PACKAGE_TTCP
2013-03-25 BR2_PACKAGE_VALA
2012-12-18 BR2_PACKAGE_XSTROKE

  Note: it's quite a bit of work to generate this list since I didn't 
find a way to do it automatically, so I propose to save it somewhere :-)

  As to which ones can be removed: I think that things should be kept 
around for at least a year (i.e. 4 releases), to give users a little bit 
of time to react. So that means that everything that was deprecated 
before 2013 can be removed.

  Regards,
  Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
