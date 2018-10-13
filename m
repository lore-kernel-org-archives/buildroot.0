From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Oct 2018 16:43:17 +0200
Subject: [Buildroot] [PATCH 5/5] support/testing: add python-twisted
 tests
In-Reply-To: <1adacc2a-25dc-eee5-8688-47ce66aa080b@mind.be>
References: <20180926025514.2092-1-ricardo.martincoski@gmail.com>
 <20180926025514.2092-6-ricardo.martincoski@gmail.com>
 <20181011204808.1aff4cd1@windsurf>
 <1adacc2a-25dc-eee5-8688-47ce66aa080b@mind.be>
Message-ID: <20181013144317.GF31509@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-10-11 23:27 +0200, Arnout Vandecappelle spake thusly:
> On 11/10/18 20:48, Thomas Petazzoni wrote:
> > Hello,
> > 
> > On Tue, 25 Sep 2018 23:55:14 -0300, Ricardo Martincoski wrote:
> > 
> >> +TEST_SCRIPT = """
> >> +from twisted.internet import protocol, reactor, endpoints
> >> +class F(protocol.Factory):
> >> +    pass
> >> +endpoints.serverFromString(reactor, "tcp:1234").listen(F())
> >> +reactor.run()
> >> +"""
> > 
> > At some point, we will have to find a solution to store such
> > "artefacts" somewhere, instead of having them inline in their test
> > cases. I don't have a good idea about this.
> 
>  I think it would be nice if we could add in the package directory a
> subdirectory with files to be copied to the target for the runtime test, and a
> python script for the test itself.

I'm not sure that would answer the question, but I already worked on
moving the packages' tests files inside the packages directories:
    https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/package-tests

(Note that this branch is not entirely up-to-date, as I haven't updated
it since we added new package tests.)

Contrary to Thomas, I don't really mind that we have tests in two
locations. Per-paclages tests are, in y opinion, better to be
side-by-side with the package they test.

As for the test on the infra, they go where they make more sense: in the
test infra.

My 2cts.

Regards,
Yann E. MORIN.

>  As an in-between step, we can put the files-to-be-copied inside the
> support/testing directory and explicitly enumerate the files-to-be-copied in the
> test fixture.
> 
>  Regards,
>  Arnout
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
