From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Sep 2020 16:21:31 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-09-10
In-Reply-To: <1f704b79-d506-698e-38c3-8d4ee1146802@heine.tech>
References: <20200911070826.658B8868D9@whitealder.osuosl.org>
 <38c1b78d-82f6-2d50-a60f-eb6a161d22f8@heine.tech>
 <20200911101547.77832bc9@windsurf.hq.k.grp>
 <20200911122734.GY14354@scaer>
 <1f704b79-d506-698e-38c3-8d4ee1146802@heine.tech>
Message-ID: <20200911142131.GA10548@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael, All,

On 2020-09-11 15:18 +0200, Michael Nosthoff spake thusly:
> On 11.09.2020 14:27, Yann E. MORIN wrote:
> > Michael, All,
> > 
> > On 2020-09-11 10:15 +0200, Thomas Petazzoni spake thusly:
> >> On Fri, 11 Sep 2020 09:29:20 +0200
> >> Michael Nosthoff <buildroot@heine.tech> wrote:
> >>> On 11.09.2020 09:08, Thomas Petazzoni wrote:
> >>>>   mips64el   |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/b554f6f2fb66892273f7520ad6e36923557b229e |     
> > Thanks for looking into this. Here's a simple way to reproduce:
> >     $ curl https://pastebin.com/raw/JMe512Pt >foo/Dockerfile
> Thanks for the Dockerfile.
> Wouldn't it make sense to include the used Dockerfile with the autobuild
> results?

Because the autobuilders do not (all) run in docker.

For example, my autobuilder (on which the host-grpc build issue happens)
is not running in docker, so there is no Dockerfile that created it. It
was manually created in November 2015 with debbootstrap.

The Dockerfile I provided was made after the fact, a few months ago,
last May.

> Concerning the host-grpc issue:
> 
> With the Dockerfile I was able to reproduce the issue.
> In comparison on a debian jessie with gcc 4.8.5 this problem does not occur.
> 
> From what I found on the protobuf issue tracker this seems to be an
> issue which hits people pretty randomly even with newer (mostly clang)
> compilers:
> 
> https://github.com/protocolbuffers/protobuf/issues/6074

Yeah, I had already found those issues bacj when I was investigating:

    https://github.com/protocolbuffers/protobuf/issues/5353
    https://github.com/protocolbuffers/protobuf/issues/5923

And also:

    https://github.com/grpc/grpc/issues/22781

> So currently I have no real idea how to fix this...

I also already spent quite some time investigating this issue, and I
have no clue...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
