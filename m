From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Feb 2016 22:25:25 +0100
Subject: [Buildroot] Why not perform a shallow clone?
In-Reply-To: <CAF_dkJCgzJQE4i1DbDF_=eVgfEDJHDiwD-qRAjQe72ar+_=YBg@mail.gmail.com>
References: <CAF_dkJA0tBn_6x-sBwqF6Hb4x4+Pp3vM+e+rndm24kJe_y6pVg@mail.gmail.com>
 <CAHXCMMKHZ0usTWkgfJUbM6P4zLV2ZkAxQB9H9KrTVPar=fMEuA@mail.gmail.com>
 <CAF_dkJCZ3SzR3u7RASj-9ABxd8D70p6V1BGdVKZNnPKtFay0Gg@mail.gmail.com>
 <CAF_dkJCgzJQE4i1DbDF_=eVgfEDJHDiwD-qRAjQe72ar+_=YBg@mail.gmail.com>
Message-ID: <56CE1FC5.8090408@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/24/16 21:18, Patrick Doyle wrote:
> On Wed, Feb 24, 2016 at 2:50 PM, Patrick Doyle <wpdster@gmail.com> wrote:
[snip]
>> I suppose I could tell menuconfig that the (Atmel) kernel I am cloning
>> is available on github somehow and have the magic "fetch a sha1sum
>> from github" work.  I'll go think about that for a bit.
> 
> No, that doesn't seem to work either.  linux.mk doesn't use $(call
> github).  Oh well.

 $(call github) is not really needed, you can just use the actual URL in your
config: https://github.com/<project>/<repo>/archive/<version>/<version>.tar.gz


 Regards,
 Arnout

> 
> I suppose I could add support for that... does that seem useful to
> folks other than I?
> 
> --wpd
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
