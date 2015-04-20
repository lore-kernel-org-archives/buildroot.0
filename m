From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 20 Apr 2015 22:54:35 +0200
Subject: [Buildroot] [PATCH v2] live555: fix library installation
In-Reply-To: <20150420113516.53c9199f@free-electrons.com>
References: <1429519351-8391-1-git-send-email-luca@lucaceresoli.net>
 <20150420113516.53c9199f@free-electrons.com>
Message-ID: <5535678B.7090506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/04/15 11:35, Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
> 
> On Mon, 20 Apr 2015 10:42:31 +0200, Luca Ceresoli wrote:
> 
>> -if BR2_PACKAGE_LIVE555
>> -
>> -config BR2_PACKAGE_LIVE555_OPENRTSP
>> -	bool "OpenRTSP"
>> -	default y
>> -	help
>> -	  Live555 RTSP Client.
>> -
>> -config BR2_PACKAGE_LIVE555_MEDIASERVER
>> -	bool "live555MediaServer"
>> -	default y
>> -	help
>> -	  RTSP Server. Supports numerous media formats such as H.264 and MPEG2.
>> -
>> -config BR2_PACKAGE_LIVE555_MPEG2_INDEXER
>> -	bool "MPEG2TransportStreamIndexer"
>> -	default y
>> -	help
>> -	  MPEG2 Transport Stream Indexer. Provides indexes allowing 'trick play'
>> -	  operation in the Live555MediaServer.
>> -
>> -endif
> 
> Config.in.legacy handling?

 Don't really see the point... It defaults to y anyway, so only someone who
explicitly disabled it in their config would care. But in that case, it won't
even show up on the legacy screen. So actually, it's better _not_ to have legacy
handling for this one IMHO.

 Regards,
 Arnout

> 
> Thanks!
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
