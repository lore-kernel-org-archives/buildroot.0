From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 20 Oct 2012 18:52:33 +0200
Subject: [Buildroot] [PATCH 10/13] Add update-all-config target
In-Reply-To: <5082D5B1.1020609@mind.be>
References: <20121013231344.17317.92930.stgit@localhost>
 <20121013231438.17317.13801.stgit@localhost>
 <CAAXf6LWwO6OkBhz03vsBekTWv4=9Bb7eO-sskvzhdTCD58K7oA@mail.gmail.com>
 <5082D5B1.1020609@mind.be>
Message-ID: <5082D6D1.6010508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/10/12 18:47, Arnout Vandecappelle wrote:
>> - forced copy
>
>   Ah, except that cp -f doesn't mean forced copy; it means: remove an
> already existing file before the copy. That means that permissions are
> lost and if it's a symlink, it's not the file it points to that gets
> updated. So I think cp -f is _not_ what we want here...

  Wrong again, Arnout :-(  The -f only removes the symlink it the file
couldn't be written to in the first place, so it's OK to have it.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
