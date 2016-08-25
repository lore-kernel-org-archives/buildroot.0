From: Matthew Weber <matt@thewebers.ws>
Date: Thu, 25 Aug 2016 09:27:49 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-08-24
In-Reply-To: <CAFt09wM5VBzvUezTaOq1OH_2hu9RgDz_mLi5ywH2rJPrY7OnbQ@mail.gmail.com>
References: <20160825063045.2728F101CC4@stock.ovh.net>
 <CAFt09wM5VBzvUezTaOq1OH_2hu9RgDz_mLi5ywH2rJPrY7OnbQ@mail.gmail.com>
Message-ID: <CAFt09wPo1qaHBs7WMYT33=Dm3fPmf9mmijPcz1wZ2MkE3MX+iQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Thu, Aug 25, 2016 at 9:18 AM, Matthew Weber <matt@thewebers.ws> wrote:
> All,
>
> On Thu, Aug 25, 2016 at 1:30 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> Build statistics for 2016-08-24
>> ================================
>>
>>       successes : 169
>>        failures : 42
>>        timeouts : 0
>>           TOTAL : 211
>>
>> Classification of failures by reason
>> ====================================
>>
>> kmsxx-bd5f6471e619a6ba2987b... | 3
>>               libarchive-3.2.1 | 3
>>                  libraw-0.17.1 | 3
>>                   ffmpeg-2.8.7 | 2
>> iputils-55828d1fef3fed7f07a... | 2
>
> So libgpg-error needs a dependency on gettext so that the libintl
> exists when it is statically linking.  I noticed gettext has a
> "depends on BR2_USE_WCHAR" which I'd need to pull up into libgpg-error
> and the packages which use libgpg-error.....  Any thoughts on if
> that's the right way to resolve this?  Wasn't sure if a WCHAR
> limitation on libgpg-error is the right way to go as there maybe
> packages that could use libgpg-error without libintl dependencies when
> WCHAR isn't set....

Scratch that, the libintl.a/h are not present (ie gettext hasn't
build) in a "make clean iputils" build which is successful and
libgpg-error's config log shows it didn't detect the lib.   When doing
a full build "make clean all" which runs and fails, the libgpg config
log shows the same thing but gettext did build and the libintl* files
are present.  So I'm thinking I have a libgpg-error configure opts
issue where something is getting half enabled and not linking
correctly.

>
>>                  jack2-v1.9.10 | 2
>>                     libiio-0.7 | 2
>>              libxmlrpc-1.25.30 | 2
>>                binutils-2.25.1 | 1
>>                   cppcms-1.0.5 | 1
>>      docker-engine-v1.12.0-rc4 | 1
>>                domoticz-3.4834 | 1
>>         host-gcc-initial-4.9.4 | 1
>> libamcodec-6f9b99182f94be14... | 1
>>            libfreeimage-3.17.0 | 1
>>                 libmpeg2-0.5.1 | 1
>>                  liburcu-0.8.7 | 1
>>                    lldpd-0.9.4 | 1
>>                  mesa3d-12.0.1 | 1
>>                     mosh-1.2.5 | 1
>>                  mplayer-1.3.0 | 1
>>            python-psutil-4.3.0 | 1
>>              rabbitmq-c-v0.8.0 | 1
>>                 rsyslog-8.19.0 | 1
>> sconeserver-bbb384404575f8a... | 1
>>                tcpreplay-4.1.1 | 1
>>                 tinydtls-0.8.2 | 1
>>                      vlc-2.2.4 | 1
>>                wvstreams-4.6.1 | 1
>>                 xfsprogs-4.7.0 | 1
>>                   zeromq-4.1.5 | 1
>>
>>
>> Detail of failures
>> ===================
>>
>>          arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/b85e35a7df924292cbacda9c29d614ace09d53df
>>       x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/2526db8e384906cd2244b45e383e8699979729ac
>>       x86_64 |      docker-engine-v1.12.0-rc4 | NOK | http://autobuild.buildroot.net/results/cad6dcb8b8fa04a0db9dcac0daf74feed4eae6c7
>>      powerpc |                domoticz-3.4834 | NOK | http://autobuild.buildroot.net/results/393f839e160b51ca12ac36058718ad2f0c1b50a6
>>          arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/7dac04a068cd9acb03522f2e4933fd9c88363f34
>>          arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/4f59d9d84b310b1b313eec14c2c4b12c604b3434
>>          arm |         host-gcc-initial-4.9.4 | NOK | http://autobuild.buildroot.net/results/53a88fee0cb72d869458824cb1a21c31f8a47108
>>        sparc | iputils-55828d1fef3fed7f07a... | NOK | http://autobuild.buildroot.net/results/f81eabb37788aa6dcdadf4034889c84bef78b876
>>          arm | iputils-55828d1fef3fed7f07a... | NOK | http://autobuild.buildroot.net/results/f296e8fba1e79f96d3d119aa4c8207ed4b80694b
>>         sh4a |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/5cbec1eb66c1d05d0ea4232a73168c5dea1563ad
>>         i686 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/7ae1463733e40eea7c2a093132eaa1e0eb455794
>>         i586 | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/17e9584c37de7c4c3769820ac1d7d34c77cc2d49
>>          arm | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/4160ac8efbde5163ef9048ade26bf2d41f19bb1e
>>         m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/ee319c39de1566447552d0a2ed7a4f191939ca40
>>          arm | libamcodec-6f9b99182f94be14... | NOK | http://autobuild.buildroot.net/results/7ea34b48def0429534b240f1bd2f64f50046ed47
>>         m68k |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/af440562a6906bae5ab6aabf3dd3f6a077e1f2cb
>>       xtensa |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/98f950a1f79772f50a1e35273b9add20411abdbb
>>          arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/ebb4388acbfa34e635653d78cc0d55ab79fb7f32
>>          arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/428e576b7b6e297dcbf806231313e71aaa0b9657
>>         bfin |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/b14056a5a774bf04c8d270d99fa2a3041b16405f
>>         bfin |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/84091855e380cd52fb146e736be26dd08ed88679
>>          arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/f0f656c9f31d8d162b5f8ed2a1b20cfa35ad4979
>>         bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/156239901a91808b32a98f4eefb9402395ff9b0d
>>          arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/3002d195fa69bd88e0e695c5048fc15dbd54f013
>>          arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/6a993f8c102ac1034fa3c8e4cbf1b2865f5a8fb8
>>          arm |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/b216043f2a93ab7c0e5f07429a6ea82bf81b10da
>>          arm |              libxmlrpc-1.25.30 | NOK | http://autobuild.buildroot.net/results/c45530f34bf2074bd204c485615124df928f246c
>>          arm |              libxmlrpc-1.25.30 | NOK | http://autobuild.buildroot.net/results/b0091ba87f5fe8783f87952572620825e4d8b401
>>          arm |                    lldpd-0.9.4 | NOK | http://autobuild.buildroot.net/results/e6b336c6b252d0122017948341aa80e98c94a831
>>          arc |                  mesa3d-12.0.1 | NOK | http://autobuild.buildroot.net/results/f4eafcc81889ebe24cea215a288608255f272fea
>>         i586 |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/f3e56f4f4d6f434449210b8aca69b0692d9ff6b0
>>          arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/1d27af94c002f4f7251ddb3b7d6e6d25bf5fb3ce
>>       x86_64 |            python-psutil-4.3.0 | NOK | http://autobuild.buildroot.net/results/5a8130c0dfc660eae232825ce1123f31d70be791
>>          arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/50b32b24f7ed238b6fb2a0a02609cb0b2179d383
>>        sparc |                 rsyslog-8.19.0 | NOK | http://autobuild.buildroot.net/results/af60edea35a97d8515155787b5ddb47c3c0d4790
>>          arm | sconeserver-bbb384404575f8a... | NOK | http://autobuild.buildroot.net/results/fa7881c6ffb821a2aff139f95ba53c96d6e2b942
>>          arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/66938512a682cf45bbf69b42da6464c1657cefb5
>>          arm |                 tinydtls-0.8.2 | NOK | http://autobuild.buildroot.net/results/928be69f90476e6b04be3a1afd3b74112bcac0a0
>>         m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/effa7548daac03aeb15642a1b35c71f0dc7d3eec
>>          arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/cd72b0c512038dc8a35c2f230cd8b2b1851980e6
>>          arm |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/948d8e65123b666cad339018d88787f56bd611b1
>>         bfin |                   zeromq-4.1.5 | NOK | http://autobuild.buildroot.net/results/3aa73620d0f1afcc82de93069c9693e1ca755bb9
>>
>> --
>> http://autobuild.buildroot.net
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
> --
> Thanks,
> Matt



-- 
Thanks,
Matt
