From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 26 Nov 2016 11:48:57 +0100
Subject: [Buildroot] [git commit] qextserialport: fix line endings in
 patch 0002
In-Reply-To: <20161125214131.8C49E80DB5@busybox.osuosl.org>
References: <20161125214131.8C49E80DB5@busybox.osuosl.org>
Message-ID: <24560a5e-b297-7406-e3ba-e9b1a933922b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Didn't I warn about this in the commit message?

 To avoid this kind of problem in the future, perhaps we should add
--ignore-whitespace to our patch calls?

 Regards,
 Arnout

On 25-11-16 22:40, Thomas Petazzoni wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=72dcc7c252e7be65ff3e66bcf5dd20b49e2de915
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/074d379e4d491dd454726bed666a7e1028333ef7/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ...Create-a-main-include-file-QExtSerialPort.patch | 23 ++++++++++------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/package/qextserialport/0002-Create-a-main-include-file-QExtSerialPort.patch b/package/qextserialport/0002-Create-a-main-include-file-QExtSerialPort.patch
> index 1f14304..e1d99f0 100644
> --- a/package/qextserialport/0002-Create-a-main-include-file-QExtSerialPort.patch
> +++ b/package/qextserialport/0002-Create-a-main-include-file-QExtSerialPort.patch
> @@ -28,16 +28,13 @@ diff --git a/src/qextserialport.pri b/src/qextserialport.pri
>  index 461d56f..f8a678d 100644
>  --- a/src/qextserialport.pri
>  +++ b/src/qextserialport.pri
> -@@ -3,7 +3,8 @@ DEPENDPATH += $$PWD
> - 
> - PUBLIC_HEADERS         += $$PWD/qextserialport.h \
> -                           $$PWD/qextserialenumerator.h \
> --                          $$PWD/qextserialport_global.h
> -+                          $$PWD/qextserialport_global.h \
> -+                          $$PWD/QExtSerialPort
> - 
> - HEADERS                += $$PUBLIC_HEADERS \
> -                           $$PWD/qextserialport_p.h \
> --- 
> -2.10.2
> -
> +@@ -3,7 +3,8 @@
> + 
> + PUBLIC_HEADERS         += $$PWD/qextserialport.h \
> +                           $$PWD/qextserialenumerator.h \
> +-                          $$PWD/qextserialport_global.h
> ++                          $$PWD/qextserialport_global.h \
> ++			  $$PWD/QExtSerialPort
> + 
> + HEADERS                += $$PUBLIC_HEADERS \
> +                           $$PWD/qextserialport_p.h \
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
