From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2011 23:35:07 +0200
Subject: [Buildroot] [RFC] Slides "Using Buildroot for real projects"
In-Reply-To: <20111017184718.71afc290@skate>
References: <20111017184718.71afc290@skate>
Message-ID: <201110182335.07799.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Monday 17 October 2011 18:47:18, Thomas Petazzoni wrote:
> The goal of the talk is to give some recommendations and best practices
> on how to use Buildroot. As I'm sure I forgot a lot of things in my
> slides above, I'd like to know what you, Buildroot developers/users,
> would have to say on the topic, so that I can improve the contents of
> this presentation.

 Of course, I can't stay behind with giving my comments!  They're a bit
broader than the earlier comments, though.

 For the 'What is Buildroot slide', I would split it in a 'What' and a 'Why' slide (bottom/top half).  Also, the goal for me is to build a complete Linux-based embedded system with the minimum amount of hassle.  That means:
 - minimal dependency on the build host's operating system (no specific bitbake or whatever package needs to be installed);
 - reproducible builds;
 - builds everything.

 About the "Buildroot can import external toolchains": it's not the option that I would advise at this time.  A major disadvantage is that there may be inconsistencies between what buildroot thinks the toolchain can do and what it actually can (unless it's a CodeSourcery toolchain, but those use glibc) - you have to define yourself what extra stuff the toolchain has.

 The board/<company>/<project>/linux-patches setup is exactly what I typically use as well.  I would like some future version of buildroot to simplify such a setup, i.e. you just configure board/<company>/<project> and buildroot looks for all the patches there.  But that's not for this presentation :-)

 One typical use case that is missing: in a company with several developers, you would put a download mirror in some central location and either point 
BR2_DL_DIR or BR2_PRIMARY_SITE to it.  (BTW, now I notice that the help text of BR2_PRIMARY_SITE incorrectly claims that it only works for AUTOTARGETS.)

 Another important hint: to debug, you should use output/host/usr/bin/<arch>-gdb -ex 'set solib-absolute-prefix output/staging'.

 And it may be worthwhile to talk about how you can contribute :-)  DCO, coding style, where to send it.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
