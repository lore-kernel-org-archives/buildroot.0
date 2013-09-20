From: Michael Rommel <rommel@layer-7.net>
Date: Fri, 20 Sep 2013 10:29:43 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-09-19
In-Reply-To: <20130920063008.7C55952C101@lolut.humanoidz.org>
References: <20130920063008.7C55952C101@lolut.humanoidz.org>
Message-ID: <B0A6FFF3-ACCB-44F1-8C5E-03E88849F4D5@layer-7.net>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net


Hi Thomas,

I wanted to look after the pyzmq package, as I submitted it.

The build log says:
[7m>>> python-pyzmq 13.1.0 Downloading[27m
--2013-09-19 11:47:40--  https://pypi.python.org/packages/source/p/pyzmq/pyzmq-13.1.0.tar.gz
Resolving pypi.python.org... 185.31.16.184, 185.31.16.185
Connecting to pypi.python.org|185.31.16.184|:443... connected.
ERROR: certificate common name `*.a.ssl.fastly.net' doesn't match requested host name `pypi.python.org'.
To connect to pypi.python.org insecurely, use `--no-check-certificate'.
--2013-09-19 11:47:40--  http://sources.buildroot.net//pyzmq-13.1.0.tar.gz
Resolving sources.buildroot.net... 176.9.16.109
Connecting to sources.buildroot.net|176.9.16.109|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2013-09-19 11:47:40 ERROR 404: Not Found.

make: *** [/home/test/test/3/output/build/python-pyzmq-13.1.0/.stamp_downloaded] Error 1

indicating a download error. Now I have no idea, why the script changes to http://sources.buildroot.net//pyzmq-13.1.0.tar.gz.

I have investigated the certificate "error", which in fact is none, because if you look at the actual sent cert, you see that in the Alternative name section, pypi.python.org is listed.
Maybe the fetch program incorrectly does not evaluate this section?

Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number:
            06:a5:04:45:f8:94:ac:a5:77:53:fe:64:5c:1d:55:3c
        Signature Algorithm: sha1WithRSAEncryption
        Issuer: C=US, O=DigiCert Inc, OU=www.digicert.com, CN=DigiCert High Assurance CA-3
        Validity
            Not Before: Jan 18 00:00:00 2013 GMT
            Not After : Jan 23 12:00:00 2014 GMT
        Subject: C=US, ST=California, L=San Francisco, O=Fastly, Inc., CN=*.a.ssl.fastly.net
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
            RSA Public Key: (2048 bit)
                Modulus (2048 bit):
                    00:ba:32:b2:a1:cc:05:71:19:31:56:5f:b7:f7:29:
                    c6:50:76:c6:25:60:f0:80:32:65:0d:fa:a4:5d:01:
                    42:d1:38:66:63:97:96:5b:fd:c8:ff:69:de:d4:c3:
                    94:4f:42:d1:40:14:5b:31:ec:95:59:98:82:84:9d:
                    af:34:5c:4b:10:42:df:a2:00:ba:4a:11:84:a9:68:
                    ed:70:b5:04:dd:3a:36:a0:c1:4e:a5:71:e5:a6:af:
                    7b:bc:ae:3a:d0:a8:f9:5a:10:bc:e9:04:3e:b6:60:
                    49:55:6b:96:2d:3b:e6:04:9b:70:40:d4:f0:ac:5b:
                    a8:d3:33:19:69:13:1a:c0:71:87:73:d2:35:9e:e9:
                    29:12:bc:4a:ff:5c:83:08:33:2b:10:ee:ad:aa:68:
                    5d:d1:3e:8b:b1:f1:6b:c6:c3:17:4e:46:83:35:bf:
                    dd:48:b0:76:d4:2a:f5:53:a7:92:e6:15:09:0e:6e:
                    c5:f5:88:68:a3:42:91:29:e6:44:9b:ec:25:34:02:
                    1b:95:7b:39:a5:ff:e3:9c:e9:13:f2:f8:09:b6:99:
                    87:2f:a6:9e:51:61:63:64:61:c4:82:1c:d2:ad:2f:
                    ed:af:6d:bb:c8:c4:30:62:3e:c9:d4:43:5d:17:b4:
                    79:90:f9:41:b6:f2:67:ad:9d:17:d3:c4:9a:49:d5:
                    37:ff
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Authority Key Identifier: 
                keyid:50:EA:73:89:DB:29:FB:10:8F:9E:E5:01:20:D4:DE:79:99:48:83:F7

            X509v3 Subject Key Identifier: 
                CC:69:24:A5:0A:C1:E4:BD:36:1B:6E:55:2B:E1:87:8D:D6:F0:33:ED
            X509v3 Subject Alternative Name: 
                DNS:*.a.ssl.fastly.net, DNS:fast.wistia.com, DNS:purge.fastly.net, DNS:app.fastly.com, DNS:api.fastly.com, DNS:www.fastly.com, DNS:blog.fastly.com, DNS:mirrors.fastly.net, DNS:*.imgix.net, DNS:api.metacpan.org, DNS:www.metacpan.org, DNS:signin.epek.com, DNS:*.parsecdn.com, DNS:*.fastssl.net, DNS:voxer.com, DNS:www.voxer.com, DNS:*.firebase.com, DNS:sites.yammer.com, DNS:sites.staging.yammer.com, DNS:*.skimlinks.com, DNS:*.skimresources.com, DNS:assets.wantful.com, DNS:cdn.shazam.com, DNS:cdn.thinglink.me, DNS:*.fitbit.com, DNS:beta.fastly.com, DNS:*.hosts.fastly.net, DNS:control.fastly.net, DNS:*.perfectaudience.com, DNS:*.wikia-inc.com, DNS:*.wikia.com, DNS:f.cloud.github.com, DNS:*.digitalscirocco.net, DNS:*.etsy.com, DNS:*.etsystatic.com, DNS:*.addthis.com, DNS:*.addthiscdn.com, DNS:fast.wistia.net, DNS:raw.github.com, DNS:www.userfox.com, DNS:www.shazam.com, DNS:*.assets-yammer.com, DNS:*.staging.assets-yammer.com, DNS:assets.huggies-cdn.net, DNS:beacon.fastly.com, DNS:api.kinja.com, DNS:orbit.shazamid.com, DNS:about.jstor.org, DNS:*.global.ssl.fastly.net, DNS:web.voxer.com, DNS:pypi.python.org, DNS:*.12wbt.com, DNS:www.holderdeord.no, DNS:secured.resources.infolinks.com, DNS:secured.indn.infolinks.com, DNS:play.vidyard.com, DNS:play-staging.vidyard.com, DNS:secure.img.wfrcdn.com, DNS:secure.img.josscdn.com, DNS:*.gocardless.com, DNS:widgets.pinterest.com, DNS:debug.fastly.com, DNS:maintenance.fastly.com, DNS:*.7digital.com, DNS:*.7static.com, DNS:p.datadoghq.com, DNS:*.plan3.se, DNS:new.mulberry.com, DNS:www.safariflow.com, DNS:*.stelladot.com, DNS:*.stelladotstg.com, DNS:api.altmetric.com, DNS:cdn.contentful.com, DNS:tools.fastly.net, DNS:tools.fastly.com, DNS:*.huevosbuenos.com, DNS:*.goodeggs.com, DNS:www.onelogin.com, DNS:staging.www.onelogin.com, DNS:*.fastly.picmonkey.com, DNS:*.cdn.whipplehill.net, DNS:*.whipplehill.net, DNS:cdn.media34.whipplehill.net, DNS:cdn.media56.whipplehill.net, DNS:cdn.media78.whipplehill.net, DNS:cdn.media910.whipplehill.net, DNS:*.modcloth.com, DNS:*.disquscdn.com, DNS:*.jstor.org, DNS:www.flinto.com, DNS:*.dreamhost.com, DNS:*.chartbeat.com, DNS:*.hipmunk.com, DNS:content.beaverbrooks.co.uk, DNS:*.vsco.co, DNS:secure.common.csnstores.com, DNS:www.joinos.com, DNS:staging-mobile-collector.newrelic.com, DNS:*.modcloth.net, DNS:*.foursquare.com
            X509v3 Key Usage: critical
                Digital Signature, Key Encipherment
            X509v3 Extended Key Usage: 
                TLS Web Server Authentication, TLS Web Client Authentication
            X509v3 CRL Distribution Points: 
                URI:http://crl3.digicert.com/ca3-g24.crl
                URI:http://crl4.digicert.com/ca3-g24.crl

            X509v3 Certificate Policies: 
                Policy: 2.16.840.1.114412.1.1
                  CPS: http://www.digicert.com/ssl-cps-repository.htm
                  User Notice:
                    Explicit Text: 

            Authority Information Access: 
                OCSP - URI:http://ocsp.digicert.com
                CA Issuers - URI:http://cacerts.digicert.com/DigiCertHighAssuranceCA-3.crt

            X509v3 Basic Constraints: critical
                CA:FALSE








-- 
Michael Rommel, Erlangen, Germany

On Sep 20, 2013, at 8:30 , Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Build statistics for 2013-09-19
> ===============================
> 
>        success : 70 
>       failures : 63 
>       timeouts : 0  
>          TOTAL : 133
> 
> Classification of failures by reason
> ====================================
> 
>    trace-cmd-trace-cmd-v2.2.1 | 9 
>                 qt5base-5.0.2 | 4 
> make: *** [/home/test/test/... | 4 
> make: *** [/home/test/test/... | 4 
>                    orc-0.4.18 | 4 
>           python-pyzmq-13.1.0 | 3 
>                 dropwatch-1.4 | 3 
>      host-gcc-initial-4.8-arc | 3 
>               alsa-lib-1.0.26 | 3 
>                       bc-1.06 | 2 
> make: *** [/home/test/test/... | 2 
>                    ola-0.8.31 | 2 
>                      qt-4.8.5 | 1 
>             gstreamer-0.10.36 | 1 
>               w_scan-20130331 | 1 
>        host-util-linux-2.23.2 | 1 
>                  iozone-3_414 | 1 
>                  boost-1.53.0 | 1 
>               qt5script-5.0.2 | 1 
>                      icu-51.2 | 1 
>               qt5webkit-5.0.2 | 1 
>                 webkit-1.11.5 | 1 
> make: *** [/home/test/test/... | 1 
>                 omniorb-4.1.6 | 1 
>               libglib2-2.36.3 | 1 
>                directfb-1.6.3 | 1 
>                     popt-1.16 | 1 
>                 mplayer-1.1.1 | 1 
>                 libssh2-1.4.3 | 1 
>                aiccu-20070115 | 1 
>                libtirpc-0.2.2 | 1 
>                   ncftp-3.2.5 | 1 
> 
> Detail of failures
> ===================
> 
>  mips64el |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/193127bbfe0c6070194e62fbedc783d50d232a2c/
>      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/6e6b2ddee308626098dcad9208e0425536cc9f76/
>    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/09b2279ece11f56a3ce4722e8639af5d932a10b6/
>    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/aee6ed7dddd69de8520a0ebe7d97f9c758ebbf93/
>       arm |                        bc-1.06 | NOK | http://autobuild.buildroot.net/results/49d78f0528c6ecc2adfcfa17f4b09ec225c594be/
>   powerpc |                        bc-1.06 | NOK | http://autobuild.buildroot.net/results/3d50274fd7fdb4f1576d068ceda8b759a08b2fc9/
>      bfin |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/77c53ddf804b8c54a710d039b8b1beb77325214e/
>    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/33c95f8c36ca8db40648ef9f70c7aa531d520e92/
>     avr32 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/7c7b7df5695df94557e7461dcba085573645fd07/
>  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/4ebde0913a7f96e8ee78df528d47a68b8743af76/
>  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/604d68540885922aa63fd23613b5472495e71db6/
>    xtensa |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/ea9c30dcf5847b12ce33b8cd5ab3b9fa1f658694/
>       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/ff903ce970ea652cc1aa57a5eb57e923dc4c5405/
>       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/d3b2e4e32d531c08c19d39b248898fe462b81d8f/
>       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/76a2ab46ef7183f14eec944db4a598325e00b503/
>    x86_64 |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/0e2ff8e61a67a40e143a5d714a29c89afa140de8/
>      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/58b34c7729166b4ae8b585d98ed6b905530d97b8/
>     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/ce1fecd6445b10c9e43ec43f3b91eb5c8f67b34b/
>      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/6fc465d1663d276bc6bac6b9edbd0b0d63071f80/
>   powerpc |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/b68848cd8e77f7c0f7ba93efb6754d7a274cd227/
>       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/8a09a7d89073b6c74a7551864c5487de69a9af86/
>       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/14eeec85eb97fa4dc27425eb13198b1ffd6cf450/
>       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/2b452476b75cdda4bfce57b1d93fefd71301d41b/
>       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/3610be3ef00226a6fd4fd1235e7b247288c7e57f/
>      i686 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/e5c4f5e25c72430e5160308b4db7210e7877666e/
>    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/063915a55e49096a39a53f8839953f5efaec261e/
>    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/b4710a36679b516c07b37e73a815857764cab449/
>       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/73de8ca9a30642ccef8bb0181bb028d6ea9c49d1/
>    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/c22ca77ba84ba8423883f5e34a28d2c6c3a1ad51/
>       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/e91c4868fa911c7498985c72f2eb7566385764e1/
>    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/19acd48195857bffd99a703dbe05846a883f792a/
>      i686 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/5f5cc4f4a0d30da582934affba2724aeeb91d7d5/
>       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/a8f5a018f297307976bd0a1a0217c44786d864ca/
>      i686 |                    ncftp-3.2.5 | NOK | http://autobuild.buildroot.net/results/33d0fde74a5c35da7ed9c38039b581b7da8c7d27/
>   aarch64 |                     ola-0.8.31 | NOK | http://autobuild.buildroot.net/results/7d8437cda1c9f8cc3a93f28bdec2616ddebbebef/
>   aarch64 |                     ola-0.8.31 | NOK | http://autobuild.buildroot.net/results/9cba27b7e35e3639c55a95b3291111577b5834bc/
>       arm |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/61a0d3b22943623778265dad3bec9007924ab2fe/
>       arm |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/7cb544393816d62284cca9dd3381703d782841d1/
>       arm |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/8fc1e8cbd6cc3e3066056b5983d09ecd8ae659b2/
>       arm |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/8517f4e75b0a69353b8bcd55e24dbd88376006f1/
>   powerpc |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/1cdba71798ed90e69a8a5e845fe547ba25b4913a/
>      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/b5e158eb64b68dfaba92e8ac45156546c58f1bd3/
>       arm |            python-pyzmq-13.1.0 | NOK | http://autobuild.buildroot.net/results/b557fcb270c2984184715834c904c79d8c4a0868/
>   powerpc |            python-pyzmq-13.1.0 | NOK | http://autobuild.buildroot.net/results/6f624771016012f075d9082fc039dcd447bfd645/
>       arm |            python-pyzmq-13.1.0 | NOK | http://autobuild.buildroot.net/results/458d1fe1682afeb1638061e70e7005dec02c7bca/
>  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/c53eda251e8fc11d11d6fdb27a48328bd1acb465/
>       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/520dd41b93f2f82932b2308c971b5365a8c9f8da/
>    mipsel |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/436dc8c03e2f728e375013b2a9edbdd45722e7ce/
>       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/1f72b1bc6b8aa95ba3cf3081617608ee6ab2096f/
>       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/c332567f06b49b230c475b2b8a6c19b10278c17f/
>  mips64el |                qt5script-5.0.2 | NOK | http://autobuild.buildroot.net/results/8a8142676066b40fe7a03946c2fce4024aed6c56/
>   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/642f902c105592c759392a38a3c8f7aee2756965/
>   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/deb376c626bca6a5a35b1125db9e5692cd901478/
>   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/1e98d95aaacd2a976b00063820c471646003fd6e/
>   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/5ba39e047e26ff7dc9ec9cbd8b9185a3dd7cd511/
>   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/e529d92b956050ac96332a20a906a03889992ff0/
>       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/0f9c5875d8e937896446f866cb3faa3da8f2723f/
>   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/5a50f8a3b82c76192917d075050ee2334ae09119/
>   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/ab80d73398f295025887c7ad17eb1c9328277896/
>   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/510ea5d0889a6363e20f7fa14792e73d96923625/
>       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/5c69dc5b52b9b8bc3e77946bb05ec4e205fd6f16/
>       arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/5e33f7ce11a40a78fd5be8e0089814acf6d3aa3f/
>   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/31b9169ed9bd00fcf0bff8de12e0c7f382ca2dac/
> 
> 
> -- 
> http://autobuild.buildroot.net
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130920/8b867bf0/attachment-0001.html>
