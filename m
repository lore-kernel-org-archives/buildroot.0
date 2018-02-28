From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 28 Feb 2018 13:28:34 +0100
Subject: [Buildroot] Bug: buildroot failed when build asterisk 13.19
In-Reply-To: <1519819249.769725505@f221.i.mail.ru>
References: <1519819249.769725505@f221.i.mail.ru>
Message-ID: <20180228132834.4c7b4ec3@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Zyama,

On Wed, 28 Feb 2018 15:00:49 +0300, ***** ***** <zyama.abel@mail.ru> wrote:

> Why happens fail when I build asterisk 13.19 with buildroot-2018.02-rc2 ?
> I modified file ./package/asterisk/asterisk.mk typed version 13.19.0
> 
> Log buildroot:
> ============================================================================================================================
> 
> root at container_debian_9_stretch:/buildroot# make
> 
> host-asterisk 13.19.0 Downloading
> --2018-02-27 19:24:13--? https://github.com/asterisk/asterisk/archive/13.19.0/asterisk-13.19.0.tar.gz
> Resolving proxy.domain.lan (proxy.domain.lan)... 148.54.5.8
> Connecting to proxy.domain.lan (proxy.domain.lan)|148.54.5.8|:3128... connected.
> Proxy request sent, awaiting response... 302 Found
> Location: https://codeload.github.com/asterisk/asterisk/tar.gz/13.19.0 [following]
> --2018-02-27 19:24:14--? https://codeload.github.com/asterisk/asterisk/tar.gz/13.19.0
> Connecting to proxy.domain.lan (proxy.domain.lan)|148.54.5.8|:3128... connected.
> Proxy request sent, awaiting response... 200 OK
> Length: 8892922 (8.5M) [application/x-gzip]
> Saving to: '/buildroot/output/build/.asterisk-13.19.0.tar.gz.tfl1T2/output'
> 
> /buildroot/output/build/.asterisk-13.19.0.tar.gz.tfl1T2/ou 100%[======================================================================================================================================>]? ?8.48M? 2.37MB/s? ? in 3.6s
> 
> 2018-02-27 19:24:18 (2.37 MB/s) - '/buildroot/output/build/.asterisk-13.19.0.tar.gz.tfl1T2/output' saved [8892922/8892922]
> 
> ERROR: No hash found for asterisk-13.19.0.tar.gz

This line is the key to your problem, you need to adjust the content
of the  file package/asterisk/asterisk.hash to contain a valid hash
for asterisk-13.19.0.tar.gz (or remove the file completely)...

Regards,
Peter

> --2018-02-27 19:24:18--? http://sources.buildroot.net/asterisk-13.19.0.tar.gz
> Resolving proxy.domain.lan (proxy.domain.lan)... 148.54.5.8
> Connecting to proxy.domain.lan (proxy.domain.lan)|148.54.5.8|:3128... connected.
> Proxy request sent, awaiting response... 404 Not Found
> 2018-02-27 19:24:18 ERROR 404: Not Found.? ? ? ? ? ? ? ? ? ?<------------ file not found (asterisk-13.19.0) http://sources.buildroot.net
> 
> package/pkg-generic.mk:159: recipe for target '/buildroot/output/build/host-asterisk-13.19.0/.stamp_downloaded' failed
> make: *** [/buildroot/output/build/host-asterisk-13.19.0/.stamp_downloaded] Error 1
> root at container_debian_9_stretch:/buildroot#
> 
> Site http://sources.buildroot.net contain asterisk 14.x version only.
> ============================================================================================================================
> assimp-v3.2.tar.gz? ? 2015-Dec-28 23:05:09? ? 32.1M? ? application/x-gtar-compressed
> asterisk-1.6.0-beta6.tar.gz? ? 2008-Sep-04 01:10:21? ? 12.4M? ? application/x-gtar-compressed
> asterisk-14.5.0.tar.gz? ? 2017-Sep-25 10:04:22? ? 8.5M? ? application/x-gtar-compressed
> asterisk-14.6.2.tar.gz? ? 2018-Jan-08 03:18:52? ? 8.5M? ? application/x-gtar-compressed
> asterisk-14.7.5.tar.gz? ? 2018-Jan-22 11:16:04? ? 8.6M? ? application/x-gtar-compressed
> asterisk-14.7.6.tar.gz? ? 2018-Feb-26 04:16:20? ? 8.6M? ? application/x-gtar-compressed
> asterisk-core-sounds-en-gsm-1.5.tar.gz? ? 2017-Sep-25 10:04:25? ? 2.3M? ? application/x-gtar-compressed
> asterisk-moh-opsound-wav-2.03.tar.gz? ? 2017-Sep-25 10:04:40? ? 14.6M? ? application/x-gtar-compressed
> at_3.1.10.tar.gz? ? 2006-Jan-03 07:32:05? ? 96.8K? ? application/x-gtar-compressed
> 
