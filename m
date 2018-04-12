From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Thu, 12 Apr 2018 19:18:33 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-04-11
In-Reply-To: <20180412060058.042A020894@mail.bootlin.com>
References: <20180412060058.042A020894@mail.bootlin.com>
Message-ID: <CAPP7BN3Ji2+tfo7SzWr0W2T7vY=nbJ0s7NLZuYAZyEKNVmGggg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

2018-04-12 8:00 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:
> Hello,
>
> Build statistics for 2018-04-11
> ===============================
>
>       branch |  OK | NOK | TIM | TOT |
>    2018.02.x |  28 |   8 |   0 |  36 |
>       master | 189 |  76 |   1 | 266 |
>
> Results for branch '2018.02.x'
> ==============================
>
> Classification of failures by reason
> ------------------------------------
>
>                    flann-1.9.1 | 6
>                 poppler-0.59.0 | 1
>               wireshark-2.2.14 | 1
>
>
> Detail of failures
> ------------------
>
>          arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/24f4fc495f1e81ebcb31a4b432670a42290a5317 |
>       mipsel |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/4df04b0489ca50d906483ca9d1bdadd3a3b10633 |
>     mips64el |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/8d5ed2fba49f5fbf7a65931913c1d37927fa7eda |
>     mips64el |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/32fb22b356cf122fd0205e539336cfe8e1ec5a61 |
>      sparc64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/021e3fccdb2b1551b0abba311dd8b7cbe7a881f5 |
>       xtensa |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/cc903c7ef10adac59bfe2012037fca254dfda514 |
>          arm |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/c37a68ac00b5df7a2da1a8b253eed1d53f22fdc5 |
>        nios2 |               wireshark-2.2.14 | NOK | http://autobuild.buildroot.net/results/f9b72ab9a2dddf6119b77d64a219f91682e87b9e | ORPH
>
> Results for branch 'master'
> ===========================
>
> Classification of failures by reason
> ------------------------------------
>
>                   zeromq-4.2.5 | 14
>                      lxc-3.0.0 | 13
> dtv-scan-tables-07b18ecef17... | 10
>                libglib2-2.56.1 | 6
>                    flann-1.9.1 | 5
>                   host-go-1.10 | 4
> gst1-interpipe-10dba89eecc2... | 3
>                libcap-ng-0.7.9 | 3
>              expect-2014-05-02 | 2
>                libupnpp-0.16.1 | 2
>                    picocom-3.1 | 2
>                   udftools-2.0 | 2
>           usb_modeswitch-2.5.2 | 2
> x264-7d0ff22e8c96de126be9d3... | 2
>                     host-guile | 1
> host-imx-mkimage-rel_imx_4.... | 1

This error is due to a missing host dependency to zlib. So a simple
HOST_IMX_MKIMAGE_DEPENDENCIES = host-zlib  solves it.
But before I send in the patch I have a question. I can't figure out
if I need to add anything about libz in Config.in.host for package
imx-mkimage. If I add "selects BR_PACKAGE_ZLIB" it will select zlib
and build it for target as well, which is not really needed. How do I
handle this in a correct way?


>            host-mono-5.4.0.201 | 1
>              qt5location-5.6.3 | 1
>    qt5quickcontrols-legal-info | 1
>                 snort-2.9.11.1 | 1
>                    wmctrl-1.07 | 1
>
>
> Detail of failures
> ------------------
>
>         bfin | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/e3b5a5ae4659900a663c2a9b7422733792e67b7d |
>          sh4 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/c09d8b121b3fb5778cd8c4b92e2c7e47e2ac86fe |
>        sparc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/996770a862232b733accd6fbdb23152cfb2ca5a6 |
>          arc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/1280d843589c11e5b82091802bab80bff9e7798c |
>        nios2 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/62341a650a26d2653f722c1b06f91fd4849c1ece |
>     mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/2c5f889b032c91e713be35c09ff1400e7283caa6 |
>        nios2 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/893ded1eba658f4d4676a4faa362ad6c7aa7cad2 |
> microblazeel | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/2916cfef73f394491148893aebf4864793ea0626 |
>          arc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/9b584a624bb08c5ab6d977b93f4b92ed4bd1d40f |
>      aarch64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/b418394f679ad269d587753302c540036793334c |
>         i686 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/2dac656fc3829288b2fd4386cbb0f5c24560f26b | ORPH
>          arc |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/8e89e0fe4b9699f469133c32c36082585e66c0a3 | ORPH
>          arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/4871cc1dd8761359f7bd388c974f67d43ca33eb6 |
>     mips64el |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/859df4479af6f44a5088ab1a98f25c7fbf2ed087 |
>         bfin |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/df5dd1c539a27eb9c45a3e742944d9c7ef0fc577 |
>      sparc64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/7a52f1398f50e8355ea6bf848f269401069fd3c6 |
>         i586 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/3d1540ba5c67030e8e7f5e5a52ca9bf1622ec125 |
>         mips | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/ae4561167dc3eeabd34ed5fc73773bb498a4623e |
>          arm | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/e3689689eb27b55db893e99e006d4c2357fab0b9 |
>      powerpc | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/7a88d1aa9ea155f1527d2fa141207c676af85298 |
>       x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/1e240ffe33fe64723776e9f9939fffc96444bbf3 | ORPH
>       x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/c5e1f66ffaa3c7c535b269a0d86aa86242651859 | ORPH
>       x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/8c2a1e87e20974e9f3271aaba28baddf8439e502 | ORPH
>       x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/629992c71197e731a42328af89829a96391da8a6 | ORPH
>          arm |                     host-guile | TIM | http://autobuild.buildroot.net/results/2722da66ec9c59c48993fb05ebe3db11d9ab886a |
> microblazeel | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/00d284b4841c7ec89475d509d5b8a8df8437ee3a |
>          arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/4cfceec1191efd790210e64bca43d9c990a91956 |
>          arm |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/f1db36827d1ac1f16e86ac3e5bcabd3e254df182 |
>          arm |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/cf83c965327783ed26e03d5a534bc1be1b36bf62 |
>          arm |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/27a3d8f40aa882f7106142d94023cd4f7500e18d |
>         or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/5a64334eb1859f0d666ff37eea793597eb5da7bc |
>         or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/002f486d0e98270265492f4b3ef4ae0d3130176a |
>         or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/c4a429aceb7df082d69bd8946759a6e014d22a69 |
>         or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/861bd73b76a4121c3ce24080f1c5dd638a90462c |
>         or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/4b8e28731e24f4e7d5296f2ac75f4069fb16d142 |
>         or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/7780a27507c83b029cbb6b756e59a0c2ccad8594 |
>         m68k |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/f1092dfd7db8532722721fb295090bea91d3f91f |
>          arm |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/60e898d8821f755cec27b9e7aec987349dc1d495 |
>          arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/049ba991d804da092c9c8ab823a492b0c16ef6c3 |
>          arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/7c1c71a1d9a070f36f607f1f14f727d8f23cd326 |
>         i686 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/f37c1a71af2800328f0b176968c2c4afb510cd84 |
>          arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/8d659e74d3157407d5513a48c62f4f39f6b9ba07 |
>         i586 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/187d511e53760723973629c0a9dc7c48fdb791bc |
>  powerpc64le |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/a158aeecada8d6f5a66dd250de798f87fde613d0 |
>        nios2 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/3dbf704ecc188d0ce2ffd2b678e818249439b7f7 |
>         i586 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/d663b956fb958ef4e22f66323979969e88139eee |
>          arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/45d462e616e70e787e3d3a61a8a6575a3dc6c968 |
>      aarch64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/94d5dd2d28d4fb1b2133a80aae1a3db6328abf9c |
>          arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/8112581c98816380a58afc4867e2bea86b3e2246 |
>         m68k |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/2abc765ff3be88b74ab359d2dc3d997d8bd01e44 |
>          arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/803f87bc74be0bfdea17691218aa67f517a6f626 |
>         i586 |                    picocom-3.1 | NOK | http://autobuild.buildroot.net/results/201491160b7116d603c50c7450a3c84f22d066bc |
>         i586 |                    picocom-3.1 | NOK | http://autobuild.buildroot.net/results/f5f2f21860d8a580df2b8efa7dcf810dadc321e9 |
>      powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/2937bb52f8738003173e37adca74e4e907816e7b |
>          arm |    qt5quickcontrols-legal-info | NOK | http://autobuild.buildroot.net/results/7da4bafa06056516739b9912ded2d171f34a8f3c |
>        sparc |                 snort-2.9.11.1 | NOK | http://autobuild.buildroot.net/results/9c6b02407227c228ee7dac8d17cd7001a381f12e |
>          arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/8ec3cd23e673dd98c6992fd2520ecee25850ed7a |
>          arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/df911cce6748810092cd223f038a10450920c084 |
> microblazeel |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/7cc3e7e16e1c9e98ceb5fadc6c510a2ed89f7a02 | ORPH
> microblazeel |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/92e874b13e166b16ae5def62ea9bd62e13071958 | ORPH
>      sparc64 |                    wmctrl-1.07 | NOK | http://autobuild.buildroot.net/results/613238a5400fd7cfbf2f0c516302dc19135078ce |
>          arm | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/49447491c10c593f32dc678d9fcc5373cf281f58 |
>          arm | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/fe2597e1b572a1a7fc14ef320f67d3620e0cf064 |
> microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/7cd956b8a00c8ad42a58b42f9e7c87f47956b5c5 | ORPH
>          arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/d24f8ce8e454d796a2368a5c798431bc4d7eee59 | ORPH
>         m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/dd84c1538031f2960b6fe0ebaf1f13cbcb3ad343 | ORPH
>         m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/b7667d9fd317f6f039d448e8f5fc607dafc092cb | ORPH
>         m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/05060cd54dfff5cd429dce44bb1b9ffb02f910ff | ORPH
> microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/caae8d89e3970038ca9e86b92c9e92504cb0b660 | ORPH
>          arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/c4fe951d976d2d5797e468900cfb29098a9ed222 | ORPH
>       xtensa |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/d467ea48f119ca51fbc292323cab61220a78823d | ORPH
> microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/46aa818851a8b0821dc49a4febe069af977e1f70 | ORPH
> microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/7fc644999c75aef5c41c598151e4643ad945193d | ORPH
>        sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/ad7a6758dbaef786555ef5cae6158e4d5fafa14b | ORPH
> microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/bc1caf6a84b1613647ee748f939b0c99f90a2d1a | ORPH
> microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/6527c49763b66a09fe11ee0794ca6f466af356f9 | ORPH
>         m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/ecdafe1263cc46d080e1cb43f038bfb98d15cc31 | ORPH
>
>
> --
> http://autobuild.buildroot.net
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Best regards,
Erik
