From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 7 Nov 2016 22:58:01 +0100
Subject: [Buildroot] busybox error
In-Reply-To: <CANO2Q29C45jEphAw5nzo_x7j4WjumkfNyE0qf+_B-G1pw_VqbQ@mail.gmail.com>
References: <CANO2Q29C45jEphAw5nzo_x7j4WjumkfNyE0qf+_B-G1pw_VqbQ@mail.gmail.com>
Message-ID: <d563d924-cd16-f433-f1f4-e3f37cfef008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-11-16 10:04, Siva Prakash Reddy Nareddy wrote:
> /home/buildroot-labs/buildroot/output/build/busybox-1.25.1/miscutils/runlevel.c:35:
> undefined reference to `utmpxname'

 You have done some very serious hacking, so don't be surprised if things don't
work.

 busybox runlevel can only be enabled when busybox FEATURE_UTMP is enabled.
However, Buildroot will explicitly disable that option when musl is used as libc
because musl doesn't provide utmpxname (and another one too I think).

 I don't know how you managed to break this, but it must be by manually copying
some files into the build directory. If you do something like that, you're on
your own. It's like pulling a screw out of the engine of your car and going to
your car dealer complaining that something doesn't work.

 Now, I could be mistaken, so if you can reproduce the issue after doing 'make
clean; make', please provide your buildroot .config and busybox .config (if it
was customized).


 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
