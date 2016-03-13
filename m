From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 13 Mar 2016 22:11:16 +0100
Subject: [Buildroot] [PATCH v2] Makefile: add --no-builtin-rules flag
In-Reply-To: <20160312222625.GD3745@free.fr>
References: <1457740059-9618-1-git-send-email-arnout@mind.be>
 <20160312222625.GD3745@free.fr>
Message-ID: <56E5D774.7080407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/12/16 23:26, Yann E. MORIN wrote:
> Arnout, All,
>
> On 2016-03-12 00:47 +0100, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>> >When calling 'make', it takes several seconds before anything happens.
>> >This is because all the makefiles that have to be parsed and variables
>> >and rules that have to be evaluated.
>> >
>> >One of the rules to be evaluated are the implicit rules that make adds
>> >to check out the *.mk files from RCS etc. This obviously makes no
>> >sense. Therefore, disable the built-in rules.
>> >
>> >To avoid breaking package that depend on them, make sure we filter this
>> >out when calling sub-makes. MFLAGS has to be overridden too, otherwise
>> >the sub-make will just use that instead of MAKEFLAGS when MAKEFLAGS is
>> >empty.
> Sorry, it breaks at least host-ncurses:
>
>      /usr/bin/make MAKEFLAGS="--no-print-directory" MFLAGS= -j1 -C /home/ymorin/dev/buildroot/O/build/host-ncurses-5.9 sources
>      cd include && /usr/bin/make ---no-print-directory DESTDIR="" sources
>      /usr/bin/make: unrecognized option '---no-print-directory'
>      Usage: make [options] [target] ...
>      [--SNIP--]

  Gah, bug in make 3.81 :-(

  That will probably require even more hackery to work around... Let's drop this 
patch.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
