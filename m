From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Sep 2012 23:28:44 +0200
Subject: [Buildroot] [PATCH] Add package raspberrypi-firmware.
In-Reply-To: <CAAfyv36do0+Cf+ZYyj67Sypt13UzfM2TRyx9-Pwq_28fVgsWsw@mail.gmail.com>
References: <1347914057-20287-1-git-send-email-marek.belisko@open-nandra.com>
 <5058EF56.3070208@mind.be>
 <CALR4fEJzZPa+CAeCvuFrFZoNwO562+6_LDEM8xP2a15dy1YJuA@mail.gmail.com>
 <CAAfyv365AxzAfJSP3rnhbgKoDKMq19AyUnZkkSW54uerXCOYTg@mail.gmail.com>
 <505A21D6.7060808@mind.be>
 <CAAfyv36do0+Cf+ZYyj67Sypt13UzfM2TRyx9-Pwq_28fVgsWsw@mail.gmail.com>
Message-ID: <505A390C.7080704@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/19/12 22:08, Belisko Marek wrote:
>> >    Shouldn't all images be in that boot directory, then?  Or rather, doesn't
>> >  it make more sense to place the bootfiles directly in the images dir?
> Idea behind /boot directory was to copy raspberrypi booloader files +
> config file +
> kernel cmdline file + kernel bzImage to  that directory and compress it
> to output/images/boot.tar.gz (probably in post-build.sh script)
> directory to make it
> more user friendly (avoid manually copy files from different parts of
> buildroot).

  But would the images/ dir contain anything besides the boot.tar.gz?  If not,
it makes more sense to put all the required images in the images dir.  It's
easier to copy the files from there than to untar them.

  Ah, of course, there's the rootfs files...  But OTOH, you'd also have to handle
bzImage explicitly in some way, so it's just as easy to copy everything except
rootfs.* from the images directory.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
