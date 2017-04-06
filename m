From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 6 Apr 2017 22:39:37 +0200
Subject: [Buildroot] [PATCH v5 06/13] configs: add autobuild toolchain
 defconfigs
In-Reply-To: <20170406215546.6e0b393d@free-electrons.com>
References: <cover.1491502445.git.arnout@mind.be>
 <20170406181854.5242-6-arnout@mind.be>
 <20170406215546.6e0b393d@free-electrons.com>
Message-ID: <acf85a2b-4942-26f8-29eb-0080c5aa158e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-04-17 21:55, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 6 Apr 2017 20:18:46 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
> 
>> Note: I choose to name them xxx_defconfig and put them under to configs
>> directory so they can be used directly as a quick way to set up a build
>> with an external toolchain. However, neither test-pkg nor autobuild-run
>> will use them as _defconfig, so we could just as well call them *.config
>> and put them under e.g. support/autobuild-toolchains. Let me know what
>> you think.
> 
> It's not a fully clear-cut opinion, but I believe I have a preference
> for having those in support/<something>/ rather than as official
> defconfigs.
> 
> I don't think it makes much sense to advertise them as defconfigs.
> Those base configurations are very specialized, some of them use
> completely stupid toolchain configurations (ARM no thread, really?)
> that only exist for the sake of testing various combinations of
> toolchain features. So making those visible to random users along with
> real defconfigs for boards doesn't seem like a good idea.
> 
> Plus it avoids the need to support defconfigs in subfolders (even
> though I guess you went through great lengths to workaround make
> stupidity about how patterns without slashes are handled), and the big
> question of your last RFC patch on how to display them in
> "list-defconfigs".

 Yeah, it's only at the last minute that I realized that there was no need for
them to be defconfigs. So at that point I just reworded the commit message and
pressed send :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
