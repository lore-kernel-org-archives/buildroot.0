From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 08 Feb 2013 20:59:32 +0100
Subject: [Buildroot] Running Packages
In-Reply-To: <CAFzEKXHK58EP_KjNQA-x46YP-SXHQMoeBn_4U1DcpJ3Ho4Z7Sw@mail.gmail.com>
References: <CAFzEKXETDCU8FTapwDLP1gpTOP=y9ETGjUfrDRxUxMGtkxi-+Q@mail.gmail.com>
 <511498BE.4030108@siganos.org>
 <CAFzEKXHK58EP_KjNQA-x46YP-SXHQMoeBn_4U1DcpJ3Ho4Z7Sw@mail.gmail.com>
Message-ID: <51155924.5080206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/02/13 16:21, Aditya Rawat wrote:
> Thank your for the insight Dimitris , the Buildroot environment is
> quite aged( Released February 28th, 2011) but has php :D >>
> https://github.com/j1nx/buildroot-AmLogic
>
> The original Buildroot environment above had php5.2 so I replaced only
> the /package/php dir with the one which had a php5.3
> (http://git.buildroot.net/buildroot/commit/?id=aeb9350cfbd2f4675f0d095394660cc0c2cc0d7b)
> Seems like it missing it target altogether, I will try the "make
> php-dirclean php" and post my findings.

  The package infrastructure has changed in the mean time, so copying the 
directory won't work.  You can either cherry-pick the commit in git

git cherry-pick aeb9350cfbd2f467

or you can modify the last line of php.mk into:

$(eval $(call AUTOTARGETS,package,php))


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
