From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Apr 2015 00:02:11 +0200
Subject: [Buildroot] [PATCH] ffmpeg: explicitly pass --ranlib
In-Reply-To: <XnsA47EE2C9972B5berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1429214355-29429-1-git-send-email-arnout@mind.be>
 <XnsA47EE2C9972B5berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <55303163.4090606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/04/15 22:17, Bernd Kuhls wrote:
> "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> 
> wrote in news:1429214355-29429-1-git-send-email-arnout at mind.be:
> 
>> +     --ranlib=$(TARGET_RANLIB) \
> 
> Hi,
> 
> are you sure that your patch changes the behaviour of
> http://git.videolan.org/?
> p=ffmpeg.git;a=blob;f=configure;h=c11262a66c5ce8906f1a06bb54de3ab1e964dfb0;hb
> =HEAD#l2760
> 
> when testing ranlib features?
> I am asking this because the configure options are stored into script 
> variables in line 3019[1], whereas the ranlib test occurs in line 2760 
> already.

 It doesn't change the behaviour of the ranlib_default test, but since we pass
the ranlib invocation explicitly on the commandline the default is not used. And
I did check that it solves the autobuild error (which I could reproduce locally).

 Regards,
 Arnout

> 
> Regards, Bernd
> 
> [1] http://git.videolan.org/?
> p=ffmpeg.git;a=blob;f=configure;h=c11262a66c5ce8906f1a06bb54de3ab1e964dfb0;hb
> =HEAD#l3019
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
