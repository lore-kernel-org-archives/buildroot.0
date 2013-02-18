From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 18 Feb 2013 08:27:14 +0100
Subject: [Buildroot] [PATCH] neard: fix build with kernel headers 3.1 -
	3.6
In-Reply-To: <87621qmvzc.fsf@dell.be.48ers.dk>
References: <1361034167-10068-1-git-send-email-arnout@mind.be>
 <1361036067-26971-1-git-send-email-arnout@mind.be>
 <87621qmvzc.fsf@dell.be.48ers.dk>
Message-ID: <5121D7D2.1000401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/02/13 23:11, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
>
>   Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
>   Arnout> neard uses the linux/nfc.h header which is fairly recent, so we have a
>   Arnout> patch that creates linux-nfc.h and uses it if necessary. However, since
>   Arnout> the bump to 0.9, neard uses some symbols that are introduced in linux 3.7
>   Arnout> so the build fails with headers 3.1 (which introduced nfc.h) to 3.6.
>
>   Arnout> To resolve that, add a check for one of the newly introduced symbols
>   Arnout> (that is used by neard).
>
>   Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>   Arnout> ---
>   Arnout> v2: Forgot to include <sys/socket.h>.
>
>   Arnout> Probably wanted for 2013.02.
>
> Committed, thanks. Don't forget to send upstream.

  Thomas, did you ever send the original patch upstream?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
