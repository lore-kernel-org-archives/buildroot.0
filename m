From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Sep 2013 22:38:29 +0200
Subject: [Buildroot] [PATCHv2 0/4] Add a BR2_EXTERNAL mechanism
In-Reply-To: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <52376C45.1020406@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi all,

On 14/09/13 21:03, Thomas Petazzoni wrote:
> Here is the second version of the BR2_EXTERNAL patch series.

  I've taken a few days to let the dust settle on this patch series (and 
it seems it still hasn't settled...). After reading the entire series 
this time (instead of commenting before I understood what was happening 
exactly), I have two overall comments still. More comments will follow in 
individual patches.


1. Peter nacked all previous attempts of having this type of feature, so 
I think it's best if he gives an indication if this series has a chance 
of survival before we all spend more time on it.


2. I really have a huge problem with the fact that the .config is no 
longer complete, and that instead you have to explicitly provide extra 
command-line arguments to be able to reproduce the build. And it doesn't 
help that it behaves differently when you have an out-of-tree output 
directory (where the BR2_EXTERNAL is stored) than when you're using the 
default output directory. I'm actually very surprised that nobody else 
seems to have a problem with this. So for me, this gets a big Nack unless 
the BR2_EXTERNAL is stored in the .config.



  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
