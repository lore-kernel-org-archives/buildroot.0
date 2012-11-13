From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Nov 2012 00:06:34 +0100
Subject: [Buildroot] libgomp.so.1.0.0 not in target image
In-Reply-To: <20121113231021.6995bd28@skate>
References: <CABtOAfzcjFWUVELMn0X4fRF8fcdqBL5HsBzo7sw1wt8JJc+Ghw@mail.gmail.com>
 <50A284A8.9070304@mind.be> <20121113231021.6995bd28@skate>
Message-ID: <50A2D27A.5000706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/11/12 23:10, Thomas Petazzoni wrote:
> Arnout,
>
> On Tue, 13 Nov 2012 18:34:32 +0100, Arnout Vandecappelle wrote:
>
>>    Thomas, I think this should be fixed by adding libgomp to
>> LIB_EXTERNAL_LIBS in ext-tool.mk.  Is that right?  Will that also
>> work if libgomp doesn't exist?
>
> Do we really need to be linked against libgomp? Under what conditions
> does that happen? Can't we avoid that even if the toolchain has OpenMP
> support?

  beecrypt links agains libgomp if libgomp is available; rpm uses beecrypt.

  The point is not avoiding to link with libgomp (you have to do that explicitly),
the point is that if somebody links against libgomp, it has to be in target.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
