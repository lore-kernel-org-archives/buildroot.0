From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 20 Oct 2014 21:57:10 +0200
Subject: [Buildroot] [PATCH 01/15] package/pkg-cmake.mk: globally
 disable doc, examples and tests
In-Reply-To: <20141019225649.2f16bd37@free-electrons.com>
References: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
 <1413741891-30113-2-git-send-email-s.martin49@gmail.com>
 <20141019221013.090eb47d@free-electrons.com>
 <CAHXCMMKCj2PoOrL0xGPRfp=FOhZm4=tN2RdPJR9J-J=_3ro_3w@mail.gmail.com>
 <20141019225649.2f16bd37@free-electrons.com>
Message-ID: <54456916.6010407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/10/14 22:56, Thomas Petazzoni wrote:
> Dear Samuel Martin,
> 
> On Sun, 19 Oct 2014 22:28:18 +0200, Samuel Martin wrote:

[snip]

>> Since we don't really care about these things, and don't want to be
>> bothered by failure because of these features, I think it's a way to
>> enforce disabling them.
> 
> And so, we will keep adding more and more options that are not CMake
> standard options to the core CMake infrastructure?
> 
> I know we've done that for pkg-autotools, but I'm not sure it was such
> a great idea. Especially, I'd like to understand where we will stop:
> will we, when two packages have common options, move them to the common
> infrastructure, even if those options are not CMake standard at all?
> 
> At least, I'd like to see what is our "policy" about this, and get some
> feedback from other Buildroot developers on this.

 I prefer to have these things in the common package infrastructure. It makes it
easier for package contributors to get things right. It doesn't really hurt to
add redundant options to configure or cmake (except for the warning, but the
warning message is clear enough to see when it is or isn't problematic). And
it's extremely unlikely that the options we provide in the infrastructure will
ever by wrong.

 So for me, ease of development takes precedence over cleanliness.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
