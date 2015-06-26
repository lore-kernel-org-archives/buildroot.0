From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Jun 2015 23:54:57 +0200
Subject: [Buildroot] [PATCH v2 1/1] board: add support for Warpboard
In-Reply-To: <20150626150643.GB17113@free.fr>
References: <1434988018-16391-1-git-send-email-lambertarthur22@gmail.com>
 <558B254C.2090606@mind.be> <20150625085428.GA3400@arthur-dreem>
 <558C800F.5030702@mind.be> <20150625223823.GI4178@free.fr>
 <CAMQcK5JBCq4Dro8o-6n2O=YKeSzvv3Eb07FT+=iKfvsv-sB3zg@mail.gmail.com>
 <20150626150643.GB17113@free.fr>
Message-ID: <558DCA31.7000204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/26/15 17:06, Yann E. MORIN wrote:
[snip]
> Again, I'm *not* against adding demo defconfig files, I am OK with that.
> What I'd like is we keep basic defconfig files for all boards, and that
> a demo defconfig should be a second defconfig, not  replacement for a
> basic defconfig file.
> 
> (Ditto the Linux defconfig file, btw...)

 Actually for the Linux defconfig I don't agree. If you'd apply it there, the
basic linux defconfig would include just the serial driver, so no USB, no
networking, no framebuffer... I don't think that would make anyone happy,
because it can be pretty tricky (even for someone experienced) to find out
exactly what to enable.

 Therefore, for the Linux configs, I tend to prefer one which has all the
devices enabled that are available on the board.

 And of course an in-tree defconfig is even better, and that usually has a lot
of stuff that doesn't even exist on the board (e.g. because it supports multiple
boards).

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
