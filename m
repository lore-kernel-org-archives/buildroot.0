From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 06 Oct 2012 00:54:49 +0200
Subject: [Buildroot] Building FFMPEG fails
In-Reply-To: <A2DF5FFD542E4E4DBE52600E0292D017@JohanW7>
References: <B8BCA720FEFB473BBD1EACE9016F23C5@JohanW7>
 <87fw5tzdze.fsf@macbook.be.48ers.dk>
 <A2DF5FFD542E4E4DBE52600E0292D017@JohanW7>
Message-ID: <506F6539.2060205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/10/12 12:32, Sagaert Johan wrote:
> Right, its mplayer build that is complaining
>
> Here is more detail and the config file.
>
> It seems to be caused bij some optimzed assembly code : Error: selected processor does not support ARM mode `vld1.32
> {d2[],d3[]},[sl,:32]'

  Note that the ffmpeg package itself seems to have a similar problem:
http://autobuild.buildroot.net/results/847efc70592069af475e5b528f9bc4814df04f94/build-end.log

  But with current master and your configuration, ffmpeg seems to work.


  Anyway, you need to pass -mfpu=neon -mfloat-abi=softfp to the compiler.
Patch follows.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
