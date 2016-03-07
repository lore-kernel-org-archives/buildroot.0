From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Mar 2016 00:21:42 +0100
Subject: [Buildroot] buggy init script
In-Reply-To: <CAK7rcp-mGsPNS03NthrhdGV00TtthChp0M+OP=oZ+7BW6isGzA@mail.gmail.com>
References: <CAK7rcp-mGsPNS03NthrhdGV00TtthChp0M+OP=oZ+7BW6isGzA@mail.gmail.com>
Message-ID: <56DE0D06.4020508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/07/16 15:48, Kenneth Adam Miller wrote:
> I have /etc/init.d in my target directory being populated with relevant scripts
> S02abc, S90xyz, S91abcxyz, S92zyx. I operate under the belief that init.d
> contents get executed in order of their numbers after S, and that the names
> after S<num><name> do not matter.

  The scripts are actually run by /etc/init.d/rcS, so you can check there how it 
is done. Basically it will execute everything that starts with S in shell sort 
order.


  To debug things, the easiest thing to do is to change the shebang into
#! /bin/sh -x
which will print each command on the console before it is executed. Of course, 
that's assuming you have a console, otherwise things are more difficult to debug...


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
