From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 6 Oct 2016 01:10:43 +0200
Subject: [Buildroot] How can I add extra CFLAGS and LDFLAGS parameters
 in Busybox ?
In-Reply-To: <CADZ=QZnXFXbkTw-om1Vy+Lk1xdAJsszGgeDavmRUpjBN_WQMhg@mail.gmail.com>
References: <CADZ=QZnXFXbkTw-om1Vy+Lk1xdAJsszGgeDavmRUpjBN_WQMhg@mail.gmail.com>
Message-ID: <0bc0290b-179f-069a-7451-fc73a362f402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-10-16 05:57, Jack wrote:
> I tried to add new feature on busybox, and I need to call another API
> in busybox toolchain.

 This sounds like something very weird and unlikely. But OK.


> How can I add additional CFLAGS and LDFLAGS in busybox?
> 
> All I tried is, add "-I XXX" at CONFIG_EXTRA_CFLAGS and "-L XXX -lxxx"
> at CONFIG_EXTRA_LDFLAGS in busybox config file without modifying
> busybox's Makefile. It shows "XXX/XXX/ld: cannot find -lxxx" message.

 Clearly that worked, or you wouldn't get the -lxxx message.

 If you build with 'V=1' on the command line, you'll see the full argument list
of the LD command.

 If you want actual help from us, provide all the details, i.e. your busybox
config and the build log (with V=1). Put it in a pastebin to avoid spamming the
list.

 Regards,
 Arnout

> 
> I already check "-l" library file in "-L" option PATH.

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
