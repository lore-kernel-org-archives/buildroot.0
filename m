From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 6 Feb 2019 09:47:09 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-02-05
In-Reply-To: <20190206070049.C4B9F87FA4@hemlock.osuosl.org>
References: <20190206070049.C4B9F87FA4@hemlock.osuosl.org>
Message-ID: <CANQCQpYgmHvLi9pXMey0cgRnxYYm55KXcQ=FEF3Bn5qRwd8Q1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 6, 2019 at 1:00 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Build statistics for 2019-02-05
> ===============================
>
>       branch |  OK | NOK | TIM | TOT |
>    2018.02.x |  16 |   0 |   0 |  16 |
>    2018.11.x |  15 |   0 |   0 |  15 |
>       master |  99 |  84 |   1 | 184 |
>
> Results for branch 'master'
> ===========================
>
> Classification of failures by reason
> ------------------------------------
>
>                  ibrdtnd-1.0.1 | 19
> host-android-tools-4.2.2+gi... | 9
>                      pound-2.8 | 9
>              luacrypto-0.3.2-1 | 8
>              qpid-proton-0.9.1 | 8
> host-softether-v4.22-9634-beta | 6
>                 moarvm-2017.05 | 5
>                    netsurf-3.8 | 4
>                ipmitool-1.8.18 | 3
>                  tn5250-0.17.4 | 3
>                 mongodb-r3.3.4 | 2
>                  qt5base-5.6.3 | 2

Narrowed it down to what I think is porting this series.  However it
is pretty obvious that openssl 1.1.x backend was completely rewritten
in the latest QT5.12 vs our 5.6.3.
https://codereview.qt-project.org/#/c/189399/

Other related distractions I found along the way.
(Similar activity for QT4)
https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=214691
(5.7 patch but isn't complete)
https://github.com/patch-exchange/openssl-1.1-transition/blob/master/qt5-qtbase/qtbase-5.7.0-openssl-1.1.patch
(5.9 gentoo series)
http://www.gentoofan.org/gentoo/poly-c_overlay/dev-qt/qtnetwork/files/qtnetwork-5.9.4-openssl-1.1.patch
(debian porting notes QT4)
https://lists.debian.org/debian-qt-kde/2016/06/msg01281.html

> android-tools-4.2.2+git2013... | 1
>                 clamav-0.101.1 | 1
>                 gnuchess-6.2.5 | 1
>                    luvi-v2.7.6 | 1
>           obsidian-cursors-1.0 | 1
>                     postgresql | 1
>               sqlcipher-v3.2.0 | 1
>
>
> Detail of failures
> ------------------
>
>          arm | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d77b264e5c294e022f9cceaf8b5d5bdc8a63e078 |
>      powerpc |                 clamav-0.101.1 | NOK | http://autobuild.buildroot.net/results/a3cc7d463fd9385766714f953f09d86581c95155 |
>          arm |                 gnuchess-6.2.5 | NOK | http://autobuild.buildroot.net/results/31e9b721970edfe674bc41adfe3c7ad69b872003 | ORPH
>     mips64el | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/7210623aca52661ab2e4b4f6c4417051f52471fe |
>      aarch64 | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/f034ae04a725c786d400b170b0718c02f08e24ba |
>      aarch64 | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/7b207764b28ecd0d280b0615e6598c2a3cb140ea |
>  powerpc64le | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/08edca41faaf5ae97c22bb57be93544c5f59d87f |
>       mipsel | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/3f2c2300a745bd3da9148d2f721ae62b6daea724 |
>     mips64el | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/93ee024cdaa1b5e2a34ecffc7c8b3244f708e097 |
>          arm | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/819643c1fdb1f003ad14f69121183a2bec3e838e |
>          sh4 | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/fd35034bb863d97f71724d3fa85e0bbf5cd45bd5 |
>          arm | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/068c59495fcbbde78b89b7b2bd3c17a68b79e941 |
>          arm | host-softether-v4.22-9634-beta | NOK | http://autobuild.buildroot.net/results/a6f1f326ce2525ee0f9d423f1b6d989a89e6b87e |
>       xtensa | host-softether-v4.22-9634-beta | NOK | http://autobuild.buildroot.net/results/4c0b622dbfedbdbc441ce853351655b78d00ba5c |
>          sh4 | host-softether-v4.22-9634-beta | NOK | http://autobuild.buildroot.net/results/b5a499dd3a238bc552b0836feac6a23d8b42c61a |
>         m68k | host-softether-v4.22-9634-beta | NOK | http://autobuild.buildroot.net/results/afdb64b876895ec61b39e3356b66992aa59d3c9b |
>      powerpc | host-softether-v4.22-9634-beta | NOK | http://autobuild.buildroot.net/results/6de4370ae281e0c7599989030fab621c4a06e873 |
>          arm | host-softether-v4.22-9634-beta | NOK | http://autobuild.buildroot.net/results/442d03e12aa08099a17fc6df245fba2424bd3c36 |
>      aarch64 |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/d354a8403f6ab942ff2d5f685d18243283c2365e | ORPH
>      aarch64 |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/42171eedb280af601ed45d5f6b43414eb2858138 | ORPH
>         i686 |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/ad66e9507e43ef0fe54a5c92cebbcdcd510293ec | ORPH
>     mips64el |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/d8d60c630c7856c9c0c9e6d7cae62fa49b35caed | ORPH
>     mips64el |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/a4b1cb720dac743e17c84b2d35a5361bf491ff28 | ORPH
>   aarch64_be |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/5ef8292e1dffc036310d757a8c5e3d9f84d594da | ORPH
>         m68k |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/b0cd9c9e4a651c7e63f264d81abcb9c18e68701a | ORPH
>      sparc64 |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/414d8351da81365ca9127d93e7c6facc0de512b7 | ORPH
>       xtensa |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/caf8e0a1450ac2524cb062dccc5c438d3d008c02 | ORPH
>          arc |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/0d9066a672b6528728b71cd078ec624ebf6c475b | ORPH
>      powerpc |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/be788aeb568ea11c3db5764d88af3d25c2edef93 | ORPH
>          arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/56be36dcc03dee5d2510b4945f6eb4136d1d4c86 | ORPH
>     mips64el |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/3c2746071f446d8e31abe15ebdc7d9476bacfc9b | ORPH
>          arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/38bb3027eac3455be2cafc8e300ee69a66bb49c3 | ORPH
>   aarch64_be |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/ef528e0ff6f5d2371f2bfb03ef88325e3f71da6a | ORPH
>      aarch64 |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/1fd983275c22e6ddf5567785fc67e84805516420 | ORPH
>     mips64el |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/ef6d50aeba88116ad046e541944720755f3b2369 | ORPH
>     mips64el |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/71048b3a5b9dbec2778c20e85ec3fbc4e702fe49 | ORPH
>          arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/3852a414afacbe3c044b1e49be8ccf8c554c8565 | ORPH
>        nios2 |                ipmitool-1.8.18 | NOK | http://autobuild.buildroot.net/results/19632bdb1f19cc5f9afc60840ea9b4fdb76a803e |
>       xtensa |                ipmitool-1.8.18 | NOK | http://autobuild.buildroot.net/results/2b8e58085a65cdfa8eb0d3579137575bcba7b457 |
>  powerpc64le |                ipmitool-1.8.18 | NOK | http://autobuild.buildroot.net/results/97dab568f1f3d342b6bfcb9f597ced4de6f1309e |
>     mips64el |              luacrypto-0.3.2-1 | NOK | http://autobuild.buildroot.net/results/5a8fd94f8239b463221e413607f3f3a5d2a60d03 |
>      aarch64 |              luacrypto-0.3.2-1 | NOK | http://autobuild.buildroot.net/results/d6d4b6bbe20769a191ccea18b0d957c087fb078c |
>          arm |              luacrypto-0.3.2-1 | NOK | http://autobuild.buildroot.net/results/bdb9ad82f885cf43cd3f456dbe7294347ab2c841 |
>      aarch64 |              luacrypto-0.3.2-1 | NOK | http://autobuild.buildroot.net/results/46d21cfee7d0a20f71212efd726e1bbec16003b2 |
>          arc |              luacrypto-0.3.2-1 | NOK | http://autobuild.buildroot.net/results/afdc598b80356a8301d890232466de421f7779d5 |
>      sparc64 |              luacrypto-0.3.2-1 | NOK | http://autobuild.buildroot.net/results/6ffef1fb2aebc7226899403705ddb2bad851f8be |
>       x86_64 |              luacrypto-0.3.2-1 | NOK | http://autobuild.buildroot.net/results/a53070a5d25d72af7dcf58d76ce67307ed54edc6 |
>          arm |              luacrypto-0.3.2-1 | NOK | http://autobuild.buildroot.net/results/3ae1c60eac800fd5a1a64cfe663264eed65679a7 |
>       x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/cb76134231ddc18f65514ce6f7c169faa28b0540 |
>          arm |                 moarvm-2017.05 | NOK | http://autobuild.buildroot.net/results/42edcabeb1b901ccfd2247a400bd36783818952a |
>     mips64el |                 moarvm-2017.05 | NOK | http://autobuild.buildroot.net/results/2fe9634e9caed4680bb93c884422c24a79064b2c |
>     mips64el |                 moarvm-2017.05 | NOK | http://autobuild.buildroot.net/results/40aa5376e257e084200565088255ad674a663801 |
>    powerpc64 |                 moarvm-2017.05 | NOK | http://autobuild.buildroot.net/results/ded3247cd84b6c52a04b626791c7a5ac77bb8104 |
>     mips64el |                 moarvm-2017.05 | NOK | http://autobuild.buildroot.net/results/02ff68698603ebdce5d13d3130a15b5a1ecc14d2 |
>          arm |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/d0b8ba29ad25a2921abcf31fca895aa6aa4d88e9 |
>      aarch64 |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/1fff87d10659033109f4080c023bd24f2845bdbe |
>      sparc64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/b83ef86c3ab55ca67cfe46da993a191e617adb88 |
>       xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/44112e8ad03f47125bbf4b231d800ebd5beef24b |
>          arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/ba7f57cec9a10fa771609cfdbcf772b56167832f |
>      sparc64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/a5bd8969c398fc3101ffaec4aa715a827aec5770 |
>          arc |           obsidian-cursors-1.0 | NOK | http://autobuild.buildroot.net/results/3dca055e9fd29a7f480788464ca20c259c3e2928 | ORPH
> microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/a249628cdb73bfdcd20df01044f532f4420259a4 |
>         m68k |                      pound-2.8 | NOK | http://autobuild.buildroot.net/results/df5b94e17d83b56b640c8679e4714cc5d3679418 |
>          arm |                      pound-2.8 | NOK | http://autobuild.buildroot.net/results/ef2de6c280bf8622a00d4573bc5bd143e3baa002 |
>          arm |                      pound-2.8 | NOK | http://autobuild.buildroot.net/results/5498d5b92414649ba3cd62defc0af6a8b4115c35 |
>         i686 |                      pound-2.8 | NOK | http://autobuild.buildroot.net/results/52405c4c151c636eaad14865cd8bff233b19f258 |
>      aarch64 |                      pound-2.8 | NOK | http://autobuild.buildroot.net/results/20a823b3ebe1f963de1100c650031432816ed82f |
>      riscv32 |                      pound-2.8 | NOK | http://autobuild.buildroot.net/results/61336369ebe69a57098edabdf94a47f776a0440f |
>       mipsel |                      pound-2.8 | NOK | http://autobuild.buildroot.net/results/f4b000cfc22bbdc48f07c00988375c3eeee2d434 |
>      riscv32 |                      pound-2.8 | NOK | http://autobuild.buildroot.net/results/2fedb91df8dfba02458e526b8a1d9a7d25075765 |
>       xtensa |                      pound-2.8 | NOK | http://autobuild.buildroot.net/results/10674a31c8f9e475b72d8043460f8d97e38a2465 |
>      powerpc |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/f9085f223cd54c70daf29b12e6c66edb416f7243 |
>       x86_64 |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/f6761a1fcb4e89179a4ac7103a0b5c0cdc0616de |
>          arc |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/eecaee5367d24e1f5c35647e373d8f7f67f07424 |
>          arc |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/3e843869d06b544fbb0f3a4aa52c7a5f272397fc |
>      aarch64 |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/0155a1a9aefcd04713cec31c345d58afdbe165c4 |
>      sparc64 |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/41fdf4527ec940886b2a3b00a9f47b5add4e1199 |
>      powerpc |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/e23a07c01520f78a11335a6ce3d041a70858cca5 |
>      sparc64 |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/791a24487fa0b5c046f09e62f084dfc77f62ba7f |
>          arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/4a1ed64a3e26147337856f8bb434736abaa4d96e |
>          arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/d51b1da88b8c40688b269db834cebe1de9fa496a |
>       mipsel |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/fde124a1d8976035cb40ce5bf4db46f2360e7425 |
>        nios2 |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/8c86427ef7b26bb8a82678347b213e22b17609c6 |
>      riscv32 |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/e5402f736c8f77200471d680243fc6bb66e3e5d5 |
>      powerpc |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/e0d739d700f870bc29822376c773aaec6f7be8b4 |
>
>
> --
> http://autobuild.buildroot.net
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 

Matthew Weber | Pr. Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
