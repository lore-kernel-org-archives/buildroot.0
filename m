From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Jun 2014 08:00:50 +0200
Subject: [Buildroot] Problem with Languages Busybox
In-Reply-To: <CAEex6OREg7DJBsawCM_Gto_hk3VUyieLTcBz=sCRZpQ7BPL=Mg@mail.gmail.com>
References: <CAEex6OREg7DJBsawCM_Gto_hk3VUyieLTcBz=sCRZpQ7BPL=Mg@mail.gmail.com>
Message-ID: <539E8812.8050608@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/12/14 22:15, Correa Romero, Julian wrote:
> Hello, I am new at this.
> 
> I built a system with buildroot-2014.02 glibc and buildroot toolchain, I have
> problems with my language that is Spanish when I press the letter ?, ?, ?, ?, ?,
> ? or ? it appears on the terminal  (arg: 1). I did the loadkmap < es.bin. if the
> file has this characters also they aren't showed.
> 
> What can I do to give support to the language?

 First of all, I'm surprised you don't have this on your host machine, since
this is normal bash behaviour.

 From the bash manual:

  convert-meta (On)
     If set to On, readline will convert characters with the eighth bit set to
an ASCII key sequence by stripping the eighth bit and prefixing an escape
character (in effect, using escape as the meta prefix).


 Since ? in UTF-8 is encoded as 0xc3 0xb1, this sequence is interpreted by bash
as M-C M-1. M-C is not bound to anything by default so is ignored. M-1 is bound
to digit-argument.

 So to solve this problem, add the following to your .inputrc:

set convert-meta Off


 Note that bash will still expand these characters to escape sequences, but it
should be sufficient for typing file names. Read the man page to find out how to
solve _that_ issue.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
