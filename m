From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 06 May 2012 13:27:22 +0200
Subject: [Buildroot] [PATCH resend] directfb: add support for davinci
	gfx driver
In-Reply-To: <87obq3f16o.fsf@macbook.be.48ers.dk>
References: <1335631844-15681-1-git-send-email-arnout@mind.be>
 <87obq3f16o.fsf@macbook.be.48ers.dk>
Message-ID: <4FA6601A.60203@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/05/12 11:05, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>  writes:
>
>   Arnout>  Signed-off-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
>   Arnout>  ---
>   Arnout>   package/directfb/Config.in   |    4 ++++
>   Arnout>   package/directfb/directfb.mk |    3 ++-
>   Arnout>   2 files changed, 6 insertions(+), 1 deletion(-)
>
> This seems to fail on the autobuilder:
>
> http://autobuild.buildroot.org/results/d5c2cb226757a8bf90dac33bd04f87f325654220/build-end.log
>
> For some odd reason, I don't see the davincifb.h file in the directfb
> tarball, but it IS in git:
>
> http://git.directfb.org/?p=core/DirectFB.git;a=tree;f=gfxdrivers/davinci;h=f0bd9ad6add6164f3a5e953d4eed4056315a2be2;hb=ab0d779e85cec22c7c2e7b8b6b1976049b1ba0f1
>
> Is it working for you? If so, how?

  davincifb.h is the kernel header file which contains the davinci-specific
interfaces.  Unfortunately the davinci stuff doesn't get upstreamed, so you
need a davinci-specific fork like
git://arago-project.org/git/projects/linux-davinci.git

  I thought I tested it with davinci-specific kernel headers, but I can't
find the output anymore and I can't reproduce it...

  One solution would be to add includethe davincifb.h file with a buildroot
patch. However, I don't have a davinci board anymore so I can't even test
if it works.

  Therefore, I prefer to revert the patch.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
