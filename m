From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Sep 2012 10:17:01 +0200
Subject: [Buildroot] Kernel version
In-Reply-To: <1348558164.41699.YahooMailNeo@web164601.mail.gq1.yahoo.com>
References: <1348517486.7248.YahooMailNeo@web164604.mail.gq1.yahoo.com>
 <5060CF90.7070605@mind.be>
 <1348558164.41699.YahooMailNeo@web164601.mail.gq1.yahoo.com>
Message-ID: <5061687D.8090703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/25/12 09:29, Zoran Djordjevic wrote:
> I will try to be more specific and I am aware that host kernel version doesn't matter in this story.
> I have kernel sources for my board 2.6.32 on let' say "BoardKernelDir" directy. There, I also have ".config" file, for
> kernel configuration.
> Then I go into Buildroot menues (make menuconfig) and under "Kernel/Kernel version"
> choose 3.2.6. In that same page of Buildroot menu, I can choose "Kernel configuration (Using custom configuration file)"
> to be the one I mentioned above (".config").
> Question is - is it wrong procedure and what kernel will be built this way- the one from
> "BoardKernelDir" (2.6.32) or 3.2.6 or (probably) it will make some mess ?

  This will work, more or less.  It will download the 3.2.6 kernel and run its
configure with your 2.6.32 .config.  That will give you a lot of questions on
the console about config options which exist in the 3.2.6 kernel but didn't
exist yet in the 2.6.32 kernel.  So not necessarily the most efficient
approach.

> Also, can I somehow (in Buildroot) use sources for my board - not those downloaded from kernel.org.
> I intend to use CrosstoolNG.

  Yes you can: use the "custom tarball" option that I mentioned in my mail.

  You have to configure that separately for buildroot and for crosstool-NG.
AFAIK buildroot doesn't allow to give a directory, so you'll have to make
a tarball from the directory first.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
