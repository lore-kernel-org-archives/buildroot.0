From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Oct 2016 23:08:31 +0200
Subject: [Buildroot] any opinions on uClibc-ng test-suite?
In-Reply-To: <20161017184120.GM21808@waldemar-brodkorb.de>
References: <20161017184120.GM21808@waldemar-brodkorb.de>
Message-ID: <bf1755cb-2741-5c6b-9b35-6eac1426a81b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Waldemar,

On 17-10-16 20:41, Waldemar Brodkorb wrote:
> Hi,
> 
> see here:
> http://mailman.uclibc-ng.org/pipermail/devel/2016-October/001224.html

 I'm replying here because I'm too lazy to subscribe to the uClibc-ng mailing
list...

 Normally I prefer that the test suite stays with the package. At least from the
buildroot point of view, we can solve the not-complete-toolchain issue by adding
a uClibc-test package that builds the uClibc tests after the toolchain has been
built. A bit similar to how linux-tools are separated from the linux kernel build.

 I would try, however, to reuse and expand libc-test if at all possible. If that
upstream agrees with it, it shouldn't be too hard to convert the make-based
runner to a shell-based runner. Hell, the target_template can almost be reused
as-is to generate runner shell fragments...


 Regards,
 Arnout


> 
> best regards
>  Waldemar
> 
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
