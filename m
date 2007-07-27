From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 27 Jul 2007 18:24:04 +0200
Subject: [Buildroot] GCC - march=geode doesn't exist?
In-Reply-To: <20070723175420.GE9995@aon.at>
References: <469EEA03.2020304@strudel-hound.com> <20070723175420.GE9995@aon.at>
Message-ID: <20070727162404.GG25147@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

William,

On Mon, Jul 23, 2007 at 07:54:20PM +0200, Bernhard Fischer wrote:
>On Thu, Jul 19, 2007 at 02:35:15PM +1000, William Pettersson wrote:
>>Ok, so I'm still working on this Soekris, using gcc-4.2.0.  4.2.0
>>doesn't support -march=geode or -mtune=geode, but BR2_GCC_TARGET_ARCH
>>and BR2_GCC_TARGET_TUNE are both set to "geode" if you select the geode.
>> Now apparently gcc-4.3.0 has plans for a geode target, but as 4.3.0
>>isn't stable yet, I've attached a patch which makes the "geode" select
>>"i586" for BR2_GCC_TARGET_TUNE and BR2_GCC_TARGET_ARCH.
>
>Yes, somebody already mentioned about the same for itanium. I added
>those bits with just a copy of gcc-trunk at hand..
>
>Can you check your manpage of gcc-4.2 to see what itanium variants are
>supported there and fix those and geode according to:
>
>default foo if BR2_foo && BR2_GCC_VERSION_4_3
>default bar if BR2_foo && !BR2_GCC_VERSION_4_3
>
>default baz1 if BR2_baz && (BR2_GCC_VERSION_3_4 || 4_0 || 4_1)
>etc..
>
>TIA,

ping
Would be awesome if you could have a look into this..
